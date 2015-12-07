# Download and unzip file to wd
fileURL="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileURL, "EDAproject2.zip", method="curl")
unzip("EDAproject2.zip", exdir="/Users/zm")

# Read data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

# Aggregate data
aggEmissionBalt<-aggregate(Emissions~year, NEI[NEI$fips=='24510',], sum)
#aggEmissionBalt$Emissions<-aggEmissionBalt$Emissions/1000000 #Data adjustment

# Data plot and png image creation
png(filename="plot2.png", width = 480, height=480, units="px")
barplot(tapply(aggEmissionBalt$Emissions, INDEX=aggEmissionBalt$year, sum), 
        ylim=c(0,3500), 
        xlab="Year",
        ylab="PM2.5 Emission in Tons for Baltimore City",
        col="blue")

dev.off()
