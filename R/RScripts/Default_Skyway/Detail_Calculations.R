
#Status Boxplot, aufschlüsselung CT in die einzelnen Stufen.
# Hier können ggf einzelne Status zusammengefasst werden

implmins <- round((as.numeric(calcDT$`In Implementation`) +
                    as.numeric(calcDT$`E2E Test`)
                  ), digits = 1)

analysismins <- round((as.numeric(calcDT$`In Analysis`)), digits = 1);

backlogmins <- round((as.numeric(calcDT$Backlog)), digits = 1);

blockedmins <- round((as.numeric(calcDT$Blocker)), digits = 1);

#Umrechung in Tage

calcDT$FunnelDays <- as.numeric(calcDT$Funnel) / 1440
calcDT$DevTime <- implmins / 1440
calcDT$BlockedTimeDays <- blockedmins / 1440
calcDT$AnalysisDays <- analysismins / 1440
calcDT$BacklogDays <- backlogmins / 1440

#Blocker mit 0 Tagen sind keine Blocker. 
#Zeit auf NA setzen um falsches Bild im Diagramm zu verhindern
#Im Regelfall interessieren hier nur die Fälle in denen es zu einem Blocker kam
calcDT$Blocker[calcDT$Blocker == 0] <- NA
