#Coursera Getting and Cleaning Data Peer Assignment 2

#Aim to return a single tidy dataset by reading and merging train and test data sets from the Samsung
#UCI HAR Dataset.

#For each dataset, training and test, the files are arranged as follows:
# subject_test.txt is the number of the ID of the test subject for each of the rows of data
# X_(test/train).txt is the raw data from the acceloromter 
# y_(test/train).txt is the activity descriptor for each data entry.

#Using the data extracted from the archive obtained from Coursera:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# on 21/04/2014

# A description of the data can be found at:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#As each dataset is found in the archive within test / training folders, please ensure this 
#run_analysis.R script is located in the UCI HAR Dataset folder.

#Data is sub-setted into measurements of mean and standard deviation for each data measurement, columns
#have label names that include "mean()" or "std()" and finally written to a file



#Clear the console screen
cat("\014")  


cat("Coursera: Getting and Cleaning Data", "\n")
cat("Merging and Cleaning data from Samsung Galaxy S II phone movements", "\n")
cat("","\n")
cat("Before running this please ensure the script run_analysis.R is currently in the folder \"/UCI HAR Dataset/\".","\n")
cat("Using this dataset a tidy data will be created containing means and standard deviations only","\n")
cat("please refer to script comments for more information","\n")



#Load the training set raw data into dataframe
data_train <- read.table("./train/X_train.txt", quote="\"")
subject_train <-read.table("./train/subject_train.txt", quote="\"", col.names=c("ID_Subject"))
activity_train <-read.table("./train/y_train.txt", quote="\"", col.names=c("ID_Activity"))

#Load the test set raw data into dataframe
data_test <- read.table("./test/X_test.txt", quote="\"")
subject_test <- read.table("./test/subject_test.txt", quote="\"", col.names=c("ID_Subject"))
activity_test <- read.table("./test/y_test.txt", quote="\"", col.names=c("ID_Activity"))



#Load the feature names and activity labels of the data columns
feature_names<- read.table("./features.txt", quote="\"", header=F, as.is=T, col.names=c("ID_Feature", "Feature"))
activity_labels <- read.table("./activity_labels.txt", header=F, as.is=T, col.names=c("ID_Activity", "Activity"))
activity_labels$Activity <- as.factor(activity_labels$Activity)


#Rename columns of data frames
names(data_train) <- feature_names[,2]
names(data_test) <- feature_names[,2]

# Subset the column names for those required: containing mean() or std()
subset_data_cols <- grep(".*mean\\(\\)|.*std\\(\\)", feature_names$Feature)


#Subset the the complete data set with those only required
data_test <- data_test[,subset_data_cols]
data_train <- data_train[,subset_data_cols]

#Add SubjectID and ActivityID to data frames
data_train<-cbind(activity_train, subject_train, data_train)
data_test<-cbind(activity_test, subject_test, data_test)

#Merge Dataframes to one complete set of data
data_all <- as.double(NA) 
data_all<-rbind(data_train,data_test)

#Rename the columns with mean() and std()
column_names <- colnames(data_all)
column_names <- gsub("\\.+mean\\.+", replacement="Mean", column_names)
column_names <- gsub("\\.+std\\.+", replacement="Std",  column_names)
colnames(data_all) <- column_names

#Sort data by Activity Label
data_all <- data_all[ order(data_all[,1]), ]

#Change Activity values for descriptive names
data_all <- merge(data_all, activity_labels)
data_all[,1]<-as.factor(data_all[,1])

data_all[,1] <- sapply(data_all[,1],switch,"1"=activity_labels$Activity[1],
                       "2"=activity_labels$Activity[2],"3"=activity_labels$Activity[3],
                       "4"=activity_labels$Activity[4], "5"=activity_labels$Activity[5], 
                       "6"=activity_labels$Activity[6])




library(reshape2)

#Melt the dataset to get to final mean values
id_vars = c("ID_Activity", "Activity", "ID_Subject")
measure_vars = setdiff(colnames(data_all), id_vars)
melted_data <- melt(data_all, id=id_vars, measure.vars=measure_vars)

#Recast the dataset taking the Means of each ID_Subject and Activity for the measurements
tidy_data<-dcast(melted_data, Activity + ID_Subject ~ variable, mean)

#Write the data to file (txt)
write.table(tidy_data, "./tidy_data.txt")
write.csv(tidy_data, file ="./tidy_data.csv",row.names=FALSE)

#Let user know the file written
cat("","\n")
cat("The Tidy Data has been written to files: tidy_data.txt and tidy_data.csv","\n")
