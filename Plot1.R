## question 1 : answer is Yes, the total emissions from PM2.5 decreased from 1999 to 2008.
##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##Using the base plotting system, make a plot showing the total PM2.5 emission from 
## all sources for each of the years 1999, 2002, 2005, and 2008.

## Load NEI data frame from file "summarySCC_PM25.rds"
NEI <- readRDS("summarySCC_PM25.rds")

## agregate Emissions on the different years
TotalEmissionPerYear <- aggregate(Emissions ~ year,NEI,sum)

## prepare png file for the plot
png("./DataAnalysis/plot1.png",width=480, height=480, units="px")

## plot the result of the aggregation using a barplot
barplot(
        TotalEmissionPerYear$Emissions/10^6, 
        names.arg=TotalEmissionPerYear$year, 
        xlab="Year",
        ylab=expression("Total PM"[2.5]*" Emission (in tons)"),
        main=expression("Total PM"[2.5]*" Emissions in US from 1999 to 2008")
)

dev.off()
