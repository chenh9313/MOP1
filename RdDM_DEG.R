# Your data
data <- data.frame(
  Category = c("Up-regulated Gene", "Down_regulated Gene"),
  Os = c(405, 390),
  Bd = c(336, 375),
  Ot = c(333, 368),
  Sv = c(448, 424),
  Sb = c(479, 421),
  Zm = c(600, 589),
  Zm_ref = c(327, 390)
)

# Create a matrix for the barplot
data_matrix <- as.matrix(data[, -1]) 

# Create the barplot and store the bar midpoints
bar_midpoints <- barplot(data_matrix,
                         main = "DEG from Orthologs",
                         xlab = "Species",
                         ylab = "Gene Count",
                         ylim = c(0,1500),
                         axes = TRUE,
                         col = c("darkred", "deepskyblue4"),
                         names.arg = c("Os", "Bd", "Ot","Sv","Sb","Zm","Zm_RdDM"))

# Add numbers on top of each bar
text(x = bar_midpoints, 
     y = data_matrix[1, ] + 50, 
     labels = data_matrix[1, ], 
     col = "black", 
     cex = 0.8)

text(x = bar_midpoints, 
     y = data_matrix[1, ] + data_matrix[2, ] + 50, 
     labels = data_matrix[2, ], 
     col = "black", 
     cex = 0.8)

# Add a legend
legend("topright", 
       legend = c("Up-regulated", "Down-regulated"),
       fill = c("darkred", "deepskyblue4"),
       bty = "n")
