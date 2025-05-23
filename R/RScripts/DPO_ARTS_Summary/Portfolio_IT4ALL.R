#IT4ALL
#
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

PortfolioName <- "IT4ALL"
WD <- getwd()

ARTS <- c("DEVX")

if (!exists("startDate")){
  #startDate <- "2022-10-30"
  startDate <- Sys.Date()-365
  endDate <- Sys.Date()
  #endDate <- "2024-12-31"
}

source("RScripts/DPO_ARTS_Summary/Portfolio_Summary.R")
source("RScripts/DPO_ARTS_Summary/divsARTS.R")
source("RScripts/DPO_ARTS_Summary/Export.R")