NEI<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
total<-aggregate(Emissions ~ year,NEI, sum)
barplot((total$Emission),
names.arg=totalEmission$year,
xlab="Year",
ylab="PM2.5 Emissions",
main="Total PM2.5 Emissions From All US Sources")
dev.copy(png, file="plot1.png") 
dev.off()