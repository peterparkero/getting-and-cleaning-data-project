initialize_paths <- function(...) {
  for (path in list(...)) {
    if (! dir.exists(path)) {
      dir.create(path, recursive = TRUE) 
    }
  }
}
