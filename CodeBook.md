# **Getting and Cleaning Data Project Code Book**


This repository contains:

* **CodeBook.md/CodeBook.html** This file

* **README.md/README.html** Summary of the project

* **Raw data** Data obtained from the given link.

    * *X_train.txt*: Training set
    * *y_train.txt*: Training labels
    * *X_tesy.txt*: Test set
    * *y_test.txt*: Test labels
    * *activity_labels.txt*: Links the class labels with their activity name.
    * *features.txt*: List of all features.
    *  *subject_train.txt/subject_test.txt*: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
    
* **features_info.txt**: Detailed features' information from the time and frequency domain of the raw data.

* **run_analysis.R** R script that gets the tidy data from the raw data.

* **tidydata.txt** The new tidy data created by *run_analysis.R*
* **tidydata_info.txt** Detailed information about the variables in *tidydata.txt*.

##Source Data

A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The source data for this project can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

##Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

##Attribute Information

For each record in the dataset it is provided:

Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration Triaxial Angular velocity from the gyroscope. A 561-feature vector with time and frequency domain variables. Its activity label. An identifier of the subject who carried out the experiment.

##Script Description

The R script called run_analysis.R does the following.

####**STEP1** Merge the training and the test sets to create one data set.
Set the working directory
Load the raw data into R
Applying *cbind()*, merge the training and test datas.

####**STEP2** Extract only the measurements on the mean and standard deviation for each measurement.
Create a vector that contains the indices of the columns with "mean()" or "std()" in their name.
Subset this data to keep only the necessary columns.

####**STEP3** Use descriptive activity names to name the activities in the data set
Convert the labels fron integer to factor, and change their levels to match the ones given in *activity_labels.txt*

####**STEP4** Appropriately label the data set with descriptive activity names.
Set the names of the data set accordingly to *features.txt* and clean them up using *tolower()* and *gsub()* functions.

####**STEP5** Create a second, independent tidy data set with the average of each variable for each activity and each subject.
Using *group_by()* and *summarise_each()* from the **dplyr package** create the new tidy data.
Change its labels again to reflect that now they reprsent an average.

####**FINAL STEP**
Create a *final.txt* file with *write.table()* containing the new tidy data.