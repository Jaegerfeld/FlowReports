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
# CX


WD <- getwd()
PortfolioName <- "All Portfolios"
totalCycleDT <- data.frame(matrix(ncol = 7 , nrow = 0))
names(totalCycleDT) <- c("Project","Key","CycleDays","Resolution","Closed Date","DevTime","AnalysisDays","BacklogDays")
arts <- 0
Summary_ARTS <- data.frame(matrix(ncol = 6 , nrow = 0))
names(Summary_ARTS) <- c("Min","Q1","Median","Mean","Q3","Max")
#################################################################################################
#
# Single ARTs Reports Build
#
#################################################################################################

#1######### AppART
source("RScripts/APPART/BuildCharts_ART.R")
Summary_AppART_DF <-summary(calcDT$CycleDays)
Summary_ARTS <- rbind(Summary_ARTS,Summary_AppART_DF)
#Summary_ARTS <- cbind("AppART")
names(Summary_ARTS) <- c("Min","Q1","Median","Mean","Q3","Max")
totalIssues <- nrow(calcDT)
GlobalIssues <- totalIssues

totalCycleDT <- data.frame(calcDT$Project,calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime, calcDT$AnalysisDays, calcDT$BacklogDays )
c1 <- data.frame(calcDT$Project,calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime, calcDT$AnalysisDays, calcDT$BacklogDays)
arts <- arts +1
calcDTAgingrows <- nrow(calcDTAging)

#2############### MSF
source("RScripts/MSF/BuildCharts.R")
Summary_MSF_DF <-summary(calcDT$CycleDays)
Summary_ARTS <- rbind(Summary_ARTS,Summary_MSF_DF)
totalIssues <- nrow(calcDT)
GlobalIssues <- rbind(GlobalIssues, totalIssues)

c2 <- c1
c1 <- data.frame(calcDT$Project,calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime, calcDT$AnalysisDays, calcDT$BacklogDays)
totalCycleDT <- rbind(c1,totalCycleDT)
arts <- arts +1
calcDTAgingrows <- calcDTAgingrows + nrow(calcDTAging)

# ############### MyPorsche
# source("RScripts/MyPorsche/BuildCharts.R")
# Summary_MyPorsche_DF <-summary(calcDT$CycleDays)
# Summary_ARTS <- rbind(Summary_ARTS,Summary_MyPorsche_DF)
#totalIssues <- nrow(calcDT)
#GlobalIssues <- rbind(GlobalIssues, totalIssues)

#c1 <- data.frame(calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime, calcDT$AnalysisDays, calcDT$BacklogDays)
#totalCycleDT <- rbind(c1,totalCycleDT)
#arts <- arts +1
#calcDTAgingrows <- calcDTAgingrows + nrow(calcDTAging)
############### Datona
source("RScripts/Datona/BuildCharts.R")
Summary_Datona_DF <-summary(calcDT$CycleDays)
Summary_ARTS <- rbind(Summary_ARTS,Summary_Datona_DF)
totalIssues <- nrow(calcDT)
GlobalIssues <- rbind(GlobalIssues, totalIssues)

c1 <- data.frame(calcDT$Project,calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime, calcDT$AnalysisDays, calcDT$BacklogDays)
totalCycleDT <- rbind(c1,totalCycleDT)
arts <- arts +1
calcDTAgingrows <- calcDTAgingrows + nrow(calcDTAging)

############### OneShop
# source("RScripts/OneShop/BuildCharts.R")
# Summary_OneShop_DF <-summary(calcDT$CycleDays)
# Summary_ARTS <- rbind(Summary_ARTS,Summary_OneShop_DF)
# #totalIssues <- nrow(calcDT)
# #GlobalIssues <- rbind(GlobalIssues, totalIssues)
# 
# #c1 <- data.frame(calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime, calcDT$AnalysisDays, calcDT$BacklogDays)
# #totalCycleDT <- rbind(c1,totalCycleDT)
# #arts <- arts +1
# #calcDTAgingrows <- calcDTAgingrows + nrow(calcDTAging)

############### PCOM
source("RScripts/PCOM/BuildCharts.R")
Summary_PCOM_DF <-summary(calcDT$CycleDays)
Summary_ARTS <- rbind(Summary_ARTS,Summary_PCOM_DF)
totalIssues <- nrow(calcDT)
GlobalIssues <- rbind(GlobalIssues, totalIssues)

c1 <- data.frame(calcDT$Project,calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime, calcDT$AnalysisDays, calcDT$BacklogDays)
totalCycleDT <- rbind(c1,totalCycleDT)
arts <- arts +1
calcDTAgingrows <- calcDTAgingrows + nrow(calcDTAging)

