# Your original data frame
data <- data.frame(
  Category = c("Total Gene Count","Average Gene Length", "Average Gene Distance"),
  Os = c(38993 ,2949, 7058),
  Bd = c(35125 ,3299, 4896),
  Ot = c(28909 ,2476, 5599),
  Sv = c(38334 ,3066, 8330),
  Sb = c(35567 ,3570, 16668),
  Zm = c(44303 ,4168, 44192)
)

# Convert only numeric columns to a matrix and set row names
data_matrix <- as.matrix(data[, -1])
rownames(data_matrix) <- data$Category

# Define colors
my_colors <- c("grey","pink", "lightblue")

# Create barplot
bp <- barplot(data_matrix, col = my_colors, beside = TRUE, main = "",
              ylab = "", cex.names = 1,
              ylim = c(0, max(data_matrix) * 1.3))  # Slightly higher ylim for labels

# Add numbers on top of each bar
text(x = bp, y = data_matrix, labels = round(data_matrix, 1), pos = 3, cex = 0.4)

# Add legend
legend("topleft", legend = rownames(data_matrix), 
       fill = my_colors, box.lty = 0, cex = 0.6, inset = c(0.01, 0))





