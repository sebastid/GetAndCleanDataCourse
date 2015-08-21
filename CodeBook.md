## Code Book Description
This is the code book for the project course assignment of the coursera 'Getting And Cleaning Data' course.
The purpose of this project is to demonstrate the ability to collect, work with, and clean a dataset.

This code book provides some basic information about the raw data, and how to create the tidy datafile from it.
It contains a full list of the variables defined in the tidy dataset.

###Notes on the original (raw) data 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


###Creating the tidy data file
Here are the steps to follow to create the tidy data file:  
1. download the zip package from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
2. unzip the file to a chosen working directory, i.e.:  
   '~/Documents/Coursera/Getdata/GetAndCleanDataCourse'.
3. edit the setwd() command in the script to point to the correct working directory, i.e.:  
    setwd("~/Documents/Coursera/Getdata/GetAndCleanDataCourse").
4. execute the run_analysis.R script from R or RStudio and review the saved tidy data set file 'tiny_data.txt'.

###Cleaning of the data
The run_analysis.R script cleans the raw dataset as follows:  
- Renames duplicated variables names and incorrect names (e.g.'BodyBody...').
- Renames the undescriptive prefixes to a more meaningfull format, i.e t and f change to time and freq.
- Removes the '-' symbols from variable names.
- Removes the '(' and ')' characters from variable names.
- Reformats the Activity Name variable as a factor using meaningful activity names (re-using the labels defined from the raw  file activity_labels.txt).
- Selects the variables related to the mean and standard deviation statistical measurements.
- Performs a summrarization step by grouping the dataset by activity name and by subject ID showing
  a single row of averaged observations.

Refer to [README.md](.README.md) for more details about the script internal execution steps.

###Description of the variables in the 'tidy_data.txt' file
- Dimensions of the dataset:  
  180 rows by 68 columns
- Summary of the data:   
  The data is summarised using the average of 66 feature variables grouped by Subject IDs and Activity Names.
  The dplyr::group_by and dplyr::summarise_each functions from the dplyr package were used to perform the summarization.
- Variables present in the dataset:  
  68 variables are present in the dataset comprising of 66 mean-summarised feature variables and two index variables
  being SubjectID and ActivityName.
- Variable Name Formating:    
  The 66 summarized feature variable names were written according to the following format:  
    `Feature Name`.`domain type`.`statistical metric`_`summarization method`
     - `Feature Name` can be like 'BodyAccX', 'BodyAccMag', ...
     - `domain type` can be either 'time' to denote the time domain, or 'freq' to denote the frequency domain in which the original measurement was made.
     - `statistical metric` can be either 'mean' or 'std' to denote the mean or standard deviation calculations of the original feature measurements.
 
####SubjectID
Identification number assigned to each subject.
- Column Index  : 1/68 
- Class         : integer
- Variable Range: distinct value defined in the interval [1,30]

####ActivityName
Name of labelled activity
- Column Index  : 2/68 
- Class         : factor
- Variable Range: defined withing the factor level WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,S TANDING, LAYING

