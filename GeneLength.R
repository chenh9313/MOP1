
par(mfrow = c(3, 2))

#Os
data_Os <- read.table("Os_genelength.txt")
data_Os <- as.matrix(data_Os)
hist(data_Os,
     col = "lemonchiffon",   # Use the corresponding color
     main = "Oryza sativa (Os)",cex.main = 1,
     ylim = c(0, 50000),xlab = "Gene Length", ylab = "Gene Count")
mean(data_Os)
write.table(mean(data_Os),file="res_aveGeneLength_Os.txt")

#Bd
data_Bd <- read.table("Bd_genelength.txt")
data_Bd <- as.matrix(data_Bd)
hist(data_Bd,
     col = "lightgoldenrod",   # Use the corresponding color
     main = "Brachypodium distachyon (Bd)",cex.main = 1,
     ylim = c(0, 50000),xlab = "Gene Length", ylab = "Gene Count")
mean(data_Bd)
write.table(mean(data_Bd),file="res_aveGeneLength_Bd.txt")

#Ot
data_Ot <- read.table("Ot_genelength.txt")
data_Ot <- as.matrix(data_Ot)
hist(data_Ot,
     col = "seagreen",   # Use the corresponding color
     main = "Oropetium thomaeum (Ot)",cex.main = 1,
     ylim = c(0, 50000),xlab = "Gene Length", ylab = "Gene Count")
mean(data_Ot)
write.table(mean(data_Ot),file="res_aveGeneLength_Ot.txt")

#Sv
data_Sv <- read.table("Sv_genelength.txt")
data_Sv <- as.matrix(data_Sv)
hist(data_Sv,
     col = "olivedrab",   # Use the corresponding color
     main = "Setaria viridis (Sv)",cex.main = 1,
     ylim = c(0, 50000),xlab = "Gene Length", ylab = "Gene Count")
mean(data_Sv)
write.table(mean(data_Sv),file="res_aveGeneLength_Sv.txt")

#Sb
data_Sb <- read.table("Sb_genelength.txt")
data_Sb <- as.matrix(data_Sb)
hist(data_Sb,
     col = "green2",   # Use the corresponding color
     main = "Sorghum bicolor (Sb)",cex.main = 1,
     ylim = c(0, 50000),xlab = "Gene Length", ylab = "Gene Count")
mean(data_Sb)
write.table(mean(data_Sb),file="res_aveGeneLength_Sb.txt")

#Zm
data_Zm <- read.table("Zm_genelength.txt")
data_Zm <- as.matrix(data_Zm)
hist(data_Zm,
     col = "green4",   # Use the corresponding color
     main = "Zea mays (Zm)",cex.main = 1,
     ylim = c(0, 50000),xlab = "Gene Length", ylab = "Gene Count")
mean(data_Zm)
write.table(mean(data_Zm),file="res_aveGeneLength_Zm.txt")

