# GettingNCleanData
Course project for 'Getting and Cleaning Data'

logic for run_analysis.R

1. First, set the working directory to "C:\DataScience\R-Programming\CleanData\data\UCI HAR Dataset"

2. a.  Read features.txt  to features  table.
   b.  Extract V2 and assign to char array of all 561 variables , the second column of the features
   
3. Read activity labels from 'activity_labels.txt'  activity lables such as walking, sitting...etc.

4.  a. Read ./train/X_train.txt to X_train table
    b. Assign columns names of X_train  <-features which are in feats from the 2nd step 
	
5. Read ./train/y_train.txt to Y_train table, activities of each subject.

6.  a. Read ./train/subject_train.txt to subject_train table.
    b. Set "PersonId"  as column name for subject_train

7.  Next, merge Y_train and activity labels and map all activity codes to descriptive names for all subject's activities(Y_train)

8.  a. The step 7 is merged to data.frame - 'train_activities'
    b.  set the column of above data,frame to "Activity"
	
9. Do column bind for 	subject_train, train_activities and X_train)  ---->  resulting finalTrainData

10.  Repeat same steps from 2 to 9 for test data also.  ----> resulting finalTestData

11. Finally merge both finalTrainData & finalTestData using rbind.

12. grep to filter out to get only columns having mean and std, ofcourse other 2 columns as well (PersonId and Activity)

13. Use aggregate function to calculate means of all variables from 3 to 81 (first 2 beging PersonId and Activity)

14. write.table the output of means from step 13.



