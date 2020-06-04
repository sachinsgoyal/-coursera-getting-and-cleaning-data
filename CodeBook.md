#Getting and Cleaning Data Project
A code book that describes the variables, the data, and any transformations or work that I performed to clean up 
the data.

#Description 
A full description of the data used in this project can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The data can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ).

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

##Attributes
For each record in the dataset it is provided:
<ul>
<li>Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.</li>
<li>Triaxial Angular velocity from the gyroscope.</li>
<li>A 561-feature vector with time and frequency domain variables.</li>
<li>Its activity label.</li>
<li>An identifier of the subject who carried out the experiment.</li>
</ul>

#Algorithm.
The following steps describe algorithm of data analysis.

##Step 1. Reading the data from files and assigning names.
On this step I read the data from UCI HAR Dataset folder from files: *features.txt, activity_labels.txt, X_train and X_test, y_tain and y_test, subject_train and subject_test*. 
Also assign names to some variable in order to make data readable.

##Step 2. Merging test and train sets.
At first I create train set by binding y_train, subject_train and x_train. Afterwards, do the same for test set. Then, merging the train and test sets

##Step 3. Extracting only the measurements on the mean and standard deviation for each measurement.
Create a logical vector with *grepl* function, that contains *TRUE* values for the *activity_Id*, *subject*, *mean* and *stdev* columns and *FALSE* values for the others. Subset this data to keep only the necessary columns.

##Step 4. Using descriptive activity names to name the activities in the data set
Merge data subset from step 3 with the activity type table **activity_labels** to make the activity names.
Then I make data tidy by excluding redundant information (activity id and name of activity).

##Step 5. Appropriately label the data set with descriptive activity names.
Use gsub function for pattern replacement to clean up the data labels.

##Step 6. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
Creating  independent tidy data set with the average of each variable for activity and subject and writing it to *avg_by_act_sub.txt* file.
