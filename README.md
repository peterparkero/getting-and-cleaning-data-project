Getting and Cleaning Data Project
===============

This is the course project for the Getting and Cleaning Data Coursera course, part of the Data Science: Foundations using R Specialization.  The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

# Steps to Run
1. Ensure required libraries are installed.
2. Run `run_analysis.R`
3. Required data set is located at `./output/tidy_dataset.txt`.

# Files
- `codebook.md` contains a description on the transformations and work applied from the [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to the final output data located at `./output/tidy_dataset.txt`.
- `output` folder
    - `tidy_dataset.txt` contains the final output data, which contains the average of each variable for each activity and each subject based on input data from [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
- `requirements.txt` contains the packages required to run the entire programme.
- `run_analysis.R` is the main script to run to download data, process data, and output the final tidy data set to the `output` folder.
- `src` folder contains supporting functions to `run_analysis.R`
    - `initialize.R` contains functions relating to creating folders required by the script to ensure smooth running.
    - `load_data.R` contains functions relating to downloading data, merging data, and all preprocessing required to get the full data set.
    - `processing.R` contains functions relating to filtering columns and finding the average of each mean and standard deviation relating variable per activity and per subject.

## Others
- `data` folder
    - This folder does not exist in the code base, but is created when the script is run.  This is the location where the data is downloaded to from [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
