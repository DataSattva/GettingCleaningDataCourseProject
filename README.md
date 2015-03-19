---
title: "README"
author: "Alexander Bukreev"
e-mail: datasattva@yandex.com
location: Beijing, China
date: "March 2015"
---

This is a README file for **Course Project** for the course [Getting and Cleaning Data](https://class.coursera.org/getdata-012). Getting and Cleaning Data is the part of the program [Data Science Specialization 
of Johns Hopkins University] (https://www.coursera.org/specialization/jhudatascience/1).

Assignment for the Course Project
===

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 


http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Course Project
===

Course Project is placed in this repo. It includes: script file **run_analysis.R**, tidy data file **Data_set_mean.txt**, **README.md** and variables description in **Code_book.md**.

This repo does not include raw data. It can be downloaded on the link above. Script **run_analysis.R** must be run in the same directory, where *UCI HAR Dataset* with raw data is located.

Below there is a description that explain what the analysis file did in RStudio.

1. Merges the training and the test sets to create one data set
---

All row data of this zip-arhive is in the *UCI HAR Dataset* folder. After revising descriptions to raw data (see *README.txt* in *UCI HAR Dataset*) and their structure in TextWrangler test editor, files from *text* and *train* folders were used as a raw data, *text/Inertial Signals* and *train/Inertial Signals* sub-folders data were not used, as they do not include mean and standard deviation for each measurement.  That is why variables values only from the list *features.txt* were used for the analysis, they are marked in the following way:

- *mean(): Mean value*
- *std(): Standard deviation*

(see *features_info.txt* file from *UCI HAR Dataset* folder for more information about this).

### 1.1 Download data to R from *test* folder


```r
## download data from UCI HAR Dataset/test/X_test.txt
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)

## download data from UCI HAR Dataset/test/subject_test.txt 
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE)

## download data from UCI HAR Dataset/test/y_test.txt 
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", sep = "", header = FALSE)
```

### 1.2 Download data to R from *train* folder


```r
## download data from UCI HAR Dataset/train/X_train.txt 
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)

## download data from UCI HAR Dataset/train/subject_train.txt 
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE)

## download data from UCI HAR Dataset/train/y_train.txt 
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", sep = "", header = FALSE)
```

### 1.3 Merges the training and the test sets to create one data set


```r
##  Merges the test sets
X_test_full <- cbind(subject_test, y_test, X_test)

##  Merges the train sets
X_train_full <- cbind(subject_train, y_train, X_train)

## Merges the training and the test sets to create one data set
Data_set <- rbind(X_test_full, X_train_full)
```

After merging there appeared **Data_set** *data.frame* with dimension:


```r
dim(Data_set)
```

```
## [1] 10299   563
```

2. Extracts only the measurements on the mean and standard deviation for each measurement
---


```r
## download feature labels from features.txt from root "UCI HAR Dataset" folder into R
features_full <- read.table("UCI HAR Dataset/features.txt", sep = "", header = FALSE)
```

The resulting table is **features_full**, and it contains the list of all *features*, which will be used as feature titles for naming 561 column of **Data_set**.


```r
tail(features_full)
```

```
##      V1                                   V2
## 556 556 angle(tBodyAccJerkMean),gravityMean)
## 557 557     angle(tBodyGyroMean,gravityMean)
## 558 558 angle(tBodyGyroJerkMean,gravityMean)
## 559 559                 angle(X,gravityMean)
## 560 560                 angle(Y,gravityMean)
## 561 561                 angle(Z,gravityMean)
```

According to *features_info.txt* mean and standard deviation values are labelled in *features.txt* using *"-mean()"* and *"-std()"*. Use *grepl()* function for finding lines in the column *V2* **features_full**, containing *"-mean()"* and *"-std()"*; and write the result logical vector in the new column *"Mean_Std"*. 


```r
## transfer from factor to character
features_full$V2 <- as.character(features_full$V2)

## create logical vector in the new column "Mean_Std"
features_full$Mean_Std <- ifelse(grepl("-mean()", features_full$V2, fixed = TRUE) | grepl("-std()", features_full$V2, fixed = TRUE), TRUE, FALSE) 
```

Here is the resulted table:


```r
head(features_full, 8)
```

```
##   V1                V2 Mean_Std
## 1  1 tBodyAcc-mean()-X     TRUE
## 2  2 tBodyAcc-mean()-Y     TRUE
## 3  3 tBodyAcc-mean()-Z     TRUE
## 4  4  tBodyAcc-std()-X     TRUE
## 5  5  tBodyAcc-std()-Y     TRUE
## 6  6  tBodyAcc-std()-Z     TRUE
## 7  7  tBodyAcc-mad()-X    FALSE
## 8  8  tBodyAcc-mad()-Y    FALSE
```

The logical vector in *Mean_Std* colomn will be used for subsetting  **Data_set** table into the appropriate columns. Finally, *TRUE* value columns will remain, while *FALSE* value columns will be deleted. Before subsetting we will add two values *TRUE*, *TRUE* in the beginning of vector **features_full$Mean_Std**, as the first two columns were added before and they do not need to be cancelled (see 1.1 and 1.2 steps).


```r
## subsetting Data_set using features_full$Mean_Std logicl vector
Data_set <- Data_set[ ,c(TRUE, TRUE, features_full$Mean_Std)]
```

Finally, in the **Data_set** table we have only nesessary values of features, corresponding mean and standard deviation values. Dimension of the table is shown below:


```r
dim(Data_set)
```

```
## [1] 10299    68
```

3. Uses descriptive activity names to name the activities in the data set
---


```r
## download data from activity_labels.txt from root "UCI HAR Dataset" folder into R 
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE)
```

This is an activity table, the activities are given in the second column of our main **Data_set** table. This is the description to activity. The **activity_labels** table contents is given below:


```r
activity_labels
```

```
##   V1                 V2
## 1  1            WALKING
## 2  2   WALKING_UPSTAIRS
## 3  3 WALKING_DOWNSTAIRS
## 4  4            SITTING
## 5  5           STANDING
## 6  6             LAYING
```

Change numbers in the second column of the **Data_set** to descriptive activity


```r
## transfer from factor to character
activity_labels[ ,2] <- as.character(activity_labels[ ,2])

## replace activity_lables & modification activity names 
for (i in 1:nrow(Data_set)) {
      Data_set[i, 2] <- tolower(sub("_",".", activity_labels[Data_set[i, 2],2],))
}
```

Finally, we get the following **Data_set** table (first 5 columns are given):


```r
head(Data_set[ ,1:5])
```

```
##   V1     V1.1      V1.2          V2          V3
## 1  2 standing 0.2571778 -0.02328523 -0.01465376
## 2  2 standing 0.2860267 -0.01316336 -0.11908252
## 3  2 standing 0.2754848 -0.02605042 -0.11815167
## 4  2 standing 0.2702982 -0.03261387 -0.11752018
## 5  2 standing 0.2748330 -0.02784779 -0.12952716
## 6  2 standing 0.2792199 -0.01862040 -0.11390197
```

4. Appropriately labels the data set with descriptive variable names 
---


```r
## create the table from features_full only with the names of features coordinating to measurements on the mean and standard deviation
features_full <- features_full[features_full$Mean_Std, ]

## rename colomns in the main table
names(Data_set) <- c("subject", "activity", features_full$V2)
```

Finally, we get the following table **Data_set** (first 5 columns are given):


```r
head(Data_set[ ,1:5])
```

```
##   subject activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z
## 1       2 standing         0.2571778       -0.02328523       -0.01465376
## 2       2 standing         0.2860267       -0.01316336       -0.11908252
## 3       2 standing         0.2754848       -0.02605042       -0.11815167
## 4       2 standing         0.2702982       -0.03261387       -0.11752018
## 5       2 standing         0.2748330       -0.02784779       -0.12952716
## 6       2 standing         0.2792199       -0.01862040       -0.11390197
```

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
---

In this part of a Course project a *dplyr* package was used.


```r
##  install.packages("dplyr")
library(dplyr)
```


```r
## create new data set
Data_set_mean <- Data_set

## group table according to subject and activity
Data_set_mean <- group_by(Data_set_mean, subject, activity)

## Create tidy data set with the average of each variable for each activity and each subject
Data_set_mean <- summarise_each(Data_set_mean, funs(mean))
```

As now mean values of features are collected in **Data_set_mean**, it is better to rename these features in the columns:


```r
## rename the columns by adding "aver." (Average), to distinguish the columns in the table from the columns in the Data_set table
names(Data_set_mean)[3:ncol(Data_set_mean)] <- paste0("aver.", names(Data_set_mean)[3:ncol(Data_set_mean)])
```

Finally, we get the following table **Data_set_mean** (first 4 columns are given):


```r
head(Data_set_mean[ ,1:4])
```

```
## Source: local data frame [6 x 4]
## Groups: subject
## 
##   subject           activity aver.tBodyAcc-mean()-X aver.tBodyAcc-mean()-Y
## 1       1             laying              0.2215982           -0.040513953
## 2       1            sitting              0.2612376           -0.001308288
## 3       1           standing              0.2789176           -0.016137590
## 4       1            walking              0.2773308           -0.017383819
## 5       1 walking.downstairs              0.2891883           -0.009918505
## 6       1   walking.upstairs              0.2554617           -0.023953149
```

This table's data were written in the file **Data_set_mean.txt**. It is located in this *repo*. The file was saved with the following options:


```r
write.table(Data_set_mean, file = "Data_set_mean.txt", row.name=FALSE)
```

For correct opening of file **Data_set_mean.txt** on your computer in R, copy it into the *work directory* and open use code:


```r
Data_set_mean <- read.table("Data_set_mean.txt", header = TRUE) 

View(Data_set_mean)
```
