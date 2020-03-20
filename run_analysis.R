# Source functions
sapply(list.files("./src", full.names = TRUE), source)

# Load Data
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
target.folder = "./data"
df <- get_full_data(url, target.folder)

# Filter columns
df <- filter_mean_std_columns(df, data.folder)
