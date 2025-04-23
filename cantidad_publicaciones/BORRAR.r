library(ggplot2)

# Sample data
data <- data.frame(x = 1:10, y = c(2, 4, 3, 6, 8, 7, 9, 11, 10, 13))

# Create the scatterplot with smoothed line
ggplot(data, aes(x, y)) +
  geom_point() + 
  geom_smooth(method = "loess", se = FALSE, size = 2) 

# To adjust the weight (thickness) of the smooth line:
# Change the value of 'size' within geom_smooth()

# Example:
ggplot(data, aes(x, y)) +
  geom_point() + 
  geom_smooth(method = "loess", se = FALSE, size = 1.5)