# Given data
x <- c(245, 355, 403, 510, 818, 2300)
y1_UpSO <- c(115, 57, 84, 176, 223, 301)
y2_DownSO <- c(216, 117, 153, 255, 279, 414)

# Labels for each point
labels <- c("Ot", "Bd", "Os", "Sv", "Sb", "Zm") 

# Create the plot with the first line (Up-regulated Orthologs)
plot(x, y1_UpSO, type="o", col="pink", lwd=3,
     xlab="Genome size (Mb)", ylab="Gene count", 
     main="", ylim=c(0, 1000))

# Add the second line (Down-regulated Orthologs)
lines(x, y2_DownSO, type="o", col="lightblue", lwd=3)

# Add labels to each data point for all lines
text(x, y1_UpSO, labels=labels, pos=3, col="pink", cex=0.5)
text(x, y2_DownSO, labels=labels, pos=3, col="lightblue", cex=0.5)

# Add a legend
legend("topright", legend=c("Up-regulated Syntenic Orthologs", "Down-regulated Syntenic Orthologs"), 
       col=c("pink", "lightblue"), lty=1, pch=1, lwd=1, cex=0.7)
