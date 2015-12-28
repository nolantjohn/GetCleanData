## Reads in the data from there respective directories
## Then appropriately labels the data set with descriptive variable names
## For train and test, adds descriptive activity names to name the activities in the data set
## Assumes all files are in the current working directory and file names remain unchanged
prepData <- function(){
        
        ## Loads the plyr package, which contains the join package
        if(!require("plyr")){
                install.packages("plyr")
        }
        library(plyr)
        
        features <- read.table(paste(getwd(), "features.txt", sep="/"))
        names(features) <- c("Feature ID", "Feature")
        
        labels <- read.table(paste(getwd(), "activity_labels.txt", sep="/"))
        names(labels) <- c("Label ID", "Label")
        
        ttrainlabels <- read.table(paste(getwd(), "y_train.txt", sep="/"))
        names(ttrainlabels) <- "Label ID"
        trainlabels <- join(ttrainlabels, labels, by="Label ID")
        
        trainsubject <- read.table(paste(getwd(), "subject_train.txt", sep="/"))
        names(trainsubject) <- "Subject ID"
        
        ttrain <- read.table(paste(getwd(), "X_train.txt", sep="/"))
        names(ttrain) <- features$Feature
        train <- cbind(trainsubject, trainlabels$Label, ttrain)
        names(train)[2] <- "Activity"
        
        ttestlabels <- read.table(paste(getwd(), "y_test.txt", sep="/"))
        names(ttestlabels) <- "Label ID"
        testlabels <- join(ttestlabels, labels, by="Label ID")
        
        testsubject <- read.table(paste(getwd(), "subject_test.txt", sep="/"))
        names(testsubject) <- "Subject ID"
        
        ttest <- read.table(paste(getwd(), "X_test.txt", sep="/"))
        names(ttest) <- features$Feature
        test <- cbind(testsubject, testlabels$Label, ttest)
        names(test)[2] <- "Activity"
        
        list(features = features, labels = labels, trainlabels = trainlabels, trainsubject = trainsubject, train = train, testlabels = testlabels, testsubject = testsubject,  test = test)
}

## Merges the training and test data sets, by row with training appearing first, to create one data set
mergeData <- function(x){
        fdata <- rbind(x$train, x$test)
        fdata
}

## Extracts the measurements on the mean, column headers containing mean(),
## and standard deviation, column headers containing std(), for each measurement
extractData <- function(x){
        ## Leaves the first two columns (Subject ID and Activity) unchanged in the data frame
        edata <- x[1:2]
        names(edata)[1:2] <- names(x[1:2])
        
        ## Instantiates count, which is used to ensure the next item to pass the condition is placed after the last valid column
        ## Ensures there are no empty columns in the data set
        count <- 3
        
        for(i in 3:length(x)){
                
                ## If the Header contains "mean()" or "std()" then that column contains mean or standard deviation data
                if(grepl("mean()", names(x[i])) || grepl("std()", names(x[i]))){
                        
                        edata[count] <- x[i]
                        names(edata)[count] <- names(x[i])
                        count <- count + 1
                }
        }
        edata
}

## Creates an independent tidy data set with the average of each variable for each activity and each subject
avgData <- function(x){
        
        adata <- aggregate(x[, 3:length(x)], list(x$"Subject ID",x$Activity), mean)
        names(adata)[1:2] <- names(x[1:2])
        adata
}

## Will write a data set to the current working directory
writeData <- function(x, file, row.name=F){
        
        write.table(x, file=file, row.name=row.name)
}