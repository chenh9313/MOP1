# Read data from file, assuming tab-separated values and header present
data <- read.table("res_SupFamily_regulated_percentage.txt", header = TRUE, row.names = 1, sep = "")
data
# Convert to matrix and apply log2 transformation
data <- as.matrix(data)
data

# Color scheme (add more if you have more rows)
my_colors <- c("lemonchiffon", "lightgoldenrod",  # First 2 rows
               "seagreen", "olivedrab", "green2", "green4")

pdf("Allgene_3KB_SuperFamily_TEtype_percentage.pdf", width = 10, height = 6)
par(mar = c(8, 4, 4, 2)) #8 gives more space for the bottom
# Plot bar chart
barplot(data, col = my_colors, beside = TRUE, 
        main = "Proportion of Class I (Retrotransposition) and Class II (DNA Transposition) TE Super Families in Plants",
        ylim=c(0,100),
        ylab = "Total TE Content (% of the total genes)", cex.names = 0.8, las = 2)

# Add legend
legend(x = "topright", inset = c(0.005, 0), 
       legend = rownames(log_data), fill = my_colors[1:nrow(log_data)],
       box.lty = 0, cex = 0.8, xpd = TRUE)
dev.off()

