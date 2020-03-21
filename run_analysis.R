# Source functions
sapply(list.files("./src", full.names = TRUE), source)

# Define paths
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
target.folder = "./data"
data.folder <- file.path(target.folder, "UCI HAR Dataset")
output.folder <- "./output"
output.file.path <- file.path(output.folder, "tidy_dataset.txt")

# Create default paths
initialize_paths(target.folder, output.folder)

# Load Data
df <- get_full_data(url, target.folder, data.folder)

# Filter columns
df <- filter_columns(df)

# Summarize data
summary.df <- summarize_data(df)

# Write to output
