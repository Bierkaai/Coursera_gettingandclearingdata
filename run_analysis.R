library(dplyr)
library(reshape2)

# Set this variable to point to the data folder for the script to work. 
# Do not change if data is in working directory.
data_folder <- "."

# Read column names file
colnames_raw <- read.csv(file.path(data_folder, "features.txt"), sep="", header=FALSE)

# Get column indices that contain mean and standard deviation values
column_ids <- c(grep("mean\\(\\)", colnames_raw[,2]), grep("std\\(\\)", colnames_raw[,2]))
column_ids <- column_ids[order(column_ids)]

# Replace dashes with dots in column names
colnames <- gsub("-", ".", colnames_raw[,2])

# Remove brackets from column names
colnames <- gsub("\\(\\)", "", colnames)

# Rewrite column names to obtain more descriptive labels
colnames <- gsub("Mag", "Magnitude", colnames)
colnames <- gsub("Acc", "Acceleration", colnames)

# Read activity description labels from text file
act_labels <- tbl_df(read.csv(file.path(data_folder, "activity_labels.txt"), sep="", col.names=c("ActivityId", "Activity"), header=FALSE))

# Calculate file paths for all data files in subfolders
x_train_file <- file.path(data_folder, "train", "X_train.txt")
y_train_file <- file.path(data_folder, "train", "Y_train.txt")
subjects_train_file <- file.path(data_folder, "train", "subject_train.txt")
x_test_file <- file.path(data_folder, "test", "X_test.txt")
y_test_file <- file.path(data_folder, "test", "Y_test.txt")
subjects_test_file <- file.path(data_folder, "test", "subject_test.txt")

# Call the prep.data function defined above for both the training and the test data
train <- prep.data(x_train_file, y_train_file, subjects_train_file, colnames, column_ids, act_labels)
test <- prep.data(x_test_file, y_test_file, subjects_test_file, colnames, column_ids, act_labels)

# Paste train and test data together
data <- rbind(train, test)
# Free up some memory by removing the raw data frames
rm(train, test)

# Determine indices of measuremnet columns (everything except for subjectID, activityId and Activity)
var_columns <- 1:(length(names(data)) - 3)

# Melt data set to distribute activity names, measurements and subject id's over all rows
melted <- tbl_df(melt(data, id=c("SubjectId", "Activity"), measure.vars=var_columns))

# Group by subject, activity and measurement
grouped <- group_by(melted, SubjectId, Activity, variable)

# Calculate means over grouped indices and give pretty names to the columns
result <- summarise(grouped, Mean=mean(value))
result <- mutate(result, Measurement=variable) %>% select(SubjectId, Activity, Measurement, Mean)


