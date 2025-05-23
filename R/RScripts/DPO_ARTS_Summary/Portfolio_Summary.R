
library(readxl)
library(readr)
#library(dplyr)
library(ggplot2)
library(ggrepel)
ArtLaunchTable <- read_excel("ARTLaunchTable.xlsx",  col_types = c("text", "date"))

library(dplyr)

totalCycleDT <- data.frame(matrix(ncol = 12 , nrow = 0))
#names(totalCycleDT) <- c("Project","ART","Key","CycleDays","Resolution","Closed Date","DevTime","AnalysisDays","BacklogDays","ART")
names(totalCycleDT) <- c("Project","ART","Key","CycleDays","Resolution","First Date","Implementation Date","Closed Date","DevTime","AnalysisDays","BacklogDays","ART")

arts <- 0
Summary_ARTS <- data.frame(matrix(ncol = 6 , nrow = 0))
names(Summary_ARTS) <- c("Min","Q1","Median","Mean","Q3","Max")

#1######### Iteration über die ARTS


sdtable  <- data.frame(matrix(ncol = 1 , nrow = 0))
names(sdtable) <- c("sd")

CTMetriktable  <- data.frame(matrix(ncol = 1 , nrow = 0))
names(CTMetriktable) <- c("CT in perc")
CTInOut  <- data.frame(matrix(ncol = 1 , nrow = 0))
ItemsCount <- data.frame(matrix(ncol = 1 , nrow = 0))
calcDTAgingrows <- 0

ignoredArts  <- data.frame(matrix(ncol = 1 , nrow = 0))
names(ignoredArts) <- c("ART")
#art <- "D051"
ArtLaunchTable$LaunchDate <- as.Date(ArtLaunchTable$LaunchDate,"%Y-%m-%d", tz = "Europe/London")
#art<-"FIPLAT"
for (art in ARTS){
  print(art)

  ARTTable <- ArtLaunchTable
  ARTTable2 = filter(ARTTable, (ARTTable$ART == art))
#  View(ARTTable2)

  # ARTTable2$LaunchDate <- as.Date(ARTTable2$LaunchDate,"%Y-%m-%d", tz = "Europe/London")
  # if (ARTTable2$LaunchDate > endDate ){
  #   notnow <- TRUE
  #   ignoredArts <- rbind(ignoredArts,art)
  #   next
  # }
 
  sourcepath <- paste("RScripts/",art,"/BuildCharts.R", sep = "")
  source(sourcepath)
  #print("1")  
  Summary_ART_DF <-summary(calcDT$CycleDays)

  Summary_ARTS <- rbind(Summary_ARTS,Summary_ART_DF)
  names(Summary_ARTS) <- c("Min","Q1","Median","Mean","Q3","Max")
  totalIssues <- nrow(calcDT)
  GlobalIssues <- totalIssues
  #print("12")
  calcDT$ART <- teamname
  c1 <- data.frame(calcDT$Project,calcDT$ART,calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`First Date`,calcDT$`Implementation Date`,calcDT$`Closed Date`,calcDT$DevTime, calcDT$AnalysisDays, calcDT$BacklogDays, art)
  totalCycleDT <- rbind(c1,totalCycleDT)
  arts <- arts +1

  calcDTAgingrows <- calcDTAgingrows + nrow(NotReady_Aging_DT)
  NotReady_Aging_DT
  sdDf <- 100/ Summary_ART_DF[4] * sd(calcDT$CycleDays)
  sdtable <- rbind(sdtable,sdDf)

  targetCycleDT <- c1
  targetCycleDT = filter(c1,targetCycleDT$calcDT.CycleDays <= 90 )
  RatioTarget <- 100/ nrow(c1) * nrow(targetCycleDT)
  CTArt <- round(as.numeric(RatioTarget), digits = 2)
  CTMetriktable <- rbind(CTMetriktable,CTArt)
  
 # inoutTable <- paste(round(ratio,2) , " : 1")
  inoutTable <- round(ratio,2)
  CTInOut <- rbind(CTInOut,inoutTable)
  
  itemsTable <- nrow(calcDT)
  ItemsCount <- rbind(ItemsCount,itemsTable)

}

#print("123")

names(Summary_ARTS) <- c("Min","Q1","Median","Mean","Q3","Max")
totalsummaryMedian <- summary(Summary_ARTS$Median)

IssuesCount = sum(GlobalIssues)
#startDate <- Sys.Date()-365

#startDate <- as.Date("2022-01-01","%Y-%m-%d", tz = "Europe/London")
#endDate <- as.Date("2023-01-01","%Y-%m-%d", tz = "Europe/London")
#endDate <- enddate



targetCycleDT <- totalCycleDT
targetCycleDT = filter(targetCycleDT,targetCycleDT$calcDT.CycleDays <= 90 )
RatioTarget <- 100/ nrow(totalCycleDT) * nrow(targetCycleDT)
#RatioTarget <- 50.00

