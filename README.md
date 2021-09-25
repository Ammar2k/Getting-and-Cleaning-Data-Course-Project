# Getting-and-Cleaning-Data-Course-Project
This repostory contains files for coursera course titles "Getting and Cleaning Data". The files were made as submission for the course project.

## Project Description
The goal of this project is to tidy the raw data that can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The raw data is processed in steps as done and explained in *Course Project.R*

The following steps explain the steps in which the raw data was processed.

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## File Description
**Course Project.R**: Processes the data from raw to tidy

**tidy_data.txt** is the tidy data after the processing

**CodeBook.md** gives an introuction to the data in the *tidy_data.txt* file
