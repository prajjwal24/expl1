NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
data1<-subset(NEI,fips=="24510")
total<-aggregate(Emissions ~ year,data1, sum)
g<-ggplot(aes(year,Emissions),data=data1)
g+geom_bar(stat="identity")+facet_grid(.~type)+labs(x="year")+labs(y=expression("Total PM"[2.5]*" Emission"))+
labs(title="emission baltimore city typewise")
dev.copy(png,file="plot3.png")
dev.off()