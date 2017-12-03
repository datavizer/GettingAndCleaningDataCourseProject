# Data Dictionary - Summary File for Human Activity Recognition Using Smartphones Data Set 

### Field Name: subject_id
#### Descirption: An identifier of the subject who carried out the experiment
Values: Integers from 1 to 30

### Field Name: activity_desc
#### Description: Activity the subject is performing
Values: 
LAYING
SITTING
STANDING
WALKING
WALKING_DOWNSTAIRS
WALKING_UPSTAIRS

### Field Name: feature_id
#### Description: The original data set includes 561 features with time and frequency domain variables. This summary data set extracts only the 66 features with means and standard deviations. The original feature name is split between fields in this summary data set. This field includes the identifier.
Values: Integers 1..6 41..46 81..86 121..126  161..166  201..202  214..215  227..228 240..241  253..271 345..350  424..429 503..504  516..517  529..530  542..543
### Field Name: feature
#### Description: The movement being measured. Values starting with "f" are measuring frequency. Values starting with "t" are measuring time. This summary data set extracts only the 66 features with means and standard deviations. The original feature name is split between fields in this summary data set. This field includes the identifier.
Values:
fBodyAcc
fBodyAccJerk
fBodyAccMag
fBodyBodyAccJerkMag
fBodyBodyGyroJerkMag
fBodyBodyGyroMag
fBodyGyro
tBodyAcc
tBodyAccJerk
tBodyAccJerkMag
tBodyAccMag
tBodyGyro
tBodyGyroJerk
tBodyGyroJerkMag
tBodyGyroMag
tGravityAcc
tGravityAccMag

### Field Name: feature_type
#### Description: Indicator of whether the feature is a mean or a standard deviation. This summary data set extracts only the 66 features with means and standard deviations. The original feature name is split between fields in this summary data set. This field includes the identifier.
Values: 
mean
std

### Field Name: coordinate
#### Description: Indicator of whether the feature is being measured in the x, y, or z coorinate direction. For magnitude type features, there is no coordinate and this field is blank. This summary data set extracts only the 66 features with means and standard deviations. The original feature name is split between fields in this summary data set. This field includes the identifier.
Values:
X
Y
Z
(blank)

### Field Name: average_value
#### Description: The mean of all samples for the given Subject ID, activity, and feature. The values in the source data were normalized within a range of -1 to 1. Because of this, the means of the individual measurements also fall between -1 and 1.
Values: -1 to 1
