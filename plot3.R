library(ggplot2)
# Download and unzip file to wd
fileURL="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileURL, "EDAproject2.zip", method="curl")
unzip("EDAproject2.zip", exdir="/Users/zm")

# Read data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

#Baltimore City only subset
subBalt<-subset(NEI, NEI$fips=='24510')

# Data plot by 'type' and png image creation
png(filename="plot3.png", width = 480, height=480, units="px")
ggplot(data=subBalt, aes(factor(year), Emissions, fill=type))+
  geom_bar(stat="identity")+
  theme_bw()+guides(fill=FALSE)+
  facet_grid(.~type, scales = "free", space="free")+
  labs(x="Year", y="Total PM2.5 Emission in Tons")+
  labs(title="PM2.5 Emission in Tons for Baltimore City (1999-2008)")

dev.off()
