###question 2 : They have globally decreased between 1999 and 2008 but with an increase in 2005.
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland ") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question

## Load NEI data frame from file "summarySCC_PM25.rds"
NEI <- readRDS("summarySCC_PM25.rds")

## select only the Baltimore, MA data from the NEI data frame
NEI_Maryland <- subset(NEI,fips=="24510")

## aggregate the Maryland(Baltimore) emissions per year with sum
TotalMaryland <- aggregate(Emissions ~ year,NEI_Maryland,sum)

## prepare the png file for the plot
png("./DataAnalysis/plot2.png",width=580, height=580, units="px")

## plot giving an understanding of the variation of total amount of Pm25 emissions per year in Maryland (Baltimore)
barplot(
        TotalMaryland$Emissions, 
        names.arg=TotalMaryland$year, 
        xlab="Year",
        ylab=expression("Total PM"[2.5]*" Emission (in tons)"),
        main=expression("Total PM"[2.5]*" Emissions in Baltimore City, Maryland from 1999 to 2008")
)
dev.off()
