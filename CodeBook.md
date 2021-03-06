# Code book
This code book is intended to extend the code book provided with the raw data from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.
The original code book is included in this repository in the files original\_data\_features\_info.txt and original\_data\_README.txt.

## Extracted variables
These variables are extracted from the raw data set. See the original data code book for their description
- "tBodyAcceleration.mean.X"
- "tBodyAcceleration.mean.Y"               
- "tBodyAcceleration.mean.Z"
- "tBodyAcceleration.std.X"                
- "tBodyAcceleration.std.Y"
- "tBodyAcceleration.std.Z"                
- "tGravityAcceleration.mean.X"
- "tGravityAcceleration.mean.Y"            
- "tGravityAcceleration.mean.Z"
- "tGravityAcceleration.std.X"             
- "tGravityAcceleration.std.Y"
- "tGravityAcceleration.std.Z"             
- "tBodyAccelerationJerk.mean.X"
- "tBodyAccelerationJerk.mean.Y"           
- "tBodyAccelerationJerk.mean.Z"
- "tBodyAccelerationJerk.std.X"            
- "tBodyAccelerationJerk.std.Y"
- "tBodyAccelerationJerk.std.Z"            
- "tBodyGyro.mean.X"
- "tBodyGyro.mean.Y"                       
- "tBodyGyro.mean.Z"
- "tBodyGyro.std.X"                        
- "tBodyGyro.std.Y"
- "tBodyGyro.std.Z"                        
- "tBodyGyroJerk.mean.X"
- "tBodyGyroJerk.mean.Y"                   
- "tBodyGyroJerk.mean.Z"
- "tBodyGyroJerk.std.X"                    
- "tBodyGyroJerk.std.Y"
- "tBodyGyroJerk.std.Z"                    
- "tBodyAccelerationMagnitude.mean"
- "tBodyAccelerationMagnitude.std"         
- "tGravityAccelerationMagnitude.mean"
- "tGravityAccelerationMagnitude.std"      
- "tBodyAccelerationJerkMagnitude.mean"
- "tBodyAccelerationJerkMagnitude.std"     
- "tBodyGyroMagnitude.mean"
- "tBodyGyroMagnitude.std"                 
- "tBodyGyroJerkMagnitude.mean"
- "tBodyGyroJerkMagnitude.std"             
- "fBodyAcceleration.mean.X"
- "fBodyAcceleration.mean.Y"               
- "fBodyAcceleration.mean.Z"
- "fBodyAcceleration.std.X"                
- "fBodyAcceleration.std.Y"
- "fBodyAcceleration.std.Z"                
- "fBodyAccelerationJerk.mean.X"
- "fBodyAccelerationJerk.mean.Y"           
- "fBodyAccelerationJerk.mean.Z"
- "fBodyAccelerationJerk.std.X"            
- "fBodyAccelerationJerk.std.Y"
- "fBodyAccelerationJerk.std.Z"            
- "fBodyGyro.mean.X"
- "fBodyGyro.mean.Y"                       
- "fBodyGyro.mean.Z"
- "fBodyGyro.std.X"                        
- "fBodyGyro.std.Y"
- "fBodyGyro.std.Z"                        
- "fBodyAccelerationMagnitude.mean"
- "fBodyAccelerationMagnitude.std"         
- "fBodyBodyAccelerationJerkMagnitude.mean"
- "fBodyBodyAccelerationJerkMagnitude.std" 
- "fBodyBodyGyroMagnitude.mean"
- "fBodyBodyGyroMagnitude.std"             
- "fBodyBodyGyroJerkMagnitude.mean"
- "fBodyBodyGyroJerkMagnitude.std"
- "SubjectId"
- "ActivityId"
- "ActivityLabel"

## Performed transformations
From the raw data, the aforementioned columns are selected and information about the performed activities is added. 
See the README.md file for details about the operation of the script.
For every aforementioned variable, except the subject id, activity id, and the activity label, mean values are computed per subject and per activity.

The result is a nice and clean data set according to the clean data standards and the requirements set for this project.

## Clean set columns
The clean set contains four columns:

1. SubjectId: Identifier for the test subject performing the activity
2. Activity: Descriptive name of the activity performed
3. Measurement: the measured variable. One of the aforementioned variable names
4. Mean: mean value for the measurement for this activity and this subject, mean is calculated over the entire dataset.