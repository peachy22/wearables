# wearables
R script that cleans and filters data from a study on smartphone accelerometer data. Returns a tidy data frame in the R environment as well as a text file that reports the averages for measurements of interest by subject and activity type.  Original data and study description: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The script first checks to see if tidyr, dplyr, and reshape2 are installed. If any are missing, those packages are installed for you and then loaded with the library() commands. 

The raw, untidy data (from the second URL above) is downloaded then unzipped into your working directory. 

The core data from the raw folder is separated into "testing" and "training" category folders. Both folders contain a "Y" file, an "X" file, and a "subjects" file. The "Y" file contains a numeric label for the kind of activity being observed. The "subjects" file contains an id number for the participant during this observation. The "X" file contains 561 column vectors and the same number of rows as both of the previous files; each vector is a measurement type. In total, there are 10299 row observations and 561 data measurements. In lines 14-21 the testing and training data is loaded into R along with the vectors describing the accelerometer measurement types (features.txt: standard deviation of Z-axis "body jerk", etc.) and descriptive activity names (activity_labels.txt: 1 - walking, etc). 

In lines 23-31 the .txt data for each of the three main file types is joined across the "test" and "train" categories, creating 3 data frames of row count 10299. Also, each of the numeric labels for the activity types is replaced with the appropriate descriptive label. 

For 33, all three data frames are joined together to create a large combined frame with 561+2 columns for the accelerometer data, activity, and subject performing for that observation. The resulting frame is stored in the "XYsub" variable for reference. An intermediate "data" variable then extracts only those measurements which take a mean or standard deviation. The criteria for this selection is that the feature end in "mean()' or "std()" in the original labeling. 

Lines 35-37 are concerned primarily with using melt() to reshape the data into a 4-column structure which gives a subject id, activity, a mean or standard deviation-type measurement label, and the value. 38 and 39 create a tidy data frame with appropriate labels that averages out the values for each identical combination of subject, activity, and measurement type. The resulting frame is loaded into the variable "tidy_avg" and sorted so that one measurement for each activity by each subject is displayed. The tidy_avg table explicitly explains the definition of each observation: the subject, what they were doing, and what the average measurement was. 

The final line clears out the intermediate variables involved in constructing the two aforementioned data frames. 




