#########################################################################################
# Author: sebastid
# Date: 21-08-2015
#
# Description: 
#  This script implements the necessary steps to obtain a tidy data set from the 
#  Human Activity Recognition Using Smartphones Dataset.
# 
# The implemented steps are:
# 1) Current working direction and file paths Intialization 
# 2) Load the raw training and test datasets.
# 3) Merge/Assemble the training and the test sets to create one data set.
# 4) Extract only the measurements on the mean and standard deviation for each measurement.
# 5) Use descriptive activity names to name the activities in the data set.
# 6) Appropriately labels the data set with descriptive variable name.
# 7) From the data set in step 5, creates a second, independent tidy data set with the average. 
#    of each variable for each activity and each subject.
# 8) Save the final tidy data frame from step 6) to disk.
#########################################################################################

#----------------------------------------------------------------------------------------
# 1 - Current working direction and file paths Intialization 
#----------------------------------------------------------------------------------------

setwd("~/Documents/Coursera/Getdata/GetAndCleanDataCourse")
dataset_basedir <- "./UCI HAR Dataset"
dataset_basedir_train <- file.path(dataset_basedir,"train")
dataset_basedir_test <- file.path(dataset_basedir,"test")

#----------------------------------------------------------------------------------------
# 2 - Load the feature names, the activity labels, train and test datasets
#----------------------------------------------------------------------------------------
feature_names <- read.table(file.path(dataset_basedir, "features.txt"), header = F, stringsAsFactors = F)[,2]
activity_labels <- read.table(file.path(dataset_basedir, "activity_labels.txt"), header = F, stringsAsFactors = F)[,2]

train_subject <- read.table(file.path(dataset_basedir_train,"subject_train.txt"), header = F, stringsAsFactors = F)
train_X <- read.table(file.path(dataset_basedir_train,"X_train.txt"), header = F, stringsAsFactors = F)
train_y <- read.table(file.path(dataset_basedir_train,"y_train.txt"), header = F, stringsAsFactors = F)

test_subject <- read.table(file.path(dataset_basedir_test,"subject_test.txt"), header = F, stringsAsFactors = F)
test_X <- read.table(file.path(dataset_basedir_test,"X_test.txt"), header = F, stringsAsFactors = F)
test_y <- read.table(file.path(dataset_basedir_test,"y_test.txt"), header = F, stringsAsFactors = F)

#----------------------------------------------------------------------------------------
# 3 - Merge/Assemble the Train and Test data.frames into one data.frame
#----------------------------------------------------------------------------------------
train_dataset <- cbind(train_X, train_subject, train_y)
test_dataset <- cbind(test_X, test_subject, test_y)
whole_dataset <- rbind(train_dataset, test_dataset)

#----------------------------------------------------------------------------------------
# 4 - Appropriately labels the dataset with descriptive variable name
#----------------------------------------------------------------------------------------

#--- Reformat labels like "tBodyAcc-mean()-X" to "BodyAcc_X.time.mean"
relabelled_feature_names <- sub("^t(.*)-(.*)\\(\\)-(\\w)$","\\1\\3.time.\\2",feature_names)

#--- Reformat labels like "fBodyAcc-mean()-X" to "BodyAcc_X.freq.mean"
relabelled_feature_names <- sub("^f(.*)-(.*)\\(\\)-(\\w)$","\\1\\3.freq.\\2",relabelled_feature_names)

#--- Reformat labels like "tBodyAccMag-mean()-X"  to "BodyAcc_Mag.time.mean"
relabelled_feature_names <- sub("^t(.*)Mag-(.*)\\(\\)","\\1Mag.time.\\2",relabelled_feature_names)

#--- Reformat labels like "fBodyAccMag-mean()-X" to "BodyAcc_Mag.freq.mean"
relabelled_feature_names <- sub("^f(.*)Mag-(.*)\\(\\)","\\1Mag.freq.\\2",relabelled_feature_names)

#--- Correct labelling mistakes from raw dataset
relabelled_feature_names <- sub("BodyBody","Body",relabelled_feature_names)

#--- Rename duplicate labels 
relabelled_feature_names <- make.names(relabelled_feature_names, unique=TRUE, allow_ = TRUE)

#--- Relabel the whole dataset variable names
names(whole_dataset) <- c(relabelled_feature_names, "SubjectID", "ActivityName")

#----------------------------------------------------------------------------------------
# 5 - Use descriptive activity names to name the activities in the data set.
#----------------------------------------------------------------------------------------
whole_dataset$ActivityName <- factor(whole_dataset$ActivityName, labels=activity_labels)

#----------------------------------------------------------------------------------------
# 6 - Extract the column names for the measurements on the mean and standard deviation 
#----------------------------------------------------------------------------------------
library(dplyr)
whole_dataset_tbl <- tbl_df(whole_dataset)

#--- filter labels ending with 'mean' or ending with 'std' or matching 'SubjectID' or matching 'ActivityName'
selected_fearture_idx <- grep("mean$|std$|SubjectID|ActivityName",names(whole_dataset_tbl))
selected_feature_names <- names(whole_dataset_tbl)[selected_fearture_idx]

#--- Select the mean, std, SubjectID and ActivityName variables using dplyr::select
tidy_data_tbl <- select(whole_dataset_tbl, one_of(selected_feature_names))

#----------------------------------------------------------------------------------------
# 7 - Summarize the tidy data by grouping by Subject and Activity using dplyr::group_by and summarise_each
#----------------------------------------------------------------------------------------
grouped_by_tidy_data <- group_by(tidy_data_tbl, SubjectID, ActivityName)
summarized_tidy_data <- summarise_each(grouped_by_tidy_data, funs("mean", mean(., na.rm = TRUE)))

#----------------------------------------------------------------------------------------
# 8 - Save the final tidy data frame to disk
#----------------------------------------------------------------------------------------
write.table(summarized_tidy_data, file="tidy_data.txt", row.name=F)

