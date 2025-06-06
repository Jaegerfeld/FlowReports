
##import
library(tidyverse)
Enddate <- max(FeaturesCFD_DT$Day)
SD <- min(FeaturesCFD_DT$Day)
lastDate <- Enddate

#laufende summe bilden

calcCFD_DT <- FeaturesCFD_DT

calcCFD_DT <- calcCFD_DT %>% filter( calcCFD_DT$Day >= SD)

calcCFD_DT$Closed <- NULL
calcCFD_DT$X11 <- NULL
calcCFD_DT$...9 <- NULL
calcCFD_DT$...10 <- NULL
calcCFD_DT$...11 <- NULL
calcCFD_DT$...12 <- NULL


calcCFD_DT$Funnel <- c(0, cumsum(calcCFD_DT$Funnel)[-nrow(calcCFD_DT)])
calcCFD_DT$`In Analysis` <- c(0, cumsum(calcCFD_DT$`In Analysis`)[-nrow(calcCFD_DT)])
calcCFD_DT$Backlog <- c(0, cumsum(calcCFD_DT$Backlog)[-nrow(calcCFD_DT)])
calcCFD_DT$`In Implementation` <- c(0, cumsum(calcCFD_DT$`In Implementation`)[-nrow(calcCFD_DT)])
calcCFD_DT$Blocker <- c(0, cumsum(calcCFD_DT$Blocker)[-nrow(calcCFD_DT)])
calcCFD_DT$`E2E Test` <- c(0, cumsum(calcCFD_DT$`E2E Test`)[-nrow(calcCFD_DT)])
calcCFD_DT$Completed <- c(0, cumsum(calcCFD_DT$Completed)[-nrow(calcCFD_DT)])
calcCFD_DT$Monitoring <- c(0, cumsum(calcCFD_DT$Monitoring)[-nrow(calcCFD_DT)])
calcCFD_DT$Done <- c(0, cumsum(calcCFD_DT$Done)[-nrow(calcCFD_DT)])



##### plotting

library(reshape2)
df <- calcCFD_DT
df <- melt(df, id.vars='Day')

dffirstStartAll = filter(df,(Day == SD) 
                         & ( df$variable == "In Analysis" 
                             | df$variable == "Backlog"
                             | df$variable == "In Implementation"
                             | df$variable == "Blocker"
                             | df$variable == "E2E Test"
                             | df$variable == "Completed" 
                             | df$variable == "Monitoring"
                             | df$variable == "Done" 
                         )
)

dffirstStartAll$value <- as.numeric(dffirstStartAll$value)

dffirstStart = filter(df,(Day == SD) & (df$variable == "In Analysis"))
dffirstStart$value <- as.numeric(dffirstStart$value)
dffirstStart$value <- sum(dffirstStartAll$value)

dflastStartAll = filter(df,(Day == lastDate) 
                        & ( df$variable == "In Analysis" 
                            | df$variable == "Backlog"
                            | df$variable == "In Implementation"
                            | df$variable == "Blocker"
                            | df$variable == "E2E Test"
                            | df$variable == "Completed" 
                            | df$variable == "Monitoring"
                            | df$variable == "Done" 
                        )
)

dflastStart = filter(df,(Day == lastDate) & ( df$variable == "In Analysis"))
dflastStartAll$value <- as.numeric(dflastStartAll$value)
dflastStart$value <- sum(dflastStartAll$value)


dfStart <- rbind(dffirstStart,dflastStart)

dffirstEndAll = filter(df,(Day == SD) & ( df$variable == "Done"
                                                 | df$variable == "Monitoring"
                                                 | df$variable == "Completed"
)
)

dffirstEndAll$value <- as.numeric(dffirstEndAll$value)

dffirstEnd = filter(df,(Day == SD) & (df$variable == "Completed"))
dffirstEnd$value <- as.numeric(dffirstEnd$value)
dffirstEnd$value <- sum(dffirstEndAll$value)




dflastEndAll = filter(df,(Day == lastDate) & ( df$variable == "Done"
                                               | df$variable == "Monitoring"
                                               | df$variable == "Completed"
)
)

dflastEndAll$value <- as.numeric(dflastEndAll$value)

dflastEnd = filter(df,(Day == lastDate) & (df$variable == "Completed"))
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




