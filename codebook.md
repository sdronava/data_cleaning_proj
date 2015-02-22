Average Feature Selection 
=========================
****************** BEGIN COPIED FROM INPUT FILE ****************************************************************************
** Snippet copied from the original input data's features_info.txt
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another 
low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, 
fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

****************** END COPIED FROM INPUT FILE ****************************************************************************

All the columns other than the first two retain the names of the original columns as described in the features.txt file. However, it should be noted that in this table, they refer to the average value of the corresponding column grouped by their
subject and activity names respectiviely.

Naming convention
-------------------
All names in the tbale below excluding the first two columns have a naming pattern.
* **first letter**   t or f - time domain or frequencey domain 
* **contains -mean() or -std()** - indicating they are either the mean or standard deviation values for the corresponding time or frequency signal.
* **Ends with X, Y or Z** - refers to the X, Y or Z dimennsions of the observation. 

Units
-----
It is not clear to me what the units are from the input files provided. However, a little googling reveals that time based signals and frequency based signals are likely in seconds (or multiples/fractions) and hertz. Given this assumption, all column names begining with 't' are assumed to be in seconds and all column names begining with 'f' are in Hertz respectively.

Codebook
--------


| Column Number         | Column Name                      | Description                                      |
| ---------------------:|:--------------------------------|:------------------------------------------------|
| 1 | subject  | The identity of the subject that took the training. Range is 1-30|
| 2 | activity | The name of the activity performed by the subject. There are 6 kinds of activities|
| 3 | tBodyAcc-mean()-X | Average Mean Body Acceleartion Time Signal in X axis
| 4 | tBodyAcc-mean()-Y | Average Mean Body Acceleartion Time Signal in Y axis
| 5  | tBodyAcc-mean()-Z | Average Mean Body Acceleartion Time Signal in Z axis
| 6  | tBodyAcc-std()-X | Average Standard Deviation of  Body Acceleartion Time Signal in X axis
| 7 |   tBodyAcc-std()-Y  | Average Standard Deviation of  Body Acceleartion Time Signal in Y axis
| 8  |   tBodyAcc-std()-Z  | Average Standard Deviation of  Body Acceleartion Time Signal in Z axis
| 9  |   tGravityAcc-mean()-X  | Average Mean Gravity Acceleartion Time Signal in X axis
| 10  |   tGravityAcc-mean()-Y  | Average Mean Gravity Acceleartion Time Signal in Y axis
| 11 |   tGravityAcc-mean()-Z  | Average Mean Gravity Acceleartion Time Signal in Z axis
| 12 |   tGravityAcc-std()-X  | Average Standard Deviation of Gravity Acceleartion Time Signal in X axis
| 13 |   tGravityAcc-std()-Y  | Average Standard Deviation of Gravity Acceleartion Time Signal in Y axis
| 14 |   tGravityAcc-std()-Z  | Average Standard Deviation of Gravity Acceleartion Time Signal in Z axis
| 15 |   tBodyAccJerk-mean()-X  |  Average Mean Body Acceleartion Jerk Time Signal in X axis
| 16 |   tBodyAccJerk-mean()-Y  |  Average Mean Body Acceleartion Jerk Time Signal in Y axis
| 17 |   tBodyAccJerk-mean()-Z  |  Average Mean Body Acceleartion Jerk Time Signal in Z axis
| 18 |   tBodyAccJerk-std()-X  |  Average Standard Deviation of Body Acceleartion Jerk Time Signal in X axis
| 19 |   tBodyAccJerk-std()-Y  |  Average Standard Deviation of Body Acceleartion Jerk Time Signal in Y axis
| 20 |   tBodyAccJerk-std()-Z  |  Average Standard Deviation of Body Acceleartion Jerk Time Signal in Z axis
| 21 |   tBodyGyro-mean()-X  | Average Mean Gyroscopic Acceleartion Time Signal in X axis
| 22 |   tBodyGyro-mean()-Y  | Average Mean Gyroscopic Acceleartion Time Signal in Y axis
| 23 |   tBodyGyro-mean()-Z  | Average Mean Gyroscopic Acceleartion Time Signal in Z axis
| 24 |   tBodyGyro-std()-X  | Average Standard Deviation of Gyroscopic Acceleartion Time Signal in X axis
| 25 |   tBodyGyro-std()-Y  |  Average Standard Deviation of Gyroscopic Acceleartion Time Signal in Y axis
| 26 |   tBodyGyro-std()-Z  | Average Standard Deviation of Gyroscopic Acceleartion Time Signal in Z axis
| 27 |   tBodyGyroJerk-mean()-X  |  Average Mean of Gyroscopic Acceleartion Jerk  Time Signal in X axis
| 28 |   tBodyGyroJerk-mean()-Y  |  Average Mean of Gyroscopic Acceleartion Jerk  Time Signal in y axis
| 29 |   tBodyGyroJerk-mean()-Z  | Average Mean of Gyroscopic Acceleartion Jerk  Time Signal in Z axis
| 30 |   tBodyGyroJerk-std()-X  | Average Standard Deviation of Gyroscopic Acceleartion Jerk  Time Signal in X axis
| 31 | tBodyGyroJerk-std()-Y  | Average Standard Deviation of Gyroscopic Acceleartion Jerk  Time Signal in Y axis
| 32 |tBodyGyroJerk-std()-Z  | Average Standard Deviation of Gyroscopic Acceleartion Jerk  Time Signal in Z axis
| 33 |  tBodyAccMag-mean()  | Average Mean Magnitude of Body Acceleartion Time Signal.
| 34  |   tBodyAccMag-std()  |  Average Standard Deviation of Body Acceleartion Time Signal.
| 35  |   tGravityAccMag-mean()  |  Average Mean Magnitude of Gravity Acceleartion Time Signal.
| 36  |   tGravityAccMag-std()  |  Average Standard deviation Magnitude of Gravity Acceleartion Time Signal.
| 37  |   tBodyAccJerkMag-mean()  |  Average Standard deviation Magnitude of Jerk Body Acceleartion Time Signal.
| 38  |   tBodyAccJerkMag-std()  | Average Standard deviation Magnitude of Jerk Body Acceleartion Time Signal.
| 39  |   tBodyGyroMag-mean()  | Average Mean Magnitude of Gyroscopic Body Acceleartion Time Signal.
| 40  |   tBodyGyroMag-std()  | Average Standard deviation Magnitude of Gyroscopic Body Acceleartion Time Signal.
| 41  |   tBodyGyroJerkMag-mean()  |Average Mean Magnitude of Gyroscopic Jerk Body Acceleartion Time Signal.
| 42  |   tBodyGyroJerkMag-std()  | Average Standard deviation Magnitude of GyroscopicJerk Body Acceleartion Time Signal
| 43  |   fBodyAcc-mean()-X  |Average Mean Body Acceleration of Frequency Signal in X-axis.
| 44  |  fBodyAcc-mean()-Y  |Average Mean Body Acceleration of Frequency Signal in Y-axis.
| 45  |  fBodyAcc-mean()-Z  |Average Mean Body Acceleration of Frequency Signal in Z-axis.
| 46  |  fBodyAcc-std()-X  |Average Standard deviation in Body Acceleration of Frequency Signal in X-axis.
| 47  |  fBodyAcc-std()-Y  |Average Standard deviation in Body Acceleration of Frequency Signal in Y-axis.
| 48  |  fBodyAcc-std()-Z  |Average Standard deviation in Body Acceleration of Frequency Signal in Z-axis.
| 49  |  fBodyAccJerk-mean()-X  |Average Mean in Jerk Body Acceleration of Frequency Signal in X-axis.
| 50  |  fBodyAccJerk-mean()-Y  |Average Mean in Jerk Body Acceleration of Frequency Signal in Y-axis.
| 51  |  fBodyAccJerk-mean()-Z  |Average Mean in Jerk Body Acceleration of Frequency Signal in Z-axis.
| 52  |  fBodyAccJerk-std()-X  |Average Standard Deviation of Jerk Body Acceleration of Frequency Signal in X-axis.
| 53  |  fBodyAccJerk-std()-Y  |Average Standard Deviation of Jerk Body Acceleration of Frequency Signal in Y-axis.
| 54  |  fBodyAccJerk-std()-Z  |Average Standard Deviation of Jerk Body Acceleration of Frequency Signal in Z-axis.
| 55  |  fBodyGyro-mean()-X  |Average mean of  Gyroscopic Body Acceleration of Frequency Signal in X-axis.
| 56  |  fBodyGyro-mean()-Y  |Average mean of  Gyroscopic Body Acceleration of Frequency Signal in Y-axis.
| 57  |  fBodyGyro-mean()-Z  |Average mean of  Gyroscopic Body Acceleration of Frequency Signal in Z-axis.
| 58  |  fBodyGyro-std()-X  |Average Standard Deviation of  Gyroscopic Body Acceleration of Frequency Signal in X-axis.
| 59  |  fBodyGyro-std()-Y  |Average Standard Deviation of  Gyroscopic Body Acceleration of Frequency Signal in Y-axis.
| 60  |  fBodyGyro-std()-Z  |Average Standard Deviation of  Gyroscopic Body Acceleration of Frequency Signal in Z-axis.
| 61  |  fBodyAccMag-mean()  |Average mean magnitude of body acceleration frequency signal
| 62  |  fBodyAccMag-std()  | Average standard deviation magnitude of body acceleration frequency signal
| 63  |  fBodyBodyAccJerkMag-mean()  |Average mean magnitude of body body jerk acceleration  frequency signal
| 64  |  fBodyBodyAccJerkMag-std()  |Average standard deviation of magnitude of body body jerk acceleration frequency signal.
| 65  |  fBodyBodyGyroMag-mean()  | Average mean magnitude of body gyroscopic acceleration in time signals
| 66  |  fBodyBodyGyroMag-std()  |Average standard deviation magnitude of body gyroscopic acceleration in time signals
| 67  |  fBodyBodyGyroJerkMag-mean()  |Average mean magnitude of body body gyroscopic jerk acceleration in time signals
| 68  |  fBodyBodyGyroJerkMag-std()  |Average standard deviation magnitude of body body gyroscopic jerk acceleration in time signals