title =  paste("CycleTime all ARTS _ median summarys", "Min:", totalsummaryMedian[1],
               "| Q1: ",  round(as.numeric(totalsummaryMedian[2]), digits = 2),
               "| Mean: ", round(as.numeric(totalsummaryMedian[4]), digits = 2),
               " | Median: ", round(as.numeric(totalsummaryMedian[3]), digits = 2),
               " | Q3: ", round(as.numeric(totalsummaryMedian[5]), digits = 2),
               " | Max: ", round(as.numeric(totalsummaryMedian[6]), digits = 2),
               "| #Items: ", paste(arts," ART") 
)
boxplotCycledays <- ggplot(Summary_ARTS, aes(Median)) + 
  geom_boxplot( varwidth = TRUE, fill = "orange", outlier.colour = "red", outlier.shape = 1, outlier.size =  2) +
  ggtitle(title)

totalsummaryTotal <- summary(totalCycleDT$calcDT.CycleDays)
totalmad <- mad(totalCycleDT$calcDT.CycleDays)
totalsd <- sd(totalCycleDT$calcDT.CycleDays)

title =  paste("CycleTime all ARTS _ total summarys", "Min:", totalsummaryTotal[1],
               "| Q1: ",  round(as.numeric(totalsummaryTotal[2]), digits = 2),
               "| Mean: ", round(as.numeric(totalsummaryTotal[4]), digits = 2),
               " | Median: ",round(as.numeric(totalsummaryTotal[3]), digits = 2),
               " | Q3: ", round(as.numeric(totalsummaryTotal[5]), digits = 2),
               " | Max: ", round(as.numeric(totalsummaryTotal[6]), digits = 2),
               "| #Items: ", nrow(totalCycleDT), 
               "| 90d CT %: ", round(as.numeric(RatioTarget), digits = 2),
               "| SD: ", round(as.numeric(totalsd), digits = 2) ,
               "| SD %: ", round(100/as.numeric(totalsummaryTotal[4])*as.numeric(totalsd), digits = 2) 
)
totalCycleDT <- totalCycleDT %>% 
  rename(
    Key = calcDT.Key,
    CycleDays = calcDT.CycleDays,
    Resolution = calcDT.Resolution,
    ClosedDate = calcDT..Closed.Date.,
    FirstDate = calcDT..First.Date.,
    ImplementationDate = calcDT..Implementation.Date.
  )

boxplotCycledaysTotal  <- ggplot(totalCycleDT, aes(CycleDays )) + 
  geom_boxplot( varwidth = TRUE, fill = "orange", outlier.colour = "red", outlier.shape = 1, outlier.size =  2) +
  ggtitle(title)


scatterTable <- totalCycleDT[, c('ClosedDate', 'CycleDays', 'Key')]


dates <- as.Date(totalCycleDT$`ClosedDate`, "%Y-%m-%d %H:%M:%S", tz = "Europe/London")

scatterpercentiles <- quantile(totalCycleDT$CycleDays, probs = c(.50, .85, .95))

summaryCycle <- summary(totalCycleDT$CycleDays)
maxdays <- summaryCycle[6]
standarddeviation <- sd(totalCycleDT$CycleDays)
mad <- mad(totalCycleDT$CycleDays)
spanwidth <- (summaryCycle[6]-summaryCycle[1])
plotmean <- summaryCycle[4]
plusmean <- summaryCycle[4] + standarddeviation
minusmean <- summaryCycle[4] - standarddeviation

goodplus <- summaryCycle[4] + (summaryCycle[4]*0.2)
goodminus <- summaryCycle[4] - (summaryCycle[4]*0.2)

min <- as.Date(startDate,"%Y-%m-%d", tz = "Europe/London")
max <- max(totalCycleDT$ClosedDate) 
max <- as.Date(endDate,"%Y-%m-%d", tz = "Europe/London")


scatterPlot <- ggplot(scatterTable, aes(x = dates, y = CycleDays, color = CycleDays)) +
  geom_point(shape = 1) +
  # geom_hline(yintercept=(scatterpercentiles[1]), linetype="dashed", color = "red") +
  # geom_hline(yintercept=(scatterpercentiles[2]), linetype="dashed", color = "cyan") +
  # geom_hline(yintercept=(scatterpercentiles[3]), linetype="dashed", color = "green") +
  geom_hline(yintercept=(goodplus), linetype="dashed", color = "red") +
  geom_hline(yintercept=(goodminus), linetype="dashed", color = "red") +
  geom_hline(yintercept=(plusmean), linetype="dashed", color = "blue") +
  geom_hline(yintercept=(minusmean), linetype="dashed", color = "blue") +
  scale_color_gradientn(colors = c("#00FF00", "#0000FF", "#FF0000")) +
  geom_smooth(method = loess, alpha = 0.8, color = "blue",fill = "orange") +
  xlim(min, max) +
  ggtitle(title)
  
source("RScripts/DPO_ARTS_Summary/Trendline.R")

plot(scatterPlot)

for (ignart in ignoredArts){
  ARTS <- ARTS[! ARTS %in% ignart]
}

names(sdtable) <- c("Value")

Summary_ARTS$Name <- ARTS
Summary_ARTS$SD <- as.numeric(sdtable$Value)
Summary_ARTS$CTpercent <- CTMetriktable
Summary_ARTS$InOut <- CTInOut
Summary_ARTS$Items  <- ItemsCount
summ2 <- Summary_ARTS
names(Summary_ARTS) <- c("Min","Q1","Median","Mean","Q3","Max","ART","SD in percent","CT in percent","In Out Ratio","# Items")
