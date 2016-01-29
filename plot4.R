NEI<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
SCCcomb<-grepl("comb", SCC$SCC.Level.One, ignore.case = TRUE)
SCCCoal<-grepl("coal", SCC$SCC.Level.Four, ignore.case = TRUE)
SCCCoalCombSCC<-SCC[SCCcomb & SCCCoal,]$SCC
NIECoalCombValues<-NEI[NEI$SCC %in% SCCCoalCombSCC,]
NIECoalCombTotal<-aggregate(Emissions~year, NIECoalCombValues, sum)
g<-ggplot(aes(year, Emissions/10^5), data=NIECoalCombTotal)
g+geom_bar(stat="identity") +
  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across us"))
dev.copy(png,file="plot4.png")
dev.off()

