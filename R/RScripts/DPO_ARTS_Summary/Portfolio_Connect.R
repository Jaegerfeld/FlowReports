#Vehicle
# Physical Products
# My Porsche Web
# ART Digital Products
# ART Car Sales
# ART P.COM
# ART Retail Sales
# ART Porsche ID
# ePayment
# ART Digital Finance
# CX

PortfolioName <- "Portfolio Connect"
WD <- getwd()

#ARTS <- c("PCVCC","APPART","D052","D06")
ARTS <- c("D051","D052","APPART")


if (!exists("startDate")){
  #startDate <- "2022-10-30"
  startDate <- Sys.Date()-365
  endDate <- Sys.Date()
  #endDate <- "2024-12-31"
}

source("RScripts/DPO_ARTS_Summary/Portfolio_Summary.R")
source("RScripts/DPO_ARTS_Summary/divsARTS.R")
source("RScripts/DPO_ARTS_Summary/Export.R")


write.csv(totalCycleDT, "Export/CAllIssuesCalcDT_connect.csv", row.names = FALSE)