####BodyAccX.time.mean_mean
Summary value of the mean linear acceleration along the X body axis in the time domain. 
- Column Index  : 3/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccY.time.mean_mean
Summary value of the mean linear acceleration along the Y body axis in the time domain. 
- Column Index  : 4/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccZ.time.mean_mean
Summary value of the mean linear acceleration along the Z body axis in the time domain. 
- Column Index  : 5/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccX.time.std_mean
Summary value of the standard deviation of the linear acceleration along the X body axis in the time domain. 
- Column Index  : 6/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccY.time.std_mean
Summary value of the standard deviation of the linear acceleration along the Y body axis in the time domain. 
- Column Index  : 7/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccZ.time.std_mean
Summary value of the standard deviation of the linear acceleration along the Z body axis in the time domain. 
- Column Index  : 8/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####GravityAccX.time.mean_mean
Summary value of the mean gravitational acceleration along the AccX axis in the time domain. 
- Column Index  : 9/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####GravityAccY.time.mean_mean
Summary value of the mean gravitational acceleration along the AccY axis in the time domain. 
- Column Index  : 10/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####GravityAccZ.time.mean_mean
Summary value of the mean gravitational acceleration along the AccZ axis in the time domain. 
- Column Index  : 11/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####GravityAccX.time.std_mean
Summary value of the standard deviation of the gravitational acceleration along the AccX axis in the time domain. 
- Column Index  : 12/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####GravityAccY.time.std_mean
Summary value of the standard deviation of the gravitational acceleration along the AccY axis in the time domain. 
- Column Index  : 13/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####GravityAccZ.time.std_mean
Summary value of the standard deviation of the gravitational acceleration along the AccZ axis in the time domain. 
- Column Index  : 14/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccJerkX.time.mean_mean
Summary value of the mean linear jerk along the X body axis in the time domain. 
- Column Index  : 15/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccJerkY.time.mean_mean
Summary value of the mean linear jerk along the Y body axis in the time domain. 
- Column Index  : 16/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccJerkZ.time.mean_mean
Summary value of the mean linear jerk along the Z body axis in the time domain. 
- Column Index  : 17/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccJerkX.time.std_mean
Summary value of the standard deviation of the linear jerk along the X body axis in the time domain. 
- Column Index  : 18/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccJerkY.time.std_mean
Summary value of the standard deviation of the linear jerk along the Y body axis in the time domain. 
- Column Index  : 19/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccJerkZ.time.std_mean
Summary value of the standard deviation of the linear jerk along the Z body axis in the time domain. 
- Column Index  : 20/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroX.time.mean_mean
Summary value of the mean angular velocity about the X body axis in the time domain. 
- Column Index  : 21/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroY.time.mean_mean
Summary value of the mean angular velocity about the Y body axis in the time domain. 
- Column Index  : 22/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroZ.time.mean_mean
Summary value of the mean angular velocity about the Z body axis in the time domain. 
- Column Index  : 23/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroX.time.std_mean
Summary value of the standard deviation of the angular velocity about the X body axis in the time domain. 
- Column Index  : 24/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroY.time.std_mean
Summary value of the standard deviation of the angular velocity about the Y body axis in the time domain. 
- Column Index  : 25/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroZ.time.std_mean
Summary value of the standard deviation of the angular velocity about the Z body axis in the time domain. 
- Column Index  : 26/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroJerkX.time.mean_mean
Summary value of the mean angular jerk about the Z body axis in the time domain. 
- Column Index  : 27/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroJerkY.time.mean_mean
Summary value of the mean angular jerk about the Z body axis in the time domain. 
- Column Index  : 28/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroJerkZ.time.mean_mean
Summary value of the mean angular jerk about the Z body axis in the time domain. 
- Column Index  : 29/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroJerkX.time.std_mean
Summary value of the standard deviation of the angular jerk about the Z body axis in the time domain. 
- Column Index  : 30/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroJerkY.time.std_mean
Summary value of the standard deviation of the angular jerk about the Z body axis in the time domain. 
- Column Index  : 31/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroJerkZ.time.std_mean
Summary value of the standard deviation of the angular jerk about the Z body axis in the time domain. 
- Column Index  : 32/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccMag.time.mean_mean
Summary value of the mean linear acceleration magnitude in the time domain. 
- Column Index  : 33/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccMag.time.std_mean
Summary value of the standard deviation of the linear acceleration magnitude in the time domain. 
- Column Index  : 34/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####GravityAccMag.time.mean_mean
Summary value of the mean gravitational acceleration along the AccMag axis in the time domain. 
- Column Index  : 35/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####GravityAccMag.time.std_mean
Summary value of the standard deviation of the gravitational acceleration along the AccMag axis in the time domain. 
- Column Index  : 36/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccJerkMag.time.mean_mean
Summary value of the mean linear jerk magnitude in the time domain. 
- Column Index  : 37/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccJerkMag.time.std_mean
Summary value of the standard deviation of the linear jerk magnitude in the time domain. 
- Column Index  : 38/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroMag.time.mean_mean
Summary value of the mean angular velocity magnitude in the time domain. 
- Column Index  : 39/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroMag.time.std_mean
Summary value of the standard deviation of the angular velocity magnitude in the time domain. 
- Column Index  : 40/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroJerkMag.time.mean_mean
Summary value of the mean angular jerk magnitude in the time domain. 
- Column Index  : 41/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroJerkMag.time.std_mean
Summary value of the standard deviation of the angular jerk magnitude in the time domain. 
- Column Index  : 42/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccX.freq.mean_mean
Summary value of the mean linear acceleration along the X body axis in the frequency domain. 
- Column Index  : 43/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccY.freq.mean_mean
Summary value of the mean linear acceleration along the Y body axis in the frequency domain. 
- Column Index  : 44/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccZ.freq.mean_mean
Summary value of the mean linear acceleration along the Z body axis in the frequency domain. 
- Column Index  : 45/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccX.freq.std_mean
Summary value of the standard deviation of the linear acceleration along the X body axis in the frequency domain. 
- Column Index  : 46/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccY.freq.std_mean
Summary value of the standard deviation of the linear acceleration along the Y body axis in the frequency domain. 
- Column Index  : 47/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccZ.freq.std_mean
Summary value of the standard deviation of the linear acceleration along the Z body axis in the frequency domain. 
- Column Index  : 48/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccJerkX.freq.mean_mean
Summary value of the mean linear jerk along the X body axis in the frequency domain. 
- Column Index  : 49/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccJerkY.freq.mean_mean
Summary value of the mean linear jerk along the Y body axis in the frequency domain. 
- Column Index  : 50/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccJerkZ.freq.mean_mean
Summary value of the mean linear jerk along the Z body axis in the frequency domain. 
- Column Index  : 51/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccJerkX.freq.std_mean
Summary value of the standard deviation of the linear jerk along the X body axis in the frequency domain. 
- Column Index  : 52/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccJerkY.freq.std_mean
Summary value of the standard deviation of the linear jerk along the Y body axis in the frequency domain. 
- Column Index  : 53/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccJerkZ.freq.std_mean
Summary value of the standard deviation of the linear jerk along the Z body axis in the frequency domain. 
- Column Index  : 54/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroX.freq.mean_mean
Summary value of the mean angular velocity about the X body axis in the frequency domain. 
- Column Index  : 55/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroY.freq.mean_mean
Summary value of the mean angular velocity about the Y body axis in the frequency domain. 
- Column Index  : 56/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroZ.freq.mean_mean
Summary value of the mean angular velocity about the Z body axis in the frequency domain. 
- Column Index  : 57/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroX.freq.std_mean
Summary value of the standard deviation of the angular velocity about the X body axis in the frequency domain. 
- Column Index  : 58/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroY.freq.std_mean
Summary value of the standard deviation of the angular velocity about the Y body axis in the frequency domain. 
- Column Index  : 59/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroZ.freq.std_mean
Summary value of the standard deviation of the angular velocity about the Z body axis in the frequency domain. 
- Column Index  : 60/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccMag.freq.mean_mean
Summary value of the mean linear acceleration magnitude in the frequency domain. 
- Column Index  : 61/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccMag.freq.std_mean
Summary value of the standard deviation of the linear acceleration magnitude in the frequency domain. 
- Column Index  : 62/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccJerkMag.freq.mean_mean
Summary value of the mean linear jerk magnitude in the frequency domain. 
- Column Index  : 63/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyAccJerkMag.freq.std_mean
Summary value of the standard deviation of the linear jerk magnitude in the frequency domain. 
- Column Index  : 64/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroMag.freq.mean_mean
Summary value of the mean angular velocity magnitude in the frequency domain. 
- Column Index  : 65/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroMag.freq.std_mean
Summary value of the standard deviation of the angular velocity magnitude in the frequency domain. 
- Column Index  : 66/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroJerkMag.freq.mean_mean  
Summary value of the mean angular jerk magnitude in the frequency domain.  
- Column Index  : 67/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]

####BodyGyroJerkMag.freq.std_mean  
Summary value of the standard deviation of the angular jerk magnitude in the frequency domain.   
- Column Index  : 68/68 
- Class         : numeric
- Variable Unit : normalized value defined in the interval [-1.0,1.0]
