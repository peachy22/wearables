ORIGINAL SMARTPHONE ACCELEROMETER STUDY FOR HUMAN ACTIVITY DATA:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

This R script cleans the above data into a four-column format which gives the average value, per subject id and activity, for measurements originally flagged as being mean or standard deviation entries. 

The script returns two data R frames, 1) XYsub and 2) tidy_avg. tidy_avg is also written as a .txt file to your working directory.

1) XYsub represents wide data collected into a single frame from multiple files across two category folders within the original .zip files. It is so named because the data originaly consisted of separate "X" "Y" and "subject" .txt files. The first task in the script was to combine the two categories and three data sets each into a single data frame with descriptive labels. XYsub contains the following 563 columns:

    subject_id:
    Numeric vector giving ID number (1-30) for the subject performing each task. No other description of the subjects was provided. 

    test_labels:
    Vector with six possible activities tested by each subject: standing, walking, walking_upstairs], walking_downstairs, laying, sitting.

    (561 measured accelerometer variables):
    The 561 numeric data points collected for each activity. 

2) tidy_avg is the above data, filtered only to include measurements of mean and standard deviation and arranged into a much more readable 4-column format that reports the subject id, activity, accelerometer data point, and average value for all dublicate combinations of the first three column variables.

    subject_id:
    Numeric vector giving ID number (1-30) for the subject performing each task. No other description of the subjects was provided. 

    test_labels:
    Vector with six possible activities tested by each subject: standing, walking, walking_upstairs], walking_downstairs, laying, sitting.
    
    measurement:
    Vector with 66 possible labels. Filtered from the original 561 accelerometer measurements to only include those that end with mean() or std(). 
    
    value: 
    The average value of all duplicate combinations of subject_id, test_labels, and measurement. 
