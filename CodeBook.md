#This is the code book for Getting and Cleaning Data Course Project
About the source data

The source data are from the Human Activity Recognition Using Smartphones Data Set. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

About R script

File with R code "run_analysis.R" performs the following steps:
Read data;
label the data set with descriptive variable names;
merge the train and the test sets to create one data set;
use descriptive activity names to name the activities in the data set;
extract the mean and standard deviation for each measurement;
create a second data set with the average of each variable for each activity and each subject and write it into a txt file

About variables:
x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
onedata1 merges the previous datasets for further analysis.
features contains the correct names for the x_data sets, which are applied to the column names stored in onedata1
activityLabels contains the activity information for the y_data sets, which are applied to the column names (i.e., activityID and activityTypes) stored in onedata1
