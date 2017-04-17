# This script will perform the following:
# > 1. Merges the training and the test sets to create one data set.
# > 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# > 3. Uses descriptive activity names to name the activities in the data set.
# > 4. Appropriately labels the data set with descriptive activity names.
# > 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# Preliminaries:
# Load the needed packages
packages <- c("data.table", "reshape2", "dplyr")
sapply(packages, require, character.only=TRUE, quietly=TRUE)


# Get the data from the source:
# A `data` folder will be created and the zip file will be saved
if(!file.exists("./data")){dir.create("./data")}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "./data/Dataset.zip")


# Unzip the file:
# A new directory named `UCI HAR Dataset` will be created in your working directory 
# when the file is unzipped. 
unzip("./data/Dataset.zip")


# Read in the files:
# Subject, Labels and Data files are stored in `train` and `test` subfolders of 
# the `UCI HAR Dataset`, respectively. A full description can be found in `README.txt`
dtSubjectTrain <- fread("./UCI HAR Dataset/train/subject_train.txt")
dtSubjectTest <- fread("./UCI HAR Dataset/test/subject_test.txt")

dtActivityTrain <- fread("./UCI HAR Dataset/train/y_train.txt")
dtActivityTest <- fread("./UCI HAR Dataset/test/y_test.txt")

dtMeasurementsTrain <- fread("./UCI HAR Dataset/train/X_train.txt")
dtMeasurementsTest <- fread("./UCI HAR Dataset/test/X_test.txt") 


# Operations on the files:
# Concatenate the data tables
dtSubject <- rbind(dtSubjectTrain, dtSubjectTest)
# The use of setnames is justified in the following post: 
# http://stackoverflow.com/questions/10655438/rename-one-named-column-in-r
setnames(dtSubject, "V1", "Subject")

dtActivity <- rbind(dtActivityTrain, dtActivityTest)
setnames(dtActivity, "V1", "ActivityNum")

dtMeasurements <- rbind(dtMeasurementsTrain, dtMeasurementsTest)

# Merge the columns in the data tables
dtIndividual <- cbind(dtSubject, dtActivity)
dtIndividualAll <- cbind(dtIndividual, dtMeasurements)

# Sort the data table by Subject and Activity
setkey(dtIndividualAll, Subject, ActivityNum) 


# Extract some information from the dataset:
# In the `features.txt` file, variables corresponding to different atributes are given 
# (e.g. mean, standard deviation, median, ...)
dtFeatures <- fread("./UCI HAR Dataset/features.txt")
setnames(dtFeatures, names(dtFeatures), c("MeasurementNum", "MeasurementName")) ## MeasurementNum by FeatureNum

# Subset just variables related with "mean" or "std" using regexp
dtFeaturesSub <- dtFeatures[grep("(mean|std)\\(\\)", MeasurementName)]

# Add new column where the rows are a vector of MeasurementNum
# This column will be used for cross referencing the measurement headers in the data table
## `dtIndividualAll`
dtFeaturesSub$MeasurementCode <- dtFeaturesSub[, paste0("V", MeasurementNum)]


# Subset the variables using their variable names
select <- c(key(dtIndividualAll), dtFeaturesSub$MeasurementCode)

# Take only the columns of interested, in this case, mean and std
# and create a data table with only those columns
dtIndividualAllMeanStd <- dtIndividualAll[, select, with=FALSE]


# Use descriptive names:
# Extract descriptive names for the activities from the `activity_labels.txt` file.
dtActivityNames <- fread("./UCI HAR Dataset/activity_labels.txt")
setnames(dtActivityNames, names(dtActivityNames), c("ActivityNum", "ActivityName"))


# Label the data table with descriptive names
# Use descriptive names for the data table new column `ActivityName`
dtIndividualAllMeanStd <- merge(dtIndividualAllMeanStd,
                                dtActivityNames, by="ActivityNum", 
                                all.x=TRUE)

# Sort the data table by Subject and Activity 
setkey(dtIndividualAllMeanStd, Subject, ActivityNum, ActivityName)


## Reshape the data table using only the keys recently created
dtIndividualAllMeanStd <- data.table(melt(dtIndividualAllMeanStd, 
                                          key(dtIndividualAllMeanStd), 
                                          variable.name="MeasurementCode")) 


# Merge activity name
dtIndividualAllMeanStd <- merge(dtIndividualAllMeanStd, 
                                dtFeaturesSub[, list(MeasurementNum, MeasurementCode, MeasurementName)], 
                                by="MeasurementCode", all.x=TRUE)

# Create new variables `Activity` and `Measurement` equivalents to `ActivityName` and `MeasurementName` as factors
dtIndividualAllMeanStd$ActivityName <-factor(dtIndividualAllMeanStd$ActivityName)
dtIndividualAllMeanStd$MeasurementName <- factor(dtIndividualAllMeanStd$MeasurementName)

# Reshape the data table to get the averages 
measureAverages <- dcast(dtIndividualAllMeanStd, 
                          Subject + ActivityName ~ MeasurementName, 
                          mean, 
                          value.var="Value")

# Write the tab delimited file
write.table(measureAverages, file="./tidyData.txt", row.name=FALSE, sep = "\t")