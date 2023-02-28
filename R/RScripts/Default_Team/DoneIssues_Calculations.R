calcDoneIssues_DT <- DoneIssues_DT

# wie lange ist die Cyclertime in Minuten, CyleTime = InAnalysis bis Completed,  
cyclemins <- round((as.numeric(calcDoneIssues_DT$`In Refinement`)
                    + as.numeric(calcDoneIssues_DT$`Ready for Dev`)
                    + as.numeric(calcDoneIssues_DT$`In Progress`)
                    + as.numeric(calcDoneIssues_DT$`Technical Review`)
                    + as.numeric(calcDoneIssues_DT$`In Review / Test`)
                    + as.numeric(calcDoneIssues_DT$`PO Review`)
                    + as.numeric(calcDoneIssues_DT$BLOCKED)), digits = 1);

# umrechnung in Tage CyleTime = InAnalysis bis Completed,  
calcDoneIssues_DT$CycleDays <- round(as.numeric(cyclemins / 1440), digits = 1);
summaryCycle_DoneIssues <- summary(calcDoneIssues_DT$CycleDays)

#leadTime = done - InProgress
calcDoneIssues_DT$lead <- round(as.numeric(difftime(calcDoneIssues_DT$`Closed Date`, calcDoneIssues_DT$`First Date`, units = "days")), digits = 0);
summaryLead_DoneIssues <- summary(calcDoneIssues_DT$lead)


