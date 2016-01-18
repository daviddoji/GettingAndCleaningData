Codebook
========

Variable Name              | Variable Type | Description
-------------              | ------------- | ----------- 
Subject                    | integer       | Subject id numbers
ActivityName               | factor        | Descriptor of activity name
fBodyAccJerk-mean()-X      | numeric       | * See below
fBodyAccJerk-mean()-Y      | numeric       |
fBodyAccJerk-mean()-Z      | numeric       |
fBodyAccJerk-std()-X       | numeric       |
fBodyAccJerk-std()-Y       | numeric       |
fBodyAccJerk-std()-Z       | numeric       |
fBodyAccMag-mean()         | numeric       |
fBodyAccMag-std()          | numeric       |
fBodyAcc-mean()-X          | numeric       |
fBodyAcc-mean()-Y          | numeric       |
fBodyAcc-mean()-Z          | numeric       |
fBodyAcc-std()-X           | numeric       |
fBodyAcc-std()-Y           | numeric       |
fBodyAcc-std()-Z           | numeric       |
fBodyBodyAccJerkMag-mean() | numeric       |
fBodyBodyAccJerkMag-std()  | numeric       |
fBodyBodyGyroJerkMag-mean()| numeric       |
fBodyBodyGyroJerkMag-std() | numeric       |
fBodyBodyGyroMag-mean()    | numeric       |
fBodyBodyGyroMag-std()     | numeric       |
fBodyGyro-mean()-X         | numeric       |
fBodyGyro-mean()-Y         | numeric       |
fBodyGyro-mean()-Z         | numeric       |
fBodyGyro-std()-X          | numeric       |
fBodyGyro-std()-Y          | numeric       |
fBodyGyro-std()-Z          | numeric       |
tBodyAccJerkMag-mean()     | numeric       |
tBodyAccJerkMag-std()      | numeric       |
tBodyAccJerk-mean()-X      | numeric       |
tBodyAccJerk-mean()-Y      | numeric       |
tBodyAccJerk-mean()-Z      | numeric       |
tBodyAccJerk-std()-X       | numeric       |
tBodyAccJerk-std()-Y       | numeric       |
tBodyAccJerk-std()-Z       | numeric       |
tBodyAccMag-mean()         | numeric       |
tBodyAccMag-std()          | numeric       |
tBodyAcc-mean()-X          | numeric       |
tBodyAcc-mean()-Y          | numeric       |
tBodyAcc-mean()-Z          | numeric       |
tBodyAcc-std()-X           | numeric       |
tBodyAcc-std()-Y           | numeric       |
tBodyAcc-std()-Z           | numeric       |
tBodyGyroJerkMag-mean()    | numeric       |
tBodyGyroJerkMag-std()     | numeric       |
tBodyGyroJerk-mean()-X     | numeric       |
tBodyGyroJerk-mean()-Y     | numeric       |
tBodyGyroJerk-mean()-Z     | numeric       |
tBodyGyroJerk-std()-X      | numeric       |
tBodyGyroJerk-std()-Y      | numeric       |
tBodyGyroJerk-std()-Z      | numeric       |
tBodyGyroMag-mean()        | numeric       |
tBodyGyroMag-std()         | numeric       |
tBodyGyro-mean()-X         | numeric       |
tBodyGyro-mean()-Y         | numeric       |
tBodyGyro-mean()-Z         | numeric       |
tBodyGyro-std()-X          | numeric       |
tBodyGyro-std()-Y          | numeric       |
tBodyGyro-std()-Z          | numeric       |
tGravityAccMag-mean()      | numeric       |
tGravityAccMag-std()       | numeric       |
tGravityAcc-mean()-X       | numeric       |
tGravityAcc-mean()-Y       | numeric       |
tGravityAcc-mean()-Z       | numeric       |
tGravityAcc-std()-X        | numeric       |
tGravityAcc-std()-Y        | numeric       |
tGravityAcc-std()-Z        | numeric       |


* Meaning of the variable names
-------------------------------
- Prefix `f` and `t` denote frequency or time domain signals, respectively.
- Acceleration signal was then separated into `BodyAcc` and `GravityAcc` signals, respectively.
- Body linear acceleration and angular velocity were derived in time to obtain `BodyAccJerk` and `BodyGyroJerk` signals, respectively.
- The magnitude of the previous signals were calculated using the Euclidean norm to obtain `tBodyAccMag`, `tGravityAccMag`, `tBodyAccJerkMag`, `tBodyGyroMag` and `tBodyGyroJerkMag` signals.
- Fast Fourier Transform (FFT) was applied to some of these signals producing `fBodyAcc`, `fBodyAccJerk`, `fBodyGyro`, `fBodyAccJerkMag`, `fBodyGyroMag` and `fBodyGyroJerkMag` signals.