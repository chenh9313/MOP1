# Given data
x <- c(245, 355, 403, 510, 818, 2300)
y1_UpO <- c(333, 336, 405, 448, 479, 600)
y2_DownO <- c(368, 375, 390, 424, 421, 589)
y3_UPSO <- c(115, 57, 84, 176, 223, 301)
y4_DownSO <- c(216, 117, 153, 255, 279, 414)

# Labels for each point
labels <- c("Ot", "Bd", "Os", "Sv", "Sb", "Zm") 

# Create the plot with the first line (Up-regulated Orthologs)
plot(x, y1_UpO, type="o", col="darkred", lwd=2,
     xlab="Genome size (Mb)", ylab="Gene count", 
     main="", ylim=c(0, 1000))

# Add the second line (Down-regulated Orthologs)
lines(x, y2_DownO, type="o", col="deepskyblue4", lwd=2)

# Add the third line (Up-regulated Syntenic Orthologs)
lines(x, y3_UPSO, type="o", col="pink", lwd=2)

# Add the fourth line (Down-regulated Syntenic Orthologs)
lines(x, y4_DownSO, type="o", col="lightblue", lwd=2)

# Add labels to each data point for all lines
text(x, y1_UpO, labels=labels, pos=3, col="darkred", cex=0.5)
text(x, y2_DownO, labels=labels, pos=3, col="deepskyblue4", cex=0.5)
text(x, y3_UPSO, labels=labels, pos=3, col="pink", cex=0.5)
text(x, y4_DownSO, labels=labels, pos=3, col="lightblue", cex=0.5)

# Add a legend
legend("topright", legend=c("Up-regulated Orthologs", "Down-regulated Orthologs", 
                            "Up-regulated Syntenic Orthologs", "Down-regulated Syntenic Orthologs"), 
       col=c("darkred", "deepskyblue4", "pink", "lightblue"), lty=1, pch=1, lwd=1, cex=0.7)
