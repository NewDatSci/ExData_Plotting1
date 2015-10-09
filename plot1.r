ReadNPlot1 <- function(datafile)
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
  hist(DF$Global_active_power,col = 2,main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
  
  ##save to png
  dev.copy(png,file = "plot1.png")
  dev.off()
}

ReadNPlot1("~/R_Projects/Exploratory Analysis/household_power_consumption.txt")

