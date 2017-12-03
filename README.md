# Getting And Cleaning Data Course Project


This is a submittal for the class project for Getting and Cleaning Data course. This document starts with a restatement of the assignment, then describes the steps used to complete the assignment. The script also includes descriptions in line with the code.

## Introduction and background

> The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

In this project we are asked to take movement data collected by UC Irvine researchers from the accellerometers on the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

The original data is in multiple files that we need to merge and make tidy. As described in the assignment, the data files are: 

* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

Dataset citation: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

## How the scripts work
The R script called run_analysis.R retrieves and tidies the data. The assumption is that the original data is already downloaded into a subdirectory called "data".

After intializing the work environment and retrieving data (Step 0), run_analysis.R does the following:

Step 1: Merges the training and the test sets to create one data set.
Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
Step 3: Uses descriptive activity names to name the activities in the data set
Step 4: Appropriately labels the data set with descriptive variable names.
Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Step 0: Initialize workspace and retrieve data
This script uses readr, tidyr, and dplyr. The neeeded raw data tables are loaded in this step. This includes activity labels and features from the base tables; x_test and y_test from the test tables, and x_train and y_train from the train tables.

The x tables have 561 data measures that correspond with the items listed in the feature table. I chose to merge these descriptive measure names onto the columns in this step. This results in meaningful field names immediately and the ability to select fields based on parts of the column names.

To keep the list of variables clean, I remove variables once they are no longer needed. Since I added meaningful column names, I can remove the feature table at the end of this step. 

### Step 1: Merge training and test

First, dplyr::bind_cols is used to combine subject ID (from subject table), activity ID (from the y tables), and measures (from x tables) 
for both the test and train data sets. At the same time, a column is added to indicate if a record is from the test or train set. Then dplyr::bind_rows is used to merge the test and training data.

The following tables and variables are no longer needed after this step and are removed: subject_test, subject_train, x_test, x_train, 
     x_test1, x_train1, y_test, y_train

### Step 2: Extract only measurements on the mean and standard deviation for each measure

Instead of the "grep" functions from Basic R, I chose to use the "select" function from dplyr with the "contains" helper function. The first three columns contain the subject ID, activity ID, and whether it is test or train. The next 561 columns already have meaningful names from Step 0. Those that contain "mean()" or "std()" are selected.

At this point I can remove the table created in Step 1.

### Step 3: Use descriptive activity names to name the activies in the data set

I chose to do this using dplyr::left_join function. Join the activity_labels table on activity_id to get descriptive activity names.

The variable x_step3 could be piped to x_step2, but is kept separate for ease of illustrating the steps in this exercise. 

At this point I can remove the table created in Step 2.

### Step 4. Appropriately labels the data set with descriptive variable names

I added appropriate descriptive variable names in Step 0. In this step, I us tidyr::gather to switch all of the measures from columns into individual rows. I then can separate the variable names into separate components. 

The arrangement of the data for tidiness as tall and skinny is a judgement call, but I chose to do this because I assume that the analyst may want to group on the measure type, the measure, or the XYZ coordinate. 

At this point I can remove the table created in Step 3.

### Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

First, the tidy data from step 4 is grouped, to the level of the individual measure ID. Then the mean is taken for each measure value. I chose to sort the data after that.

Finally, the summary table is written to a text file.
