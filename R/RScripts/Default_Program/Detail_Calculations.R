


implmins <- round((as.numeric(calcDT$`In Progress`)
                  ), digits = 1)


analysismins <- round((as.numeric(calcDT$Analysis)), digits = 1);

backlogmins <- round((as.numeric(calcDT$Backlog)), digits = 1);

blockedmins <- round((as.numeric(calcDT$Pending)), digits = 1);


calcDT$FunnelDays <- as.numeric(calcDT$Funnel) / 1440
calcDT$DevTime <- implmins / 1440
calcDT$BlockedTimeDays <- blockedmins / 1440
calcDT$AnalysisDays <- analysismins / 1440
calcDT$BacklogDays <- backlogmins / 1440

#zero Blocking minutes == NA to ease sorting
calcDT$Pending[calcDT$Pending == 0] <- NA
