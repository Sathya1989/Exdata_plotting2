plot1 <- function(){
  ##read both files using readRDS()
  pm25_data <- readRDS("summarySCC_PM25.rds")
  scc <- readRDS("Source_Classification_Code.rds")
  ##open the png file
  png('plot1.png',width=480,height=480)
  ##find the yearwise sum of the PM2.5 emissions
  emission <- tapply(pm25_data$Emissions,pm25_data$year,FUN=sum)
  ##Plot the emission values for years 1999,2002,2005,2008 
  plot(unique(pm25_data$year),emission,xlab="year",ylab="Total PM2.5 emission",main="Yearwise total PM2.5 emission from all sources")
  lines(unique(pm25_data$year),emission,col="blue")
  ##close the png file
  dev.off()
}