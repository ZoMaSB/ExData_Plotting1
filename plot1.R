setwd("./Documents/Data Science/Exploratory Data Analysis")
# check if package is installed and launch library
if(!require(data.table)){
    install.packages("data.table")
    library(data.table)
}
require(data.table)

fileURL="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile="./EDAPowerConsumptionProjectI.zip" 
if (!file.exists(destfile)) {
  download.file(fileURL ,destfile,method="curl") }

unzip("EDAPowerConsumptionProjectI.zip")

#load file into temp connection
temp<-file("household_power_consumption.txt")
open(temp)
#read specific rows
cleandata<-read.table("household_power_consumption.txt", sep=";", skip=66637, nrow=2880, col.names=colnames(read.table("household_power_consumption.txt", sep=";",header=TRUE)))

#plot and create an image file
png("plot1.png",width = 480, height = 480, units = "px")
#histogram
hist(cleandata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()                      
