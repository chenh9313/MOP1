# Your fixed data
data <- data.frame(
  Category = c("Up-regulated Orthologs", "Down-regulated Orthologs", "Up-regulated Syntenic Orthologs", "Down-regulated Syntenic Orthologs"),
  Os = c(405, 390, 84, 153),
  Bd = c(336, 375, 57, 117),
  Ot = c(333, 368, 115, 216),
  Sv = c(448, 424, 176, 255),
  Sb = c(479, 421, 223, 279),
  Zm = c(600, 589, 301, 414),
  Zm_ref = c(327, 390, 247, 346)
)

# Create a matrix for the barplot
data_matrix <- as.matrix(data[, -1]) 

pdf("Fig3-RdDM_DEG_orth_syntenic_new.pdf", width = 12, height = 8)
# Create the barplot and store the bar midpoints
#par(font.axis = 2)
bar_midpoints <- barplot(data_matrix,
                         main = "DEGs targeted by the RdDM pathway",
                         xlab = "Species",
                         ylab = "Gene Count",
                         ylim = c(0, 900),
                         beside = TRUE,
                         col = c("darkred", "deepskyblue4", "pink", "lightblue"),
                         names.arg = c("Os", "Bd", "Ot", "Sv", "Sb", "Zm", "Zm_ABA_RdDM"),
                         #las = 2,
                         cex.names = 1.2,     # Shrink x-axis labels
                         cex.lab = 1,       # Shrink axis labels
                         cex.main = 1)

# Add numbers on top of each bar
# Loop through each row (category) and place the corresponding label on each bar
for (i in 1:nrow(data_matrix)) {
  text(x = bar_midpoints[i, ],
       y = data_matrix[i, ] + 20,   # Offset text a bit above the bar
       labels = data_matrix[i, ],
       cex = 1,
       col = "black")
}

# Add legend
legend("topright", 
       legend = data$Category,
       fill = c("darkred", "deepskyblue4", "pink", "lightblue"),
       bty = "n",
       cex=1.2)
dev.off()
