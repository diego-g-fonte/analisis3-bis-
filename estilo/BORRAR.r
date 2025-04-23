# install.packages(ggplot2)
library(ggplot2)

ggplot(economics, aes(date, unemploy)) +
  geom_area(fill = rgb(0, 0.5, 1, alpha = 0.5)) +
  geom_smooth() +
  ggtitle("Title of the plot using ggtitle()") 
