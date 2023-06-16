
##import
library(tidyverse)


Enddate <- max(FeaturesCFD_DT$Day)
SD <- min(FeaturesCFD_DT$Day)
startDate <- Enddate - 365
lastDate <- Enddate


#laufende summe bilden

calcCFD_DT <- FeaturesCFD_DT

calcCFD_DT <- calcCFD_DT %>% filter( calcCFD_DT$Day >= startDate)

calcCFD_DT$Closed <- NULL
calcCFD_DT$X11 <- NULL
calcCFD_DT$...9 <- NULL
calcCFD_DT$...10 <- NULL
calcCFD_DT$...11 <- NULL
calcCFD_DT$...12 <- NULL


calcCFD_DT$Funnel <- c(0, cumsum(calcCFD_DT$Funnel)[-nrow(calcCFD_DT)])
calcCFD_DT$Analysis <- c(0, cumsum(calcCFD_DT$Analysis)[-nrow(calcCFD_DT)])
calcCFD_DT$Backlog <- c(0, cumsum(calcCFD_DT$Backlog)[-nrow(calcCFD_DT)])
calcCFD_DT$`In Progress` <- c(0, cumsum(calcCFD_DT$`In Progress`)[-nrow(calcCFD_DT)])
calcCFD_DT$Pending <- c(0, cumsum(calcCFD_DT$Pending)[-nrow(calcCFD_DT)])
calcCFD_DT$Released <- c(0, cumsum(calcCFD_DT$Released)[-nrow(calcCFD_DT)])
calcCFD_DT$Done <- c(0, cumsum(calcCFD_DT$Done)[-nrow(calcCFD_DT)])



##### plotting

library(reshape2)
df <- calcCFD_DT
df <- melt(df, id.vars='Day')

dffirstStartAll = filter(df,(Day == startDate) 
                         & ( df$variable == "Analysis" 
                             | df$variable == "Backlog"
                             | df$variable == "In Progress"
                             | df$variable == "Pending"
                             | df$variable == "Released" 
                             | df$variable == "Done" 
                         )
)

dffirstStartAll$value <- as.numeric(dffirstStartAll$value)

dffirstStart = filter(df,(Day == startDate) & (df$variable == "Analysis"))
dffirstStart$value <- as.numeric(dffirstStart$value)
dffirstStart$value <- sum(dffirstStartAll$value)

dflastStartAll = filter(df,(Day == lastDate) 
                        & ( df$variable == "Analysis" 
                            | df$variable == "Backlog"
                            | df$variable == "In Progress"
                            | df$variable == "Pending"
                            | df$variable == "Released" 
                            | df$variable == "Done" 
                        )
)

dflastStart = filter(df,(Day == lastDate) & ( df$variable == "Analysis"))
dflastStartAll$value <- as.numeric(dflastStartAll$value)
dflastStart$value <- sum(dflastStartAll$value)


dfStart <- rbind(dffirstStart,dflastStart)

dffirstEndAll = filter(df,(Day == startDate) & ( df$variable == "Done"
                                                 | df$variable == "Released"
)
)

dffirstEndAll$value <- as.numeric(dffirstEndAll$value)

dffirstEnd = filter(df,(Day == startDate) & (df$variable == "Released"))
dffirstEnd$value <- as.numeric(dffirstEnd$value)
dffirstEnd$value <- sum(dffirstEndAll$value)




dflastEndAll = filter(df,(Day == lastDate) & ( df$variable == "Done"
                                               | df$variable == "Released"
)
)

dflastEndAll$value <- as.numeric(dflastEndAll$value)

dflastEnd = filter(df,(Day == lastDate) & (df$variable == "Released"))
dflastEnd$value <- as.numeric(dflastEnd$value)
dflastEnd$value <- sum(dflastEndAll$value)

dfEnd <- rbind(dffirstEnd,dflastEnd)

ratio = dflastStart$value / dflastEnd$value

title = paste("Ratio In/out ", round(ratio,2) , " : 1")

cfdPlot <- ggplot(df, aes(x = Day, y = value)) +
  geom_area(aes(fill = variable)) +
  geom_line(data=dfStart, aes(x=Day, y=value, group=1)) +
  geom_line(data=dfEnd, aes(x=Day, y=value, group=1)) +
  labs(title = title,
       x = "Date",
       y = "Count")


plot(cfdPlot)
#write.csv(calcCFD_DT, "Export/CFD-cumsum.csv", row.names = FALSE)
#write.csv(df, "Export/CFD-cumsumDF.csv", row.names = FALSE)




