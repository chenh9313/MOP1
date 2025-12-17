# Read data from file, assuming tab-separated values and header present
data <- read.table("res_SuperFamily_UP_regulated_percentage.txt", header = TRUE, row.names = 1, sep = "")
data
data <- as.matrix(data)

# Color scheme (add more if you have more rows)
my_colors <- c("lemonchiffon", "lightgoldenrod",  # First 2 rows
               "seagreen", "olivedrab", "green2", "green4", "grey")

pdf("Up-SuperFamily_TEtype_Percentage.pdf", width = 10, height = 6)
par(mar = c(8, 4, 4, 2)) #8 gives more space for the bottom
# Plot bar chart
barplot(data, col = my_colors, beside = TRUE, 
        main = "TE Super Families in Up-regulated DEG Genes",
        ylim=c(0,100),
        ylab = "Total TE Content (% of the total up-regulated DEG genes)", cex.names = 0.8, las = 2)

# Add legend
legend(x = "topright", inset = c(0.005, 0), 
       legend = rownames(data), fill = my_colors[1:nrow(data)],
       box.lty = 0, cex = 0.8, xpd = TRUE)
dev.off()


# Read data from file, assuming tab-separated values and header present
data <- read.table("res_SupFamily_DOWN_regulated_pencentage.txt", header = TRUE, row.names = 1, sep = "")

data <- as.matrix(data)

# Color scheme (add more if you have more rows)
my_colors <- c("lemonchiffon", "lightgoldenrod",  # First 2 rows
               "seagreen", "olivedrab", "green2", "green4", "grey")

pdf("Down-SuperFamily_TEtype_Percentage.pdf", width = 10, height = 6)
# Plot bar chart
par(mar = c(8, 4, 4, 2)) 
bp <- barplot(data, col = my_colors, beside = TRUE, width=0.2,
        main = "TE Super Families in Down-regulated DEG Genes",
        ylim=c(0,100),
        ylab = "Total TE Content (% of the total down-regulated DEG genes)", cex.names = 0.8, las = 2)

# Add legend
legend(x = "topright", inset = c(0.005, 0), 
       legend = rownames(data), fill = my_colors[1:nrow(data)],
       box.lty = 0, cex = 0.8, xpd = TRUE)
dev.off()
