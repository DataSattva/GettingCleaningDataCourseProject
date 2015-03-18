---
title: "Code_book"
author: "Alexander Bukreev"
date: "March 2015"
---

This is a *code book* to the **Data_set_mean.txt** tidy data set, located in this repo. For additional information on analysis see **README.md**.

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For correct opening of file **Data_set_mean.txt** on your computer in R, copy it into the *work directory* and open use code:


```r
Data_set_mean <- read.table("Data_set_mean.txt", header = TRUE)

View(Data_set_mean)
```

**Data_set_mean** table has 180 rows and 68 columns.

### subject
####column #1

Volunteers' numbers are from 1 to 30. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
 
### activity
####column #2

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

Data on 6 activities for each participant is given in the table.

[1] WALKING            
[2] WALKING_UPSTAIRS  
[3] WALKING_DOWNSTAIRS 
[4] SITTING           
[5] STANDING           
[6] LAYING  

### average of mean and standard deviation for each activity and each subject
####columns from #3 to #68

Average value of a 66-feature vector with time and frequency domain variables are included in the data set. 

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

 [1] mean(tBodyAcc-mean()-X)          
 [2] mean(tBodyAcc-mean()-Y)          
 [3] mean(tBodyAcc-mean()-Z)          
 [4] mean(tBodyAcc-std()-X)           
 [5] mean(tBodyAcc-std()-Y)           
 [6] mean(tBodyAcc-std()-Z)           
 [7] mean(tGravityAcc-mean()-X)       
 [8] mean(tGravityAcc-mean()-Y)       
 [9] mean(tGravityAcc-mean()-Z)       
[10] mean(tGravityAcc-std()-X)        
[11] mean(tGravityAcc-std()-Y)        
[12] mean(tGravityAcc-std()-Z)        
[13] mean(tBodyAccJerk-mean()-X)      
[14] mean(tBodyAccJerk-mean()-Y)      
[15] mean(tBodyAccJerk-mean()-Z)      
[16] mean(tBodyAccJerk-std()-X)       
[17] mean(tBodyAccJerk-std()-Y)       
[18] mean(tBodyAccJerk-std()-Z)       
[19] mean(tBodyGyro-mean()-X)         
[20] mean(tBodyGyro-mean()-Y)         
[21] mean(tBodyGyro-mean()-Z)         
[22] mean(tBodyGyro-std()-X)          
[23] mean(tBodyGyro-std()-Y)          
[24] mean(tBodyGyro-std()-Z)          
[25] mean(tBodyGyroJerk-mean()-X)     
[26] mean(tBodyGyroJerk-mean()-Y)     
[27] mean(tBodyGyroJerk-mean()-Z)     
[28] mean(tBodyGyroJerk-std()-X)      
[29] mean(tBodyGyroJerk-std()-Y)      
[30] mean(tBodyGyroJerk-std()-Z)      
[31] mean(tBodyAccMag-mean())         
[32] mean(tBodyAccMag-std())          
[33] mean(tGravityAccMag-mean())      
[34] mean(tGravityAccMag-std())       
[35] mean(tBodyAccJerkMag-mean())     
[36] mean(tBodyAccJerkMag-std())      
[37] mean(tBodyGyroMag-mean())        
[38] mean(tBodyGyroMag-std())         
[39] mean(tBodyGyroJerkMag-mean())    
[40] mean(tBodyGyroJerkMag-std())     
[41] mean(fBodyAcc-mean()-X)          
[42] mean(fBodyAcc-mean()-Y)          
[43] mean(fBodyAcc-mean()-Z)          
[44] mean(fBodyAcc-std()-X)           
[45] mean(fBodyAcc-std()-Y)           
[46] mean(fBodyAcc-std()-Z)           
[47] mean(fBodyAccJerk-mean()-X)      
[48] mean(fBodyAccJerk-mean()-Y)      
[49] mean(fBodyAccJerk-mean()-Z)      
[50] mean(fBodyAccJerk-std()-X)       
[51] mean(fBodyAccJerk-std()-Y)       
[52] mean(fBodyAccJerk-std()-Z)       
[53] mean(fBodyGyro-mean()-X)         
[54] mean(fBodyGyro-mean()-Y)         
[55] mean(fBodyGyro-mean()-Z)         
[56] mean(fBodyGyro-std()-X)          
[57] mean(fBodyGyro-std()-Y)          
[58] mean(fBodyGyro-std()-Z)       
[59] mean(fBodyAccMag-mean())     
[60] mean(fBodyAccMag-std())
[61] mean(fBodyBodyAccJerkMag-mean())
[62] mean(fBodyBodyAccJerkMag-std()) 
[63] mean(fBodyBodyGyroMag-mean())   
[64] mean(fBodyBodyGyroMag-std())    
[65] mean(fBodyBodyGyroJerkMag-mean())
[66] mean(fBodyBodyGyroJerkMag-std())

*Alexander Bukreev, Beijing, 2015. E-mail: datasattva@yandex.com*