# Merge the training and the test sets to create one data set
## read activity and feature
activity_labels <- read.table("C:/Users/Muhammad Ammar/Desktop/Getting and Cleaning Data/Course Project/UCI HAR Dataset/activity_labels.txt")
features <- read.table("C:/Users/Muhammad Ammar/Desktop/Getting and Cleaning Data/Course Project/UCI HAR Dataset/features.txt")

## read test data
subject_test <- read.table("C:/Users/Muhammad Ammar/Desktop/Getting and Cleaning Data/Course Project/UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("C:/Users/Muhammad Ammar/Desktop/Getting and Cleaning Data/Course Project/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("C:/Users/Muhammad Ammar/Desktop/Getting and Cleaning Data/Course Project/UCI HAR Dataset/test/y_test.txt")

## read train data
subject_train <- read.table("C:/Users/Muhammad Ammar/Desktop/Getting and Cleaning Data/Course Project/UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("C:/Users/Muhammad Ammar/Desktop/Getting and Cleaning Data/Course Project/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("C:/Users/Muhammad Ammar/Desktop/Getting and Cleaning Data/Course Project/UCI HAR Dataset/train/y_train.txt")

## combine data for test and train sets respectively
test <- cbind(subject_test, y_test, X_test)
train <- cbind(subject_train, y_train, X_train)

## combine test and train together
combined_data <- rbind(test, train)
View(combined_data)

## naming the columns
names(combined_data)
names(combined_data) <- c("subject", "activity", features$V2)

## Extracts only the measurements on the mean and standard deviation for each measurement
sub_features <- features$V2[grep("[Mm]ean|std", features$V2)]
mean_std <- c("subject", "activity", as.character(sub_features))
mean_std_col <- subset(combined_data, select = mean_std)
TidyData <- combined_data %>% select(subject, activity, contains("mean"), contains("std"))

## Use descriptive activity names to name the activities in the data set
mean_std_col$activity <- activity_labels[mean_std_col$activity, 2]
mean_std_col2 <- mean_std_col

## Appropriately labels the data set with descriptive variable names
names(mean_std_col)<-gsub("Acc", "Accelerometer", names(mean_std_col))
names(mean_std_col)<-gsub("Gyro", "Gyroscope", names(mean_std_col))
names(mean_std_col)<-gsub("BodyBody", "Body", names(mean_std_col))
names(mean_std_col)<-gsub("Mag", "Magnitude", names(mean_std_col))
names(mean_std_col)<-gsub("^t", "Time", names(mean_std_col))
names(mean_std_col)<-gsub("^f", "Frequency", names(mean_std_col))
names(mean_std_col)<-gsub("tBody", "TimeBody", names(mean_std_col))
names(mean_std_col)<-gsub("-mean()", "Mean", names(mean_std_col), ignore.case = TRUE)
names(mean_std_col)<-gsub("-std()", "STD", names(mean_std_col), ignore.case = TRUE)
names(mean_std_col)<-gsub("-freq()", "Frequency", names(mean_std_col), ignore.case = TRUE)
names(mean_std_col)<-gsub("angle", "Angle", names(mean_std_col))
names(mean_std_col)<-gsub("gravity", "Gravity", names(mean_std_col))

### using the janitor package to clean column names
library(janitor)
tidy_data <- clean_names(mean_std_col)
