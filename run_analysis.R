library(dplyr)

runAnalysis <- function() {

	# load the train data set with just the means and stds
	trainSet <- createTrainDataSet ()

	# load the test data set with just the means and stds
	testSet  <- createTestDataSet  ()

	# join the two data sets with just the means and stds
	completeSet <- rbind(trainSet, testSet)
	##print(dim(completeSet))

	## Calculate the averages of means and stds per subject per activity.
	result <- createAverages(completeSet)
	
	## Write the result out.
	if(!file.exists("./results")) { dir.create("./results")}
	write.table(result, file = "results/avg_mean_and_stds_all_data.txt",row.names=FALSE, na="", sep=",", quote=FALSE)
}

createAverages <- function(data) {

	activities <- getActivityNames()
	subjects <-	unique(getAllSubjects())
	features <-	getAnalysisFeatures()

	#######################################
	##result <- merge(activities , subjects, by=NULL) ## cross join - 6X30 = 180.
	##result$V1.x = NULL
	##result <- rename(result, Activity=V2, Subject=V1.y)	
	#################################


	
	##Create Result Data frame.
	colNames 		  <-   c("subject", "activity")
	result   		  <-   as.data.frame(c("subject"))
	result["Activity"]  <-   c("activity")
	for(featIdx in 1:length(features[, 2]))
	{
		iFeature <- toString(features[featIdx, 2])
		colNames <- c(colNames, iFeature)
		result[toString(iFeature)] <- c(iFeature)
	}
	names(colNames) <- colNames
	names(result) <- colNames

	## Split by subjects (30 data sets)
	dataBySubj <- split(data, data[, 2])
	numOfSubjs <- length(subjects[,1])		
	for(subjIdx in 1 : numOfSubjs )
	{
		iSubj <- toString(subjIdx)
		subjData <- dataBySubj[[ iSubj ]];
		dataByActivity <- split(subjData , subjData [, 3])
		numOfActivities <- length(activities[, 1])
		for(activityIdx in 1: numOfActivities )
		{
			iActivity <- activities[activityIdx, 2]
			activityData <- dataByActivity[[ iActivity ]]
			newrow <- as.data.frame(c(iSubj))
			newrow["Activity"] <- toString(iActivity)

			for(featIdx in 1:length(features[, 2]))
			{
				iFeature <- toString(features[featIdx, 2])
				iValue <-  mean(activityData [[ toString(iFeature) ]])
				newrow[toString(iFeature)] <- as.numeric(iValue)				
			}
			names(newrow) <- colNames
			result <- rbind(result, newrow)			
		}

	}
	result <- result[-c(1), ]


	#Rename the columns to meet tidy data standards.
	##newColNames(colNames)

	#Send the results
	result
}

newColNames <- function(oldNames) {

	n <- length(oldNames)
	newNames <- c()
	for(idx in 1 : n) {
		old <- oldNames[idx]
		## print(old)
	}
}

createTestDataSet <- function() {

	### Get Features to be analysed.
	analysisFeatures <- getAnalysisFeatures()

	####  Read activity names.
	activityNames <- getActivityNames()

	####  Read y_test
	testActivities <- read.csv("UCI HAR Dataset/test/y_test.txt", sep=" ", header=FALSE)
	testActivities <- as.data.frame(testActivities$V1)
	testActivities <- as.data.frame(apply(testActivities, 1, function(s) sub("1", activityNames[1,2], s, fixed=TRUE)))
	testActivities <- as.data.frame(apply(testActivities, 1, function(s) sub("2", activityNames[2,2], s, fixed=TRUE)))
	testActivities <- as.data.frame(apply(testActivities, 1, function(s) sub("3", activityNames[3,2], s, fixed=TRUE)))
	testActivities <- as.data.frame(apply(testActivities, 1, function(s) sub("4", activityNames[4,2], s, fixed=TRUE)))
	testActivities <- as.data.frame(apply(testActivities, 1, function(s) sub("5", activityNames[5,2], s, fixed=TRUE)))
	testActivities <- as.data.frame(apply(testActivities, 1, function(s) sub("6", activityNames[6,2], s, fixed=TRUE)))
	##print(dim(testActivities ))

	testSubjects <- getTestSubjects()

	#### X_test.txt
	testReadings <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
	##print(dim(testReadings))

	# Join the columns to create a data set for the test data.
	temp <- data.frame(id=1:2947)
	temp[["Subject"]] = testSubjects[ , 1]
	temp[["Activity"]] = testActivities [ , 1]
	##print(dim(temp))
	
	sz <- length(analysisFeatures[, 1])
	for( index in 1:sz ) {
		columnName <- analysisFeatures[index, 2]
		columnNum  <- analysisFeatures[index, 1]
		temp[[toString(columnName)]] = testReadings [, columnNum]
	}
	##print(dim(temp))
	temp
}

