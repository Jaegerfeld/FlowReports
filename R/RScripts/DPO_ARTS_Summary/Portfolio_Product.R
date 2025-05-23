#Product
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

# startDate <- "2024-03-20"
# endDate <- "2025-03-20"

PortfolioName <- "Product"
WD <- getwd()
#"KAEFX",
ARTS <- c("Datona","DDEART","CADPDMART","EPDX","MSART")

if (!exists("startDate")){
  startDate <- "2024-02-11"
  startDate <- Sys.Date()-365
  endDate <- Sys.Date()
  endDate <- "2025-02-10"
}

source("RScripts/DPO_ARTS_Summary/Portfolio_Summary.R")
source("RScripts/DPO_ARTS_Summary/divsARTS.R")
source("RScripts/DPO_ARTS_Summary/Export.R")

write.csv(totalCycleDT, "Export/AllIssuesDone_product.csv", row.names = FALSE)
