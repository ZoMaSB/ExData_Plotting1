library(ggplot2)
# Download and unzip file to wd
fileURL="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileURL, "EDAproject2.zip", method="curl")
unzip("EDAproject2.zip", exdir="/Users/zm")

# Read data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

coal<-SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE),]

merged<-merge(x=NEI,y=coal, by="SCC")
aggEmCoal<-aggregate(Emissions~year, data=merged, sum)

png(filename="plot4.png", width = 480, height=480, units="px")
aggEmCoal$Emissions<-aggEmCoal$Emissions/100000
barplot(tapply(aggEmCoal$Emissions, INDEX=aggEmCoal$year, sum), 
        ylim=c(0,7),
        xlab="Year",
        ylab="PM2.5 Emission in 100,000 Tons",
        main="PM2.5 Emission for coal combustion-related sources (1999–2008)",
        col="yellow")

dev.off()
