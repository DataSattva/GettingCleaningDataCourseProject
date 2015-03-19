
#     1. Merges the training and the test sets to create one data set ====

## download data from UCI HAR Dataset/test/X_test.txt
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)

## download data from UCI HAR Dataset/test/subject_test.txt 
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE)

## download data from UCI HAR Dataset/test/y_test.txt 
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", sep = "", header = FALSE)

## download data from UCI HAR Dataset/train/X_train.txt 
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)

## download data from UCI HAR Dataset/train/subject_train.txt 
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE)

## download data from UCI HAR Dataset/train/y_train.txt 
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", sep = "", header = FALSE)

##  Merges the test sets
X_test_full <- cbind(subject_test, y_test, X_test)

##  Merges the train sets
X_train_full <- cbind(subject_train, y_train, X_train)

## Merges the training and the test sets to create one data set
Data_set <- rbind(X_test_full, X_train_full)

#     2. Extracts only the measurements on the mean and standard deviation for each measurement ====

## download feature labels from features.txt from root "UCI HAR Dataset" folder into R
features_full <- read.table("UCI HAR Dataset/features.txt", sep = "", header = FALSE)

## transfer from factor to character
features_full$V2 <- as.character(features_full$V2)

## create logical vector in the new column "Mean_Std"
features_full$Mean_Std <- ifelse(grepl("-mean()", features_full$V2, fixed = TRUE) | grepl("-std()", features_full$V2, fixed = TRUE), TRUE, FALSE) 

## subsetting Data_set using features_full$Mean_Std logicl vector
Data_set <- Data_set[ ,c(TRUE, TRUE, features_full$Mean_Std)]

#     3. Uses descriptive activity names to name the activities in the data set ====
           
## download data from activity_labels.txt from root "UCI HAR Dataset" folder into R 
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE)

## transfer from factor to character
activity_labels[ ,2] <- as.character(activity_labels[ ,2])

## replace activity_lables & modification activity names
for (i in 1:nrow(Data_set)) {
      Data_set[i, 2] <- tolower(sub("_",".", activity_labels[Data_set[i, 2],2],))
}

#     4. Appropriately labels the data set with descriptive variable names ====

## create the table from features_full only with the names of features coordinating to measurements on the mean and standard deviation
features_full <- features_full[features_full$Mean_Std, ]

## rename colomns in the main table
names(Data_set) <- c("subject", "activity", features_full$V2)

## result
View(Data_set)

#     5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject ====

##  install.packages("dplyr")
library(dplyr)

## create new data set
Data_set_mean <- Data_set

## group table according to subject and activity
Data_set_mean <- group_by(Data_set_mean, subject, activity)

## Create tidy data set with the average of each variable for each activity and each subject
Data_set_mean <- summarise_each(Data_set_mean, funs(mean))

## rename the columns by adding "aver." (Average), to distinguish the columns in the table from the columns in the Data_set table
names(Data_set_mean)[3:ncol(Data_set_mean)] <- paste0("aver.", names(Data_set_mean)[3:ncol(Data_set_mean)])

View(Data_set_mean)

write.table(Data_set_mean, file = "Data_set_mean.txt", row.name=FALSE)







