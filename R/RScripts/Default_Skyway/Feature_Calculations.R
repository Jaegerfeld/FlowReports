#Arbeitstabelle Cycletimeberechnung
calcDT <- Features_DT

#alle vor startdate/enddate rauswerfen
calcDT$`Closed Date` <- as.Date((calcDT$`Closed Date`))
calcDT <- calcDT %>% filter( calcDT$`Closed Date`>= startDate)
calcDT <- calcDT %>% filter( calcDT$`Closed Date`< endDate)

# wie lange ist die Cyclertime in Minuten, CyleTime = In Analysis bis Completed (Defaultfall)  
cyclemins <- round((as.numeric(calcDT$`In Analysis`)
                    + as.numeric(calcDT$Backlog)
                    + as.numeric(calcDT$`In Implementation`)
                    + as.numeric(calcDT$`E2E Test`)
                    + as.numeric(calcDT$Blocker)), digits = 1);

# umrechnung in Tage CyleTime = InAnalysis bis Completed,  
calcDT$CycleDays <- round(as.numeric(cyclemins / 1440), digits = 1);
summaryCycle <- summary(calcDT$CycleDays)

#leadTime = done - InProgress
# zweite Sicht auf die Cycletime. verstrichene zeit zwischen Start und beginn. Kann abweichen von der ersten Berechnung, muss aber nicht
# hilft dabei Fehler im System zu erkennen (z.b. zurück in Backlog nach Done)
calcDT$lead <- round(as.numeric(difftime(calcDT$`Closed Date`, calcDT$`First Date`, units = "days")), digits = 0);
summaryLead <- summary(calcDT$lead)

