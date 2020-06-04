# Getting And Cleaning Data Project
[Getting and Cleaning Data](https://www.coursera.org/course/getdata) Course Project 
##Project Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

Submission requirements:
<ol>
<li> A tidy data set as described below. </li>
<li> A link to a Github repository with your script for performing the analysis. </li>
<li> A code book that describes the variables, the data, and any transformations or work that you performed to clean up 
the data called CodeBook.md. </li>
<li> A README.md in the repo with scripts. This repo explains how all of the scripts work and how they are connected.</li>
</ol>

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . 
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
The data linked to from the course website represent data collected from the accelerometers from the 
Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project: 

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )

You should create one R script called run_analysis.R that does the following. 
<ul>
<li>Merges the training and the test sets to create one data set. </li>
<li>Extracts only the measurements on the mean and standard deviation for each measurement. </li>
<li>Uses descriptive activity names to name the activities in the data set. </li>
<li>Appropriately labels the data set with descriptive variable names. </li>
<li>From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.</li>
</ul>

##Repo Overview
This project contains R script file (*run_analysis.R*) that implements methods from [Getting and Cleaning Data Course](https://www.coursera.org/course/getdata) 
in order to make *tidy data* from *raw data*. The final data can be used for future analysis as it has labels and full description in the *CodeBook* file.
*CodeBook.md* describes the variables, the data, and any transformations or work that was performed to clean up the data.
The output file of the sctipt is called *avg_by_act_sub.txt*, and uploaded in the course project's data folder.

##Working with R script
You will need to make one modification to R script before you can start work with it. In the second line of *run_analysis.r* script
you should set your working directory.  

##Data Description
You can find additional information about the variables, data and transformations in the CodeBook.MD file.
