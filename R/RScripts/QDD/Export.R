library(gridExtra)


filepath <-  gsub(" ", "",paste("Export/", teamname))

pdf(file =  gsub(" ", "",paste(filepath,".pdf")), width = 20,height = 8, onefile = TRUE)

print(boxplotCycledays)     # Plot 1 --> in the first page of PDF
print(scatterPlot)     # Plot 2 ---> in the second page of the PDF
boxplotIssueTypes <- boxplot(calcDT$FunnelDays,calcDT$AnalysisDays,calcDT$BacklogDays, calcDT$DevTime, main = paste(teamname, " Workflow Steps"),
                             xlab = " days ", col = " orange ", border = " brown ", horizontal = TRUE, 
                             names = c("Funnel","Analysis","Program Backlog","Implementation" ),
                             bottom = "...")
print(cfdPlot)     #CFD Diagramm Plot
print(AgingWIPPlot)
dev.off() 


write.csv(calcDT,paste("Export/", teamname,"_CT.csv",sep=""), row.names = FALSE)