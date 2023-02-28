library(ggplot2)
library(ggrepel)
library(ggthemes)
library(plotly)
library(EnvStats)
library(ggstatsplot)
library(ggtext)

# Alle Issues Boxplot + Scatterplot

titlenull =  paste("Issues:", nrow(calcDoneIssues_DT))
title =  paste("CycleTime ", "Min:", summaryCycle_DoneIssues[1],
               "| Q1: ",  round(as.numeric(summaryCycle_DoneIssues[2]), digits = 2),
               "| Mean: ", round(as.numeric(summaryCycle_DoneIssues[4]), digits = 2),
               " | Median: ", round(as.numeric(summaryCycle_DoneIssues[3]), digits = 2),
               " | Q3: ", round(as.numeric(summaryCycle_DoneIssues[5]), digits = 2),
               " | Max: ", round(as.numeric(summaryCycle_DoneIssues[6]), digits = 2),
			   "| #Items: ", nrow(calcDoneIssues_DT))

boxplotCycledays_DoneIssues <- ggplot(calcDoneIssues_DT, aes(CycleDays,Issuetype)) + 
    geom_boxplot( varwidth = TRUE, fill = "orange", outlier.colour = "red", outlier.shape = 1, outlier.size =  2) +
    ggtitle(titlenull)

dates <- as.Date(scatterTable_DoneIssues$`Closed Date`, "%Y-%m-%d %H:%M:%S", tz = "Europe/London")

scatterPlot_DoneIssues <- ggplot(scatterTable_DoneIssues, aes(x = dates, y = CycleDays, color = CycleDays)) +
geom_point(shape = 1) +
scale_color_gradientn(colors = c("#00FF00", "#0000FF", "#FF0000")) +
geom_smooth(method = loess, alpha = 0.1, color = "blue") +
geom_text_repel(aes(label = Key), size = 1)


### Build Boxplot + Scatterplot for Storys


title =  paste("CycleTime", "Min:", summaryCycle_DoneStorys[1],
               "| Q1: ",  round(as.numeric(summaryCycle_DoneStorys[2]), digits = 2),
               "| Mean: ", round(as.numeric(summaryCycle_DoneStorys[4]), digits = 2),
               " | Median: ", round(as.numeric(summaryCycle_DoneStorys[3]), digits = 2),
               " | Q3: ", round(as.numeric(summaryCycle_DoneStorys[5]), digits = 2),
               " | Max: ", round(as.numeric(summaryCycle_DoneStorys[6]), digits = 2),
               "| #Items: ", nrow(calcDoneStorys_DT))

titleDevTime =  paste("DevTime", "Min:", summaryCycle_DoneStorysDev[1],
               "| Q1: ",  round(as.numeric(summaryCycle_DoneStorysDev[2]), digits = 2),
               "| Mean: ", round(as.numeric(summaryCycle_DoneStorysDev[4]), digits = 2),
               " | Median: ", round(as.numeric(summaryCycle_DoneStorysDev[3]), digits = 2),
               " | Q3: ", round(as.numeric(summaryCycle_DoneStorysDev[5]), digits = 2),
               " | Max: ", round(as.numeric(summaryCycle_DoneStorysDev[6]), digits = 2),
               "| #Items: ", nrow(calcDoneStorys_DT))

boxplotCycledays_DoneStorys <- ggplot(calcDoneStorys_DT, aes(CycleDays)) + 
  geom_boxplot( varwidth = TRUE, fill = "orange", outlier.colour = "red", outlier.shape = 1, outlier.size =  2) +
  ggtitle(title)

dates <- as.Date(scatterTable_DoneStorys$`Closed Date`, "%Y-%m-%d %H:%M:%S", tz = "Europe/London")

scatterPlot_DoneStorys <- ggplot(scatterTable_DoneStorys, aes(x = dates, y = CycleDays, color = CycleDays)) +
  geom_point(shape = 1) +
  scale_color_gradientn(colors = c("#00FF00", "#0000FF", "#FF0000")) +
  geom_smooth(method = loess, alpha = 0.1, color = "blue") +
  geom_text_repel(aes(label = Key), size = 1)+
  ggtitle(title)

scatterPlot_DoneStorysDev <- ggplot(scatterTable_DoneStorysDev, aes(x = dates, y = DevTime, color = DevTime)) +
  geom_point(shape = 1) +
  scale_color_gradientn(colors = c("#00FF00", "#0000FF", "#FF0000")) +
  geom_smooth(method = loess, alpha = 0.1, color = "blue") +
  geom_text_repel(aes(label = Key), size = 1)+
  ggtitle(titleDevTime)

boxplotCycledaysStorys <- ggplot(calcDoneStorys_DT, aes(CycleDays)) + 
  geom_boxplot( varwidth = TRUE, fill = "orange", outlier.colour = "red", outlier.shape = 1, outlier.size =  2) +
  ggtitle(title)



pdf(file = paste("Export/",teamname,"_Status.pdf"), width = 20,height = 8)
  testplot <- boxplot(calcDoneStorys_DT$OpenDays, calcDoneStorys_DT$RefineDays, calcDoneStorys_DT$ProgTime, calcDoneStorys_DT$ReviewDays, calcDoneStorys_DT$Blockedonly, calcDoneStorys_DT$BlockedTimeDays, main = paste(teamname, " Workflow Steps"),
         xlab = " days ", col = " orange ", border = " brown ", horizontal = TRUE, 
         names = c("Open", "Refine", "Prog", "Review", "Blocked", "Blckd \n all"),
         bottom = "blabla"
         )
  
  # testplot <- boxplot(calcDoneStorys_DT$OpenDays, calcDoneStorys_DT$RefineDays, calcDoneStorys_DT$ProgTime, calcDoneStorys_DT$ReviewDays, calcDoneStorys_DT$Blockedonly, calcDoneStorys_DT$BlockedTimeDays, main = paste(teamname, " Workflow Steps"),
  #                     xlab = " days ", col = " orange ", border = " brown ", horizontal = TRUE, 
  #                     names = c("Open", "Refine", "Prog", "Review", "Blocked", "Blckd \n all"),
  #                     bottom = "blabla"
  #)
  
 dev.off()

plot(boxplotCycledaysStorys)
plot(boxplotCycledays_DoneIssues)
plot(scatterPlot_DoneStorys)
plot(scatterPlot_DoneStorysDev)
