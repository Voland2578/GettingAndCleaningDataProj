### Raw Data Collection
The data collected is a human activity recognition data using smartphones. It represents the experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
It described in full detail here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The raw data is provided at this
[location](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 

### Data Transformation
#### Merging
##### Train Data
Training set data has been loaded into the following variables in the **acquire.data()** function

Variable Name | Description 
------------  | -------------
train_data    | signal data from X_train.txt
train_labels  | numerical activity label from y_train.txt
train_subject | subject data contained in subject_train.txt

test_data contains the result of merging the 3 tables above


##### Test Data
Test set data has been loaded into the following variables in the **acquire.data()** function

Variable Name | Description 
------------  | -------------
test_data    | signal data from X_test.txt
test_labels  | numerical activity label from y_test.txt
test_subject | subject data contained in subject_test.txt

train_data contains the result of merging the 3 tables above

