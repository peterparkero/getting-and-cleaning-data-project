retrieve_data <- function(url, target.folder) {
  
  # Download file and unzip to data
  # 
  # Args:
  #  url (str): URL to getting data zip file
  #  target.folder (str): Path to data
  #
  
  # Download and Unzip
  temp.file <- tempfile()
  download.file(URL, temp.file)
  unzip(temp.file, exdir = TARGET.FOLDER)
  file.remove(temp.file)
  
}

load_x_header <- function(data.folder) {
  
  # Load header from data folder features file
  #
  # Args:
  #  data.folder (str): Path to data folder, where features.txt is located at
  #
  # Returns:
  #  header (str): Vector of strings containing the header of X tables
  
  header.df <- read.table(
    file.path(data.folder, "features.txt"),
    col.names = c("rownum", "feature"),
    stringsAsFactors = FALSE)
  header <- header.df[["feature"]]
  
  return (header)
}

load_activity_df <- function(data.folder) {
  
  # Load activity mapping from file.
  #
  # Args:
  #  data.folder (str): Path to data folder, where activity_labels.txt is located at
  #
  # Returns:
  #  activity.df (data.table): Activity mapping with respective target label
  
  activity.df <- read.table(
    file.path(data.folder, "activity_labels.txt"),
    col.names = c("Label", "Activity"),
    stringsAsFactors = FALSE)
  
  return (activity.df)
  
}

load_table <- function(data.folder, part, X.or.y) {
  
  # Load a table.
  #
  # Args:
  #  data.folder (str): Path to data folder, where train/test folder are located at
  #  part (str): Which part of the data to load. Either "train" or "test".
  #  X.or.y (str): Which part of the data to load. "X" for features, "y" for labels.
  #
  # Returns:
  #  df (data.table): Data table loaded.
  
  # Check input
  stopifnot(part %in% c("train", "test"),
            X.or.y %in% c("X", "y"))

  # Load header
  if (X.or.y == "X") {
    header <- load_x_header(data.folder)  
  } else if (X.or.y == "y") {
    header <- c("Label")
  } else {
    stop("X.or.y must be either \"X\" or \"y\"")
  }
  
  # Load table
  df <- read.table(
    file.path(data.folder, part, paste0(X.or.y, "_", part, ".txt")),
    col.names = header
    )
  
  # Update activity labels to descriptions
  if (X.or.y == "y") {
    activity.df <- load_activity_df(data.folder)
    df <- dplyr::left_join(df, activity.df, by = "Label")
    df <- df["Activity"]
  }
  
  return (df)
}

get_full_data <- function(url, target.folder, data.folder) {
  
  # Merge required tables
  #
  # Args:
  #  url (str): URL to getting data zip file
  #  target.folder (str): Path to data
  #  data.folder (str): Path to actual data.
  #                     Normally file.path(target.folder, "UCI HAR Dataset")
  #
  # Returns:
  #  df (data.table): Merged data from zip link
  
  # Check if data folder exists, if not download data
  if (!dir.exists(target.folder)) {
    retrieve_data(url, target.folder)
  }
  
  # Load data
  train.x <- load_table(data.folder, "train", "X")
  train.y <- load_table(data.folder, "train", "y")
  test.x <- load_table(data.folder, "test", "X")
  test.y <- load_table(data.folder, "test", "y")
  
  # Merge
  x <- rbind(train.x, test.x)
  y <- rbind(train.y, test.y)
  df <- cbind(x, y)
  
  return (df)
}
