#Delivery


PortfolioName <- "Portfolio Delivery"
WD <- getwd()

ARTS <- c("ARTKAST","ARTOPEX","ARTLOG")

if (!exists("startDate")){
  #startDate <- "2022-10-30"
  startDate <- Sys.Date()-365
  endDate <- Sys.Date()
  #endDate <- "2024-12-31"
}

source("RScripts/DPO_ARTS_Summary/Portfolio_Summary.R")
source("RScripts/DPO_ARTS_Summary/divsARTS.R")
source("RScripts/DPO_ARTS_Summary/Export.R")


write.csv(totalCycleDT, "Export/CAllIssuesCalcDT_delivery.csv", row.names = FALSE)
