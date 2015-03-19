---
title: "Code_book"
author: "Alexander Bukreev"
e-mail: datasattva@yandex.com
location: Beijing, China
date: "March 2015"
---

This is a *code book* to the **Data_set_mean.txt** tidy data set, located in this repo. For additional information on this data analysis see **README.md**.

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

All row data of this zip-arhive is in the *UCI HAR Dataset* folder. After revising descriptions to raw data (see *README.txt* in *UCI HAR Dataset*) and their structure in TextWrangler test editor, files from *text* and *train* folders were used as a raw data, *text/Inertial Signals* and *train/Inertial Signals* sub-folders data were not used, as they do not include mean and standard deviation for each measurement.  That is why variables values only from the list *features.txt* were used for the analysis, they are marked in the following way:

- *mean(): Mean value*
- *std(): Standard deviation*

(see *features_info.txt* file from *UCI HAR Dataset* folder for more information about this).

For correct opening of file **Data_set_mean.txt** on your computer in R, copy it into the *work directory* and open use code:


```r
Data_set_mean <- read.table("Data_set_mean.txt", header = TRUE)

View(Data_set_mean)
```

**Data_set_mean** table has 180 rows and 68 columns.

### column #1 | subject

Volunteers' numbers are from 1 to 30. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. See footnote [1].
 
### column #2 | activity

Each volunteer performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. See footnote [1].

Data on 6 activities for each participant is given in the table.

- 1 WALKING            
- 2 WALKING_UPSTAIRS  
- 3 WALKING_DOWNSTAIRS 
- 4 SITTING           
- 5 STANDING           
- 6 LAYING  

### columns from #3 to #68 | average of mean and standard deviation for each activity and each subject

Average value of a 66-feature vector with time and frequency domain variables are included in the data set. See footnote [2]. 

These signals were used to estimate variables of the feature vector for each pattern ('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions): 

*tBodyAcc-XYZ, 
tGravityAcc-XYZ, 
tBodyAccJerk-XYZ, 
tBodyGyro-XYZ, 
tBodyGyroJerk-XYZ, 
tBodyAccMag, 
tGravityAccMag, 
tBodyAccJerkMag, 
tBodyGyroMag, 
tBodyGyroJerkMag, 
fBodyAcc-XYZ, 
fBodyAccJerk-XYZ, 
fBodyGyro-XYZ, 
fBodyAccMag, 
fBodyAccJerkMag, 
fBodyGyroMag, 
fBodyGyroJerkMag.*

The set of variables that were estimated from these signals are: *mean(): Mean value* and *std(): Standard deviation*.

Finally, we have 33*2 = 66 variables in the table, which correspond its columns:

- 1 mean(tBodyAcc-mean()-X)          
- 2 mean(tBodyAcc-mean()-Y)          
- 3 mean(tBodyAcc-mean()-Z)          
- 4 mean(tBodyAcc-std()-X)           
- 5 mean(tBodyAcc-std()-Y)           
- 6 mean(tBodyAcc-std()-Z)           
- 7 mean(tGravityAcc-mean()-X)       
- 8 mean(tGravityAcc-mean()-Y)       
- 9 mean(tGravityAcc-mean()-Z)       
- 10 mean(tGravityAcc-std()-X)        
- 11 mean(tGravityAcc-std()-Y)        
- 12 mean(tGravityAcc-std()-Z)        
- 13 mean(tBodyAccJerk-mean()-X)      
- 14 mean(tBodyAccJerk-mean()-Y)      
- 15 mean(tBodyAccJerk-mean()-Z)      
- 16 mean(tBodyAccJerk-std()-X)       
- 17 mean(tBodyAccJerk-std()-Y)       
- 18 mean(tBodyAccJerk-std()-Z)       
- 19 mean(tBodyGyro-mean()-X)         
- 20 mean(tBodyGyro-mean()-Y)         
- 21 mean(tBodyGyro-mean()-Z)         
- 22 mean(tBodyGyro-std()-X)          
- 23 mean(tBodyGyro-std()-Y)          
- 24 mean(tBodyGyro-std()-Z)          
- 25 mean(tBodyGyroJerk-mean()-X)     
- 26 mean(tBodyGyroJerk-mean()-Y)     
- 27 mean(tBodyGyroJerk-mean()-Z)     
- 28 mean(tBodyGyroJerk-std()-X)      
- 29 mean(tBodyGyroJerk-std()-Y)      
- 30 mean(tBodyGyroJerk-std()-Z)      
- 31 mean(tBodyAccMag-mean())         
- 32 mean(tBodyAccMag-std())          
- 33 mean(tGravityAccMag-mean())      
- 34 mean(tGravityAccMag-std())       
- 35 mean(tBodyAccJerkMag-mean())     
- 36 mean(tBodyAccJerkMag-std())      
- 37 mean(tBodyGyroMag-mean())        
- 38 mean(tBodyGyroMag-std())         
- 39 mean(tBodyGyroJerkMag-mean())    
- 40 mean(tBodyGyroJerkMag-std())     
- 41 mean(fBodyAcc-mean()-X)          
- 42 mean(fBodyAcc-mean()-Y)          
- 43 mean(fBodyAcc-mean()-Z)          
- 44 mean(fBodyAcc-std()-X)           
- 45 mean(fBodyAcc-std()-Y)           
- 46 mean(fBodyAcc-std()-Z)           
- 47 mean(fBodyAccJerk-mean()-X)      
- 48 mean(fBodyAccJerk-mean()-Y)      
- 49 mean(fBodyAccJerk-mean()-Z)      
- 50 mean(fBodyAccJerk-std()-X)       
- 51 mean(fBodyAccJerk-std()-Y)       
- 52 mean(fBodyAccJerk-std()-Z)       
- 53 mean(fBodyGyro-mean()-X)         
- 54 mean(fBodyGyro-mean()-Y)         
- 55 mean(fBodyGyro-mean()-Z)         
- 56 mean(fBodyGyro-std()-X)          
- 57 mean(fBodyGyro-std()-Y)          
- 58 mean(fBodyGyro-std()-Z)       
- 59 mean(fBodyAccMag-mean())     
- 60 mean(fBodyAccMag-std())
- 61 mean(fBodyBodyAccJerkMag-mean())
- 62 mean(fBodyBodyAccJerkMag-std()) 
- 63 mean(fBodyBodyGyroMag-mean())   
- 64 mean(fBodyBodyGyroMag-std())    
- 65 mean(fBodyBodyGyroJerkMag-mean())
- 66 mean(fBodyBodyGyroJerkMag-std())

### Footnotes

**[1]**

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

See *README.txt* file from *UCI HAR Dataset* folder for more information about row data for this analisys.

**[2]**

The features selected for this raw-database (from *UCI HAR Dataset* folder) come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

See *features_info.txt* file from *UCI HAR Dataset* folder for more information about this.
