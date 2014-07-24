run_analysis<-function () {
    setwd("./UCI HAR Dataset")
      ## getting data from files
    X_test<-read.table("./test/X_test.txt")
    X_train<-read.table("./train/X_train.txt")
    subject_train<-read.table("./train/subject_train.txt")
    Y_train<-read.table("./train/Y_train.txt")
    subject_test<-read.table("./test/subject_test.txt")
    Y_test<-read.table("./test/Y_test.txt")
      ## merging datasets
    test<-cbind(subject_test, Y_test, X_test)
    train<-cbind(subject_train, Y_train, X_train)
    tidy_data<-rbind(test, train)
      ## giving descriptive names to variables
    features<-read.table("./features.txt", stringsAsFactors=FALSE)
    names(tidy_data)<-c("Subject","Activity",features[,2])
      ## subsetting to only mean and standart deviation
    tidy_data<-tidy_data[, (grepl("mean", names(tidy_data)) | 
                            grepl("std",names(tidy_data)) | 
                            names(tidy_data) %in% c("Subject", "Activity")) & 
                            !grepl("meanF", names(tidy_data))]
      ## giving descriptive names to activities
    labels<-read.table("./activity_labels.txt", stringsAsFactors=F)
    tidy_data<-merge(tidy_data, labels, by.x="Activity", by.y="V1", all=TRUE)
    tidy_data<-tidy_data[order(data$Subject),]
    tidy_data$Activity<-tidy_data$V2
    tidy_data<-tidy_data[,1:68]
    write.table(tidy_data, "../tidy_data_1.txt")
    meltdata<-melt(tidy_data, id=c("Activity", "Subject"), 
                   measure.vars=names(tidy_data)[3:68])
    tidy_data_2<-dcast(meltdata,Activity+Subject~variable, mean)
    write.table(tidy_data_2, "../tidy_data_2.txt")
    
}