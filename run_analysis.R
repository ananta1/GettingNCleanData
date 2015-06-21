    
#Pre-requisite to run the script is to unzip the zip file. 

prepareTidyData<-function(){
    
    #set working dir
    setwd("C:\\DataScience\\R-Programming\\CleanData\\data\\UCI HAR Dataset")  
    
    features<-read.table("./features.txt", header = FALSE, sep = "" )   
    feats<-as.character(features$V2)
    
        
    activity_labels<-read.table("./activity_labels.txt", header = FALSE, sep = "" ) 
    
    # READ TRAIN DATA from here.
    # read X_train data
    X_train<-read.table("./train/X_train.txt", header = FALSE, sep = "" )   
    colnames(X_train)<-feats   # change the header same as features
    
    #read training labels 
    Y_train<-read.table("./train/y_train.txt", header = FALSE, sep = "" )   
    #(Training lables 
    #1.WALKING
    #2 WALKING_UPSTAIRS
    #3 WALKING_DOWNSTAIRS
    #4 SITTING
    #5 STANDING
    #6 LAYING
    
    #read subjects - sample of 30
    subject_train<-read.table("./train/subject_train.txt", header = FALSE, sep = "" ) 
    
    colnames(subject_train)<-"PersonId"
    
    train_activities<-merge(Y_train,activity_labels)[2]
        
    colnames(train_activities)<-"Activity"
    
    #Next cbind X_train and Y_train  & subject_train
    
    finalTrainData<-cbind(subject_train,train_activities,X_train)
    
    #===========================
    
    # READ TEST DATA from here.
    # read X_test data
    X_test<-read.table("./test/X_test.txt", header = FALSE, sep = "" )   
    colnames(X_test)<-feats  # columan names same as features
    
    #read training labels 
    Y_test<-read.table("./test/y_test.txt", header = FALSE, sep = "" )   
    #(Training lables 
    #1.WALKING
    #2 WALKING_UPSTAIRS
    #3 WALKING_DOWNSTAIRS
    #4 SITTING
    #5 STANDING
    #6 LAYING
    
    #read subjects - sample of 30
    subject_test<-read.table("./test/subject_test.txt", header = FALSE, sep = "" ) 
    
    colnames(subject_test)<-"PersonId"
    
    test_activities<-merge(Y_test,activity_labels)[2]
    
    colnames(test_activities)<-"Activity"
    
    #Next cbind X_train and Y_train  & subject_train
    
    finalTestData<-cbind(subject_test,test_activities,X_test)
    
    #finalMergedData<-merge(finalTrainData, finalTestData, by="Person Id")
    
    finalMergedData<-rbind(finalTrainData, finalTestData)
    
    print("---No of columns of finalMegeData-----")
    print(ncol(finalMergedData))
    
    
    #Following logic filter out only mean and std columns along with person id and activity
    selectColumns<-colnames(finalMergedData)[grep("mean()|std()|Activity|PersonId",colnames(finalMergedData))]
    finalFilterData<-finalMergedData[,selectColumns]
    
        
    # columns 3 to 81 give different variables of the data for which we are taking mean.
    means<-aggregate(finalFilterData[, 3:81], by=list(finalFilterData$Activity,finalFilterData$PersonId), mean)
    
    
    #Write means to the file into disk.
    
    write.table(means,"finalmeans.txt", row.name=FALSE )
   
    
    #
    # There are about 40 rows and following loop tells about each activity of subject howmany.
    #for (i in 1:30 ) {
      
     # print(unique(subset(finalFilterData,finalFilterData$PersonId==i,select=c(PersonId,Activity))))
      
    #}
    
    
    
    
    
}