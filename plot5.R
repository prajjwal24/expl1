NEI<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
SCCvehicle<-grepl("vehicle", SCC$EISector, ignore.case = TRUE)
SCCvehicleSCC <- SCC[SCCvehicle,]$SCC
NEIvehicleSSC <- NEIdata[NEIdata$SCC %in% SCCvehicleSCC, ]
NEIvehicle1<- subset(NEIvehicleSSC, fips == "24510")
NIEvehicle1Tot<-aggregate(Emissions~year, NEIvehicle1, sum)
g<-ggplot(aes(year, Emissions/10^5), data=NIEvehicle1Tot)
g+geom_bar(stat="identity") +
  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore"))
dev.copy(png,file="plot5.png")
dev.off()