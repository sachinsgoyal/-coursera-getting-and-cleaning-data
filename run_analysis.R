library(plyr)

unzip("getdata-projectfiles-UCI HAR Dataset.zip")## Unzip the file

# Step 1
# Reading the data from files and assigning names

features <- read.table('./UCI HAR Dataset/features.txt', header=FALSE)

activity_labels <- read.table('./UCI HAR Dataset/activity_labels.txt',header=FALSE);
colnames(activity_labels)  <- c('activity_Id','activity_type');

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
colnames(x_train) <- features[,2]; 

y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
colnames(y_train) <- "activity_Id";

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
colnames(subject_train)  = "subject_Id";

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
colnames(x_test) <- features[,2]; 

y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
colnames(y_test) <- "activity_Id";

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
colnames(subject_test) = "subject_Id";

# Step 2
# Merging

# Creating train set by binding y_train, subject_train and x_train 
train = cbind(y_train, subject_train, x_train);

# Creating test set by binding y_test, subject_test and x_test
test = cbind(y_test, subject_test, x_test);

# Merging the train and test sets
Data <- rbind(train, test)
str(Data)

# Step 3
# Extracting only the measurements on the mean and standard deviation for each measurement. 
data_mean_std <- Data[ , grepl("mean\\(\\)|std\\(\\)|subject|activity_Id", names(Data))]
#str(data_mean_std)

# Step 4
# Using descriptive activity names to name the activities in the data set
# Merging data with activity
data_mean_std <- join(data_mean_std, activity_labels, by = "activity_Id", match = "first")
# Making data tidy by excluding redundant information (activity id and name of activity)
data_mean_std <- data_mean_std[ , -1]
#str(data_mean_std)

# Step 5
# labeling the data set with descriptive variable names.

# Remove parentheses
names(data_mean_std) <- gsub('\\(|\\)',"",names(data_mean_std), perl = TRUE)
# Rename variables
names(data_mean_std) <- gsub('Acc',"Acceleration",names(data_mean_std))
names(data_mean_std) <- gsub('GyroJerk',"AngularAcceleration",names(data_mean_std))
names(data_mean_std) <- gsub('Gyro',"AngularSpeed",names(data_mean_std))
names(data_mean_std) <- gsub('Mag',"Magnitude",names(data_mean_std))
names(data_mean_std) <- gsub('^t',"TimeDomain.",names(data_mean_std))
names(data_mean_std) <- gsub('^f',"FrequencyDomain.",names(data_mean_std))
names(data_mean_std) <- gsub('\\.mean',".Mean",names(data_mean_std))
names(data_mean_std) <- gsub('\\.std',".StandardDeviation",names(data_mean_std))
names(data_mean_std) <- gsub('Freq\\.',"Frequency.",names(data_mean_std))
names(data_mean_std) <- gsub('Freq$',"Frequency",names(data_mean_std))

names(data_mean_std)

#Step 6
# Creating  independent tidy data set with the average of each variable for activity and subject
avg_by_act_sub = ddply(data_mean_std, c("subject_Id","activity_type"), numcolwise(mean))
#head(avg_by_act_sub, 8)

write.table(avg_by_act_sub, file = "./tidy_data.txt")