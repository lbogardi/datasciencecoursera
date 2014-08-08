create_png <- function ( file = 'plot3.png', width = 480, height = 480 ){
  
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
     
  with(csv, 
     plot(  Date 
           ,Sub_metering_1
           ,type = "l"
           ,col  = "black"
           ,xlab = ''
           ,ylab = 'Energy sub metering'))

  with(csv,lines(Date, Sub_metering_2, col="red"))
  with(csv,lines(Date, Sub_metering_3, col="blue"))

  legend( "topright"
        ,bty    = "n"
        ,lty     = 1
        ,col    = c("black","red","blue")
        ,legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

  # closing the graphic device
  dev.off()
}