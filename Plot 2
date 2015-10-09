ReadNPlot2 <- function(datafile)
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
  plot(DF$Time,DF$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
  
  ##save to png
  dev.copy(png,file = "plot2.png")
  dev.off()
}

ReadNPlot2("~/R_Projects/Exploratory Analysis/household_power_consumption.txt")

