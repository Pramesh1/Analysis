Run Analysis
========

Peer Assessment Assignment - Coursera2014
Pramesh

(run_analysis.R) is the scripted function created for the assignment.
the codebook explains the script and describes the variables used

The main working directory is ste to "UCI HAR Dataset" - one level down from the working directory. 
But this can be changed in the script (right at the top).
The subfolders must not be changed - or the script modifed accordingly.

Some basic labellings in the script ensures smooth reading and understanding of the cript.
The full description of the script construct and variables is to be forund in the codebook.md.

2 Files are created by the script:

1. 1st file : "./UCI HR Dataset/PR-RESULT1.csv" is the merged file for Question 1
2. 2nd file : "./UCI HR Dataset/PR-RESULT4.csv" is the tidy datá set file for Question 5

Note that I left the existing means and std couluns in the merged data sets when creating the tidy data sets.
I was not sure if we had to remiove them or not - in any case it wozuld be fairly straightforwrd to remove them 
using a grep("mean|std",colnames) on the dataset.

(It was one of the hardest assignments I ever had - I'm not a programmer ).


