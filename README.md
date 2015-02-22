# data_cleaning_proj
The data cleaning course project repository. 
===========================================

Overview
--------
* This document describes, the repository file structure, program inputs/outputs.
* The algorithm of run_analysis program is described in algorithm.txt in this folder.
* The CodeBook for the resulting data set is described in codebook.txt in this folder.
* 


Repository File Structure
-------------------------
The following picture shows the expected structure for this source code to work:
* The input data is left as is in the uncompressed folder "UCI HAR Dataset"
* The script run_analysis.R expects the input data to be in the folder where the script is.
* The output folder "results" is created if not there. The output file avg_mean_and_stds_all_data.txt is created as an output of running run_analysis program.

Program Inputs and Outputs
--------------------------

**Program Inputs:** There are no inputs to the program run_analysis.

**Command:** In an R Shell prompt, change director to the location where run_analysis.R is located. 
 Then run the following command: runAnalysis()

**Output:** results/avg_mean_and_stds_all_data.txt

