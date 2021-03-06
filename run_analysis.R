##  the several lines below read in the various data frames

x_test <- read.table("~/X_test.txt", quote="\"")
y_test <- read.table("~/y_test.txt", quote="\"")
subject_test <- read.table("~/subject_test.txt", header=FALSE, quote="\"")

x_train <- read.table("~/X_train.txt", quote="\"")
y_train <- read.table("~/y_train.txt", quote="\"")
subject_train <- read.table("~/subject_train.txt", header=FALSE, quote="\"")

activity_labels <- read.table("~/activity_labels.txt", quote="\"")
features <- read.table("~/features.txt", quote="\"")
features <- t(features)
features <- cbind("Subject", "Activity", features)


##  apply the appropriate descriptive labels for the Activities
##  do this by replacing the "non-human'langauge" indeces
##  with simply word descriptions that were provided in the
##  activity_labels data frame (and converted below to the Labels data frame)
Labels <- as.character(activity_labels[ ,2])
y_train <- replace(y_train, y_train== 1, Labels[1])
y_train <- replace(y_train, y_train== 2, Labels[2])
y_train <- replace(y_train, y_train== 3, Labels[3])
y_train <- replace(y_train, y_train== 4, Labels[4])
y_train <- replace(y_train, y_train== 5, Labels[5])
y_train <- replace(y_train, y_train== 6, Labels[6])

y_test <- replace(y_test, y_test== 1, Labels[1])
y_test <- replace(y_test, y_test== 2, Labels[2])
y_test <- replace(y_test, y_test== 3, Labels[3])
y_test <- replace(y_test, y_test== 4, Labels[4])
y_test <- replace(y_test, y_test== 5, Labels[5])
y_test <- replace(y_test, y_test== 6, Labels[6])


##  Merge the data annd labels for both the train and
##  test data frames (using cbind)
x_test <- cbind(y_test, x_test)
x_train <- cbind(y_train, x_train)


##  Merge the train and test data frames (using rbind)
##  Merge the "subjects" data frames in the same way 
mydata <- rbind(x_test, x_train)
subjects <- rbind(subject_test, subject_train)


##  now merge the "subjects" with the data variables and assign
##  descriptive column names
mydata <- cbind(subjects, mydata)
colnames(mydata) <- features[2,]


##  remove all uneeded data frames from the global environment
rm(x_test, x_train, y_test, y_train, features, activity_labels, Labels, subject_test, subject_train, subjects)


##  subset only those variables containing mean and standard deviation data
##  that are of interest
dfExtract <- subset(mydata, select=c("Subject", "Activity",
                        "tBodyAcc-mean()-X", "tBodyAcc-mean()-Y","tBodyAcc-mean()-Z",
                        "tBodyAcc-std()-X", "tBodyAcc-std()-Y","tBodyAcc-std()-Z",
                        "tGravityAcc-mean()-X", "tGravityAcc-mean()-Y","tGravityAcc-mean()-Z",
                        "tGravityAcc-std()-X", "tGravityAcc-std()-Y","tGravityAcc-std()-Z") )


##  remove the data frame "mydata" from the global environment
rm(mydata)


##  use the Paste function to create a new variable by combining
##  the Subject and Activity variables;  then convert to a Factor class
dfExtract$Subject.Activity <- as.character(paste("Subject", dfExtract$Subject, "--",
                                                 dfExtract$Activity, sep = " "))
dfExtract$Subject.Activity <- as.factor(dfExtract$Subject.Activity)


##  remove the variables "Subject" and "Activity";  then move the
##  "Subject.Activity" variable to the first column in the data frame
dfExtract[c(1,2)]<-list(NULL)
dfExtract <- subset(dfExtract, select = c(13, 1:12))


##  use tapply function to return the mean for a given variable... applied
##  to each unique Subject-Activity combination
tidyData <- tapply(dfExtract[, 2], dfExtract[, 1], mean, simplify=TRUE)


##  use a control loop to loop over all of the variables and cbind
##  each new column of results to th "tidyData" data frame
count <- 3:13
for (i in count) {
  DataHOLD <- tapply(dfExtract[, i], dfExtract[, 1], mean, simplify=TRUE)
  tidyData <- cbind(tidyData, DataHOLD)
}


##  assign descriptive column names
colnames(tidyData) <- c("MEAN.tBodyAcc-mean()-X", "MEAN.tBodyAcc-mean()-Y","MEAN.tBodyAcc-mean()-Z",
                        "MEAN.tBodyAcc-std()-X", "MEAN.tBodyAcc-std()-Y","MEAN.tBodyAcc-std()-Z",
                        "MEAN.tGravityAcc-mean()-X", "MEAN.tGravityAcc-mean()-Y","MEAN.tGravityAcc-mean()-Z",
                        "MEAN.tGravityAcc-std()-X", "MEAN.tGravityAcc-std()-Y","MEAN.tGravityAcc-std()-Z")

##  replace the row.names with the descriptive Subject-Activity 
tidyData <- cbind(Subject.Activity = rownames(tidyData), tidyData)
row.names(tidyData)<-NULL

## write.table(tidyData, "~/tidydata.txt", sep="\t")
## View(tidyData)
