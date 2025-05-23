#Enterprise


PortfolioName <- "Portfolio Corporate"
WD <- getwd()

ARTS <- c("DnA_Platform","VDA","QDD")

if (!exists("startDate")){
  #startDate <- "2022-10-30"
  startDate <- Sys.Date()-365
  endDate <- Sys.Date()
  #endDate <- "2024-12-31"
}

source("RScripts/DPO_ARTS_Summary/Portfolio_Summary.R")
source("RScripts/DPO_ARTS_Summary/divsARTS.R")
source("RScripts/DPO_ARTS_Summary/Export.R")


write.csv(totalCycleDT, "Export/AllIssuesDone_enterprise.csv", row.names = FALSE)