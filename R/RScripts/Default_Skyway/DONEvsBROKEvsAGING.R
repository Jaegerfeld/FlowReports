Check_DoneDT <- calcDT
Check_Broken <- FeaturesBroken_DT
Check_Aging <- NotReady_Aging_DT
Check_Funnel <- Funnel_Aging_DT

doneCount <- nrow(Check_DoneDT)
brokenCount <- nrow(Check_Broken)
agingCount <- nrow(Check_Aging)
funnelCount <- nrow(Check_Funnel)

reportdays = length(seq(from = startDate, to = endDate, by = 'day'))-1

data <- data.frame("category" = c(paste('Done last',reportdays,'days'), paste('Broken last',reportdays,'days'), 'Aging now', 'Funnel now'),
                   "amount" = c(doneCount, brokenCount, agingCount, funnelCount))

ptitle <- paste("Verteilung der Feature im System ", endDate)

checkPie <- ggplot(data, aes(x="", y=amount, fill=category)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) +
  ggtitle(ptitle)+
  geom_text(aes(label = paste0(amount, "Ft")), position = position_stack(vjust=0.5)) +
  theme_void() +
  labs(x = NULL, y = NULL, fill = NULL) +
  scale_fill_manual(values=c("#33DBFF","#FF5733","#75FF33",  "#BD33FF"))
  

plot(checkPie)