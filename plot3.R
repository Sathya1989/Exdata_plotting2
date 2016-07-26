plot3 <- function(){
  library(ggplot2)
  ##read both files using readRDS()
  pm25_data <- readRDS("summarySCC_PM25.rds")
  scc <- readRDS("Source_Classification_Code.rds")
  ##find the yearwise sum for each type of source of the PM2.5 emissions by subsetting Baltimore city
  mlnd <- subset(pm25_data,fips=="24510")
  emission <- aggregate(Emissions ~ year + type, mlnd, sum)
  ##open the png file
  png("plot3.png", width=480, height=480)
  ##Plot the emission values for years 1999,2002,2005,2008 
  ##plot each type in different colour
  g <- ggplot(emission, aes(year, Emissions, color=type))
  g <- g + geom_line() +xlab("year") +
    ylab(expression("Total PM2.5 Emissions")) +
    ggtitle("Yearwise total emissions from all types of sources in Baltimore City")
  ##display the plot
  print(g)
  ##close the png file
  dev.off()
}
