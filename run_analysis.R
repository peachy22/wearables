.packages = c("tidyr", "dplyr")
.inst <- .packages %in% installed.packages()
if(length(.packages[!.inst]) > 0) install.packages(.packages[!.inst])
lapply(.packages, require, character.only=TRUE)

library('dplyr')
library('tidyr')

fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile="./data.zip",method="curl")
unzip('./data.zip', files = NULL, list = FALSE, overwrite = TRUE, junkpaths = FALSE, exdir = ".", unzip = "internal",setTimes = FALSE)

features<-read.table("./UCI HAR Dataset/features.txt",header=FALSE)
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE,col.names = features$V2)
Y_test<-read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE,col.names = 'test_labels')
sub_test<-read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE,col.names = 'subject_id')
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE,col.names = features$V2)
Y_train<-read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE,col.names = 'test_labels')
sub_train<-read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE,col.names = 'subject_id')
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")

X_joined <- rbind(X_test,X_train)
Y_joined <- rbind(Y_test,Y_train)
  Y_joined$test_labels[Y_joined$test_labels == 1] <- 'walking'
  Y_joined$test_labels[Y_joined$test_labels == 2] <- 'walking_upstairs'
  Y_joined$test_labels[Y_joined$test_labels == 3] <- 'walking_downstairs'
  Y_joined$test_labels[Y_joined$test_labels == 4] <- 'sitting'
  Y_joined$test_labels[Y_joined$test_labels == 5] <- 'standing'
  Y_joined$test_labels[Y_joined$test_labels == 6] <- 'laying'
sub_joined <- rbind(sub_test,sub_train)

XYsub<-cbind(sub_joined,Y_joined,X_joined)
meas<-select(XYsub,(contains("subject_id")|contains("test_labels")|contains("mean")|contains("std"))&!(contains("freq")|contains("angle")))
data<-melt(meas,id.vars=c('subject_id','test_labels'))

group<-group_by(data,subject_id,test_labels,variable)
meas_avg<-arrange(summarize(group,average=mean(value)),subject_id,variable,test_labels)
names(meas_avg)[3]<-"measurement"

rm(list=ls()[! ls() %in% c("meas","meas_avg")])


















