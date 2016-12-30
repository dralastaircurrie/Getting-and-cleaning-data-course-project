##Preparing tidied datasets from the Human Activity Recognition data

###Content of the dataset
* `README.md`
* `Codebook.md` which describes the data, the variables, and the transformation performed on the initial input data
* `selected_data_train_and_test.txt`: combined (train + test) set of measured mean and standard deviations of physical quantities during activities. The physical quantities are described further in `CodeBook.md`
* `means_by_subject_and_activity.txt`: aggregated means (aggregated by combinations of subject and activity) of the measured means of physical quantities during activities.

###Required software to run the analysis
* base R [r-project.org](http://www.r-project.org)

###Executing the analysis
Within R, source the script `run_analysis.R`.

###Overview of the analysis does

* Downloads the "Human Activity Recognition Using Smartphones Data Set" if it is not already present in the `./Data` directory
* Consolidates the test and train datasets of the input files into combined test + train datasets for the output files
* Employs descriptive activity names in the output, as opposed to numeric codes, by using the lookup table in the input data set.
* Prepares and writes out a tidied dataset with the subset of variables which correspond to mean or standard deviation quantities. These variables are identified by the presence of the strings `mean(` or `std(`, according to the input data codebook.
* Aggregates by subject and activity those variables that correspond to mean quantities.
* Finally, the summarised means of means for each combination of subject/activity/variable are written out as a second tidied dataset.
