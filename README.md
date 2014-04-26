

###Coursera : Getting and Cleaning Data Project

- Peer assessed project for the analysis of Samsung Galaxy II movement measurements
- Dataset was downloaded from (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) on 21st April 2014
- Further description of the data can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

###Aim of the script

- Using the training and test datasets to read the measurements taken (X)
- Subset the measurements taken to those only reporting Mean and Standard Deviation values (those including mean() and std())
- Assign columns refering to the IDs of Activity and Subject
- Merge `training` and `test` datasets into a single resource
- Rename the Activity IDs to more descriptive values found in `activity_labels.txt`
- Calculate the mean values for each Subject and Activity by melting the dataset and recasting
- Write the final tidy dataset to files


###Steps for usage of run_analysis.R script

- Begin by cloning this repository
- Download the [dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and extract the files maintaining the folder structure. 
This will result in a /UCI HAR Dataset/ folder that has all the necessary data files.
- Place the run_analysis.R script in this base folder.
- Set the working directory to the /UCI HAR Dataset/ folder.
- Run `Rscript <path to>/run_analysis.R`
- The tidy dataset will be created in the working directory as `tidy_data.txt` and `tidy_data.csv` files


###Archive Files

- The Dataset.zip archive contains folders named `/test` and `/train`
- Each of these folders contain data in the form of:
	- `X_(test/train).tx`t - Measurements of data
	- `y_(test/train).txt` - Activity ID for each row of the data
	- `subject_(test/train).txt` - Corresponding Subject ID for each row of data
- As well as the raw data:
	- Names of the measurements taken in X_(test/train).txt are reported in `features.txt`
	- Descriptive Activity labels for the Activity IDs are reported in `activity_labels.txt`


