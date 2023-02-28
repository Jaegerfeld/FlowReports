library(readr)
library(timevis)
library(dplyr)
library(ggplot2)
library(ggrepel)


args = commandArgs(trailingOnly=TRUE)

if (length(args)==0) {
  startDate <- Sys.Date()-365
} else if (length(args)==1) {
  
  startDate <- Sys.Date() - args[1]
}

teamname = "Default_Skyway"

source("RScripts/Default_Skyway/Import_CSV.R")
source("RScripts/Default_Skyway/cleanup.R")
source("RScripts/Default_Skyway/Feature_Calculations.R")
source("RScripts/Default_Skyway/Detail_Calculations.R")
source("RScripts/Default_Skyway/scattertable.R")
source("RScripts/Default_Skyway/Plottings.R")
source("RScripts/Default_Skyway/Export.R")

