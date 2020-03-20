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
    header <- c("label")
  }
  
  # Load table
  df <- read.table(
    file.path(data.folder, part, paste0(X.or.y, "_", part, ".txt")),
    col.names = header
    )
  
  return (df)
}

get_full_data <- function(url, target.folder) {
  
  # Merge required tables
  #
  # Args:
  #  url (str): URL to getting data zip file
  #  target.folder (str): Path to data
  #
  # Returns:
  #  df (data.table): Merged data from zip link
  
  # Check if data folder exists, if not download data
  if (!dir.exists(target.folder)) {
    retrieve_data(url, target.folder)
  }
  
  data.folder <- file.path(target.folder, "UCI HAR Dataset")
  
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
