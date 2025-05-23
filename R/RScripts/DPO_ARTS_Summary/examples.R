# create a biplot
# load data
data(mtcars)

# fit a principal components model
fit <- prcomp(x = mtcars, 
              center = TRUE, 
              scale = TRUE)

# plot the results
library(factoextra)
fviz_pca(fit, 
         repel = TRUE, 
         labelsize = 3) + 
  theme_bw() +
  labs(title = "Biplot of mtcars data")