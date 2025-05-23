library(ggplot2)
library(ggrepel)
library(ggthemes)
#library(plotly)
library(EnvStats)
library(ggstatsplot)
library(ggtext)

#Boxplot CycleTime Features 
maxdays <- summaryCycle[6]
standarddeviation <- sd(calcDT$CycleDays)
mad <- mad(calcDT$CycleDays)
spanwidth <- (summaryCycle[6]-summaryCycle[1])

targetCycleDT <- calcDT
targetCycleDT = filter(targetCycleDT,targetCycleDT$CycleDays <= 90 )
RatioTarget <- 100/ nrow(calcDT) * nrow(targetCycleDT)

title =  paste("CycleTime", "Min:", summaryCycle[1],
               "| Q1: ",  round(as.numeric(summaryCycle[2]), digits = 2),
               "| Mean: ", round(as.numeric(summaryCycle[4]), digits = 2),
               " | Median: ", round(as.numeric(summaryCycle[3]), digits = 2),
               " | Q3: ", round(as.numeric(summaryCycle[5]), digits = 2),
               " | Max: ", round(as.numeric(summaryCycle[6]), digits = 2),
			   "| #Items: ", nrow(calcDT),
			   "StdDev: ", round(as.numeric(standarddeviation), digits = 2),
			   "| 90d CT %: ", round(as.numeric(RatioTarget), digits = 2))

IQR <- iqr(calcDT$CycleDays)
rightWhisker <- IQR*1.5 + as.numeric(summaryCycle[5])

boxplotCycledays <- ggplot(calcDT, aes(CycleDays)) + 
    geom_boxplot( varwidth = TRUE, fill = "orange", outlier.colour = "red", outlier.shape = 1, outlier.size =  2) +
    ggtitle(title)+
    theme(axis.text.y=element_blank(),axis.ticks.y=element_blank()) +
    scale_x_continuous(breaks=c(as.numeric(summaryCycle[1]),as.numeric(summaryCycle[2]),as.numeric(summaryCycle[3]),as.numeric(summaryCycle[5]),as.numeric(rightWhisker),as.numeric(summaryCycle[6])))

dates <- as.Date(scatterTable$`Closed Date`, "%Y-%m-%d %H:%M:%S", tz = "Europe/London")

scatterpercentiles <- quantile(scatterTable$CycleDays, probs = c(.50, .85, .95))

ylimit <- round(as.numeric(summaryCycle[6]), digits = 0) + 25

scatterPlot<- NULL

if(nrow(scatterTable)>0){
scatterPlot <- ggplot(scatterTable, aes(x = dates, y = CycleDays, color = CycleDays)) +
  geom_point(shape = 1) +
  geom_hline(yintercept=(scatterpercentiles[1]), linetype="dashed", color = "red") +
  geom_hline(yintercept=(scatterpercentiles[2]), linetype="dashed", color = "cyan") +
  geom_hline(yintercept=(scatterpercentiles[3]), linetype="dashed", color = "green") +
  scale_color_gradientn(colors = c("#00FF00", "#0000FF", "#FF0000")) +
  geom_smooth(method = loess, alpha = 0.1, color = "blue") +
  geom_text_repel(aes(label = Key), size = 1) + 
  ggtitle(title)+
  scale_x_date(date_labels = "%b%y", date_breaks = "2 month", minor_breaks = "1 month")+
  #scale_x_continuous (date_breaks = "2 month", minor_breaks = "10")
  scale_y_continuous(limits=c(0,ylimit), breaks=seq(0,ylimit, by = 25),position = "right")
  plot(scatterPlot)
}

plot(boxplotCycledays)
