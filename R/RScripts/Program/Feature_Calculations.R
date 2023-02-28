calcDT <- Features_DT

calc2 <- calcDT

#alle vor startdate rauswerfen
calcDT$`Closed Date` <- as.Date((calcDT$`Closed Date`))
calcDT <- calcDT %>% filter( calcDT$`Closed Date`>= startDate)

#calcDT <- calc2
#calcDT <- calcDT %>% filter( calcDT$`Closed Date`>= startDate)


# wie lange ist die Cycletime in Minuten, CyleTime = InAnalysis bis Completed,  
cyclemins <- round((as.numeric(calcDT$`In Analysis`)
                    + as.numeric(calcDT$Backlog)
                        + as.numeric(calcDT$`In Implementation`)
                                + as.numeric(calcDT$Blocker)), digits = 1);

# umrechnung in Tage CyleTime = InAnalysis bis Completed,  
calcDT$CycleDays <- round(as.numeric(cyclemins / 1440), digits = 1);
#berechne die statistischen Kennzahlen der Cycletime auf der Summary
summaryCycle <- summary(calcDT$CycleDays)



#leadTime = done - InProgress
calcDT$lead <- round(as.numeric(difftime(calcDT$`Closed Date`, calcDT$`First Date`, units = "days")), digits = 0);
summaryLead <- summary(calcDT$lead);



write.csv(calcDT,"Export/APPART_CalcDT.csv")

##### spielereien

# leadOnMins <- round((as.numeric(calcDT$`In Implementation`)
#                                 + as.numeric(calcDT$Blocker)), digits = 1);
# 
# # umrechnung in Tage
# calcDT$leadOnMins <- leadOnMins / 1440
# summaryLeadOnMins <- summary(calcDT$leadOnMins)



