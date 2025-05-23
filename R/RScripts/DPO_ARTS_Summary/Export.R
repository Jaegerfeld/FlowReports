library(gridExtra)
library(grid)

filepath <-  gsub(" ", "",paste("Export/",PortfolioName, "_Summary1",startDate,"  -  ",endDate))
pdf(file =  gsub(" ", "",paste(filepath,".pdf")), width = 20,height = 8, onefile = TRUE)
#print(boxplotCycledays) 
print(boxplotCycledaysTotal)
print(scatterPlot)
 boxplotStages <- boxplot(totalCycleDT$AnalysisDays,totalCycleDT$BacklogDays, totalCycleDT$DevTime, main = paste("Summary", " Workflow Steps","\n", "Total issues Done:", nrow(totalCycleDT), "Current WIP: ", calcDTAgingrows),
                          xlab = " days ", col = " grey ", border = " brown ", horizontal = TRUE, 
                          names = c("In Analysis","Backlog","Implementation" ),
                          bottom = "...")
if(nrow(Summary_ARTS) > 20) {
  grid.newpage()
  grid.table(Summary_ARTS[1:20, ])
  grid.newpage()
  grid.table(Summary_ARTS[21:nrow(Summary_ARTS), ]) 
}
 if(nrow(Summary_ARTS) < 21) {
  grid.newpage()
  grid.table(Summary_ARTS)
}
#grid.table(Summary_ARTS)
print(scatterTrend)
dev.off()
