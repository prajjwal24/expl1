NEI<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
data1<-subset(NEI,fips=="24510")
total<-aggregate(Emissions ~ year,data1, sum)
barplot((total$Emission),
        names.arg=total$year,
        xlab="Year",
        ylab="PM2.5 Emissions",
        main="Total PM2.5 Emissions from baltimore")
dev.copy(png, file="plot2.png") 
dev.off()