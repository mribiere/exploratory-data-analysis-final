## question 3 : 1)Non-Road, NonPoint, On-road; 2) Point has increased in 2005. 
## Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) valeriab
## , which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? 
## Use the ggplot2 plotting system to make a plot answer this question.

## Load NEI data frame from file "summarySCC_PM25.rds"
NEI <- readRDS("summarySCC_PM25.rds")

## select only the Baltimore, MA data from the NEI data frame
NEI_Maryland <- subset(NEI,fips=="24510")

## prepare the png file for the plot
png("./DataAnalysis/plot3.png",width=480, height=480, units="px")

## loading the ggplot library
library(ggplot)

## plot giving the variation of pm25 emssions per type in Batimore City, Maryland
p <- ggplot(NEI_Maryland,aes(factor(year), Emissions,fill=type)) +
        geom_bar(stat="identity") +
        facet_grid(.~type) +
        labs(x="year", y=expression("Total PM"[2.5]*" Emission (in Tons)")) +
        labs(title=expression("PM"[2.5]*" Emissions, Baltimore City from 1999 to 2008 by Source"))

print(p)
dev.off()
