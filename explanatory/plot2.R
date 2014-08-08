create_png <- function ( file = 'plot2.png', width = 480, height = 480 ){
  
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
  
  # creating a plot with lines
  csv$Date<-strptime( paste(csv$Date,csv$Time), "%d/%m/%Y %H:%M:%S" )
  
  plot( csv$Date
        ,csv$Global_active_power
        ,type = "l"
        ,xlab = ''
        ,ylab = 'Global Active Power (kilowatts)'
  )

  # closing the graphic device
  dev.off()
}