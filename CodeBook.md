## Codebook for Human Activity Recognition Using Smartphones Dataset Version 1.0
Original dataset by:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

Summary data prepared by: Alastair Currie, 2016

### Experimental procedure

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Measured variables

This dataset records mean and stdev values in the time and frequency domain for 33 physical quantities measured during the experiments (NB '-XYZ' is used to denote 3 axial signals in the Cartesian X, Y and Z directions):

Variable | Meaning
-------------|--------------
tBodyAcc-XYZ | Body acceleration vector not due to gravity
tGravityAcc-XYZ | Acceleration vector due to gravity
tBodyAccJerk-XYZ | Time-derivative of the body acceleration
tBodyGyro-XYZ | Angular velocity vector measured by the gyroscope
tBodyGyroJerk-XYZ | Time-derivative of the angular velocity vector
tBodyAccMag | Magnitude of body acceleration
tGravityAccMag | Magnitude of gravity acceleration
tBodyAccJerkMag | Magnitude of body jerk
tBodyGyroMag | Magnitude of angluar velocity
tBodyGyroJerkMag | Magnitude of angluar jerk
fBodyAcc-XYZ | Body acceleration vector not due to gravity, freq. domain
fBodyAccJerk-XYZ | Time-derivative of the body acceleration, freq. domain
fBodyGyro-XYZ |  Angular velocity vector measured by the gyroscope, freq. domain
fBodyAccMag | Magnitude of body acceleration, freq. domain
fBodyAccJerkMag |  Magnitude of body jerk, freq. domain
fBodyGyroMag | Magnitude of angluar velocity, freq. domain
fBodyGyroJerkMag |  Magnitude of angluar jerk, freq. domain

Two tables are provided (see `README.md` for preparation steps).

### Content of data files
 The first consolidates test- and training-set measurements. The second summarizes all measurements, grouped by activity and subject, via the mean.
Each row in the file `selected_data_train_and_test.txt` corresponds to a single fixed-width time sample as described above. The columns of the dataset contain

* the activityID, activityName, and subject (an integer identifier for the person doing the actiGettingAndCleaningDataCourseProjectvity) corresponding to the time sample, in columns 1 to 3, and 
* the mean and standard deviation in the time sample of the 33 physical quantities, in the remaining 66 columns.

Each row in the file `means_by_subject_and_activity.txt` corresponds to a combination pair {activity,subject}. The columns of the dataset contain:

* The activity name and subject ID in columns 1 to 2, and
* The mean over all relevant fixed-width time samples of the 33 physical quantities, in the remaining 33 columns.

Notes: 
======
- Features are normalized and bounded within [-1,1].

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
