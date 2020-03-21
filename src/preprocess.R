filter_mean_std_columns(df, data.folder) {
  
  # Extracts only the measurements on the mean and standard deviation for each measurement.
  #
  # Args:
  #  df (data.table): Data table containing full data set
  #  data.folder (str): Path to data folder, where features.txt is located at
  #
  # Returns:
  #  df (data.table): Full data set with only mean and standard deviation columns
  
  header <- load_x_header(data.folder)
  filtered.headers <- grep("mean|std|Activity|Subject", header, value = TRUE)
  df <- df[filtered.headers]
  return (df)
  
}

