# Read data from file, assuming tab-separated values and header present
data <- read.table("res_SuperFamily_UP_regulated.txt", header = TRUE, row.names = 1, sep = "")
data
# Convert to matrix and apply log2 transformation
data <- as.matrix(data)
log_data <- log2(data)
log_data[is.infinite(log_data)] <- 0  # Replace -Inf from log2(0) with 0

# Color scheme (add more if you have more rows)
my_colors <- c("lemonchiffon", "lightgoldenrod",  # First 2 rows
               "seagreen", "olivedrab", "green2", "green4", "grey")

pdf("Up-SuperFamily_TEtype.pdf", width = 10, height = 6)
par(mar = c(8, 4, 4, 2)) #8 gives more space for the bottom
# Plot bar chart
barplot(log_data, col = my_colors, beside = TRUE, 
        main = "TE Super Families in Up-regulated Genes",
        ylim=c(0,15),
        ylab = "log2(TEs count)", cex.names = 0.8, las = 2)

# Add legend
legend(x = "topright", inset = c(0.005, 0), 
       legend = rownames(log_data), fill = my_colors[1:nrow(log_data)],
       box.lty = 0, cex = 0.8, xpd = TRUE)
dev.off()


# Read data from file, assuming tab-separated values and header present
data <- read.table("res_SupFamily_DOWN_regulated.txt", header = TRUE, row.names = 1, sep = "")

# Convert to matrix and apply log2 transformation
data <- as.matrix(data)
log_data <- log2(data)
log_data[is.infinite(log_data)] <- 0  # Replace -Inf from log2(0) with 0

# Color scheme (add more if you have more rows)
my_colors <- c("lemonchiffon", "lightgoldenrod",  # First 2 rows
               "seagreen", "olivedrab", "green2", "green4", "grey")

pdf("Down-SuperFamily_TEtype.pdf", width = 10, height = 6)
# Plot bar chart
par(mar = c(8, 4, 4, 2)) 
bp <- barplot(log_data, col = my_colors, beside = TRUE, width=0.2,
        main = "TE Super Families in Down-regulated Genes",
        ylim=c(0,15),
        ylab = "log2(TEs count)", cex.names = 0.8, las = 2)

# Add legend
legend(x = "topright", inset = c(0.005, 0), 
       legend = rownames(log_data), fill = my_colors[1:nrow(log_data)],
       box.lty = 0, cex = 0.8, xpd = TRUE)
dev.off()
