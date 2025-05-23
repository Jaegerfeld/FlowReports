calcDTAging <- Features_ALL_DT


##cleanup 
# remove no Status Lines (== not an issue) , remove already closed Issues (== has a closed date, regarding to Workflow definition in issuecoll)

calcDTAging <- calcDTAging[!(is.na(calcDTAging$Status)),]
calcDTAging <- calcDTAging[(is.na(calcDTAging$`Closed Date`)),]

cycleAgingmins <- round((as.numeric(calcDTAging$Analysis)
                         + as.numeric(calcDTAging$`Program Backlog`)
                         + as.numeric(calcDTAging$Implementation)), digits = 1);

calcDTAging$CycleDays <- round(as.numeric(cycleAgingmins / 1440), digits = 1);

Funnel_Aging_DT <- subset(calcDTAging, calcDTAging$Status == "Funnel")
NotReady_Aging_DT <- subset(calcDTAging, calcDTAging$Status != "Funnel")

CountDoneIssues <- nrow(calcDT)

captionTitle =  paste("CycleTime", 
                      "| Mean: ", round(as.numeric(summaryCycle[4]), digits = 2),
                      " | Median: ", round(as.numeric(summaryCycle[3]), digits = 2),
                      "| # Done Items: ", nrow(calcDT))
summaryNotReady <- summary(NotReady_Aging_DT$CycleDays)

Reporttitle <- paste("Age & Current Status:  
                     Mean" , round(as.numeric(summaryNotReady[4]), digits = 2),
                     " | Median: ", round(as.numeric(summaryNotReady[3]), digits = 2),
                     "| # Not done Items: ", nrow(NotReady_Aging_DT))


table <- table(NotReady_Aging_DT$Status)
print(table)
AgingWIPPlot <- ggplot(NotReady_Aging_DT, aes(Status, CycleDays)) + 
  geom_boxplot() + 
  geom_dotplot(binaxis='y', 
               stackdir='center', 
               dotsize = .5,
               binwidth = 15,
               fill="red") +
  geom_hline(yintercept=(summaryCycle[3]), linetype="dashed", color = "red") +
  theme(legend.position = "none")  +
  scale_x_discrete(limits = c("Analysis","Program Backlog","Implementation")) +
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) + 
  labs(title="Aging Work in Progress", 
       subtitle=Reporttitle,
       caption=captionTitle,
       x="Current Status",
       y="Total Age")# +
# annotate("label",
#          x = 1:length(table(NotReady_Aging_DT$Status)),
#          y = aggregate(CycleDays ~ Status, NotReady_Aging_DT, median)[ , 2],
#          label = table,
#          col = "blue",
#          size=2,
#          vjust = 0 )
# annotate("label",
#        x = 1:length( table),
#        y = aggregate(CycleDays ~ Status, NotReady_Aging_DT, median)[ , 2],
#        label = c("Blocked", "Analyzing","Backlog","In Implementation",),
#        col = "blue",
#        size=2,
#        vjust = 0 )




#write.csv(NotReady_Aging_DT, "Export/notreadytest.csv", row.names = FALSE)


plot(AgingWIPPlot)

