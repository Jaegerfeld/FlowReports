## ARTS
# D04 My Porsche APP (AppART, D04) 
# My Porsche (MyPorsche)
# MSF (Mobility Services Framework)
# Datona (Datona)
# OneShop (OneShop)
# P.Com (PCOM)
# D06 (STID)
# PPB (D07 China)
# PX057
# D03 PCVCC (D03)
# ProPo (zur überbrückung)
# D02 PCSV
# D05/2
# D05/1
# FITDATAAI
# D06 STID


WD <- getwd()

totalCycleDT <- data.frame(matrix(ncol = 7 , nrow = 0))
names(totalCycleDT) <- c("Key","CycleDays","Resolution","Closed Date","DevTime","AnalysisDays","BacklogDays")
arts <- 0
Summary_ARTS <- data.frame(matrix(ncol = 6 , nrow = 0))
names(Summary_ARTS) <- c("Min","Q1","Median","Mean","Q3","Max")
#################################################################################################
#
# Single ARTs Reports Build
#
#################################################################################################

########## D04 AppART
source("RScripts/APPART/BuildCharts_ART.R")
Summary_AppART_DF <-summary(calcDT$CycleDays)
Summary_ARTS <- rbind(Summary_ARTS,Summary_AppART_DF)
#Summary_ARTS <- cbind("AppART")
names(Summary_ARTS) <- c("Min","Q1","Median","Mean","Q3","Max")
totalIssues <- nrow(calcDT)
GlobalIssues <- totalIssues

totalCycleDT <- data.frame(calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime, calcDT$AnalysisDays, calcDT$BacklogDays )
c1 <- data.frame(calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime, calcDT$AnalysisDays, calcDT$BacklogDays)
arts <- arts +1
calcDTAgingrows <- nrow(calcDTAging)




############### D07China
source("RScripts/D07/BuildCharts.R")
Summary_D07_DF <-summary(calcDT$CycleDays)
Summary_ARTS <- rbind(Summary_ARTS,Summary_D07_DF)
totalIssues <- nrow(calcDT)
GlobalIssues <- rbind(GlobalIssues, totalIssues)

c1 <- data.frame(calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime, calcDT$AnalysisDays, calcDT$BacklogDays)
totalCycleDT <- rbind(c1,totalCycleDT)
arts <- arts +1
calcDTAgingrows <- calcDTAgingrows + nrow(calcDTAging)


############### PCVCC D03
source("RScripts/PCVCC/BuildCharts.R")
Summary_PCVCC_DF <-summary(calcDT$CycleDays)
Summary_ARTS <- rbind(Summary_ARTS,Summary_PCVCC_DF)
totalIssues <- nrow(calcDT)
GlobalIssues <- rbind(GlobalIssues, totalIssues)

c1 <- data.frame(calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime, calcDT$AnalysisDays, calcDT$BacklogDays)
totalCycleDT <- rbind(c1,totalCycleDT)
arts <- arts +1
calcDTAgingrows <- calcDTAgingrows + nrow(calcDTAging)


########### PCSV D02 / R3+4
source("RScripts/PCSV/BuildCharts.R")
Summary_PCSV_DF <-summary(calcDT$CycleDays)
Summary_ARTS <- rbind(Summary_ARTS,Summary_PCSV_DF)
totalIssues <- nrow(calcDT)
GlobalIssues <- rbind(GlobalIssues, totalIssues)

c1 <- data.frame(calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime,calcDT$AnalysisDays, calcDT$BacklogDays)
totalCycleDT <- rbind(c1,totalCycleDT)
arts <- arts +2
calcDTAgingrows <- calcDTAgingrows + nrow(calcDTAging)

########### GF D05/2 
source("RScripts/D052/BuildCharts.R")
Summary_D052_DF <-summary(calcDT$CycleDays)
Summary_ARTS <- rbind(Summary_ARTS,Summary_D052_DF)
totalIssues <- nrow(calcDT)
GlobalIssues <- rbind(GlobalIssues, totalIssues)

c1 <- data.frame(calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime,calcDT$AnalysisDays, calcDT$BacklogDays)
totalCycleDT <- rbind(c1,totalCycleDT)
arts <- arts +1
calcDTAgingrows <- calcDTAgingrows + nrow(calcDTAging)


############### D06 STID
source("RScripts/D06/BuildCharts.R")
Summary_STID_DF <-summary(calcDT$CycleDays)
Summary_ARTS <- rbind(Summary_ARTS,Summary_STID_DF)
totalIssues <- nrow(calcDT)
GlobalIssues <- rbind(GlobalIssues, totalIssues)

c1 <- data.frame(calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime, calcDT$AnalysisDays, calcDT$BacklogDays)
totalCycleDT <- rbind(c1,totalCycleDT)
arts <- arts +1
calcDTAgingrows <- calcDTAgingrows + nrow(calcDTAging)










#################################################################################################
#
# SUMMARY PDF
#
#################################################################################################
names(Summary_ARTS) <- c("Min","Q1","Median","Mean","Q3","Max")
totalsummaryMedian <- summary(Summary_ARTS$Median)

IssuesCount = sum(GlobalIssues)


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
               "| MAD: ", round(as.numeric(totalmad), digits = 2),
               "| SD: ", round(as.numeric(totalsd), digits = 2) 
)
totalCycleDT <- totalCycleDT %>% 
  rename(
    Key = calcDT.Key,
    CycleDays = calcDT.CycleDays,
    Resolution = calcDT.Resolution,
    ClosedDate = calcDT..Closed.Date.
  )

boxplotCycledaysTotal  <- ggplot(totalCycleDT, aes(CycleDays )) + 
  geom_boxplot( varwidth = TRUE, fill = "orange", outlier.colour = "red", outlier.shape = 1, outlier.size =  2) +
  ggtitle(title)

scatterTable <- totalCycleDT[, c('ClosedDate', 'CycleDays', 'Key')]


dates <- as.Date(scatterTable$`ClosedDate`, "%Y-%m-%d %H:%M:%S", tz = "Europe/London")

scatterpercentiles <- quantile(scatterTable$CycleDays, probs = c(.50, .85, .95))

summaryCycle <- summary(scatterTable$CycleDays)
maxdays <- summaryCycle[6]
standarddeviation <- sd(scatterTable$CycleDays)
mad <- mad(scatterTable$CycleDays)
spanwidth <- (summaryCycle[6]-summaryCycle[1])

scatterPlot <- ggplot(scatterTable, aes(x = dates, y = CycleDays, color = CycleDays)) +
  geom_point(shape = 1) +
  geom_hline(yintercept=(scatterpercentiles[1]), linetype="dashed", color = "red") +
  geom_hline(yintercept=(scatterpercentiles[2]), linetype="dashed", color = "cyan") +
  geom_hline(yintercept=(scatterpercentiles[3]), linetype="dashed", color = "green") +
  scale_color_gradientn(colors = c("#00FF00", "#0000FF", "#FF0000")) +
  geom_smooth(method = loess, alpha = 0.1, color = "blue") +
  # geom_text_repel(aes(label = Key), size = 1) + 
  ggtitle(paste("Range: ", round(as.numeric(spanwidth), digits = 2) , 
                "Stddev: ", round(as.numeric(standarddeviation), digits = 2), 
                "MAD: ", round(as.numeric(mad), digits = 2)))

#summaryTable <- grid.table(Summary_ARTS)
source("RScripts/DPO_ARTS_Summary/divsARTS.R")
source("RScripts/DPO_ARTS_Summary/Export.R")

