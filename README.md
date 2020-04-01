# assignment
The R script details the following process:

1) Download the datasets (i.e. train & test)
2) Load the feature file and filtered for the relevant fields of interest (i.e. mean & standard deviation)
3) Load the activity file to enable the lookup of the activity to the data sets
4) Applied the filtered features to the train dataset and test dataset
5) Download Subject dataset and specify common header called "subject_number"
6) Merge the 2 datasets to get all the relevant observations
7) Create tidy dataset with the average of each variable for each activity and each subject
8) The end result is extracted to text file


==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

======================================
For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws
