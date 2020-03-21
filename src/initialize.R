initialize_paths <- function(...) {
  for (path in ...) {
    if (! dir.exists(path)) {
      dir.create(path, recursive = TRUE) 
    }
  }
}