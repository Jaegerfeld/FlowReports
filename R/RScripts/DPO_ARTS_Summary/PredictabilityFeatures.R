totalCycleDTBkp <- totalCycleDT

# totalCycleDT <- totalCycleDT[!(is.na(totalCycleDT$ImplementationDate)),]
# 
# totalCycleDT$ImplementationDate  <- as.Date(totalCycleDT$ImplementationDate , "%d-%m-%> %H:%M:%S", tz = "Europe/London")
# totalCycleDT$ClosedDate  <- as.Date(totalCycleDT$ClosedDate , "%Y-%m-%d %H:%M:%S", tz = "Europe/London")
# 
# 
# totalCycleDT$ImplTime <- difftime(totalCycleDT$ImplementationDate, totalCycleDT$ClosedDate, units="days")




totalCycleDTGood <- totalCycleDT %>% filter( totalCycleDT$DevTime <= 94)
totalCycleDTBad <- totalCycleDT %>% filter( totalCycleDT$DevTime > 94)

totalCycleDTGood$part <-">94d"
totalCycleDTBad$part <-"<94d"

totals <- rbind(totalCycleDTBad,totalCycleDTGood)

bp <- boxplot(totals$DevTime~totals$part)
print(bp)

predictability <- data.frame(matrix(ncol = 4 , nrow = 0))
names(predictability) <- c("count","median","mean","stddev")



############ good
countgood <- as.numeric(nrow(totalCycleDTGood), digits=2)
summarygood <- summary(totalCycleDTGood$DevTime)
sddev <- round(as.numeric(sd(totalCycleDTGood$DevTime)), digits = 2)


good <- data.frame(matrix(ncol = 5 , nrow = 0))
names(good) <- c("part","count","median","mean","stddev")
good <- c("<94d",countgood,summarygood[3],summarygood[4],sddev)
predictability <- rbind(good,predictability)
names(predictability) <- c("part","count","median","mean","stddev")


############# bad
countbad <- as.numeric(nrow(totalCycleDTBad), digits=2)
summarybad <- summary(totalCycleDTBad$DevTime)
sddev <- round(as.numeric(sd(totalCycleDTBad$DevTime)), digits = 2)


bad <- data.frame(matrix(ncol = 5 , nrow = 0))
names(bad) <- c("part","count","median","mean","stddev")
bad <- c(">94d",countbad,summarybad[3],summarybad[4],sddev)
predictability <- rbind(bad,predictability)
names(predictability) <- c("part","count","median","mean","stddev")

write.csv(predictability, "Export/predict.csv", row.names = FALSE)
write.csv(totals, "Export/totals.csv", row.names = FALSE)
###### pie

pie <- ggplot(predictability, aes(x = "", y = count, fill = part)) +
  geom_col() +
  coord_polar(theta = "y")
plot(pie)
print(pie)





######EXPORT

filepath <-  gsub(" ", "",paste("Export/", "predictability"))

pdf(file =  gsub(" ", "",paste(filepath,".pdf")), width = 20,height = 8, onefile = TRUE)


print(pie)     #piechart
bp <- boxplot(totals$DevTime~totals$part,main = paste("Feature <> 94 Tage"),
                xlab = " days ", col = " orange ", border = " brown ", horizontal = TRUE,
                bottom ="...")


dev.off() 

totalCycleDT <- totalCycleDTBkp

write.csv(totalCycleDT, "Export/totals.csv", row.names = FALSE)