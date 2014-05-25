##  COURSERA -- GETTING AND CLEANING DATA --Course Project CODEBOOK File

### Study Design


Purpose and Goal of the Study:

This study was conducted in accordance with the instructions of the Course Project for the Coursera course titled "Getting and Cleaning Data".  The purpose of this study was to demonstrate the ability to collect, work with, and clean a data set. The goal was to prepare tidy data that can be used for later analysis.

Experimental Study Design and Description of the "raw" Data and Data Collection:
The "raw" (or, at least, initial) data sets were produced from information collected by wearable computing. Specifically, the data for this study was collected from the accelerometers from the Samsung Galaxy S smartphone.

The site where the data was obtained:
*http://archive.ics.uci.edu/ml/datasets/HumanActivity+Recognition+Using+Smartphones 

The specific "raw" data for the study can be found:
*http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Its embedded accelerometer and gyroscope captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


Discussion of the Summary Choices (Choice of Variables to Extract) and Decisions in the Analysis:

The primary decision of this data analysis was the choice of which of the 561 variables (those that were recorded and/or manipulated from the smartphone sensor collection data) to extract for the tidy data set.

The specific variables that were extracted and shaped to generate the tidy data data set were the mean and standard deviation of the time domain (prefixed with "t") Body Acceleration and Gravity Acceleration measures on the X, Y, and Z axis.  The rationale for choosing these 12 measures was that these were the only mean or standard deviation variables in the "raw" data set that came directly from the smartphone sensor.  The other variables (Jerk, Magnitude "Mag") were derived by mathematical methods and the frequency domain variables (prefixed with "f") were also derived by mathematical method (specifically Fast Fourier Transform).

Experimental Study Design and Discussion of the Summary Choices and Decisions in the Analysis:

The data analysis was conducted entirely using the R statistical software .  The analysis steps were:

Use the read.table function to import the following data sets 
* x_test  -- the test data set data (30% of the original data set)
* y_test - the test data set labels
* subject_test - identifies the subject who performed the activity in the test set
* x_train - the train data set (70% of the original data set)
* y_train - the train data set labels
* subject_train - identifies the subject who performed the activity in the train set
* activity_labels  -- links the "activity" labels with the activity names
* features - list of all features (variable names)

Use the cbind and rbind functions to merge the various data sets
* Use the as.character function to change the class of certain variables
* Use the col.names function to assign descriptive names to variables
* Use the subset function to subset and shape the data set
* Use the tapply function to return the mean for a given variable... applied to each unique Subject-Activity combination
* Use a control loop to loop over all of the variables and return results to the "tidydata" data frame


### Code Book

Description of Variables and Units:
* Subject.Avtivity - no units for this variable  --  this is the "subject" (in other words, the person who performed the activity) labeled one through 30 and the activity that was being performed for each specific row of data (Laying, Sitting, Standing, Walking, Walking Downstairs, Walking Upstairs)

* MEAN.tBodyAcc-mean()-X  --  the units for this variable are standard gravity units 'g' - the mean body acceleration signal was obtained by subtracting the gravity from the total acceleration;  the total acceleration was obtained by a signal from the smartphone accelerometer

* MEAN.tBodyAcc-mean()-Y X  --  the units for this variable are standard gravity units 'g' - the mean body acceleration signal was obtained by subtracting the gravity from the total acceleration;  the total acceleration was obtained by a signal from the smartphone accelerometer 

* MEAN.tBodyAcc-mean()-Z X  --  the units for this variable are standard gravity units 'g' - the mean body acceleration signal was obtained by subtracting the gravity from the total acceleration;  the total acceleration was obtained by a signal from the smartphone accelerometer

* MEAN.tBodyAcc-std()-X X  --  the units for this variable are standard gravity units 'g' - the standard deviation of the mean body acceleration signal was obtained by subtracting the gravity from the total acceleration;  the total acceleration was obtained by a signal from the smartphone accelerometer

* MEAN.tBodyAcc-std()-Y	X  --  the units for this variable are standard gravity units 'g' - the standard deviation of the mean body acceleration signal was obtained by subtracting the gravity from the total acceleration;  the total acceleration was obtained by a signal from the smartphone accelerometer 

* MEAN.tBodyAcc-std()-Z X  --  the units for this variable are standard gravity units 'g' - the standard deviation of the mean body acceleration signal was obtained by subtracting the gravity from the total acceleration;  the total acceleration was obtained by a signal from the smartphone accelerometer 

* MEAN.tGravityAcc-mean()-X X  --  the units for this variable are standard gravity units 'g' - the mean body acceleration signal was obtained by subtracting the gravity from the total acceleration;  the total acceleration was obtained by a signal from the smartphone accelerometer 

* MEAN.tGravityAcc-mean()-Y X  --  the units for this variable are standard gravity units 'g' - the mean gravity acceleration signal was obtained by subtracting the gravity from the total acceleration;  the total acceleration was obtained by a signal from the smartphone accelerometer 

* MEAN.tGravityAcc-mean()-Z X  --  the units for this variable are standard gravity units 'g' - the mean gravity acceleration signal was obtained by subtracting the gravity from the total acceleration;  the total acceleration was obtained by a signal from the smartphone accelerometer 

* MEAN.tGravityAcc-std()-X X  --  the units for this variable are standard gravity units 'g' - the standard deviation of the mean gravity acceleration signal was obtained by subtracting the gravity from the total acceleration;  the total acceleration was obtained by a signal from the smartphone accelerometer 

* MEAN.tGravityAcc-std()-Y X  --  the units for this variable are standard gravity units 'g' - the standard deviation of the mean body acceleration signal was obtained by subtracting the gravity from the total acceleration;  the total acceleration was obtained by a signal from the smartphone accelerometer 

* MEAN.tGravityAcc-std()-Z X  --  the units for this variable are standard gravity units 'g' - the standard deviation of the mean body acceleration signal was obtained by subtracting the gravity from the total acceleration;  the total acceleration was obtained by a signal from the smartphone accelerometer
