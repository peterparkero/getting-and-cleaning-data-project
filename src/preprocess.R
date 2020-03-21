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

