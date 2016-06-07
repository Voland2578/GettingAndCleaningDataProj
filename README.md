# Getting and Cleaning Data Project
## Synopsis
This project serves as a demonstration of gathering, cleaning, and tidying up data for further analysis. The data used in this project is a human activity recognition dataset collected via tracking activity of 30 human volunteers wearing a smartphone. 
The complete description of the dataset can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Installation
0. Acquire data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip into local disk 
0. Download the R script from https://github.com/Voland2578/GettingAndCleaningDataProj/blob/master/run_analysis.R
0. Execute the following code substituting *root_path* with the location of the dataset acquired in (1)
<pre lang="R"><code>
# don't forget to point root path to "UCI HAR Dataset" folder
root_path <- "E:\\Projects\\R\\CleaningData\\week4\\UCI HAR Dataset"
data <- acquire.data(root_path)
analyze.data(data)
</code></pre>


Data acquisition and analysis are performed by run_analysis.R script



