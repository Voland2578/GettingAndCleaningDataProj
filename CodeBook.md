### Raw Data Collection
The data collected is a human activity recognition data using smartphones. It represents the experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
It described in full detail here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The raw data is provided at this
[location](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 


#### Loading Raw Data
The raw data was loaded into following variables

Variable Name   | Source File | Description 
------------    | ------------|------------
train_data      | X_train.txt |  signal data from X_train.txt
train_labels    | y_train.txt |  numerical activity labels for each observation in train_data
train_subject   | subject_train.txt |  subject id for each observation in train_data
test_data       | X_test.txt |  signal data from X_train.txt
test_labels     | y_test.txt |  numerical activity labels for each observation in test_data
test_subject    | subject_test.txt |  subject id for each observation in test_data
features        | features.txt |  names of 561 features provided in train_data and test_data 
activity_labels | activity_labels.txt |  mapping between activity label id  and description


### Data Transformation
#### Gathering 
All train data has been merged into train_data variable
<pre lang="R"><code>
 train_data <- cbind(train_data, train_labels)
 train_data <- cbind(train_data, train_subject)
</code></pre>

All test data has been merged into test_data variable
<pre lang="R"><code>
 test_data <- cbind(test_data, test_labels)
 test_data <- cbind(test_data, test_subject)
 </code></pre>
#### Labeling

The appropriate column labels were applied to train_data and test_data from features variable. Additionally, _LabelID_ and _SubjectID_ were added for readability

#### Merging
The test and train data were merged and represented in the _combined_data_ variable. The readable activity label from activity_labels was added.

#### Extracting columns 

Only factors representing mean or standard deviation were retained
<pre>
[1] "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"           "tBodyAcc-mean()-Z"           "tBodyAcc-std()-X"            "tBodyAcc-std()-Y"           
 [6] "tBodyAcc-std()-Z"            "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"        "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"        
[11] "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"         "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"       "tBodyAccJerk-mean()-Z"      
[16] "tBodyAccJerk-std()-X"        "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"        "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"         
[21] "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"           "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"           "tBodyGyroJerk-mean()-X"     
[26] "tBodyGyroJerk-mean()-Y"      "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"       "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"      
[31] "tBodyAccMag-mean()"          "tBodyAccMag-std()"           "tGravityAccMag-mean()"       "tGravityAccMag-std()"        "tBodyAccJerkMag-mean()"     
[36] "tBodyAccJerkMag-std()"       "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"          "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"     
[41] "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"           "fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"            "fBodyAcc-std()-Y"           
[46] "fBodyAcc-std()-Z"            "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"       "fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"       
[51] "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"        "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"          "fBodyGyro-mean()-Z"         
[56] "fBodyGyro-std()-X"           "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"           "fBodyAccMag-mean()"          "fBodyAccMag-std()"          
[61] "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"   "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"      "fBodyBodyGyroJerkMag-mean()"
[66] "fBodyBodyGyroJerkMag-std()" 

</pre>

