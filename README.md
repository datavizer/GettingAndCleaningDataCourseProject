# Getting And Cleaning Data Course Project


This is a submittal for the class project for Getting and Cleaning Data course. This document starts with a restatement of the assignment. ...

## Introduction and background

"The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected."

### Source data
In this project we are asked to take movement data collected by UC Irvine researchers from the accellerometers on the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

### Original data descriptions
The original data is in multiple files that we need to merge and make tidy. As described in the assignment, the data files are: 

* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

## How the scripts work
The R script called run_analysis.R that does the following.

Step 1: Merges the training and the test sets to create one data set.
Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
Step 3: Uses descriptive activity names to name the activities in the data set
Step 4: Appropriately labels the data set with descriptive variable names.
Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


###Script descriptions




###Instructions


Review criterialess 
The submitted data set is tidy.
The Github repo contains the required scripts.
GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
The README that explains the analysis files is clear and understandable.
The work submitted for this project is the work of the student who submitted it.
Getting and Cleaning Data Course Projectless 
