
# check if package is installed and launch library
if(!require(data.table)){
  install.packages("data.table")
  library(data.table)
}
# Download file if not already present in wd
fileURL="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile="./EDAPowerConsumptionProjectI.zip" 
if (!file.exists(destfile)) {
  download.file(fileURL ,destfile,method="curl") }

# unzip file if not present in wd
if (!file.exists("./household_power_consumption.txt")){
  unzip("EDAPowerConsumptionProjectI.zip")
}
#load file into temp connection
temp<-file("household_power_consumption.txt")
open(temp)
#read specific rows
cleandata<-read.table("household_power_consumption.txt", sep=";", skip=66637, nrow=2880, col.names=colnames(read.table("household_power_consumption.txt", sep=";",header=TRUE)))
#combine Data and Time 
cleandata$DatePlusTime <- strptime(paste(cleandata$Date, cleandata$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S")
#plot and create an image file
png("plot2.png",width = 480, height = 480, units = "px")
plot(cleandata$DatePlusTime, cleandata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",xlab="")

dev.off()                      
