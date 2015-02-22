Goal
---- 
Given the input data, output a tidy data file that lists the average mean and standard deviations per subject per activity. The file is uploaded as a text file but is a CSV file.

**Rationale for selecting the mean and standard deviation columns:**

The mean and standard deviation columns were selected by reading the features.txt file in the input data. A grep was performed on the names listed in this file 
to select the mean and standard deviation columns. The regular expression used for the grep was: "-mean[(][)]|-std[(][)]". 

This resulted in 33 mean and 33 standard deviation values. 
Therefore, together there are 66 calculated average columns per row. The total number of columns in the result set is 66 + 2 = 68. 
The first two columns are the values of the grouping criteria - subject and activity respectively.

**Output File Description**

There are 30 subjects in the combined data set (train + test) and 6 activities that each subject participates in. 
Therefore, there are 30x60 = 180 rows in the resulting set.
Each row has 68 columns as described in the previous section.

Algorithm of run_analysis 
-------------------------

1.  Extracting the columns from data set features. To do this, the naming convention of the columns listed in features.txt was used. Specifically, "-mean[(][)]|-std[(][)]" was used to match strings. 33 standard deviation and 33 mean columns were found.
   
2. Merging each data set to one table. The data for each set (training and test) is distributed in multiple files. The data is first
   merged to form a single data set. Specifically:
   For each data set:
 - subject_*, y_*, and the 99 mean and std columns from X_* are joined producing a table of 68 columns. 
 - The activity column values obtained from the y_*.txt are renamed to corresponding activity names listed in activity_labels.txt.
 - Set the column names appropriately - derive them from features.txt.

3. Merging the 2 data sets. Both data sets have the same column names and are merged by rbind.

4. Create a new table with activity, subject and average of each activity for the particular activity/subject combination.
