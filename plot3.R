# Q3. Of the four types of sources indicated by the type (point, nonpoint, onroad, 
# nonroad) variable, which of these four sources have seen decreases in emissions 
# from 1999–2008 for Baltimore City? Which have seen increases in emissions from 
# 1999–2008? 

# load required packages
require(ggplot2)

# Loading data ....
PMdata <- readRDS("summarySCC_PM25.rds")

# subset to Baltimore (fips=24510) and total emissions by year
baltimore <- subset(PMdata, fips == "24510")
totals <- aggregate(baltimore[c("Emissions")], list(year = baltimore$year,type = baltimore$type), sum)

# plot it out
png(filename="plot3.png", width = 640, height = 480, units = "px")

g <- ggplot(totals, aes(year, Emissions, color = type))

g <- g + geom_line() +
  xlab("Years") +
  ylab("Total Emissions (tonnes)") +
  ggtitle('Total Emissions by type in Baltimore City, Maryland from 1999 to 2008')


# ANSWER: Emissions decreased for Types= NON-ROAD, NONPOINT, ON-ROAD from 1999 to 2008
#         But increased for Type= POINT from 1999 to 2005.

print(g)
dev.off()
