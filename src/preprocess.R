filter_columns <- function(df) {
  
  # Extracts only the measurements on the mean and standard deviation for each measurement.
  #
  # Args:
  #  df (data.table): Data table containing full data set
  #
  # Returns:
  #  df (data.table): Full data set with only mean and standard deviation columns
  
  header <- colnames(df)
  filtered.headers <- grep("mean|std|Activity|Subject", header, value = TRUE)
  df <- df[filtered.headers]
  return (df)
  
}

summarize_data <- function(df) {
 
  # Summarize data by finding average of each variable for each activity and each subject.
  #
  # Args:
  #  df (data.table): Data table containing full data set
  #
  # Returns:
  #  df (data.frame): Summary table with average of each variable for each activity and each subject.
  
  df <- as.data.frame(dplyr::summarise_all(dplyr::group_by(df, Subject, Activity), list(mean)))
  return (df)

}