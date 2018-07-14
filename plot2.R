# Q2. Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510")  from 1999 to 2008?  

# Loading data ....
PMdata <- readRDS("summarySCC_PM25.rds")

# subset to Baltimore (fips=24510) and total Emissions by year
baltimore <- subset(PMdata, fips == "24510")
totals <- with(baltimore, tapply(Emissions, year, sum, na.rm = TRUE))

# plot it out
png(filename="plot2.png", width = 480, height = 480, units = "px")

barplot(totals, xlab = "Year", ylab = "Total Emissions (tonnes)", main = "Total PM2.5 Emission in Baltimore City, Maryland")

# ANSWER: Total emissions in Batlimore decreased from 1999 to 2002, 
# increased from 2002 to 2005 and decrease again from 2005 to 2008.

dev.off()