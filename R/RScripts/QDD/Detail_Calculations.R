


implmins <- round((as.numeric(calcDT$Implementation)
                  ), digits = 1)

funnelmins <- round((as.numeric(calcDT$Funnel)), digits = 1)

#reviewmins <- round((as.numeric(calcDT$`In Review`)), digits = 1);

analysismins <- round((as.numeric(calcDT$Analysis)), digits = 1);

backlogmins <- round((as.numeric(calcDT$`Program Backlog`)), digits = 1);

#blockedmins <- round((as.numeric(calcDT$`On Hold`)), digits = 1);


calcDT$FunnelDays <- funnelmins / 1440
calcDT$DevTime <- implmins / 1440
#calcDT$BlockedTimeDays <- blockedmins / 1440
calcDT$AnalysisDays <- analysismins / 1440
calcDT$BacklogDays <- backlogmins / 1440
#calcDT$ReviewDays <- reviewmins /1440

#calcDT$`On Hold`[calcDT$`On Hold` == 0] <- NA
