
library(tidyverse)
library(lubridate)
library(dplyr)


######### Porsche Takt TABLE

PITABLE <- read_csv("PITABLE.csv",
                      col_types = cols(
                      `Start` = col_datetime(format = "%Y-%m-%d"),
                      `End` = col_datetime(format = "%Y-%m-%d"),
                      .default = col_character()
                                              )
                      )

# meanCD <- totalCycleDT
# 
# 
# meanCD %>%
#   mutate(month_year = floor_date(dummy$ClosedDate, "month")) %>%
#   group_by(month_year) %>%
#   summarize(total_fts = mean(CycleDays))


countFt <- totalCycleDT


monthGroupTable <- countFt %>%
  mutate(month_year = floor_date(countFt$ClosedDate, "month")) %>%
  group_by(month_year) %>%
  summarize(n =n())
monthGroupTable$Ft <- as.character(monthGroupTable$n)

scatterTrendsTable <- monthGroupTable[, c('month_year', 'n', 'Ft')]
#Cutting first and last row cause they are not complete months
scatterTrendsTable <- scatterTrendsTable %>% slice(2:(n() - 1))

title = "Feature per month"

verticallines <- as.Date(PITABLE$Start)
maxnHalf <- max(scatterTrendsTable$n)/2
minn <- min(scatterTrendsTable$n)

scatterTrend <- ggplot(scatterTrendsTable, aes(x = month_year, y = n, color = n)) +
  scale_x_date(date_labels = "%b%y", date_breaks = "1 month", minor_breaks = "1 week") +
  geom_vline(xintercept=verticallines, linetype="dashed", color = "black") +
  geom_point(shape = 1,size = 3) +
  geom_smooth(method = loess, alpha = 0.1, color = "blue") +
  scale_color_gradientn(colors = c("#FF0000", "#0000FF", "#00FF00")) +
  geom_text_repel(aes(label = Ft), size = 3) + 
  ggtitle(title)

  
plot(scatterTrend)