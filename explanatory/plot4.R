create_png <- function ( file = 'plot4.png', width = 480, height = 480 ){
  
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
  datetime<-strptime( paste(csv$Date,csv$Time), "%d/%m/%Y %H:%M:%S" )

  par(mfrow = c(2, 2) )
  with(csv, {
    plot( datetime
          ,Global_active_power
          ,type = "l"
          ,xlab = ''
          ,ylab = 'Global Active Power (kilowatts)'
    )
    plot( datetime
          ,Voltage
          ,type = "l"
          ,xlab = 'datetime'
          ,ylab = 'Voltage'
    ) 
         plot(  datetime 
                ,Sub_metering_1
                ,type = "l"
                ,col  = "black"
                ,xlab = ''
                ,ylab = 'Energy sub metering')
    
    lines(datetime, Sub_metering_2, col="red")
    lines(datetime, Sub_metering_3, col="blue")
    
    legend( "topright"
            ,bty    = "n"
            ,lty     = 1
            ,col    = c("black","red","blue")
            ,legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
    
    plot( datetime
          ,Global_reactive_power
          ,type = "l")
  })
  
  # closing the graphic device
  dev.off()
}