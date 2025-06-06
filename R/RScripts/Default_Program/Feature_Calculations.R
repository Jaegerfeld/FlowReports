calcDT <- Features_DT

#alle vor startdate rauswerfen
calcDT$`Closed Date` <- as.Date((calcDT$`Closed Date`))
calcDT <- calcDT %>% filter( calcDT$`Closed Date`>= startDate)

# wie lange ist die Cyclertime in Minuten, CyleTime = InAnalysis bis Completed,  
cyclemins <- round((as.numeric(calcDT$`In Analysis`)
                    + as.numeric(calcDT$Backlog)
                        + as.numeric(calcDT$`In Implementation`)
                            + as.numeric(calcDT$`E2E Test`)
                                + as.numeric(calcDT$Blocker)), digits = 1);

# umrechnung in Tage CyleTime = InAnalysis bis Completed,  
calcDT$CycleDays <- round(as.numeric(cyclemins / 1440), digits = 1);
summaryCycle <- summary(calcDT$CycleDays)



#leadTime = done - InProgress
calcDT$lead <- round(as.numeric(difftime(calcDT$`Closed Date`, calcDT$`First Date`, units = "days")), digits = 0);
summaryLead <- summary(calcDT$lead);





##### spielereien

leadOnMins <- round((as.numeric(calcDT$`In Implementation`)
                            + as.numeric(calcDT$`E2E Test`)
                                + as.numeric(calcDT$Blocker)), digits = 1);

# umrechnung in Tage
calcDT$leadOnMins <- leadOnMins / 1440
summaryLeadOnMins <- summary(calcDT$leadOnMins)



