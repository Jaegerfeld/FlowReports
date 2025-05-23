# Entwicklung bis 2030 Prognosen

# Annahme: Wenn wirdie Issues in den Percentilen 50 - 100 beschleunigen können wird der median insgesamt Sinken und diue STreuung abnehmen
#totalCycleDT$ClosedDate <- as.Date(totalCycleDT$ClosedDate, format = "%d.%m.%Y %H:%M:%S")
#export alle fertigen ft
write.csv(totalCycleDT, "Export/ALLDoneFt_Portfolio.csv", row.names = FALSE)

#vverteilung
Verteilung <- ggplot(totalCycleDT, aes(x = totalCycleDT$CycleDays)) +
  geom_dotplot(binwidth = 1.6,dotsize = 1.25) + 
  scale_x_continuous( breaks=seq(0,1000,50),limits=c(0, 1000), name="Cycle days") +
  scale_y_continuous(breaks=NULL, name="Propotion") +
  geom_vline(xintercept=(scatterpercentiles[1]), linetype="dashed", color = "red") +
  geom_vline(xintercept=(scatterpercentiles[2]), linetype="dashed", color = "cyan") +
  geom_vline(xintercept=(scatterpercentiles[3]), linetype="dashed", color = "green") 
plot(Verteilung)


# Anteil perc > 50 heute


LongRun_DT <- totalCycleDT %>% filter( totalCycleDT$CycleDays >= totalsummaryTotal[3])

scatterTableLong50 <- LongRun_DT[, c('ClosedDate', 'CycleDays', 'Key')]
scatterpercentilesLong50 <- quantile(scatterTableLong50$CycleDays, probs = c(.50, .85, .95))
datesLongRun <- as.Date(scatterTableLong50$ClosedDate, "%Y-%m-%d %H:%M:%S", tz = "Europe/London")

scatterPlotLong50 <- ggplot(scatterTableLong50, aes(x = datesLongRun, y = CycleDays, color = CycleDays)) +
  geom_point(shape = 1) +
  geom_hline(yintercept=(scatterpercentilesLong50[1]), linetype="dashed", color = "red") +
  geom_hline(yintercept=(scatterpercentilesLong50[2]), linetype="dashed", color = "cyan") +
  geom_hline(yintercept=(scatterpercentilesLong50[3]), linetype="dashed", color = "green") +
  scale_color_gradientn(colors = c("#00FF00", "#0000FF", "#FF0000")) +
  geom_smooth(method = loess, alpha = 0.1, color = "blue") +
  geom_text_repel(aes(label = Key), size = 1) + 
  ggtitle(paste(
                "Stddev: ", round(as.numeric(standarddeviation), digits = 2),
                "Unten: ", round(as.numeric(mad), digits = 2),
                "Median: ", round(as.numeric(spanwidth), digits = 2) ,
                "Oben: ", round(as.numeric(mad), digits = 2)))

  
  



nextyear_DT <- totalCycleDT %>% filter( totalCycleDT$CycleDays <= totalsummaryTotal[3])

scatterTablenextyear <- nextyear_DT[, c('ClosedDate', 'CycleDays', 'Key')]
scatterpercentilesLong50 <- quantile(scatterTablenextyear$CycleDays, probs = c(.50, .85, .95))
datesNextYear <- as.Date(scatterTablenextyear$ClosedDate, "%Y-%m-%d %H:%M:%S", tz = "Europe/London")

#sd(scatterTablenextyear$)

scatterPlotNextYear <- ggplot(scatterTablenextyear, aes(x = datesLongRun, y = CycleDays, color = CycleDays)) +
  geom_point(shape = 1) +
  geom_hline(yintercept=(scatterpercentilesLong50[1]), linetype="dashed", color = "red") +
  geom_hline(yintercept=(scatterpercentilesLong50[2]), linetype="dashed", color = "cyan") +
  geom_hline(yintercept=(scatterpercentilesLong50[3]), linetype="dashed", color = "green") +
  scale_color_gradientn(colors = c("#00FF00", "#0000FF", "#FF0000")) +
  geom_smooth(method = loess, alpha = 0.1, color = "blue") +
  geom_text_repel(aes(label = Key), size = 1) + 
  ggtitle(paste(
    "Stddev: ", round(as.numeric(standarddeviation), digits = 2),
    "Unten: ", round(as.numeric(mad), digits = 2),
    "Median: ", round(as.numeric(spanwidth), digits = 2) ,
    "Oben: ", round(as.numeric(mad), digits = 2)))












filepathPrognose <- "Export/PROGNOSE"

pdf(file =  gsub(" ", "",paste(filepathPrognose,".pdf")), width = 20,height = 8, onefile = TRUE)
print(Verteilung)
print(scatterPlotLong50)     # Plot 1 --> in the first page of PDF
print(scatterPlot)     # Plot 2 ---> in the second page of the PDF

dev.off() 

