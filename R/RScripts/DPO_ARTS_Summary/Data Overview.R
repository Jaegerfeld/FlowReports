# Biplot Cycletime

Artnames <- c("APPART","MSF","Datona","PCOM","D07China","PX057","PCVCC", "Skywaypro", "Propo","D02","D05/2 ", "FITDATAAI","D06") 
rownames(Summary_ARTS) <- Artnames
fit <- prcomp(x = Summary_ARTS, 
              center = TRUE, 
              scale = TRUE)

# plot the results
library(factoextra)
fviz_pca(fit, 
         repel = TRUE, 
         labelsize = 3) + 
  theme_bw() +
  labs(title = "Biplot of Arts data")