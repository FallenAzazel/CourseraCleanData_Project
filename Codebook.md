###Coursera : Getting and Cleaning Data Project

###Codebook for the dataset

Feature Selection 
================= 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals 
tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a 
constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass 
Butterworth filter with a corner frequency of 20 Hzto remove noise. Similarly, the acceleration signal 
was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using 
another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk 
signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional 
signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, 
tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, 
fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' 
to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern: 

'-XYZ' is used to denote 3-axial signals in the X, Yand Z directions. 

tBodyAcc-XYZ 
tGravityAcc-XYZ 
tBodyAccJerk-XYZ 
tBodyGyro-XYZ 
tBodyGyroJerk-XYZ 
tBodyAccMag 
tGravityAccMag 
tBodyAccJerkMag 
tBodyGyroMag 
tBodyGyroJerkMag 
fBodyAcc-XYZ 
fBodyAccJerk-XYZ 
fBodyGyro-XYZ 
fBodyAccMag 
fBodyAccJerkMag 
fBodyGyroMag 
fBodyGyroJerkMag 

The set of variables that were estimated from these signals are: 

	- mean(): Mean value 
	- std(): Standard deviation 

###Each Activity Label(1 through 6):

1 WALKING 
2 WALKING_UPSTAIRS 
3 WALKING_DOWNSTAIRS 
4 SITTING 
5 STANDING 
6 LAYING 



### Data Transformations

- Each dataset (test and training) was loaded (X values) and column labels applied from features.txt
- Subject and Activity IDs were assigned to dataset rows
- Data was sub-setted finding only columns with names including the text: mean() or std()
- Both datasets were merged to a complete dataset
- Tidy the mean() and std() column names as Mean and Std
- Activity ID values (1 through 6) were renamed to associated labels (see above)
- Using the `reshape2` package the dataset was melted and reformed taking the mean values for each Activity per Subject ID
- Files tidy_data.txt and tidy_data.csv were written and reported
