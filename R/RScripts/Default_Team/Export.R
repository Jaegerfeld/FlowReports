library(gridExtra)


filepath <- paste("Export/", teamname) 

pdf(file = paste(filepath,".pdf"), width = 20,height = 8, onefile = TRUE)
print(boxplotCycledays_DoneIssues)     # Plot 1 --> in the first page of PDF
print(scatterPlot_DoneStorys)     # Plot 2 ---> in the second page of the PDF
print(scatterPlot_DoneStorysDev) 

write.csv(ISSUES_DT,paste(filepath,".csv"))
write.csv(calcDoneIssues_DT, paste(filepath,"DoneIssues.csv"))

dev.off()
