library(gridExtra)

noFeature <- (is.null(scatterPlot) || nrow(calcDT)== 0)
                                          
if(!noFeature){
filepath <-  gsub(" ", "",paste("Export/", teamname))

pdf(file =  gsub(" ", "",paste(filepath,".pdf")), width = 20,height = 8, onefile = TRUE)

print(boxplotCycledays)     # Plot 1 --> in the first page of PDF
print(scatterPlot)     # Plot 2 ---> in the second page of the PDF

boxplotIssueTypes <- boxplot(calcDT$FunnelDays,calcDT$AnalysisDays,calcDT$BacklogDays, calcDT$DevTime, calcDT$BlockedTimeDays, main = paste(teamname, " Workflow Steps"),
                             xlab = " days ", col = " orange ", border = " brown ", horizontal = TRUE, 
                             names = c("Funnel","Analysis","Backlog","Impl & E2E Test","Blocked" ),
                             bottom = "...")
print(cfdPlot)     #CFD Diagramm Plot
print(AgingWIPPlot)
#print(FlowVelocityBarPlot)

dev.off() 

write.csv(calcDT,paste("Export/", teamname,"_CT.csv", sep=""), row.names = FALSE)

}