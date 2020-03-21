# Source functions
sapply(list.files("./src", full.names = TRUE), source)

# Load Data
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
target.folder = "./data"
data.folder <- file.path(target.folder, "UCI HAR Dataset")

df <- get_full_data(url, target.folder, data.folder)

# Filter columns
df <- filter_columns(df)

# Summarize data
summary.df <- summarize_data(df)
