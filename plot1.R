# Q1. Have total emissions from PM2.5 decreased in the United States from 
# 1999 to 2008? Using the base plotting system, make a plot showing the total 
# PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

# Loading data ....
PMdata <- readRDS("summarySCC_PM25.rds")

# Total Emissions by Year
totals <- with(PMdata, tapply(Emissions, year, sum, na.rm = TRUE))

# Plot it out
png(filename="plot1.png", width = 480, height = 480, units = "px")

barplot(totals / 1000000, xlab = "Years", ylab = "Total Emissions (in millions Tonnes)", main = "Total PM2.5 emission from all sources")

# ANSWER: Yes, total emssions have decreased in the United Sates from 1999 to 2008.

dev.off()