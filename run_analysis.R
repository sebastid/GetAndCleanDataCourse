#########################################################################################
#--- Merge the training and the test sets to create one data set.
#--- Extract only the measurements on the mean and standard deviation for each measurement.
#--- Use descriptive activity names to name the activities in the data set.
#--- Appropriately labels the data set with descriptive variable name
#--- From the data set in step4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
#########################################################################################

#--- Global variables
setwd("~/Documents/Coursera/GetData/GetAndCleanDataCourse")
dataset.basedir <- "./UCI HAR Dataset"
dataset.basedir.train <- file.path(dataset.basedir,"train")
dataset.basedir.test <- file.path(dataset.basedir,"test")

feature.names <- read.table(file.path(dataset.basedir, "features.txt"), header = F, stringsAsFactors = F)[,2]
activity.labels <- read.table(file.path(dataset.basedir, "activity_labels.txt"), header = F, stringsAsFactors = F)[,2]

#--- Load the train data sets
train.subject <- read.table(file.path(dataset.basedir.train,"subject_train.txt"), header = F, stringsAsFactors = F)
train.X <- read.table(file.path(dataset.basedir.train,"X_train.txt"), header = F, stringsAsFactors = F)
train.y <- read.table(file.path(dataset.basedir.train,"y_train.txt"), header = F, stringsAsFactors = F)
train <- cbind(train.X, train.subject, train.y)

#--- Load the test data sets
test.subject <- read.table(file.path(dataset.basedir.test,"subject_test.txt"), header = F, stringsAsFactors = F)
test.X <- read.table(file.path(dataset.basedir.test,"X_test.txt"), header = F, stringsAsFactors = F)
test.y <- read.table(file.path(dataset.basedir.test,"y_test.txt"), header = F, stringsAsFactors = F)
test <- cbind(test.X, test.subject, test.y)


#--- Merge the Train and Test data.frames
merged.data <- rbind(train, test)

#--- Appropriately labels the data set with descriptive variable name
names(merged.data) <- c(feature.names, "SubjectID", "ActivityName")

#--- Use descriptive activity names to name the activities in the data set.
merged.data$ActivityName <- factor( merged.data$ActivityName, labels=activity.labels)

#--- Extract the column names for the measurements on the mean and standard deviation for each measurement (add the ActivityName and DatasetType)
data.names <- names(merged.data)
selected.feature.names <- data.names[grep("mean\\(\\)|std\\(\\)|SubjectID|ActivityName",data.names)]

#--- Final Merged Data set
merged.data <- merged.data[,selected.feature.names]

#--- Final Tidy Data 
tidy.data <- aggregate(merged.data[,-match(c("SubjectID","ActivityName"),selected.feature.names)], by=list(SubjectID=merged.data$SubjectID, ActivityName=merged.data$ActivityName), mean)

library(data.table)
DT <- data.table(merged.data)
tidy.data2 <- DT[, lapply(.SD, mean), by=c("SubjectID","ActivityName")]    
    
write.table(tidy.data, file="tidy_data.txt", row.name=F)



