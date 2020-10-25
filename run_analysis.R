#download data and unzip
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "/Users/mcheng/Documents/getting-and-cleaning-data-week-4-project/UCI HAR Dataset.zip")
unzip(zipfile = "/Users/mcheng/Documents/getting-and-cleaning-data-week-4-project/UCI HAR Dataset.zip")

#read data
x_train <- read.table("/Users/mcheng/Documents/getting-and-cleaning-data-week-4-project/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("/Users/mcheng/Documents/getting-and-cleaning-data-week-4-project/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("/Users/mcheng/Documents/getting-and-cleaning-data-week-4-project/UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("/Users/mcheng/Documents/getting-and-cleaning-data-week-4-project/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("/Users/mcheng/Documents/getting-and-cleaning-data-week-4-project/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("/Users/mcheng/Documents/getting-and-cleaning-data-week-4-project/UCI HAR Dataset/test/subject_test.txt")
features <- read.table("/Users/mcheng/Documents/getting-and-cleaning-data-week-4-project/UCI HAR Dataset/features.txt")
activityLabels <- read.table("/Users/mcheng/Documents/getting-and-cleaning-data-week-4-project/UCI HAR Dataset/activity_labels.txt")

#label the data set with descriptive variable names
colnames(x_train) <- features[ , 2]
colnames(x_test) <- features[ , 2]
colnames(y_train) <- "activityID"
colnames(y_test) <- "activityID"
colnames(subject_train) <- "subjectID"
colnames(subject_test) <- "subjectID"
colnames(activityLabels) <- c("activityID", "activityType")

#merge data sets
train <- cbind(x_train, y_train, subject_train)
test <- cbind(x_test, y_test, subject_test)
onedata <- rbind(train, test)

#use descriptive activity names to name the activities in the data set
onedata1 <- merge(onedata, activityLabels, by = "activityID")

#extract the mean and standard deviation for each measurement
colnames <- colnames(onedata1)
mean_and_sd <- grepl("activityID", colnames) | 
               grepl("subjectID", colnames) | 
               grepl("mean", colnames) | 
               grepl("std", colnames)
setformean_and_sd <- onedata1[ , mean_and_sd == TRUE]

#creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidyData<- aggregate(. ~ subjectID + activityID, data = setformean_and_sd, mean)
tidyData <- tidyData[order(tidyData$subjectID, tidyData$activityID), ]

#write the second data set into a txt file
write.table(tidyData, "tidyData.txt", row.names = FALSE)

knitr::knit("README.Rmd")
