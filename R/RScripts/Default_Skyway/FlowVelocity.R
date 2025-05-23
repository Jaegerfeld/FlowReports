# dynamisches laden PIs - später
# library(readxl)
# PorscheTakt <- read_excel("PorscheTakt.xlsx", 
#                           col_types = c("text", "date", "date"))

library(dplyr)
Features_DT3 <- Features_DT
Features_DT <- Features_ALL_DT
calcDTSAV <- calcDT

source("RScripts/Default_Skyway/cleanup.R")
Features_DT <- Features_DT3

#statisches laden pis + zusätzliche Spalte "PI" in calcDT
calcDT <- calcDT %>%
  mutate(PI = case_when(
    between(calcDT$`Closed Date`, as.Date("2022-02-17"), as.Date("2022-05-11"))~"2022.07",
    between(calcDT$`Closed Date`, as.Date("2022-05-12"), as.Date("2022-08-03"))~"2022.19",
    between(calcDT$`Closed Date`, as.Date("2022-08-04"), as.Date("2022-11-16"))~"2022.31",
    between(calcDT$`Closed Date`, as.Date("2022-11-17"), as.Date("2023-03-29"))~"2022.43",
    between(calcDT$`Closed Date`, as.Date("2023-03-30"), as.Date("2023-06-21"))~"2023.13",
    between(calcDT$`Closed Date`, as.Date("2023-06-22"), as.Date("2023-09-13"))~"2023.25",
    between(calcDT$`Closed Date`, as.Date("2023-09-14"), as.Date("2023-12-06"))~"2023.37",
    between(calcDT$`Closed Date`, as.Date("2023-12-07"), as.Date("2024-03-13"))~"2023.49",
    between(calcDT$`Closed Date`, as.Date("2024-03-14"), as.Date("2024-06-19"))~"2024.11",
    between(calcDT$`Closed Date`, as.Date("2024-06-20"), as.Date("2024-09-11"))~"2024.25",
    between(calcDT$`Closed Date`, as.Date("2024-09-12"), as.Date("2024-12-04"))~"2024.37",
    between(calcDT$`Closed Date`, as.Date("2024-12-04"), as.Date("2025-06-30"))~"2024.49")
  )



# gruppieren nach PI und anzahl feature pro PI ermitteln
PIVelocity <- calcDT %>% group_by(PI) %>% tally()

# laufendes pi raus weil noch nicht abgeschlossen == letzte zeile raus
PIVelocity <- PIVelocity %>% filter(row_number() <= n()-1)

PIVelocity$count <- PIVelocity$n

summaryPIVel <- summary(PIVelocity)
meanPIVel <- summary(PIVelocity$count)[4]

title =  paste("Flow Velocity: Feature per PI. Average = ",meanPIVel )

FlowVelocityBarPlot<-ggplot(data=PIVelocity, aes(x=PI , y=count)) +
  geom_bar(stat="identity") +
  geom_col(fill = "#0073C2FF") +
  geom_text(aes(label = count), vjust = 1.6, color = "white")+
  geom_hline(yintercept=meanPIVel, linetype="dashed", color = "red")+
  ggtitle((title))

plot(FlowVelocityBarPlot)

calcDT <- calcDTSAV
