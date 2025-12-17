
par(mfrow = c(3, 3))

#Os
data_Os <- read.table("res_GeneDistance_within3KB_UpDown_RdDM_Os.txt")
data_Os <- as.matrix(data_Os[[2]])
h <- hist(data_Os,
     col = "lemonchiffon",   # Use the corresponding color
     main = "Oryza sativa (Os)",cex.main = 1,
     ylim = c(0, 200),xlab = "Distance (bp)", ylab = "Gene Count")
mean(data_Os)
# Add text labels on top of each bar
text(x = h$mids,                     # x positions (midpoints of bars)
     y = h$counts,                   # y positions (bar heights)
     labels = h$counts,              # labels (bar counts)
     pos = 3,                        # position (above the bar)
     cex = 0.8,                      # text size
     col = "black")                  # text color

#Bd
data_Bd <- read.table("res_GeneDistance_within3KB_UpDown_RdDM_Bd.txt")
data_Bd <- as.matrix(data_Bd[[2]])
h <- hist(data_Bd,
     col = "lightgoldenrod",   # Use the corresponding color
     main = "Brachypodium distachyon (Bd)",cex.main = 1,
     ylim = c(0, 200),xlab = "Distance (bp)", ylab = "Gene Count")
mean(data_Bd)
# Add text labels on top of each bar
text(x = h$mids,                     # x positions (midpoints of bars)
     y = h$counts,                   # y positions (bar heights)
     labels = h$counts,              # labels (bar counts)
     pos = 3,                        # position (above the bar)
     cex = 0.8,                      # text size
     col = "black")                  # text color

#Ot
data_Ot <- read.table("res_GeneDistance_within3KB_UpDown_RdDM_Ot.txt")
data_Ot <- as.matrix(data_Ot[[2]])
h <- hist(data_Ot,
     col = "seagreen",   # Use the corresponding color
     main = "Oropetium thomaeum (Ot)",cex.main = 1,
     ylim = c(0, 200),xlab = "Distance (bp)", ylab = "Gene Count")
mean(data_Ot)
# Add text labels on top of each bar
text(x = h$mids,                     # x positions (midpoints of bars)
     y = h$counts,                   # y positions (bar heights)
     labels = h$counts,              # labels (bar counts)
     pos = 3,                        # position (above the bar)
     cex = 0.8,                      # text size
     col = "black")                  # text color

#Sv
data_Sv <- read.table("res_GeneDistance_within3KB_UpDown_RdDM_Sv.txt")
data_Sv <- as.matrix(data_Sv[[2]])
h <- hist(data_Sv,
     col = "olivedrab",   # Use the corresponding color
     main = "Setaria viridis (Sv)",cex.main = 1,
     ylim = c(0, 200),xlab = "Distance (bp)", ylab = "Gene Count")
mean(data_Sv)
# Add text labels on top of each bar
text(x = h$mids,                     # x positions (midpoints of bars)
     y = h$counts,                   # y positions (bar heights)
     labels = h$counts,              # labels (bar counts)
     pos = 3,                        # position (above the bar)
     cex = 0.8,                      # text size
     col = "black")                  # text color

#Sb
data_Sb <- read.table("res_GeneDistance_within3KB_UpDown_RdDM_Sb.txt")
data_Sb <- as.matrix(data_Sb[[2]])
h <- hist(data_Sb,
     col = "green2",   # Use the corresponding color
     main = "Sorghum bicolor (Sb)",cex.main = 1,
     ylim = c(0, 200),xlab = "Distance (bp)", ylab = "Gene Count")
mean(data_Sb)
# Add text labels on top of each bar
text(x = h$mids,                     # x positions (midpoints of bars)
     y = h$counts,                   # y positions (bar heights)
     labels = h$counts,              # labels (bar counts)
     pos = 3,                        # position (above the bar)
     cex = 0.8,                      # text size
     col = "black")                  # text color

#Zm
data_Zm <- read.table("res_GeneDistance_within3KB_UpDown_RdDM_Zm.txt")
data_Zm <- as.matrix(data_Zm[[2]])
h <- hist(data_Zm,
     col = "green4",   # Use the corresponding color
     main = "Zea mays (Zm)",cex.main = 1,
     ylim = c(0, 200),xlab = "Distance (bp)", ylab = "Gene Count")
mean(data_Zm)
# Add text labels on top of each bar
text(x = h$mids,                     # x positions (midpoints of bars)
     y = h$counts,                   # y positions (bar heights)
     labels = h$counts,              # labels (bar counts)
     pos = 3,                        # position (above the bar)
     cex = 0.8,                      # text size
     col = "black")                  # text color

#Zm_ABA
data_Zm <- read.table("res_GeneDistance_within3KB_UpDown_RdDM_Zm_ABA_RdDM.txt")
data_Zm <- as.matrix(data_Zm[[2]])
h <- hist(data_Zm,
          col = "grey",   # Use the corresponding color
          main = "Zea mays (Zm_ABA)",cex.main = 1,
          ylim = c(0, 200),xlab = "Distance (bp)", ylab = "Gene Count")
mean(data_Zm)
# Add text labels on top of each bar
text(x = h$mids,                     # x positions (midpoints of bars)
     y = h$counts,                   # y positions (bar heights)
     labels = h$counts,              # labels (bar counts)
     pos = 3,                        # position (above the bar)
     cex = 0.8,                      # text size
     col = "black")                  # text color

# Add a main title for the whole grid
mtext("Gene Distance for Genes Targeted by RdDM Pathway (within 3KB)",
      outer = TRUE,        # Place the title outside individual plots
      cex = 1,           # Text size
      line = -1.5,           # Move the title slightly closer to the plots
      font = 2)            # Bold text
