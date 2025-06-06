library(readr)
library(dplyr)
library(ggplot2)
library(ggrepel)

args = commandArgs(trailingOnly=TRUE)

teamname = "Program"

if (length(args)==0) {
   startDate <- Sys.Date()-365
} else if (length(args)==1) {

  startDate <- Sys.Date() - args[1]
}

#setwd(dir)
WD <- getwd()

print(args)

source("RScripts/Default_Program/Import_CSV.R")
source("RScripts/Program/cleanup.R")
source("RScripts/Program/Feature_Calculations.R")
source("RScripts/Program/Detail_Calculations.R")
source("RScripts/Default_Program/scattertable.R")
source("RScripts/Default_Program/Plottings.R")

source("RScripts/Default_Program/AgingWorkCalculations.R")
source("RScripts/Default_Program/CFD_Build.R")

source("RScripts/Default_Program/Export.R")

