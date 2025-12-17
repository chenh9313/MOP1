# Load necessary libraries
library(pheatmap)
library(grid)
#use GO0000302 as an example

data <- read.table("heatmap_data_GOTerm.txt", 
                   header = TRUE,      # First row contains column names
                   sep = "\t",         # Tab-separated file
                   row.names = 1,      # First column as row names
                   check.names = FALSE # Keep column names as is
)

# Optional: convert to matrix
# Format numbers as integers for display
# Convert to numeric matrix for plotting
mat <- as.matrix(data)
number_matrix <- matrix(as.character(mat), nrow = nrow(mat), ncol = ncol(mat))
rownames(number_matrix) <- rownames(mat)
colnames(number_matrix) <- colnames(mat)

#pdf("GO0000302.pdf", width = 12, height = 8)
# Draw the heatmap
pheatmap(mat,
         cluster_rows = TRUE,
         cluster_cols = TRUE,
         display_numbers = number_matrix,  # Matrix of integers as strings
         number_format = "%s",
         color = colorRampPalette(c("white", "blue"))(100),
         main = "GO:0000302 (response to reactive oxygen species)",
         fontsize = 10,
         fontsize_number = 10,
         fontsize_row = 10,
         fontsize_col = 10
)
#dev.off()

