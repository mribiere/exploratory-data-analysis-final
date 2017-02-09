### question 4: They have decreased 
## Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

## load the two data frames NEI and SCC
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## merge the data using the SCC variable
NEISCC <- merge(NEI,SCC, by= "SCC")

## select only Emission from coal combustion by looking for "coal" in the variable Short.Name of the merged datasets.
ccsub <- NEISCC[grepl("coal",NEISCC$Short.Name),]

## count emissions per year coimg from coal combustion in the US.
coalcombustionagg <- aggregate(Emissions ~ year,ccsub,sum)

## prepare png file for plot
png("./DataAnalysis/plot4.png",width=480, height=480, units="px")

library(ggplot)

## plot representing the total amount of pm25 emissions from coal combustion in the us
p <- ggplot(coalcombustionagg, aes(factor(year),Emissions))+ 
        geom_bar(stat="identity")+
        labs(x="year", y=expression("Total PM"[2.5]*" Emission from Coal Combustion (in Tons)"))+
        labs(title=expression("PM"[2.5]*" Emissions from Coal Combustion from 1999 to 2008")
)

print(p)
dev.off()
