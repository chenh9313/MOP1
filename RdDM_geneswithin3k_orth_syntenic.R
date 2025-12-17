# Your fixed data
data <- data.frame(
  Category = c("Up-regulated Syntenic Orthologs", "Up-regulated Syntenic Orthologs with Upstream 3KB Genes", "Down-regulated Syntenic Orthologs", "Down-regulated Syntenic Orthologs with Upstream 3KB Genes"),
  Os = c(84, 35, 153, 60),
  Bd = c(57, 40, 117, 63),
  Ot = c(115, 66, 216, 122),
  Sv = c(176, 92, 255, 134),
  Sb = c(223, 96, 279, 119),
  Zm = c(301, 73, 414, 126),
  Zm_ABA = c(247, 63, 346, 103)
)

# Create a matrix for the barplot
data_matrix <- as.matrix(data[, -1]) 

# Create the barplot and store the bar midpoints
bar_midpoints <- barplot(data_matrix,
                         main = "DEG from Syntenic Orthologs",
                         xlab = "Species",
                         ylab = "Gene Count",
                         ylim = c(0, 1000),
                         beside = TRUE,
                         col = c("pink", "pink4", "lightblue", "lightskyblue4"),
                         names.arg = c("Os", "Bd", "Ot", "Sv", "Sb", "Zm", "Zm_ABA"))

# Add numbers on top of each bar
# Loop through each row (category) and place the corresponding label on each bar
for (i in 1:nrow(data_matrix)) {
  text(x = bar_midpoints[i, ],
       y = data_matrix[i, ] + 20,   # Offset text a bit above the bar
       labels = data_matrix[i, ],
       cex = 0.7,
       col = "black")
}

# Add legend
legend("topright", 
       legend = data$Category,
       fill = c("pink", "pink4", "lightblue", "lightskyblue4"),
       bty = "n",
       cex = 0.8)
