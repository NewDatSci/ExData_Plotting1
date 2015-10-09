ReadNPlot3 <- function(datafile)
{
  ##load sqldf library
  library(sqldf)
  
  ##load data via sql between 1/2/2007 and 2/2/2007
  DF <- read.csv.sql(datafile, sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"',sep = ";",header = TRUE)
  
  ##Date and Time conversion
  DF$Date <- as.Date(as.character(DF$Date),"%d/%m/%Y")
  DF$Time <- paste(DF$Date,DF$Time)
  DF$Time <- strptime(as.character(DF$Time),"%Y-%m-%d %H:%M:%S")
  
  ##plotting on screen
  plot(DF$Time,DF$Sub_metering_1,type = "l",ylab = "Energy Sub metering",xlab = "")
  lines(DF$Time,DF$Sub_metering_2,type = "l", col="red")
  lines(DF$Time,DF$Sub_metering_3,type = "l", col="blue")
  
  ##Adding legend
  legend("topright",lty = c(1,1,1) ,col=c("black","red","blue"),legend = c("Sub_metering1","Sub_metering2","Sub_metering3"))

  ##save to png
  dev.copy(png,file = "plot3.png")
  dev.off()
}

ReadNPlot3("~/R_Projects/Exploratory Analysis/household_power_consumption.txt")

