---
title: "CodeBook"
author: "Nolan"
date: "Sunday, December 27, 2015"
output: html_document
---

This is an R Markdown document with the purpose of describing the functions / variables used in run_analysis

<b>Functions:</b><br>
- require() to check whether or not a package was already installed<br>
- install.packages() to install packages<br>
- library() to load packages<br>
- read.table() to read in files from the directory<br>
- paste() to concatenate the current directory path and file names<br>
- getwd() to get the current directory path<br>
- names() to assign descriptive column headers<br>
- join() to merge two data sets<br>
- cbind() to add 2 descriptive columns to a main data set<br>
- list() to make the data sets available by variable call, Ex: a$train<br>
- rbind() to merge the train and test data sets<br>
- for() to loop through column names<br>
- length() to get the number of columns to loop through<br>
- grepl() to partial match a string within the column headers, Ex: "mean()" in "tBodyAcc-mean()-X2" will return TRUE<br>
- aggregate() to get the average of the data based on a subject and activity grouping<br>
- write.table() to save the created data set as a file in the current directory<br>


<b>Variables (will not contain temporary / intermediate variable, such as ttrain):</b><br>
- features, a data set that stores the list of all features<br>
- labels, a data set that stores the list of activities and the corresponding id<br>
- trainlabels, a data set that stores the list of activity ids, per observation, for the train data<br>
- trainsubjects, a data set that stores the list of subject ids, per observation, for the train data<br>
- train, a data set that stores the train data<br>
- testlabels, a data set that stores the list of activity ids, per observation, for the test data<br>
- testsubjects, a data set that stores the list of subject ids, per observation, for the test data<br>
- test, a data set that stores the test data<br>
- fdata, a data set that stores the merged train and test data<br>
- edata, a data set that stores the mean and standard deviation observations<br>
- count, a variable that ensures edata does not have blank columns<br>
- adata, a data set that stores the averages per subject per activity<br>