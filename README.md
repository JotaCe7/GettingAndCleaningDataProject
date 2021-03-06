# Human Activity Recognition Using Smartphones Dataset

## Getting Tidy Data

Jose Cisneros.

This is a repository for the Course Project of Getting ans Cleaning Data, a Johns Hopkins University's MOOC.

You can enroll to this course here: [Getting and Cleaning Data](https://www.coursera.org/course/getdata)

### Abstract
One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Summary
This project consists in preparing tidy data that can be used for later analysis from a given raw data.
The *run_analysis.R* file performs this transformation. In order to execute it, be sure to have the raw data (from the given link) in the same directory.

This R script does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

