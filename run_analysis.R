#TASK 1:
#Following code merges the test and train dataset and writes into corresponding merged files,
#i.e. for each file in train and test data folders there is a corresponding merged file in
#merged folder.
listFiles = list.files("test", full.names = T, recursive = T)
listFiles = unlist(strsplit(a, split="test.txt"))
listFiles = unique(unlist(strsplit(listFiles, split="test/")))[-1]
if(!file.exists("merged")){dir.create("merged")}
if(!file.exists("merged/Inertial Signals"))dir.create("merged/Inertial Signals")
for(i in listFiles)
{
  tr = read.table(file=paste("train/", i,"train.txt",sep=""))
  te = read.table(file=paste("test/", i,"test.txt",sep=""))
  final = rbind(tr,te)
  write.table(final, file=paste("merged/", i,"merged.txt",sep=""), sep="\t")
}
#TASK 3: (Replace row names)
activityLabels = read.table(file="activity_labels.txt")
y_merged = read.table(file="merged/y_merged.txt", sep="\t", row.names = 1)
y_merged.new = merge(y_merged, activityLabels, by="V1", sort = F)

#TASK 4: (Replace column names)
featureNames = read.table(file="features.txt", sep=" ")
x_merged = read.table(file="merged/X_merged.txt", sep="\t", row.names = 1)
colnames(x_merged) = featureNames$V2

#TASK 2: (Extract mean and std. dev.)
meanIndex = grep("mean",colnames(x_merged),ignore.case=TRUE)
stdIndex = grep("std",colnames(x_merged),ignore.case=TRUE)
meanData = x_merged[,meanIndex]
stdData = x_merged[,stdIndex]

#TASK 5:
#Creating a dataset with added Activity and Subject info
subjectInfo = read.table(file="merged/subject_merged.txt")
annotated.dataset = cbind(y_merged.new, subjectInfo, x_merged)
colnames(annotated.dataset)[1:3] = c("ActiviyLabel","ActivityName","SubjectID")
new.dataset=aggregate(annotated.dataset[4:ncol(annotated.dataset)], by=list(ActivityName=annotated.dataset$ActivityName,SubjectID=annotated.dataset$SubjectID), FUN=mean)
write.table(new.dataset, file="tidyDataset.txt", sep="\t", row.names = FALSE)