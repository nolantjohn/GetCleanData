# GetCleanData
This repository contains the files required by the Coursera, Data Science Specialization, Get and Clean Data course project.

In this repo there are four files:
- run_analysis.R
- tidyData.txt
- CodeBook.md
- README.md

run_analysis.R contains the following functions:
- prepData() to read in data from the directory, appropriately label the data set with descriptive variable names, and for train and test, adds descriptive activity names to name the activities in the data set
# Assumes all files are in the current working directory and file names remain unchanged
- mergeData(x) to merge the training and test data sets, by row with training appearing first, to create one data set
# "x" is the variable assigned the prepData(), Ex: a <- prepData() "a" should be provided as "x"
- extractData(x) to extract the measurements on the mean, column headers containing mean(), and standard deviation, column headers containing std(), for each measurement
# "x" should be the variable assigned the mergeData(x), Ex: b <- mergeData(a) "b" should be provided as "x"
- avgData(x) creates an independent tidy data set with the average of each variable for each activity and each subject
# "x" should be the variable assigned the extractData(x), Ex: c <- extractData(b) "c" should be provided as "x"
- writeData(x, file, row.name=F) writes a data set to the current working directory
# "x" should be the variable assigned the avgData(x), Ex: d <- avgData(c) "d" should be provided as "x"
# "file" is a file name for the data, Ex: "myData.txt"
# "row.name=F" means there is no row name

tidyData.txt is the output of running the Samsung data through run_analysis.R

CodeBook.md describes the variables, the data, and any transformations or work that was performed to clean up the data