createTrainDataSet <- function() {

	#####  Read features.txt, rename and identify columns in the data set of interest.
	analysisFeatures = getAnalysisFeatures()

	####  Read activity names.
	activityNames <- getActivityNames()

	####  Read y_train
	activities <- read.csv("UCI HAR Dataset/train/y_train.txt", sep=" ", header=FALSE)
	activities <- as.data.frame(activities$V1)
	activities <- as.data.frame(apply(activities , 1, function(s) sub("1", activityNames[1,2], s, fixed=TRUE)))
	activities <- as.data.frame(apply(activities , 1, function(s) sub("2", activityNames[2,2], s, fixed=TRUE)))
	activities <- as.data.frame(apply(activities , 1, function(s) sub("3", activityNames[3,2], s, fixed=TRUE)))
	activities <- as.data.frame(apply(activities , 1, function(s) sub("4", activityNames[4,2], s, fixed=TRUE)))
	activities <- as.data.frame(apply(activities , 1, function(s) sub("5", activityNames[5,2], s, fixed=TRUE)))
	activities <- as.data.frame(apply(activities , 1, function(s) sub("6", activityNames[6,2], s, fixed=TRUE)))
	##print(dim(activities ))

	####  Read subject_test
	subjects <- getTrainSubjects()
	##print(dim(subjects))

	#### X_test.txt
	readings <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
	##print(dim(readings))

	# Join the columns to create a data set for the test data.
	data <- data.frame(id=1:7352)
	data [["Subject"]] = subjects[ , 1]
	data [["Activity"]] = activities [ , 1]
	##print(dim(data ))
	
	sz <- length(analysisFeatures[, 1])
	for( index in 1:sz ) {
		columnName <- analysisFeatures[index, 2]
		columnNum  <- analysisFeatures[index, 1]
		data [[toString(columnName)]] = readings [, columnNum]
	}
	##print(dim(data ))
	data 
}


getActivityNames <- function() {
	####  Read activity names.
	activityNames <- read.csv("UCI HAR Dataset/activity_labels.txt", sep=" ", header=FALSE)
	activityNames
}

getTestSubjects <- function() {
	####  Read subject_test
	subjects <- as.data.frame(read.csv("UCI HAR Dataset/test/subject_test.txt", sep=" ", header=FALSE))
	##print(dim(testSubjects))
}

getTrainSubjects <- function() {
	subjects <- as.data.frame(read.csv("UCI HAR Dataset/train/subject_train.txt", sep=" ", header=FALSE))
}

getAllSubjects <-  function(){
	s1 <- getTestSubjects()
	s2 <- getTrainSubjects()
	all <- rbind(s1, s2)
}

getAnalysisFeatures <- function() {
	#####  Read features.txt, rename and identify columns in the data set of interest.
	featureList <- read.csv("UCI HAR Dataset/features.txt", sep=" ", header=FALSE);
	featureList <- rename(featureList, number=V1, name=V2);
	analysisFeatures = featureList[grepl("-mean[(][)]|-std[(][)]", featureList$name) == TRUE, ]
	analysisFeatures
}