############## D07China
source("RScripts/D07/BuildCharts.R")
Summary_D07_DF <-summary(calcDT$CycleDays)
Summary_ARTS <- rbind(Summary_ARTS,Summary_D07_DF)
totalIssues <- nrow(calcDT)
GlobalIssues <- rbind(GlobalIssues, totalIssues)

c1 <- data.frame(calcDT$Project,calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime, calcDT$AnalysisDays, calcDT$BacklogDays)
totalCycleDT <- rbind(c1,totalCycleDT)
arts <- arts +1
calcDTAgingrows <- calcDTAgingrows + nrow(calcDTAging)


############### PX057
source("RScripts/PX057/BuildCharts.R")
Summary_PX057_DF <-summary(calcDT$CycleDays)
Summary_ARTS <- rbind(Summary_ARTS,Summary_PX057_DF)
totalIssues <- nrow(calcDT)
GlobalIssues <- rbind(GlobalIssues, totalIssues)

c1 <- data.frame(calcDT$Project,calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime, calcDT$AnalysisDays, calcDT$BacklogDays)
totalCycleDT <- rbind(c1,totalCycleDT)
arts <- arts +1
calcDTAgingrows <- calcDTAgingrows + nrow(calcDTAging)

############### PCVCC
source("RScripts/PCVCC/BuildCharts.R")
Summary_PCVCC_DF <-summary(calcDT$CycleDays)
Summary_ARTS <- rbind(Summary_ARTS,Summary_PCVCC_DF)
totalIssues <- nrow(calcDT)
GlobalIssues <- rbind(GlobalIssues, totalIssues)

c1 <- data.frame(calcDT$Project,calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime, calcDT$AnalysisDays, calcDT$BacklogDays)
totalCycleDT <- rbind(c1,totalCycleDT)
arts <- arts +1
calcDTAgingrows <- calcDTAgingrows + nrow(calcDTAging)

############### Skywaypro
source("RScripts/Skywaypro/BuildCharts.R")
Summary_Skywaypro_DF <-summary(calcDT$CycleDays)
Summary_ARTS <- rbind(Summary_ARTS,Summary_Skywaypro_DF)
totalIssues <- nrow(calcDT)
GlobalIssues <- rbind(GlobalIssues, totalIssues)

c1 <- data.frame(calcDT$Project,calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime, calcDT$AnalysisDays, calcDT$BacklogDays)
totalCycleDT <- rbind(c1,totalCycleDT)
arts <- arts +1
calcDTAgingrows <- calcDTAgingrows + nrow(calcDTAging)

############### Propo Sonderfall Codes Arts in einem Schwung, siehe oben bei Myporsche + OneShop
source("RScripts/Propo/BuildCharts.R")
Summary_Propo_DF <-summary(calcDT$CycleDays)
Summary_ARTS <- rbind(Summary_ARTS,Summary_Propo_DF)
totalIssues <- nrow(calcDT)
GlobalIssues <- rbind(GlobalIssues, totalIssues)

c1 <- data.frame(calcDT$Project,calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime, calcDT$AnalysisDays, calcDT$BacklogDays)
totalCycleDT <- rbind(c1,totalCycleDT)
arts <- arts +7
calcDTAgingrows <- calcDTAgingrows + nrow(calcDTAging)

########### PCSV D02 / R3+4
source("RScripts/PCSV/BuildCharts.R")
Summary_PCSV_DF <-summary(calcDT$CycleDays)
Summary_ARTS <- rbind(Summary_ARTS,Summary_PCSV_DF)
totalIssues <- nrow(calcDT)
GlobalIssues <- rbind(GlobalIssues, totalIssues)

c1 <- data.frame(calcDT$Project,calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime,calcDT$AnalysisDays, calcDT$BacklogDays)
totalCycleDT <- rbind(c1,totalCycleDT)
arts <- arts +2
calcDTAgingrows <- calcDTAgingrows + nrow(calcDTAging)

########### GF D05/2 
source("RScripts/D052/BuildCharts.R")
Summary_D052_DF <-summary(calcDT$CycleDays)
Summary_ARTS <- rbind(Summary_ARTS,Summary_D052_DF)
totalIssues <- nrow(calcDT)
GlobalIssues <- rbind(GlobalIssues, totalIssues)

c1 <- data.frame(calcDT$Project,calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime,calcDT$AnalysisDays, calcDT$BacklogDays)
totalCycleDT <- rbind(c1,totalCycleDT)
arts <- arts +1
calcDTAgingrows <- calcDTAgingrows + nrow(calcDTAging)

