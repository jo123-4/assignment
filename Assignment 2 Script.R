# Read "features" txt
features <- read.delim("C:/Users/joannak/Downloads/assignment/UCI HAR Dataset/features.txt", sep = "", header = FALSE)

#Filtering specific "features" - mean & std deviation
featuresindex <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:203, 240,241, 266:271, 345:350, 424:429, 503:504, 529:530)
feature_main <- features$V2[featuresindex]

#Read "test" txt and applying specific features
X_test <- read.delim("C:/Users/joannak/Downloads/assignment/UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)
head(X_test)
Y_test <- read.delim("C:/Users/joannak/Downloads/assignment/UCI HAR Dataset/test/Y_test.txt", sep = "", header = FALSE)
head(Y_test)
X_test_filtered <- X_test[,feature_main]
names(X_test_filtered) <- feature_main
names(Y_test) <- "activity"

#Read "train" txt and applying specific features
X_train <- read.delim("C:/Users/joannak/Downloads/assignment/UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)
head(X_train)
Y_train <- read.delim("C:/Users/joannak/Downloads/assignment/UCI HAR Dataset/train/Y_train.txt", sep = "", header = FALSE)
head(Y_train)
X_train_filtered <- X_train[,feature_main]
names(X_train_filtered) <- feature_main
names(Y_train) <- "activity"

#Read "subject" from both train & test txt to specify common field as "subject_number"
trainsubject <- read.delim("C:/Users/joannak/Downloads/assignment/UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE)
names(trainsubject) <- "subject_number"
testsubject <- read.delim("C:/Users/joannak/Downloads/assignment/UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE)
names(testsubject) <- "subject_number"

#merge train data
traindata <- cbind(trainsubject, X_train_filtered, Y_train)

#merge test data
testdata <- cbind(testsubject, X_test_filtered, Y_test)

#tidy up activity labels
activitylabel <- read.delim("C:/Users/joannak/Downloads/assignment/UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE)
names(activitylabel) <- c("activity","activity_description")

#merge test & train data
Combineddata <- rbind(traindata, testdata)
mergeddata <- merge(Combineddata, activitylabel, by = "activity", all.x= TRUE, sort = FALSE)

#group the data by activity & subject_number
library(dplyr)
mergeddata %>% group_by(activity, activity_description, subject_number) %>% summarise_all(funs(mean))


#extract to txt file for submission
write.table(mergeddata, "submisison", append = FALSE, sep = " ", dec = ".",
            row.names = FALSE, col.names = TRUE)
