plot4 <- function(){
  ##read both files using readRDS()
  pm25_data <- readRDS("summarySCC_PM25.rds")
  scc <- readRDS("Source_Classification_Code.rds")
  ##find the SCC ID for all sources having the word 'coal'
  coalsource <- grepl("coal",scc$Short.Name,ignore.case = TRUE)
  ind <- which(coalsource)
  s_coal <- scc$SCC[ind]
  ##subset the data whose SCC ID are in the coal sources
  mlnd <- subset(pm25_data,SCC %in% s_coal)
  ##open the png file
  png('plot4.png',width=480,height=480)
  ##find the yearwise sum of the PM2.5 emissions
  emission <- tapply(mlnd$Emissions,mlnd$year,FUN=sum)
  ##plot the graph
  barplot(unique(mlnd$year),height=emission,xlab="year",ylab="Total PM2.5 emission",main="Yearwise PM2.5 emissions from coal sources across U.S")
  ##close the png file
  dev.off()
}