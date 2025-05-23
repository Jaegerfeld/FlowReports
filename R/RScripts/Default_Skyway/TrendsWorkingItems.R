library(zoo)
library(dplyr)

AllDT <- Features_ALL_DT
AllDT$quarterYear <- as.Date(as.yearqtr(AllDT$`Created Date`))
AllDT2 <- AllDT

AllDT2 <- AllDT %>%
  group_by((AllDT$quarterYear) %>%
  summarize(count = sum(n = n())))
names(DensityTable_DT) <- c("Feature per Q", "Freq")

AllDT2 <- AllDT %>%
  group_by((AllDT$quarterYear) %>%
             summarize(count = sum(n = n())))
names(DensityTable_DT) <- c("Feature per Q", "Freq")