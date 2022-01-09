# wearables
R script that cleans and filters data from a study on smartphone accelerometer data. Returns a tidy data frame that reports the averages for measurements of interest by subject and activity type.  Original data and study description: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The script first checks to see if tidyr, dplyr, and reshape2 are installed. If any are missing, those packages are installed for you and then loaded with the library() commands. 

The raw, untidy data (from the second URL above) is downloaded then unzipped into your working directory. 

The core data from the raw folder is separated into "testing" and "training" category folders. Both folders conatin a "Y" text file and an "X" text file: 

Each recorded activity has a numeric label whose description is given in activities.txt. 561 measurement types are described in features.txt and these correspond to the columns for X_test and X_train.
