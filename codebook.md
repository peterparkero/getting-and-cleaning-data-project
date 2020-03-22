Codebook
==================================== 
# Summary
This codebook provide a summary on the data set provided under `./output/tidy_dataset.txt`.  The original data is extracted from [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), and this data set is a summary data set based on the original data set.

# Final Data Set ("./output/tidy_dataset.txt")
The summary data set contains the following fields:

## Group by
- Subject
- Activity

## Mean values per subject per activity
- tBodyAcc-mean()-X
- tBodyAcc-mean()-Y
- tBodyAcc-mean()-Z
- tBodyAcc-std()-X
- tBodyAcc-std()-Y
- tBodyAcc-std()-Z
- tGravityAcc-mean()-X
- tGravityAcc-mean()-Y
- tGravityAcc-mean()-Z
- tGravityAcc-std()-X
- tGravityAcc-std()-Y
- tGravityAcc-std()-Z
- tBodyAccJerk-mean()-X
- tBodyAccJerk-mean()-Y
- tBodyAccJerk-mean()-Z
- tBodyAccJerk-std()-X
- tBodyAccJerk-std()-Y
- tBodyAccJerk-std()-Z
- tBodyGyro-mean()-X
- tBodyGyro-mean()-Y
- tBodyGyro-mean()-Z
- tBodyGyro-std()-X
- tBodyGyro-std()-Y
- tBodyGyro-std()-Z
- tBodyGyroJerk-mean()-X
- tBodyGyroJerk-mean()-Y
- tBodyGyroJerk-mean()-Z
- tBodyGyroJerk-std()-X
- tBodyGyroJerk-std()-Y
- tBodyGyroJerk-std()-Z
- tBodyAccMag-mean()
- tBodyAccMag-std()
- tGravityAccMag-mean()
- tGravityAccMag-std()
- tBodyAccJerkMag-mean()
- tBodyAccJerkMag-std()
- tBodyGyroMag-mean()
- tBodyGyroMag-std()
- tBodyGyroJerkMag-mean()
- tBodyGyroJerkMag-std()
- fBodyAcc-mean()-X
- fBodyAcc-mean()-Y
- fBodyAcc-mean()-Z
- fBodyAcc-std()-X
- fBodyAcc-std()-Y
- fBodyAcc-std()-Z
- fBodyAcc-meanFreq()-X
- fBodyAcc-meanFreq()-Y
- fBodyAcc-meanFreq()-Z
- fBodyAccJerk-mean()-X
- fBodyAccJerk-mean()-Y
- fBodyAccJerk-mean()-Z
- fBodyAccJerk-std()-X
- fBodyAccJerk-std()-Y
- fBodyAccJerk-std()-Z
- fBodyAccJerk-meanFreq()-X
- fBodyAccJerk-meanFreq()-Y
- fBodyAccJerk-meanFreq()-Z
- fBodyGyro-mean()-X
- fBodyGyro-mean()-Y
- fBodyGyro-mean()-Z
- fBodyGyro-std()-X
- fBodyGyro-std()-Y
- fBodyGyro-std()-Z
- fBodyGyro-meanFreq()-X
- fBodyGyro-meanFreq()-Y
- fBodyGyro-meanFreq()-Z
- fBodyAccMag-mean()
- fBodyAccMag-std()
- fBodyAccMag-meanFreq()
- fBodyBodyAccJerkMag-mean()
- fBodyBodyAccJerkMag-std()
- fBodyBodyAccJerkMag-meanFreq()
- fBodyBodyGyroMag-mean()
- fBodyBodyGyroMag-std()
- fBodyBodyGyroMag-meanFreq()
- fBodyBodyGyroJerkMag-mean()
- fBodyBodyGyroJerkMag-std()
- fBodyBodyGyroJerkMag-meanFreq()

# Transformations Applied
From the original data set, the following transformations are applied:

1. Merge the training and the test sets to create one data set.  These tables include:
  - `./data/UCI HAR Dataset/train/X_train.txt`
  - `./data/UCI HAR Dataset/train/y_train.txt`
  - `./data/UCI HAR Dataset/train/subject_train.txt`
  - `./data/UCI HAR Dataset/test/X_test.txt`
  - `./data/UCI HAR Dataset/test/y_test.txt`
  - `./data/UCI HAR Dataset/test/subject_test.txt`
  
2. Extract only the measurements on the mean and standard deviation for each measurement.  This is done by getting all columns that contain either:
  - Activity
  - Subject
  - mean
  - std
  
3. Uses descriptive activity names to name the activities in the data set.  This is done by performing a left join from `./data/UCI HAR Dataset/activity_labels.txt` to `./data/UCI HAR Dataset/train/y_train.txt` and `./data/UCI HAR Dataset/test/y_test.txt` data frames.  The original activity labels are then removed to avoid duplication of information.

4. Appropriately labels the data set with descriptive variable names.  Feature names from `./data/UCI HAR Dataset/features.txt` are used as the column headers of `./data/UCI HAR Dataset/train/X_train.txt` and `./data/UCI HAR Dataset/test/X_test.txt`.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  Grouping by `Subject` and `Activity`, all remaining mean and standard deviation related variables are summarized for their mean.  This is finally saved under `./output/tidy_dataset.txt`.