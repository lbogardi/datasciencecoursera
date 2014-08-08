read_big_data <- function(file = 'c:\\Users\\Lacko\\Desktop\\Rprogramming\\explanatory_data_analysis\\course_project_1\\household_power_consumption.txt'  ){
  # delimiter is semicolon
  csv <- read.csv2( file
                    ,na.strings = "?"
                    ,dec="."
                    # specifying the following two options makes reading faster
                    ,colClasses = c( 'character', 'character', rep('numeric', 7) )
                    ,comment.char = ""
                    )
  
  csv <- subset(csv, strptime(Date,"%d/%m/%Y") >= "2007-02-01" &
                     strptime(Date,"%d/%m/%Y") <  "2007-02-03")
  csv
}


