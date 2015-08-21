## Getting And Cleaning Data Course Project
This is sebastid's repository of the project course programming assignment for the Coursera 'Getting and Cleaning Data' course.

The purpose of this project was to demonstrate the ability to collect, work with, and clean a dataset.

This repository contains the required R script and document markdown files for the project course assignment:
* README.mb: this markdown file.
* run_analysis.R: the R script used to create the tidy dataset file 'tidy_data.txt'
* CodeBook.md: the CodeBook for the tidy dataset defined as a markdown file
* tidy_data.txt: the tidy data set created by run_analysis.R

## Description of the run_analysis.R script
The R script run_analysis.R loads, merges and creates the tidy data set saved as 'tidy_data.txt'.
It assumes that the dataset has been already downloaded and unzipped to a known working directory.
The script can be executed either from RStudio or the command line as follows:
R -f run_analysis.R

### Input Files: 
* features.txt
* activity_labels.txt
* subject_train.txt
* subject_test.txt
* X_train.txt
* X_test.txt
* y_train.txt
* y_test.txt

### Output File:
* tidy_data.txt (see CodeBook for the content description).

### Script operations
The R script was written to follow the order of the project assignment brief as closely as possible and can be summarized as follows:

#### 0: Current working direction and file paths Initialization 

Initializes the current working directory and base directory paths.

#### 1: Load the raw training and test datasets.

Loading of the 8 input files listed above.

#### 2: Merge/Assemble the training and the test sets to create one data set.

The merging of the datasets were performed using a combination of rbind and cbind operations.

#### 3) Appropriately labels the dataset with descriptive variable name
The input list of feature names was obtained from the features.txt file and processed as follows
* Regular expressions and the sub commands were used to clean the variables names.
* The make.names command was used to relabel the duplicate variable names.
* "SubjectID", "ActivityName" were added for the Subject ID  and Activity columns.
* The merged dataset columns were renamed using the processed feature names.

#### 4: Use descriptive activity names to name the activities in the data set.

The ActivityName variable was transformed as a factor using the loaded activity names from activity_labels.txt.

#### 5: Extract the column names for the measurements on the mean and standard deviation 

The dplyr::select command together with grep and a regular expression were used to select the mean and standard deviation calculated features.

#### 6: Summarize the tidy data by grouping by Subject and Activity

This step creates the final tidy dataset:
* The dplyr::group_by command was used to create the grouped table by Subject IDs and Activities Nanes.
* The dplyr::summarise_each command was used to create the summarization  by averaging the grouped table.

#### 7: Save the final tidy data frame to disk

The final tidy data set was saved to disk using write.table as advised.

