create_png <- function ( file = 'plot1.png', width = 480, height = 480 ){
  
  # set working directory
  # reading the data in
  setwd('C:/Users/Lacko/Desktop/Rprogramming/explanatory_data_analysis/course_project_1/')
  source('load_data.R')
  csv <- read_big_data()
  
  # creating a graphic device
  png(  file   = file 
       ,bg     = "transparent"
       ,width  = width
       ,height = height )
  
  # creating a plot with bars
  hist(csv$Global_active_power
       ,main = 'Global Active Power'
       ,xlab = 'Global Active Power (kilowatts)'
       ,col  = 'red' )

  # closing the graphic device
  dev.off()
}