library(readr)
library(dplyr)
library(ggplot2)
library(ggrepel)

args = commandArgs(trailingOnly=TRUE)

WD <- getwd()

#Convention: KEY in JIRA, Used in Automation
teamname = "Default_Skyway"


# Automation: it is possible to add a Start and Enddate. if not  PASSED LAST YEAR
if (length(args)==0) {
  if (!exists("startDate")){
    startDate <- Sys.Date()-365
    endDate <- Sys.Date()
  }
} else if (length(args)==1) {
  
  startDate <- Sys.Date() - args[1]
  endDate <- args[2]
}

#setwd(working directory, the path)
WD <- getwd()


source("RScripts/Default_Skyway/Import_CSV.R")
source("RScripts/Default_Skyway/cleanup.R")

source("RScripts/Default_Skyway/Feature_Calculations.R")
source("RScripts/Default_Skyway/Detail_Calculations.R")
source("RScripts/Default_Skyway/scattertable.R")
source("RScripts/Default_Skyway/Plottings.R")

source("RScripts/Default_Propo/AgingWorkCalculations.R")
source("RScripts/Default_Skyway/CFD_Build.R")

source("RScripts/Default_Skyway/FlowVelocity.R")

source("RScripts/Default_Skyway/Export.R")

