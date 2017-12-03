# Getting and Cleaning Data Course Project
# 
# The purpose of this project is to demonstrate my ability to
# collect, work with, and clean a data set. Please see the Readme
# file for more background and approach.
#
# After intializing the work environment and retrieving data (Step 0),
# This script does the following:
#
# Step 1. Merges the training and the test sets to create one data set.
# Step 2. Extracts only the measurements on the mean and standard deviation 
#         for each measurement.
# Step 3. Uses descriptive activity names to name the activities in the data set
# Step 4. Appropriately labels the data set with descriptive variable names.
# Step 5. From the data set in step 4, creates a second, independent tidy 
#         data set with the average of each variable for each activity and 
#         each subject.
#
# This code presumes that data is already downloaded. See download_unzip.R
#
# Step 0: Intialization and retrieve data ---------------------------------------
wd <- "~/GitHub/GettingAndCleaningDataCourseProject"
setwd(wd)

library(readr);library(tidyr);library(dplyr)

# Load base tables, the tables that provide labels
  setwd("./data/UCI HAR Dataset")
  activity_labels <- read_table("activity_labels.txt",
                     col_names = c("activity_id","activity_desc"))
  features        <- read_table("features.txt",
                     col_names = c("feature_id"))  # a list of 561 features (or measurements) captured in the 

# Load test tables
  setwd("./test")
  subject_test <- read_table("subject_test.txt",col_names=c("subject_id"))
  x_test <- read_table("X_test.txt",col_names = features$feature_id)
  y_test <- read_table("y_test.txt", col_names = c("activity_id"))

# Load train tables
  setwd("../train")
  subject_train <- read_table("subject_train.txt",col_names=c("subject_id"))
  x_train <- read_table("X_train.txt",features$feature_id)
  y_train <- read_table("y_train.txt",col_names = c("activity_id"))

  rm(features) # this table is no longer needed
  setwd("..")
  setwd("..")

# Step 1: Merge training and test sets to create one data set --------------------
#
# First add a field (bind) to the  indicating train or test,
#  then binding with X_test or X_train. Do for both test and train

  x_test1 <-  subject_test %>%  # first column is the subject 
              bind_cols(y_test) %>%  # this table includes an activity type ID
              mutate(set="test") %>%  # add the type
              bind_cols(x_test)  # bind to all of the measures

  x_train1 <- subject_train %>% 
              bind_cols(y_train) %>% 
              mutate(set="train") %>% 
              bind_cols(x_train)
        
  x_step1 <- bind_rows(x_train1, x_test1) # Merge (bind) training values 
                                          #    with test values
  
  rm(subject_test, subject_train, x_test, x_train, 
     x_test1, x_train1, y_test, y_train)  # these tables are no longer needed
  
# Step 2. Extracts only the measurements on the mean and standard deviation ------ 
#   for each measurement 
# 
# Instead of the "grep" functions from Basic R, I chose to use the "select" 
#   function from dplyr with the "contains" helper function.X_step2 could be
#   chained to x_step1, but is kept separate for the purpose of this exercise.  
  
  x_step2 <- x_step1 %>%
             select(1:3, contains("mean()"), contains("std()")) 

  rm(x_step1)  # this table is no longer needed

# Step 3.Use descriptive activity names to name the activities in -----------------
#   the data set 
#
#   I chose to do this using dplyr::left_join function. 
#   Join the activity_labels table on activity_id to get descriptive activity names.
#   The variable x_step3 could be piped to x_step2, but is kept separate for ease
#   of illustrating the steps in this exercise.  

  x_step3 <- x_step2 %>% 
             left_join(activity_labels)
  
  rm(x_step2, activity_labels)  # these tables are no longer needed
  
# Step 4. Appropriately labels the data set with descriptive variable names.--------
#   I added labels in Step 2. Here I clean them up using tidyr reshape 
#   functions to bring all variable names into one field, then using 
#   tidyr split cell functions to clean the variable names
#   cleaning on that one field.  

  x_tidy <- x_step3 %>% 
            gather(feature, feature_value, 4:69) %>%
            separate(feature,c("feature_id","feature","feature_type", 
                             "coordinate"), extra = "merge")  %>%
            select(subject_id, activity_desc, set, feature_id, feature, 
                   feature_type, coordinate, feature_value) 
  
  x_tidy$feature_id <- as.numeric(x_tidy$feature_id)
  
  rm(x_step3)  # this table is no longer needed
  
# Step 5. From the data set in step 4, creates a second, independent tidy 
#         data set with the average of each variable for each activity and 
#         each subject.   

  x_summary <- x_tidy %>%
            group_by(subject_id, activity_desc, feature_id, 
                     feature, feature_type, coordinate) %>%
            summarize(average_value = mean(feature_value)) %>%
            arrange(subject_id, activity_desc, feature_id)
  
  setwd(wd)
  write.table(x_summary, "./HAR_measures_summary.txt", row.names = FALSE)
