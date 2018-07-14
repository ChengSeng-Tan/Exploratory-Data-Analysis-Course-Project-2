## Q4 Across the United States, how have emissions from coal combustion-related 
## sources changed from 1999–2008?

require(ggplot2)

# Loading data ....
PMdata <- readRDS("summarySCC_PM25.rds")
Codes  <- readRDS("Source_Classification_Code.rds")

# subset to Coal Combustion-Related sources, and total Emissions by year
CoalComb <- Codes[grep("Comb.*Coal", Codes$Short.Name), "SCC"]
CoalPM <- subset(PMdata, SCC %in% CoalComb)
totals <- aggregate(Emissions ~ year, CoalPM, sum)

# Plot it out
png("plot4.png", width=640)
g<- ggplot(totals, aes(year, Emissions)) 
g<- g+ geom_line() + geom_point() + labs(title = "Total Emissions from Coal Combustion-Related Sources Across the US", x = "Years", y = "Total Emissions (tonnes)")

# ANSWER: Decreased from 1999 to 2002, slightly increased to 2005 and dropped sharply to 2008!

print(g)
dev.off()