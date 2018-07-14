## Q6 Compare emissions from motor vehicle sources in Baltimore City (fips == "24510")
#  with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037")
#  Which city has seen greater changes over time in motor vehicle emissions?

# Loading data ....
PMdata <- readRDS("summarySCC_PM25.rds")
Codes  <- readRDS("Source_Classification_Code.rds")

# subset motor vehicle emissions from Baltimore & Los Angeles and total emissions
MotorCodes <- Codes[grep("vehicles", Codes$EI.Sector, ignore.case=TRUE), "SCC"]
MotorBaltPM <- subset(PMdata, SCC %in% MotorCodes & type=="ON-ROAD" & fips == "24510")
MotorLAPM <- subset(PMdata, SCC %in% MotorCodes & type=="ON-ROAD" & fips == "06037")

totalsBalt <- with(MotorBaltPM, tapply(Emissions, year, sum, na.rm = TRUE))
totalsLA <- with(MotorLAPM, tapply(Emissions, year, sum, na.rm = TRUE))

# plot it out
png(filename="plot6.png", width = 480, height = 480, units = "px")

par(mfcol = c(1,2), mar = c(4,4,3,2), oma = c(0, 0, 2, 0), mai = c(0.9, 0.8, 0.5, 0.0))

barplot(totalsBalt, ylim = c(0, max(range(totalsLA, totalsBalt))), xlab = "Years", ylab = "Total Emissions (tonnes)", main = "Baltimore City")
barplot(totalsLA, ylim = c(0, max(range(totalsLA, totalsBalt))), xlab = "Years", main = "Los Angeles")
mtext("Emissions from motor vehicle sources", outer = TRUE, cex = 1.5)

# ANSWER: Total Emissions in LA significantly higher than Baltimore City. Emissions in
# Baltimore City decreases from 1999 to 2008 while emissions in LA increases from 1999 to
# 2005 before dropping in 2008

dev.off()