plot2 <- function(){
  ##read both files using readRDS()
  pm25_data <- readRDS("summarySCC_PM25.rds")
  scc <- readRDS("Source_Classification_Code.rds")
  ##find the yearwise sum of the PM2.5 emissions by subsetting Baltimore city
  mlnd <- subset(pm25_data,fips=="24510")
  emission <- tapply(mlnd$Emissions,mlnd$year,FUN=sum)
  ##open the png file
  png('plot2.png',width=480,height=480)
  ##Plot the emission values for years 1999,2002,2005,2008
  plot(unique(mlnd$year),emission,xlab="year",ylab="Total PM2.5 emission",main="Yearwise total PM2.5 emission in Baltimore City")
  lines(unique(pm25_data$year),emission,col="blue")
  ##close the png file
  dev.off()
}