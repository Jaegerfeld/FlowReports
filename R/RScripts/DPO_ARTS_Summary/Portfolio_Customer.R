#Customer
# Physical Products
# My Porsche Web
# ART Digital Products
# ART Car Sales Vehicle
# ART Car Sales Deal
# ART P.COM / BAM
# ART Retail Sales
# ART Porsche ID
# ART Digital Finance
# ART CX
# ART PPN
# ART Aspire

PortfolioName <- "Portfolio Customer"
WD <- getwd()

ARTS <- c("MyPorsche_web","PhysicalProducts","PorscheID","DigitalProducts","DigitalFinance","Aspire","CX","Car-Sales-Deal","Car-Sales-Vehicle","PPNPRODUCT","BAM","ARTSRS","DSW")


if (!exists("startDate")){
  #startDate <- "2022-10-30"
  startDate <- Sys.Date()-365
  endDate <- Sys.Date()
  #endDate <- "2024-12-31"
}

#BAM,  epayment?

source("RScripts/DPO_ARTS_Summary/Portfolio_Summary.R")
source("RScripts/DPO_ARTS_Summary/divsARTS.R")
source("RScripts/DPO_ARTS_Summary/Export.R")

write.csv(totalCycleDT, "Export/CAllIssuesCalcDT_customer.csv", row.names = FALSE)