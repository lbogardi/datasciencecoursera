# change the following variable to the path,
# where your data files can be found
path <- 'c:/Users/Lacko/Desktop/Rprogramming/getting_and_cleaning_data/course_project/data/'

# main function, produces results for all the 5 steps
all_steps <- function (){
  
  # read in the datasets in test / train directory
  testData  <- read_dataset('test')
  trainData <- read_dataset('train')
  
  # merge 'test' to 'train'
  trainData <- rbind(trainData, testData)
  
  # append column names
  features         <- read_features()
  names(trainData) <- c(features,'Volunteers','Activities')
  
  # remove unnecessary columns
  need_feats <- filter_features( features )
  trainData  <- trainData[ ,need_feats ]
  
  # rename activities
  trainData  <- rename_activities( trainData, activity_labels() )
  
  # create tidy mean values
  tidy       <- create_tidy_means(trainData)
  
  # write the tidy dataset into a file, then return with it
  write.table(tidy, 'tidy_processed_data.txt', row.name=FALSE) 
  
  tidy
}

read_dataset <- function( dir = 'test' ){
  setwd(path)
  
  file1 <- sprintf( "./%s/X_%s.txt",       dir, dir )
  file2 <- sprintf( "./%s/subject_%s.txt", dir, dir )
  file3 <- sprintf( "./%s/y_%s.txt",       dir, dir )
  
  dataset  <- read.table( file1, colClasses = "numeric" )
  subject  <- read.table( file2 )
  activity <- read.table( file3 )
  
  # bind volunteers and activities to the dataframe
  # then return with
  dataset  <- cbind(dataset,subject)
  dataset  <- cbind(dataset,activity)
  dataset
}

read_features <- function(){
  # returns all features
  setwd( path )
  feat<-read.table( './features.txt', colClasses="character" );
  feat[,2]
}

filter_features <- function(features){
  # returns a logical vector of matching features  
  grepl( '(mean|std)', features )
}

activity_labels <- function(){
  setwd(path)
  read.table('./activity_labels.txt',
             colClasses = c('numeric','character'))
}

rename_activities <- function(ds, act){
  for ( i in c(1:6) ){
    ds$Activities[ ds$Activities==i ]<-act$V2[ i ]
  }
  ds
}

create_tidy_means <- function(ds){
  ddply(ds,.(Activities,Volunteers),colwise(mean))
}