totalCycleDT <- totalCycleDT %>% 
  rename(
    DevTime = calcDT.DevTime,
    AnalysisDays = calcDT.AnalysisDays,
    BacklogDays = calcDT.BacklogDays
  )

