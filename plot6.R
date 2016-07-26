plot6 <- function(){
  library(ggplot2)
  ##read both files using readRDS()
  pm25_data <- readRDS("summarySCC_PM25.rds")
  scc <- readRDS("Source_Classification_Code.rds")
  ##find the subset of data for all 'ON-ROAD' sources in Baltimore City
  mlnd <- subset(pm25_data,fips=="24510" & type=="ON-ROAD")
  emission <- data.frame(unique(mlnd$year),"Baltimore",tapply(mlnd$Emissions,mlnd$year,FUN=sum))
  colnames(emission) <- c("year","fips","Emissions")
  ##find the subset of data for all 'ON-ROAD' sources in Los Angeles
  la <- subset(pm25_data,fips=="06037" & type=="ON-ROAD")
  emission1 <- data.frame(unique(la$year),"Los angeles",tapply(la$Emissions,la$year,FUN=sum))
  colnames(emission1) <- c("year","fips","Emissions")
  emission <- rbind(emission,emission1)
  ##open the png file
  png("plot6.png", width=480, height=480)
  ##plot the graph
  g <- ggplot(emission, aes(factor(year), Emissions))
  g <- g + facet_grid(.~fips)+geom_bar(stat="identity") +xlab("year") +
    ylab(expression("Total PM2.5 Emissions")) +
    ggtitle("Yearwise total PM2.5 emissions from motor vehicle in Baltimore and LA")
  ##display the graph
  print(g)
  ##close the png file
  dev.off()
}
