Code Book :  Pramesh -2014
=====

####Raw Data Files:


* raw data set (unzipped) is expected to be located at "./ UCI HAR Dataset/"
* This can be modified by : 
   * changing the variable :   directory="UCI HAR Dataset" in the script
   * or, Insert a variable for "directory" in the function() + delete the directory in the script

* Subfolders should not be changed

####Script Part 1:  creates and initialise all the variables.


* These variables set the location of directories and files.     
 	      
        traDir=  sets the location of the training files
        tstDir=   sets the location of the test files    
        feaFile=  sets the location of the feature file
        actFile=  sets the location & names of the activities.txt  files
        
        traS= sets the names & location of the Subject_train.txt
        traX= sets the names & location of the X_train.txt file
        traY= sets the names &  location of the Y_train.txt file
        
        tstS= sets the names & location of the subject_test.txt
        tstX= sets the names & location of the X_test.txt
        tstY= sets the names & location of the Y_test.txt
        
* Creating initial data tables

        tbl_Features  - data table created from feature files
        tbl_Activities - data table created from activities file
        
        Data Tables  for the trainign data :  tbl_traS - tbl_traX  - tbl_traY          
        Data Tables  for the test data :  tbl_tstS   -  tbl_tstX  -  tbl_tstY


####Script Part 2:  Creating appropriate vectors and variables with their appropriate classes.

I will extract the necessary variable from these tables, for subsequent use.
* But looking at features.txt we can pick
    *  1. that the variables are ordered alphabetically - i.e. pointing to categorical variables.
    *  2- which are the relevant columns to use for the variables

I'll get the variables while transforming them to class=factor.
I`ll use the [[ ]] operand on each relevant column for this, during the extractions

A rapid head() on each table shows which column is relevantfor us.

      fac_Features         = extracted from features data set´
      fac_Activities       =    extracted from activities data set
      fac_traS - fac_traY  = extracted from relevant Subject and Y training data set
      fac_tstS - fac_tstY: = extracted from relevant Subject and Y training data set
      All are pf class=factor


#### Assessmnent Item 1. Merge the training and the test sets to create one data set.

        merged_data = merged data 
        RESULT1 = merged_data

  - Verify if file already exist  :  if yes then delete it using the file.remove() function
  - Create a file called :   ./ UCI HAR Dataset/ PR-RESULT1.csv       


#### Assessment Item 2: Extract only the measurements on the mean and standard deviation for each measurement.

    sel_col = identify the columns where the name contains "mean" or "std"
    cols_ms_data =  exctract the above identified columns and put them here
    
    RESULT2 =  contains only the columns with the means and std

#
#### Assessemnt Items 3 and 4
     3.Uses descriptive activity names to name the activities in the data set 
     4.Appropriately labels the data set with descriptive activity names. 

######situation
* 561 named columns (fron fac_Features)
* 10299 unnamed rows

######expected output
* 1 column for subjects  ID + 2nd Column for activities ID  + existing 561 columns
* 1 columns for named activites (renaming the rows)


        Activities_ID =  extracts the activities ID from the training and test vectors
        new_data_A    =   activites description added
        Subject_ID    =  combine training and test people (care that training is at top)
        new_data      = Subjects are now identified (anonymously)
        RESULT3       = new_data : Addresses Questions 3 and 4 . The data set is labelled


#### Assessemtn Item  5
###### 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

    pr_dset =  create an empty data frame 

* for each of the 30 subjects:

    * 1. Create a sub dataset  from RESULT3 above
    * 2. Get the means for each variable - per activity : using the ddply() command (needs plyr library)
    * 3. Append the result to the empty data frame create

* Loop till the end
* At the end of the loop :   RESULT4 = result to question 5
* Verify if file already exist  :  if yes then delete it using the file.remove() function
* Create a file called :   ./ UCI HAR Dataset/ PR-RESULT4.csv     * 

eof
