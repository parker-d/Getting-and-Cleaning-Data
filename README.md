##  COURSERA -- GETTING AND CLEANING DATA --README File


### Discussion of the Choice of Variables to Extract in the Analysis:

The primary decision of this data analysis was the choice of which of the 561 variables (those that were recorded and/or manipulated from the smartphone sensor collection data) to extract for the tidy data set.

The specific variables that were extracted and shaped to generate the tidy data data set were the mean and standard deviation of the time domain (prefixed with "t") Body Acceleration and Gravity Acceleration measures on the X, Y, and Z axis.  The rationale for choosing these 12 measures was that these were the only mean or standard deviation variables in the "raw" data set that came directly from the smartphone sensor.  The other variables (Jerk, Magnitude "Mag") were derived by mathematical methods and the frequency domain variables (prefixed with "f") were also derived by mathematical method (specifically Fast Fourier Transform).



### The R SCRIPT is saved to this Repo.  The analysis steps were:

### STEP 1
Use the read.table function to import the following data sets 
* x_test  -- the test data set data (30% of the original data set)
* y_test - the test data set labels
* subject_test - identifies the subject who performed the activity in the test set
* x_train - the train data set (70% of the original data set)
* y_train - the train data set labels
* subject_train - identifies the subject who performed the activity in the train set
* activity_labels  -- links the "activity" labels with the activity names
* features - list of all features (variable names)


### STEP 2
Use the "replace" function to apply the appropriate descriptive labels for the Activities by replacing the "non-human'langauge" indexes with simple word
descriptions that were provided in the activity_labels data frame.


### STEP 3
Merge the data and labels for both the train and test data frames (using cbind).


### STEP 4
Merge the train and test data frames (using rbind). Merge the "subjects" data frames in the same way.


### STEP 5
Merge the "subjects" with the data variables and assign descriptive column names.


### STEP 6
Use subset function to subset only those variables containing mean and standard deviation data that are of interest. (see "Choice of Variables" above)


### STEP 7
Use the Paste function to create a new variable by combining the Subject and Activity variables;  then convert to a Factor class.


### STEP 8
Remove the variables "Subject" and "Activity";  then use the subset function to move the "Subject.Activity" variable to the first column in the data frame


### STEP 9
Use tapply function to return the mean for a given variable... applied to each unique Subject-Activity combination.


## STEP 10
Use a control loop to loop over all of the variables and cbind each new column of results to the "tidyData" data frame.


### STEP 11
Use the colnames function to assign descriptive column names.


### STEP 12
Use cbind and row.names funbctions to replace the row.names with the descriptive Subject-Activity.


### STEP 13
Use write.table function to produce the tidydata.txt file.

