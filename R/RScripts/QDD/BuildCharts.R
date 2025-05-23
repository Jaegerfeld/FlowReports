library(readr)
library(tidyverse)
library(ggrepel)

args = commandArgs(trailingOnly=TRUE)

WD <- getwd()

#Convention: KEY in JIRA, Used in Automation
teamname = "QDD"


# Automation: it is possible to add a Start and Enddate. if not  PASSED LAST YEAR
if (length(args)==0) {
  if (!exists("startDate")){
    startDate <- Sys.Date()-365
    startDate <- "2024-08-01"
    endDate <- Sys.Date()
  }
} else if (length(args)==1) {
  
  startDate <- Sys.Date() - args[1]
  endDate <- args[2]
}

source("RScripts/Default_Skyway/Import_CSV.R")
source("RScripts/QDD/cleanup.R")
source("RScripts/QDD/Feature_Calculations.R")
source("RScripts/QDD/Detail_Calculations.R")
source("RScripts/Default_Skyway/scattertable.R")
source("RScripts/Default_Skyway/Plottings.R")
source("RScripts/QDD/AgingWorkCalculations.R")
source("RScripts/QDD/CFD_Build.R")
#source("RScripts/QDD/FlowVelocity.R")
source("RScripts/QDD/Export.R")


write.csv(calcDT, "Export/VDAALLIssuesCalcDT.csv", row.names = FALSE)

