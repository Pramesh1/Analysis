##  You should create one R script called run_analysis.R that does the following. 
##   1.Merges the training and the test sets to create one data set.
##   2.Extracts only the measurements on the mean and standard deviation for each measurement. 
##   3.Uses descriptive activity names to name the activities in the data set
##   4.Appropriately labels the data set with descriptive activity names. 
##   5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
###########################################################################################

run_analysis <- function() {

## initialising files, directories , patshs, etc.

        directory="UCI HAR Dataset"
        traDir= paste(".",paste(directory, "train", sep = "/"),sep="/")
        tstDir=paste(".",paste(directory, "test", sep = "/"),sep="/")
        
        feaFile=paste(".",paste(directory,"features.txt",sep="/"),sep="/")
        actFile=paste(".",paste(directory,"activity_labels.txt",sep="/"),sep="/")
        
        traS=paste(traDir,"subject_train.txt",sep="/")
        traX=paste(traDir,"X_train.txt",sep="/")
        traY=paste(traDir,"Y_train.txt",sep="/")
        
        tstS=paste(tstDir,"subject_test.txt",sep="/")
        tstX=paste(tstDir,"X_test.txt",sep="/")
        tstY=paste(tstDir,"Y_test.txt",sep="/")
        
        pr_dset <- NULL

## Creating initial tables

        tbl_Features <-read.table(feaFile)    
        tbl_Activities<-read.table(actFile)
        
        tbl_traS<-read.table(traS)
        tbl_traX<-read.table(traX)
        tbl_traY<-read.table(traY)
        
        tbl_tstS<-read.table(tstS)
        tbl_tstX<-read.table(tstX)
        tbl_tstY<-read.table(tstY)

## Extract the necessary variable.

        fac_Features <-tbl_Features[[2]]    
        fac_Activities<-tbl_Activities[[2]]
        
        fac_traS<-tbl_traS[[1]]
        fac_traY<-tbl_traY[[1]]
        
        fac_tstS<-tbl_tstS[[1]]
        fac_tstY<-tbl_tstY[[1]]

##  1. Merge the training and the test sets to create one data set.
#############################################################################

        merged_data<-rbind(tbl_traX,tbl_tstX)
        names(merged_data)<-fac_Features
        RESULT1 <- merged_data

        ver_file= paste(".",paste(directory, "PR-RESULT1.txt", sep = "/"),sep="/")
        if(file.exists(ver_file))file.remove(ver_file)
        write.table(RESULT1,paste(paste(".",directory,sep="/"),"PR-RESULT1.txt",sep="/"))      

print(Q1: "The 2 Datasets Have been Merged in a new set called RESULT1-")
print(Q1: "New File created in working dircetory : PR-RESULT1.txt")


###   2.Extracts only the measurements on the mean and standard deviation for each measurement.
###############################################################################################

        sel_col<- grep("mean|std",fac_Features)
        cols_ms_data<-merged_data[,sel_col]
        RESULT2<- cols_ms_data
print("Q2 COmpleteded: Mean and Std have been extracted to RESULT2")


##  3.Uses descriptive activity names to name the activities in the data set
##  4.Appropriately labels the data set with descriptive activity names. 
#########################################################################


        Activities_ID<-c(fac_traY,fac_tstY)
        new_data_A<-cbind(Activities_ID, merged_data)  ## activites description added
        Subject_ID<- c(fac_traS,fac_tstS)              ## combine training and test people (care that training is at top)
        new_data <-cbind(Subject_ID, new_data_A)       ## Subjects are now identified (anonymously)
        RESULT3<-new_data
print("Q3 & Q4 COmpleteded: Data labelled with subjects ID and activities ID - RESULT3")

##   5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
###########################################################################################
##

pr_dset <- NULL

for( i in 1:30) {
        
        sbs_data<-NULL
        sbs_data<-subset(new_data,new_data$Subject_ID==i,)
        sbs_results<-ddply(sbs_data,.(Activities_ID),colMeans)
        pr_dset<-rbind(pr_dset,sbs_results)
        }
RESULT4<-pr_dset

        ver_file= paste(".",paste(directory, "PR-RESULT4-TIDY.txt", sep = "/"),sep="/")
        if(file.exists(ver_file))file.remove(ver_file)
        write.table(RESULT4,paste(paste(".",directory,sep="/"),"PR-RESULT4-TIDY.txt",sep="/"))

print("Q5 Completeded: Tidy data set file created - PR-RESULT4-TIDY.txt")
##end
}
