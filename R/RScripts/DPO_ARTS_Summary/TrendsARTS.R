library(readxl)
library(ggplot2)
max_cycletime <- 300
filepath_Import <- gsub(" ", "", paste("Export/CSV/","Summary_ART_Values.xlsx"))
Summary_ART_Values_DT <- read_excel(filepath_Import)

#View(Summary_ART_Values_DT)
################################### Beispiel ART

####APPART
# APPART_DT <- Summary_ART_Values_DT
# APPART_DT <- APPART_DT[grep("APPART", Summary_ART_Values_DT$ART),]
# APPART_DT = filter(Summary_ART_Values_DT,Summary_ART_Values_DT$ART != "APPART" )
# 
# 
# appartline <- ggplot(data=APPART_DT, aes(x=Datum, y=Median, group=1)) +
#   geom_line(color="red")+
#   geom_point()+
#   scale_y_continuous(breaks = seq(10, max_cycletime, 50), 
#                      limits=c(0,max_cycletime))+
#   theme_minimal() +
#   theme(legend.position = "top") 
# 
# plot(appartline)
# print(appartline)

summaryline <- ggplot(data=Summary_ART_Values_DT, aes(x=Datum, y=Median,colour=ART, group=ART)) +
  #
  geom_line()+
  geom_point()+
  scale_y_continuous(breaks = seq(10, max_cycletime, 50),
                   limits=c(0,max_cycletime))+
  theme_minimal() +
  theme(legend.position = "top")

summaryarea <- ggplot(data=Summary_ART_Values_DT, aes(x=Datum, y=StdDev, fill=ART)) +
  geom_area()
# +
#   geom_point()+
#   scale_y_continuous(breaks = seq(10, max_cycletime, 50),
#                      limits=c(0,max_cycletime))+
#   theme_minimal() +
#   theme(legend.position = "top")

plot(summaryarea)
print(summaryarea)

plot(summaryline)
print(summaryline)










filepath <-  gsub(" ", "",paste("Export/", "Arts_Summary_Trends"))

pdf(file =  gsub(" ", "",paste(filepath,".pdf")), width = 20,height = 8, onefile = TRUE)
#print(appartline) 
print(summaryline)
dev.off()