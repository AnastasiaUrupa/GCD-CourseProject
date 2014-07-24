The code in this repo creates a tidy dataset out of the raw data, collected from the accelerometers from 
the Samsung Galaxy S smartphones. This code merges yesy and training datasets into one, assigns descriptive
names to variables and activities, extracts only measurments of mean and standart deviation, and creates a new dataset,
containg the average of each variable for each activity and each subject. 

Instructions to getr the tidy dataset:
1. Download raw data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
2. Unzip data to your working directory
3. Run the script, using function run_analysis()
4. After script is executed, you will get text files "tidy_data_1.txt" and "tidy_data_2.txt" with tidy_data.