## ReadMe file for course project of "Getting and Cleaning data" on-line course

I chose to use only one 'all_steps()' function in my 'run_analysis.R' file. 
This is the function which then invokes all the remaining, helper functions.

I use a global variable 'path', to store an absolute path, where the data files
and the script itself are placed. If you modify the content of this variable,
accordingly to where your data-files are placed, you should be able to execute
my script, as well.

In order of invocation, helper functions are the following:

  * read_dataset( dir = test )
  * read_features()
  * filter_features( features )
  * activity_labels()
  * rename_activities( dataset, activities )
  * create_tidy_means( dataset )

### read_dataset( dir = test )
First, it sets the working directory defined in 'path' global variable.
Then, it builds up necessary file names using 'sprintf()', after that
it reads 3 files in, using 'read.table()'.
Finally, it uses 'rbind()' to merge the recently red files together,
and returns with the result.

### read_features()
First, it sets the working directory defined in 'path' global variable.
Using the 'read.table()' it reads 'features.txt', then returns with 
the vector containing only the names of the features.

### filter_features( features )
It expects one parameter ( vector ), which contains all the features.
Then using 'grepl()' it returns a logical vector about the matching
features.

### activity_labels()
First, it sets the working directory defined in 'path' global variable.
Then it reads labels of activities using 'read.table()', and returns
with the result.

### rename_activities()
It expecets two parameters: one dataset, on which we perform the renaming,
and one vector, which contains the activities. Using a for loop, it replaces
all the identifiers of activities with the actual labels.
( Yes, I know subsetting is not the best way, to perform the renaming, rather
a quick and dirty solution. )

### create_tidy_means( dataset )
It expects a dataset, from which it creates a tidy dataset containing the mean
values per feature per subject, using 'ddply()'