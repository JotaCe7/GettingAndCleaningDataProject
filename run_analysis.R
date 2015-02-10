##### STEP1 #####
#1. Merges the training and the test sets to create one data set.

#Load the data into R.
subject_train <- read.table("./subject_train.txt", header = FALSE)
subject_test  <- read.table("./subject_test.txt",  header = FALSE)
X_train       <- read.table("./X_train.txt",       header = FALSE)
X_test        <- read.table("./X_test.txt",        header = FALSE)
y_train       <- read.table("./y_train.txt",       header = FALSE)
y_test        <- read.table("./y_test.txt")

#Load some information about the activity labels and features' names
activity_labels <- read.table("./activity_labels.txt" , header = FALSE)
features        <- read.table("./features.txt" ,        header = FALSE)

#with:
str(activity_labels)
#we see that the labels (factors) are in the V2 column of activity_labels

#with:
str(features)
#we see that the features' names (factors) are in the V2 column of features



#Bind the train and test data
subject <- rbind(subject_train, subject_test)
X       <- rbind(X_train, X_test)
y       <- rbind(y_train, y_test)



str(subject_test)
class(subject_test$V1)


summary(X)
#Check that the datas have been correctly binded by looking at their dimensions
#The new data should have the same number of colums and the sum of their rows.

dim(subject_train)
dim(subject_test)
dim(subject)

dim(X_train)
dim(X_test)
dim(X)

dim(y_train)
dim(y_test)
dim(y)

##### STEP2 #####
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#By looking at the features_info.txt we know that we are looking for variables with names "mean()" and "std()"
#So we look for features' names with "mean()" and "std()" on them from features$V2, save their
#indices; and then extract those indices (columns) from X

#features' names that contain "mean()"
mean_feactures <- grep("mean()",features$V2)
#features' names that contain "std()"
std_features   <- grep("std()",features$V2)
#now we can combine mean_feactures and std_feactures, OR...

#Using 'regular expressions' we can find features' names that contain "mean()" or "std()"
mean_std_features <- grep("mean\\(\\)|std\\(\\)",features$V2)
#note: we are keeping the "time" and "fourier" ones, because it's not been saud anything about that.


#And now we ectract those columns from X
X_new <- X[,mean_std_features]

##### STEP3 #####
#3. Uses descriptive activity names to name the activities in the data set.
#The activities are in y$V1
class(y$V1)
#and we see that these are integers (1 - 6).
#The descriptive activity names are in activity_labels$V2
activity_labels$V2

#So first, we change the class of y$V1 from integer to factor
y$V1 <- as.factor(y$V1)
class(y$V1)
#Then change its levels names
levels(y$V1) <- activity_labels$V2
summary(y$V1)

##### STEP4 #####
#Appropriately labels the data set with descriptive variable names.
#First, create a variable with the features' names
X_new_names <- features$V2[mean_std_features]
#Following the criteria for "nice and decent variable names" in lecture 1 of Week 4
library(dplyr)
X_new_names <- X_new_names %>% tolower() %>% gsub(pattern = "\\(\\)|-",replacement = "")
#Assign these names to X_new
names(X_new) <- X_new_names

#For subject
names(subject) <- "subject"

#For y
names(y) <- "activity"


##### STEP5 #####
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#Bind by columns the data in the tidydata
tidydata <- cbind(subject,y,X_new)
#Convert the class of tidydata$subject from integer to factor
tidydata$subject <- as.factor(tidydata$subject)
#Group by activity and subject
tidydata_by_activity_subject <- group_by(tidydata,subject,activity)
View(tidydata_by_activity_subject)
#Summarize each feacture column/group by its mean
finaldata <- summarise_each(tidydata_by_activity_subject,funs(mean),-c(1,2))
View(finaldata)

#Finally, change the features' names to reflect that now they represent the "average"
#get the names:
nms <- names(finaldata)
#Add "avg" to the fetures' names
nms[-(1:2)] <- vapply(nms[-(1:2)],function(x) paste0(x,"avg"),c("1"))
#Update the names
names(finaldata)[-(1:2)] <- nms[-(1:2)]


##### FINAL STEP #####
#Create a .txt file with write.table() containing the data
write.table(finaldata, "./tidydata.txt",row.names = FALSE)
