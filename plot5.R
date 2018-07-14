## Q5 How have emissions from motor vehicle sources changed from 1999–2008 
## in Baltimore City?

require(ggplot2)

# Loading data ....
PMdata <- readRDS("summarySCC_PM25.rds")
Codes  <- readRDS("Source_Classification_Code.rds")

# subset motor vehicles, on-road category in Baltimore (fips=24510) and total Emissions by Year
MotorCodes <- Codes[grep("vehicles", Codes$EI.Sector, ignore.case=TRUE), "SCC"]
MotorBaltPM <- subset(PMdata, SCC %in% MotorCodes & type=="ON-ROAD" & fips == "24510")
totals <- aggregate(Emissions ~ year, MotorBaltPM, sum)

# plot it out
png(filename="plot5.png", width = 480, height = 480, units = "px")

g<- ggplot(totals, aes(factor(year), Emissions)) 
g<- g+ geom_bar(stat="identity") + labs(title = "Emissions from motor vehicle sources in Baltimore City", x = "Years", y = "Total Emissions (tons)")

# ANSWER: Decreased from 1999 to 2008.

print(g)
dev.off()
