ReadNPlot4 <- function(datafile)
{
  ##load sqldf library
  library(sqldf)
  
  ##load data via sql between 1/2/2007 and 2/2/2007
  DF <- read.csv.sql(datafile, sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"',sep = ";",header = TRUE)
  
  ##Date and Time conversion
  DF$Date <- as.Date(as.character(DF$Date),"%d/%m/%Y")
  DF$Time <- paste(DF$Date,DF$Time)
  DF$Time <- strptime(as.character(DF$Time),"%Y-%m-%d %H:%M:%S")
  
  ##Set panel
  par(mfcol = c(2,2))
  
  ##First plot
  plot(DF$Time,DF$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
  
  ##Second plot
  plot(DF$Time,DF$Sub_metering_1,type = "l",ylab = "Energy Sub metering",xlab = "")
  lines(DF$Time,DF$Sub_metering_2,type = "l", col="red")
  lines(DF$Time,DF$Sub_metering_3,type = "l", col="blue")
  legend("topright",lty = c(1,1,1) ,col=c("black","red","blue"),legend = c("Sub_metering1","Sub_metering2","Sub_metering3"),bty="n",cex = .5)
  
  ##Third plot
  plot(DF$Time,DF$Voltage,type = "l",ylab = "Voltage",xlab = "datetime")
  
  ##Fourth plot
  plot(DF$Time,DF$Global_reactive_power,type = "l",ylab = "Global Reactive Power",xlab = "datetime")
  
  ##save to png
  dev.copy(png,file = "plot4.png")
  dev.off()
}

ReadNPlot4("~/R_Projects/Exploratory Analysis/household_power_consumption.txt")
