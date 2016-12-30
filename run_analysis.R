
# Download and uncompress the data
if(!file.exists("./Data")){dir.create("./Data")}
fileUrl=paste0(
  "https://d396qusza40orc.cloudfront.net/",
  "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
)

localZipPath="./Data/uciHarDataset.zip"
if(!file.exists(localZipPath))
{
  download.file(fileUrl,localZipPath)
}

dataFiles=unzip(localZipPath,exdir='Data')
# ...we now have a list of the paths to all input data.

# Build a dataframe containing the test and training data
## A function to build dataframes from columns from files with given names,
## and a given list of filepaths to choose from
catColsFromFiles = function(listOfDataFilenames, pathsToSearch)
{
  listOfDataFilenames = paste0("/",listOfDataFilenames) # no partial matches
  dataPaths = sapply(listOfDataFilenames,grep,x=pathsToSearch,value=T)
  print("reading:")
  print(dataPaths)
  dataFrames = sapply(dataPaths,read.table,header=F)
  mergedData = do.call(cbind, as.vector(dataFrames))
  return(mergedData)
}

testFilenames = c("subject_test.txt","y_test.txt","X_test.txt")
trainFilenames=c("subject_train.txt","y_train.txt","X_train.txt")
testData=catColsFromFiles(testFilenames,dataFiles)
trainData=catColsFromFiles(trainFilenames,dataFiles)
combinedData=data.frame(rbind(as.matrix(testData),as.matrix(trainData)))
# ...we now have the test and training data in a dataframe, combinedData

# Label the columns and extract only those that are the mean or standard deviation of a physical measurement
featuresFilename = grep("features.txt",dataFiles,value=T)
features = read.table(featuresFilename,F,stringsAsFactors=F,
                   col.names=c("featId","featName"))
columns=c("subject","activityID",features$featName)
colnames(combinedData)<-columns

colsToKeep = grep("(subject|activityID|mean\\(|std\\()",colnames(combinedData))
print( colnames(combinedData)[colsToKeep] )
selectedData = combinedData[,colsToKeep]
# ...we now have only means and stdevs, with descriptive column names, in selectedData

# replace the activity indices with string names
activityFilename = grep("activity_labels.txt",dataFiles,value=T)
activityKey=read.table(activityFilename,F,stringsAsFactors=F,
                       col.names=c("activityID","activityName"),
                       colClasses=c("integer","character"))
selectedData<-merge(activityKey,selectedData)
write.table(selectedData,'selected_data_train_and_test.txt',row.name=FALSE)

# Take the averages by activity and subject in turn
meansFilter = !grepl("std",colnames(selectedData))
meansData = selectedData[,meansFilter]
summarisedByActivity = aggregate(meansData,list(meansData$activityName),mean)
summarisedByActivity$activityName<-NULL
colnames(summarisedByActivity)[1]= "activityName"

summarisedBySubject = aggregate(meansData,list(meansData$subject),mean)
summarisedBySubject$subject<-NULL
summarisedBySubject$activityID<-NULL
summarisedBySubject$activityName<-NULL
colnames(summarisedBySubject)[1]= "subject"

# For completeness, report cross-tabulated averages for pairs of subject, activity
summarisedBySubjectAndActivity = aggregate(meansData,list(meansData$activityName,meansData$subject),mean)
summarisedBySubjectAndActivity$activityID<-NULL
summarisedBySubjectAndActivity$activityName<-NULL
summarisedBySubjectAndActivity$subject<-NULL
colnames(summarisedBySubjectAndActivity)[1]= "activityName"
colnames(summarisedBySubjectAndActivity)[2]= "subjectId"
write.table(summarisedBySubjectAndActivity,'means_by_subject_and_activity.txt',row.name=FALSE)