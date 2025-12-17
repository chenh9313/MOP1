# Load necessary libraries
library(pheatmap)
library(grid)

data <- read.table("heatmap_data_allSpecies_Down_percentage.txt", 
                   header = TRUE,      # First row contains column names
                   sep = "\t",         # Tab-separated file
                   row.names = 1,      # First column as row names
                   check.names = FALSE # Keep column names as is
)

# Optional: convert to matrix
mat <- as.matrix(data)

pdf("heatmap_Down_percentage.pdf", width = 12, height = 8)
# Draw the heatmap
pheatmap(mat,
         cluster_rows = TRUE,
         cluster_cols = FALSE,
         display_numbers = TRUE,
         color = colorRampPalette(c("white", "blue"))(100),
         main = "Down-regulated: (%) Percentage of Gene Counts / Total Genes Counts ",
         fontsize = 8,
         fontsize_number = 8,
         fontsize_row = 8,
         fontsize_col = 8
)
dev.off()
# Add Y-axis label manually
#grid.text("(%) Percentage of Gene Counts / Total Genes Counts", x = unit(0.02, "npc"), rot = 90, gp = gpar(fontsize = 6))

