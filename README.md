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
1. The features.txt file is loaded to get all column names
2. grep commands are used to determine column indices for variables containing mean and standard deviation information
3. A few gsub commands are used to change the column names into more descriptive names and to make them compliant with R. Brackets are removed and dashes are changed to dots.
4. The activity\_labels.txt file is loaded to obtain a mapping between activity id's and activity labels.
5. To obtain paths to the raw training and testing data, the file.path function is used.
6. prep.data is called for both the raw training and the raw test data. This fu
