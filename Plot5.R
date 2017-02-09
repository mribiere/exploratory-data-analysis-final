## question 5 : emissions have largely decreased between 1999 and 2002, and slightly until 2008. 
## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

## load the two data frames NEI and SCC
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## merge the data using the SCC variable
NEISCC <- merge(NEI,SCC, by= "SCC")

##select only pm25 emissions coming from motor vehicule. We assumed those measures from motor vehicule are made on the source type ON-ROAD.
## we looked before on "motor" and "vehicle" to see if they appear in the short.Name variable
mvsub <- subset(NEI, fips=="24510" & type=="ON-ROAD")

## count the pm25 emissions per year on the selected subset
motorvehiculeagg <- aggregate(Emissions ~ year,mvsub,sum)

## prepare the png file
png("./DataAnalysis/plot5.png",width=480, height=480, units="px")

library(ggplot)

## plot representing the total pm25 emissions coming from motor vehicle in Baltimore City, MD.
p <- ggplot(motorvehiculeagg, aes(factor(year),Emissions))+ 
        geom_bar(stat="identity")+ 
        labs(x="year", y=expression("Total PM"[2.5]*" Emission from Motor Vehicle (in Tons)"))+ 
        labs(title=expression("PM"[2.5]*" Emissions in Baltimore City from Motor Vehicle from 1999 to 2008")
)

print(p)
dev.off()
