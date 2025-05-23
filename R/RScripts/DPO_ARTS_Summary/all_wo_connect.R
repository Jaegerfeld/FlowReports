#All portfolios w/o connect


PortfolioName <- "All Portfolios"
WD <- getwd()

ARTS <- c("PhysicalProducts","MyPorsche_web","DigitalProducts","PCOM","PorscheID","DigitalFinance","CX","Datona","skywaypro","FITDATAAI","MSF")

source("RScripts/DPO_ARTS_Summary/Portfolio_Summary.R")
source("RScripts/DPO_ARTS_Summary/divsARTS.R")
source("RScripts/DPO_ARTS_Summary/Export.R")

write.csv(totalCycleDT, "Export/CAllIssuesCalcDT_wo_connect.csv", row.names = FALSE)