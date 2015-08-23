# Analysing Human activity data measured through Smart Phone sensors
This readme file describes the preprocessing and analysis of smart phone measurements of human activity data.
Raw data was collected from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> on August 14th 2015.
The dataset contains measurements of gyroscope and gravitational sensors from smart phones wore by test persons while performing a range of everyday activities.

The run\_analysis.R script reads the raw data from different files and pastes the data together to form one clean data set.
Only measurements regarding mean and standard deviation are extracted. Finally, the data is grouped by test person id and activity, and the mean of all extracted values is calculated per person per activity.

## Requirements to run the analysis
The following five elements need to be present in order to run the analysis script

1. The run\_analysis.R script available from this GitHub repository: <https://github.com/Bierkaai/Coursera_gettingandclearingdata>
2. R
3. The dplyr package
4. The reshape2 package
5. Raw data available from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

## Running the analysis script
Make sure the raw data is in the R working directory and the necessary packages (dplyr and reshape2) are installed.
Source the auxiliary function prep.data (from the prep.data.R file) in R.
Analysis can now be perfomed by running run_analysis.R with the raw data (unzipped) in the R working directory.
Alternatively, data can be stored in another folder, which can be set in the first line of the R script (instead of the dot denoting the current WD).

## Code book for processed data
Running the script sets a variable called 'result' in the R workspace. This contains a tbl\_df dataframe compatible with both R and the dplyr package.
Please refer to the codebook.md file for full details about the data columns.
The result dataframe contains the following columns:
- SubjectId: the id number of the subject
- Activity
- Measurement
- Mean

## How the script works
The run\_analysis.R script has extensive comments in the code to explain its operation step by step.

In short, the following steps are performed:

First the data is preprocessed into a tidy data set.

1. The features.txt file is loaded to get all column names
2. grep commands are used to determine column indices for variables containing mean and standard deviation information
3. A few gsub commands are used to change the column names into more descriptive names and to make them compliant with R. Brackets are removed and dashes are changed to dots.
4. The activity\_labels.txt file is loaded to obtain a mapping between activity id's and activity labels.
5. To obtain paths to the raw training and testing data, the file.path function is used.
6. prep.data is called for both the raw training and the raw test data. This function performs the following actions on the data:
  1. Reads in the data x (the measurements)
  2. Reads in the data y (the activity id's)
  3. Reads in the subject id's
  4. Selects only the columns with mean and standard deviation information, the column id's are determined in step 2 of the main file.
  5. Binds the measurements, activity id's and subject id's columnwise
  6. Uses a dplyr left join to add the descriptive activity names to the data
7. After preprocessing both the train and test data, these two data sets are binded row-wise to form one dataset

The second part of analysis is to process the data into a set that can be used to study person specific and activity specific features.
To get to this data set the following steps are performed by the script:

1. All columns that contain measurements are identified, these are all columns except the last three, because these contain the activity id, subject id, and activity name.
2. Data set is melted to create a data set that contains the names of measured variables on every row (in the variables column), the activity id column is dropped in this step.
3. The melted data frame is grouped by subject id, activity name, and measurement variable
4. Using the summarise command from the dplyr package, the mean value for every variable per subject and per activity is calculated
5. Finally, descriptive column names are added and only the columns with the variable name, subject id, activity name, and mean value are selected.

The result is a nice and clean data set according to the clean data standards and the requirements set for this project.
