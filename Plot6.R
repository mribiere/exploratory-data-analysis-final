## question 6: Baltimore City has seen a decrease and low level of PM 2.5 compare to Los Angeles. 
##Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
## in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater changes over time in motor vehicle emissions?

## load the two data frames NEI and SCC
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## merge the data using the SCC variable
EISCC <- merge(NEI,SCC, by= "SCC")

## take only the data for Baltimore, Los Angeles for the type ON-ROAD
mvcomparesub <- subset(NEI, (fips=="24510" | fips=="06037") & type=="ON-ROAD")

## count emissions for each town and add to the final data frame the variable region
Baltimoreagg <- aggregate(Emissions ~ year,mvcomparesub[mvcomparesub$fips=="24510",],sum)
Baltimoreagg$region <- "Baltimore City, MD" 
LosAngelesagg <- aggregate(Emissions ~ year,mvcomparesub[mvcomparesub$fips=="06037",],sum)
LosAngelesagg$region <- "Los Angeles County, CA"

##prepare the png file for the plot
png("./DataAnalysis/plot6.png",width=880, height=680, units="px")

library(ggplot)

## combine the two subsets
comparemv <- rbind(Baltimoreagg, LosAngelesagg)

## plot showing differences between the variations of pm25 emissions in batimore City ad Los Angeles County coming from motor vehicle.
comp <- ggplot(comparemv, aes(factor(year), Emissions,fill=region)) + 
        geom_bar(stat="identity")+ 
        facet_grid(.~region) + 
        labs(x="year", y=expression("Total PM"[2.5]*" Emission (in Tons)")) + 
        labs(title=expression("PM"[2.5]*" Emissions comparison between Baltimore City,MD and Los Angeles County, CA from 1999 to 2008 "))
print(comp)
dev.off()