###########  D05/1 
# source("RScripts/D051/BuildCharts.R")
# Summary_D051_DF <-summary(calcDT$CycleDays)
# Summary_ARTS <- rbind(Summary_ARTS,Summary_D052_DF)
# totalIssues <- nrow(calcDT)
# GlobalIssues <- rbind(GlobalIssues, totalIssues)
# 
# c1 <- data.frame(calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime,calcDT$AnalysisDays, calcDT$BacklogDays)
# totalCycleDT <- rbind(c1,totalCycleDT)
# arts <- arts +1
# calcDTAgingrows <- calcDTAgingrows + nrow(calcDTAging)

###########  FITDATAAI
source("RScripts/FITDATAAI/BuildCharts.R")
Summary_FITDATAAI_DF <-summary(calcDT$CycleDays)
Summary_ARTS <- rbind(Summary_ARTS,Summary_D052_DF)
totalIssues <- nrow(calcDT)
GlobalIssues <- rbind(GlobalIssues, totalIssues)

c1 <- data.frame(calcDT$Project,calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime,calcDT$AnalysisDays, calcDT$BacklogDays)
totalCycleDT <- rbind(c1,totalCycleDT)
arts <- arts +1
calcDTAgingrows <- calcDTAgingrows + nrow(calcDTAging)

############### D06 STID
source("RScripts/D06/BuildCharts.R")
Summary_STID_DF <-summary(calcDT$CycleDays)
Summary_ARTS <- rbind(Summary_ARTS,Summary_STID_DF)
totalIssues <- nrow(calcDT)
GlobalIssues <- rbind(GlobalIssues, totalIssues)

c1 <- data.frame(calcDT$Project,calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime, calcDT$AnalysisDays, calcDT$BacklogDays)
totalCycleDT <- rbind(c1,totalCycleDT)
arts <- arts +1
calcDTAgingrows <- calcDTAgingrows + nrow(calcDTAging)

############### CX
source("RScripts/CX/BuildCharts.R")
Summary_CX_DF <-summary(calcDT$CycleDays)
Summary_ARTS <- rbind(Summary_ARTS,Summary_CX_DF)
totalIssues <- nrow(calcDT)
GlobalIssues <- rbind(GlobalIssues, totalIssues)

c1 <- data.frame(calcDT$Project,calcDT$Key,calcDT$CycleDays,calcDT$Resolution,calcDT$`Closed Date`,calcDT$DevTime, calcDT$AnalysisDays, calcDT$BacklogDays)
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
startDate <- Sys.Date()-365
startDate <- as.Date("2022-01-01","%Y-%m-%d", tz = "Europe/London")
endDate <- as.Date("2023-01-01","%Y-%m-%d", tz = "Europe/London")
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


dates <- as.Date(totalCycleDT$`ClosedDate`, "%Y-%m-%d %H:%M:%S", tz = "Europe/London")

scatterpercentiles <- quantile(totalCycleDT$CycleDays, probs = c(.50, .85, .95))

summaryCycle <- summary(totalCycleDT$CycleDays)
maxdays <- summaryCycle[6]
standarddeviation <- sd(totalCycleDT$CycleDays)
mad <- mad(totalCycleDT$CycleDays)
spanwidth <- (summaryCycle[6]-summaryCycle[1])



min <- as.Date(startDate,"%Y-%m-%d", tz = "Europe/London")
max <- max(totalCycleDT$ClosedDate) 
max <- as.Date(endDate,"%Y-%m-%d", tz = "Europe/London")


scatterPlot <- ggplot(scatterTable, aes(x = dates, y = CycleDays, color = CycleDays)) +
  geom_point(shape = 1) +
  geom_hline(yintercept=(scatterpercentiles[1]), linetype="dashed", color = "red") +
  geom_hline(yintercept=(scatterpercentiles[2]), linetype="dashed", color = "cyan") +
  geom_hline(yintercept=(scatterpercentiles[3]), linetype="dashed", color = "green") +
  scale_color_gradientn(colors = c("#00FF00", "#0000FF", "#FF0000")) +
  geom_smooth(method = loess, alpha = 0.1, color = "blue") +
  xlim(min, max) +
  #scale_x_continuous(c(startDate,startDate+365)) +
  #geom_text_repel(aes(label = Key), size = 1) + 
  ggtitle(paste("Range: ", round(as.numeric(spanwidth), digits = 2) , 
                 "Stddev: ", round(as.numeric(standarddeviation), digits = 2), 
                 "MAD: ", round(as.numeric(mad), digits = 2)))
plot(scatterPlot)

#summaryTable <- grid.table(Summary_ARTS)
source("RScripts/DPO_ARTS_Summary/divsARTS.R")
source("RScripts/DPO_ARTS_Summary/Export.R")

## Emmanuel Export TotalCycleDT
write.csv(totalCycleDT,"Export/CT_Summary_TotalCycle.csv")
