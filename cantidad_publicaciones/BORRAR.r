# Example data (your vector of 50 data points)
data <- rnorm(50)  # replace this with your actual data vector

# Convert the vector into a data frame
df <- data.frame(values = data)

# Plot the histogram
ggplot(df, aes(x = values)) +
  geom_histogram(binwidth = 0.5, fill = "blue", color = "black") +
  theme_minimal() +
  labs(title = "Histogram of Data", x = "Values", y = "Frequency")