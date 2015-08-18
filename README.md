## Getting And Cleaning Data Course Project

This repository contains the script and required files for the project course assignment.

It contains the following files:
* README.mb: this markdown file
* run_analysis.R: the R script used to create the tidy dataset file 'tidy_data.txt'
* CodeBook.md: the CodeBook for the tidy dataset defined as a markdown file
* tidy_data.txt: the tidy data set created by run_analysis.R

## Description of the run_analysis.R script
The R script was written to follow the project assignment outline as close as possible and can be summarized as follows:
1) Load the raw training and test datasets.

2) Merge/Assemble the training and the test sets to create one data set.

3) Extract only the measurements on the mean and standard deviation for each measurement.

4) Use descriptive activity names to name the activities in the data set.

5) Appropriately labels the data set with descriptive variable name.

6) From the data set in step 5, creates a second, independent tidy data set with the average. 
   of each variable for each activity and each subject.

7) Save the final tidy data frame from step 6) to disk.

