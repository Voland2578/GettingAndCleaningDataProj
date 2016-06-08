library(dplyr)
library(reshape2)

# Returns combined test/trial dataset with subject and activity labels
# @Param root_path - Root directory to the data
acquire.data <- function (root_path) {
  test_path <- paste( c(root_path, "test"), collapse = "\\")
  train_path <- paste(c(root_path, "train"), collapse = "\\")
  
  # common
  activity_labels <- read.csv2(file=paste(root_path, "activity_labels.txt", sep="\\"), header = FALSE, sep= "", col.names = c("LabelID","ActivityName"))
  features <- read.csv2(file=paste(root_path, "features.txt", sep="\\"), sep = " ", header = FALSE )
  
  # test raw
  test_data <- read.table(file=paste(test_path, "X_test.txt", sep="\\"), sep="")
  test_labels <- read.table(file=paste(test_path, "y_test.txt", sep="\\"), sep="")
  test_subject <- read.table(file=paste(test_path, "subject_test.txt", sep="\\"), sep="")
  
  # train raw
  train_data <- read.table(file=paste(train_path, "X_train.txt", sep="\\"), sep="")
  train_labels <- read.table(file=paste(train_path, "y_train.txt", sep="\\"), sep="")
  train_subject <- read.table(file=paste(train_path, "subject_train.txt", sep="\\"), sep="")
  
  #-------------------TRAIN SECTION ------------------------------
  train_data <- cbind(train_data, train_labels)
  train_data <- cbind(train_data, train_subject)
  names(train_data) <- c(sapply(features[,2], as.character),"LabelID","SubjectID")
  train_data <- left_join(train_data,activity_labels)
  
  #-------------------TEST SECTION ------------------------------
  test_data <- cbind(test_data, test_labels)
  test_data <- cbind(test_data, test_subject)
  names(test_data) <- c(sapply(features[,2], as.character),"LabelID","SubjectID")
  test_data <- left_join(test_data,activity_labels)
  
  # combine the data
  combined_data <- rbind(train_data, test_data)
  
}

# Tidy up the dataset columns
# @Param dataset
tidy.up <- function (dataset) {
    # rename the columns for ease of use
    tidy_data  <- gsub("(-mean\\(\\))$",  "Mean", names(dataset))
    tidy_data  <- gsub("(-std\\(\\))$",   "Std", tidy_data)
    tidy_data <- gsub("-mean\\(\\)-(.)","Mean\\1",tidy_data)
    tidy_data <- gsub("-std\\(\\)-(.)","Std\\1",tidy_data)
    names(dataset) <- tidy_data
    dataset
}

# Analyses the dataset mean/std features
# @Param dataset
analyze.data <- function (dataset) {
  column_names  <- names(dataset)
  std_mean_idx  <- grep (pattern = "SubjectID|ActivityName|std\\(\\)|mean\\(\\)", column_names, value = FALSE)
  combined_filtered_data <- dataset[, std_mean_idx]
  
  combined_filtered_data <-tidy.up(combined_filtered_data)
  #From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  grouped <- group_by(combined_filtered_data, ActivityName, SubjectID)
  result <- summarise_each(grouped, funs(mean))
  result
}

# Saves dataset to a specified location
# @Param dataset
# @Param output_path 
save.data <- function (dataset, output_path) {
  write.table(dataset, row.name = FALSE, file = output_path)
}

# Sample code to run the analysis
run.me <- function() {
  root_path <- "E:\\Projects\\R\\CleaningData\\week4\\UCI HAR Dataset"
  combined_data <- acquire.data(root_path)
  result <- analyze.data(combined_data)
  save.data(result, paste( c(root_path, "output.txt"), collapse = "\\"))
}



