calcDoneStorys_DT <- DoneStorys_DT


# wie lange ist die Cyclertime in Minuten, CyleTime = InAnalysis bis Completed,  
cycleminsStory <- round((as.numeric(calcDoneStorys_DT$`In Refinement`)
                    + as.numeric(calcDoneStorys_DT$`Ready for Dev`)
                    + as.numeric(calcDoneStorys_DT$`In Progress`)
                    + as.numeric(calcDoneStorys_DT$`Technical Review`)
                    + as.numeric(calcDoneStorys_DT$`In Review / Test`)
                    + as.numeric(calcDoneStorys_DT$`PO Review`)
                    + as.numeric(calcDoneStorys_DT$BLOCKED)), digits = 1);

# umrechnung in Tage CyleTime = InAnalysis bis Completed,  
calcDoneStorys_DT$CycleDays <- round(as.numeric(cycleminsStory / 1440), digits = 1);
summaryCycle_DoneStorys <- summary(calcDoneStorys_DT$CycleDays)



# #leadTime = done - InProgress
# calcDoneStorys_DT$lead <- round(as.numeric(difftime(calcDoneStorys_DT$`Closed Date`, calcDoneStorys_DT$`First Date`, units = "days")), digits = 0);
# summaryLeadStorys <- summary(calcDoneStorys_DT$lead)

devmins <- round((as.numeric(calcDoneStorys_DT$`In Progress`)
                  + as.numeric(calcDoneStorys_DT$`Technical Review`)
                  + as.numeric(calcDoneStorys_DT$`PO Review`)
                  + as.numeric(calcDoneStorys_DT$`In Review / Test`)), digits = 1)


progmins <- round((as.numeric(calcDoneStorys_DT$`In Progress`)), digits = 1);

refinemins <- round((as.numeric(calcDoneStorys_DT$`In Refinement`)
                     + as.numeric(calcDoneStorys_DT$`Ready for Dev`)), digits = 1);


reviewmins <- round((as.numeric(calcDoneStorys_DT$`Technical Review`)
                     + as.numeric(calcDoneStorys_DT$`PO Review`)
                     + as.numeric(calcDoneStorys_DT$`In Review / Test`)), digits = 1);


calcDoneStorys_DT$OpenDays <- as.numeric(calcDoneStorys_DT$Open) / 1440
calcDoneStorys_DT$DevTime <- devmins / 1440
calcDoneStorys_DT$ProgTime <- progmins / 1440
calcDoneStorys_DT$BlockedTimeDays <- as.numeric(calcDoneStorys_DT$BLOCKED) / 1440
calcDoneStorys_DT$RefineDays <- refinemins / 1440
calcDoneStorys_DT$ReviewDays <- reviewmins / 1440

calcDoneStorys_DT$BLOCKED[calcDoneStorys_DT$BLOCKED == 0] <- NA
calcDoneStorys_DT$Blockedonly <- as.numeric(calcDoneStorys_DT$BLOCKED) / 1440

summaryCycle_DoneStorysDev <- summary(calcDoneStorys_DT$DevTime)
# 
#calcDoneStorys_DT$t2m <- round(as.numeric(difftime(calcDoneStorys_DT$Done, calcDoneStorys_DT$Created, units = "days")), digits = 0);
#calcDoneStorys_DT$lead <- round(as.numeric(difftime(calcDoneStorys_DT$Done, calcDoneStorys_DT$InProgress, units = "days")), digits = 0)


