library(readr)

ISSUES_DT <- read_csv("Export/CSV/Team_Lebowski_IssueTimes.csv",
            col_types = cols(
                                  `Created Date` = col_datetime(format = "%d.%m.%Y %H:%M:%S"),
                                  `First Date` = col_datetime(format = "%d.%m.%Y %H:%M:%S"),
                                  `Closed Date` = col_datetime(format = "%d.%m.%Y %H:%M:%S"),
                                  .default = col_character()
                                  )
                                  )


