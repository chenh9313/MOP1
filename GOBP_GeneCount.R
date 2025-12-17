# Create the data
species <- c("Os", "Bd", "Ot", "Sv", "Sb", "Zm", "Zm_RdDM")
gene_counts <- c(11, 16, 17, 13, 27, 33, 32)

# Optional: choose distinct colors
bar_colors <- c("lemonchiffon", "lightgoldenrod", "seagreen", "olivedrab", "green2", "green4", "grey")

# Create the bar plot
bar_midpoints <- barplot(gene_counts,
        names.arg = species,
        col = bar_colors,
        main = "Gene Count per Species in Response to Heat (GO:0009408)",
        ylab = "Gene Count",
        ylim = c(0, max(gene_counts) + 5),
        cex.names = 0.9,
        cex.main = 0.9,
        las = 2)  # Rotate x-axis labels vertically for readability

# Add text labels on top of bars
text(x = bar_midpoints, y = gene_counts + 1, 
     labels = gene_counts, 
     cex = 0.8, col = "black")
