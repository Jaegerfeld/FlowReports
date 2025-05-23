#Korrelationen

# Import metrcs table
library(readxl)
MetricsDT <- read_excel("Export/CSV/Metrics.xlsx")
View(Metrics)

# clean up data
# NA == Zeile nicht berücksichtigen, nur vollständige Daten
workTable <- MetricsDT
workTable <- workTable[!(is.na(workTable$`Work information`)),]


# remove all except KW 28

workTable <- subset(workTable,workTable$KW == "28" )

Artnames <- workTable$ART

workTable$KW <- NULL
workTable$ART <- NULL
rownames(workTable) <- Artnames

#
## correlations diagram

fit <- prcomp(x = workTable, 
              center = TRUE, 
              scale = TRUE)

# plot the results
library(factoextra)
fviz_pca(fit, 
         repel = TRUE, 
         labelsize = 3) + 
  theme_bw() +
  labs(title = "Biplot of Arts data")





