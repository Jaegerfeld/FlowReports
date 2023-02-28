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

teamname <- "Big Lebowski"

source("RScripts/Default_Team/Import_CSV.R")
source("RScripts/Default_Team/cleanup.R")

source("RScripts/Default_Team/DoneIssues_Cleanup.R")
source("RScripts/Default_Team/DoneIssues_Calculations.R")

source("RScripts/Default_Team/DoneStory_Cleanup.R")
source("RScripts/Default_Team/DoneStorys_Calculations.R")

source("RScripts/Default_Team/scattertable.R")
source("RScripts/Default_Team/Plottings.R")
source("RScripts/Default_Team/Export.R")
