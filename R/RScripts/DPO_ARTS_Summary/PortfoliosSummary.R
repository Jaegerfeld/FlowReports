#All portfolios
library(readxl)
library(readr)
library(tidyverse)
library(ggplot2)
library(ggrepel)

PortfolioName <- "All Portfolios"
WD <- getwd()


if (!exists("startDate")){
  startDate <- Sys.Date()-365
  endDate <- Sys.Date()
  # startDate <- "2024-01-01"
  # endDate <- "2024-12-31"
}
## ALLE ARTS gelauncht
#ARTS <- c("D051","D052","AppArt","BAM","ARTSRS","DSW","MyPorsche_web","PhysicalProducts","PorscheID","DigitalProducts","DigitalFinance","Aspire","CX","Car-Sales-Deal","Car-Sales-Vehicle","PPNPRODUCT","Datona","DnA_Platform","ARTKAST","ARTOPEX","ARTLOG","VDA","DEVX", "FP20")
#ARTS <- c("D051","D052","AppArt","BAM","ARTSRS","DSW","MyPorsche_web","PhysicalProducts","PorscheID","DigitalProducts","DigitalFinance","Aspire","CX","Car-Sales-Deal","Car-Sales-Vehicle","PPNPRODUCT","Datona","DnA_Platform","ARTKAST","ARTOPEX","ARTLOG","VDA","DEVX", "FP20")


#ARTS <- c("MyPorsche_web","PhysicalProducts","PorscheID","DigitalProducts","DigitalFinance","Aspire","CX","Car-Sales-Deal","Car-Sales-Vehicle","PPNPRODUCT","Datona","DnA_Platform","ARTKAST","ARTOPEX","ARTLOG","VDA","DEVX", "FP20")
#ARTS <- c("MyPorsche_web","PhysicalProducts","PorscheID","DigitalProducts","DigitalFinance")
#,"FIPLAT"

# ARTS <- c("DDEART","QDD","ARTDITOUCH","FIT2A","FIPLAT","D051","D052","AppArt","BAM","ARTSRS","DSW","MyPorsche_web","PhysicalProducts","PorscheID","DigitalProducts","DigitalFinance","Aspire","CX","Car-Sales-Deal","Car-Sales-Vehicle","PPNPRODUCT","Datona","DnA_Platform","ARTKAST","ARTOPEX","ARTLOG","VDA","DEVX", "FP20")
# #ARTS <- c("FIPLAT")
#"KAEFX",
ARTS <- c("Car-Sales-Deal","Datona","DDEART","FIPLAT","CADPDMART","EPDX","MSART","QDD","ARTDITOUCH","FIT2A","D051","D052","AppArt","BAM","ARTSRS","DSW","MyPorsche_web","PhysicalProducts","PorscheID","DigitalProducts","DigitalFinance","Aspire","CX","Car-Sales-Vehicle","PPNPRODUCT","DnA_Platform","ARTKAST","ARTOPEX","ARTLOG","VDA","DEVX", "FP20")
#ARTS <- c("FIPLAT")
#ARTS <- c("IntegrationUniverse (i4a), Netzwerk, Cyberdefense, finance: transform2gether, mdgovernance , saptransform, p2p, a2Report, Eployee: identityandaccesmanagement, campius&mobility, workplacedevices,HRIT, Delivery: Production, Planung)

source("RScripts/DPO_ARTS_Summary/Portfolio_Summary.R")
source("RScripts/DPO_ARTS_Summary/divsARTS.R")
source("RScripts/DPO_ARTS_Summary/Export.R")

#totalCycleDes<- selectByDate(total(totalCycleDT, start = "2023-01", end = "2023-03-01"))
names(Summary_ARTS) <- c("Min","Q1","Median","Mean","Q3","Max","ART","SD in percent","CT in percent","In Out Ratio","# Items")

filename <- paste("Export/ALLARTS_Done_ISSUES",startDate," - ",endDate,".csv")
write.csv(totalCycleDT, filename, row.names = FALSE)
write.csv(Summary_ARTS, paste(filename,"summary.csv"), row.names = TRUE)
