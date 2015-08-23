library(dplyr)

# Data reading and prepping function: 
# we need to perform the same procedure for training and testing data
prep.data <- function(x_file, y_file, subject_file, colnames, column_ids, act_labels) {
        # Read raw data from the files
        x <- read.csv(x_file, sep = "", col.names=colnames, header=FALSE)
        y <- read.csv(y_file, sep = "", col.names="ActivityLabel", header=FALSE)
        
        # Get the subject Id's from the subjects file
        subjects <- read.csv(subject_file, sep="", col.names="SubjectId", header=FALSE)
        
        # Select only a subset of columns determined by the column_ids vector
        x <- x[column_ids]
        
        # Bind X and Y columnwise (add activity id's and subject id's to the measurements) 
        # and create dplyr tbl_df
        raw_data <- tbl_df(cbind(x, y, subjects))
        
        # Join activity labels with the measurements by activity ID.
        data <- left_join(raw_data, act_labels, by="ActivityLabel")
        return(data)
}