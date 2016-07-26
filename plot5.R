plot5 <- function(){
  library(ggplot2)
  ##read both files using readRDS()
  pm25_data <- readRDS("summarySCC_PM25.rds")
  scc <- readRDS("Source_Classification_Code.rds")
  ##find the subset of data for all 'ON-ROAD' sources in Baltimore City
  mlnd <- subset(pm25_data,fips=="24510" & type=="ON-ROAD")
  emission <- data.frame(unique(mlnd$year),tapply(mlnd$Emissions,mlnd$year,FUN=sum))
  colnames(emission) <- c("year","Emissions")
  ##open the png file
  png("plot5.png", width=480, height=480)
  ##plot the graph
  g <- ggplot(emission, aes(factor(year), Emissions))
  g <- g + geom_bar(stat="identity") +xlab("year") +
    ylab(expression("Total PM2.5 Emissions")) +
    ggtitle("Yearwise total emissions from motor vehicle in Baltimore City")
  ##display the graph
  print(g)
  ##close the png file
  dev.off()
}
  