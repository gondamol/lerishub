#install.packages("tidyverse")
#install.packages("palmerpenguins")

library(palmerpenguins)
library(tidyverse)

ggplot(mpg, aes(displ, hwy))+geom_point(aes(color=manufacturer, shape=fl)) +
  labs {
    title = "Scatter Plot of hwy and displ"
  }

glimpse(mpg)
?ggplot
