library(readr)
#default location : /Export/CSV/ , CycleTime Table for most of the reports
# 1line per Feature, 1 column per Status mentioned in the workflow file
filepath_Import <- gsub(" ", "", paste("Export/CSV/",teamname,"_IssueTimes.csv"))

Features_DT <- read_csv(filepath_Import,
            col_types = cols(
                                  `Created Date` = col_datetime(format = "%d.%m.%Y %H:%M:%S"),
                                  `First Date` = col_datetime(format = "%d.%m.%Y %H:%M:%S"),
                                  `Closed Date` = col_datetime(format = "%d.%m.%Y %H:%M:%S"),
                                  .default = col_character()
                                  )
                                  )

#default location : /Export/CSV/ , Distribution of status for every past day , last 5 years
# 1 line per day, count of entries in that status on that day, needed for CFD diagram
filepath_ImportCFD <- gsub(" ", "", paste("Export/CSV/",teamname,"_CFD.csv"))
FeaturesCFD_DT <- read_csv(filepath_ImportCFD,
                           col_types = cols(
                             `Day` = col_date(format = "%d.%m.%Y"),
                             .default = col_character()
                           )
)

# copy feature tabel for further use (backup of original table if needed)
Features_ALL_DT <- Features_DT
