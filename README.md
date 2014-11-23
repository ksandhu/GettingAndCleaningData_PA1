---
title: "README"
output: html_document
---

### Working of script:
* Script should be kept inside the "UCI HAR Dataset" directory
* Once run, it creates a folder named "merged", where you will see a merged file for every file from "test" and "train" directories, in the same directory structure.
* X_merged and y_merged files are than modified by adding column names and row annotations to create a new dataset named "annotated.dataset"
* "annotated.dataset" is then aggregated to create a tidy data set saved in file "tidy.dataset"

### Codebook:
####New files:
* run_Analysis.R : contains the script
* tidyDataset.txt : Tidy dataset after following all steps
* merged.rar : Directory of merged datasets

####Variables in tidyDataset.txt:
* ActivityName: Descriptive name of activity added to new dataset
* SubjectID: Subject label added to new dataset
* All additional columns are features from the original dataset
