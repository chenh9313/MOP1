#install.packages("BiocManager")
#BiocManager::install("WGCNA",force = TRUE)

library(WGCNA)
options(stringsAsFactors = FALSE)

setwd("~/PATH/")
#Step1: Prepare your data
# Example loading expression data
datExpr <- read.table("expression_data.txt", row.names = 1)
datExpr <- as.data.frame(t(datExpr))  # transpose: WGCNA wants samples in rows
datExpr <- data.frame(lapply(datExpr, as.numeric), row.names = rownames(datExpr))

#Step2: Quality check
gsg <- goodSamplesGenes(datExpr, verbose = 3)
if (!gsg$allOK) {
  datExpr <- datExpr[gsg$goodSamples, gsg$goodGenes]
}

#Step3: Choose Soft Threshold (Power)
powers <- c(1:20)
sft <- pickSoftThreshold(datExpr, powerVector = powers, verbose = 5)
#plot(sft$fitIndices[,1], -sign(sft$fitIndices[,3]) * sft$fitIndices[,2],
#     xlab = "Soft Threshold (power)", ylab = "Scale Free Topology Model Fit")
sft

# Extract the scale-free fit (R^2) values
fitIndices <- sft$fitIndices
# Compute the signed R^2 used in the plot
signedR2 <- -sign(fitIndices[, "slope"]) * fitIndices[, "SFT.R.sq"]
# Find the index of the max R^2
bestIndex <- which.max(signedR2)
# Get the corresponding power
bestPower <- fitIndices[bestIndex, "Power"]
bestR2 <- signedR2[bestIndex]
# Print result
cat("Best power is:", bestPower, "with R^2 =", round(bestR2, 3), "\n")

plot(sft$fitIndices[,1], 
     -sign(sft$fitIndices[,3]) * sft$fitIndices[,2],
     xlab = "Soft Threshold (power)",
     ylab = "Scale Free Topology Model Fit",
     type = "n")  # set up the plot without points first
text(sft$fitIndices[,1], 
     -sign(sft$fitIndices[,3]) * sft$fitIndices[,2],
     labels = powers, cex = 0.9, col = "blue")
points(sft$fitIndices[,1], 
       -sign(sft$fitIndices[,3]) * sft$fitIndices[,2],
       pch = 20, col = "blue")
abline(h = 0.8, col = "red", lty = 2)
#abline(h = 0.7, col = "red", lty = 2)
#abline(h = 0.5, col = "red", lty = 2)


#Step4: Pick the smallest power where scale-free topology R² > 0.8.
softPower <- 16  # Example choice

#Step 5: Build Network and Identify Modules
adjacency <- adjacency(datExpr, power = softPower)
TOM <- TOMsimilarity(adjacency)
dissTOM <- 1 - TOM

geneTree <- hclust(as.dist(dissTOM), method = "average")
plot(geneTree)

pdf("gene_dendrogram_Up.pdf", width = 12, height = 9)
plot(geneTree, main = "Gene Clustering Dendrogram")
dev.off()

dynamicMods <- cutreeDynamic(dendro = geneTree, distM = dissTOM,
                             deepSplit = 2, pamRespectsDendro = FALSE,
                             minClusterSize = 10)
moduleColors <- labels2colors(dynamicMods)
plotDendroAndColors(geneTree, moduleColors, "Dynamic Tree Cut")


#Step6: Calculate Module Eigengenes and Correlate with Traits (Optional)
MEList <- moduleEigengenes(datExpr, colors = moduleColors)
MEs <- MEList$eigengenes
MEs
colnames(MEs)

# Step 3: Calculate module membership (kME)
# This is simply the Pearson correlation between each gene and each module eigengene
kMEtable <- as.data.frame(cor(datExpr, MEs, use = "p"))
kMEtable
# Optionally, get p-values
kME_pvalues <- as.data.frame(corPvalueStudent(as.matrix(kMEtable), nSamples = nrow(datExpr)))
kME_pvalues

# Optional: correlate modules with traits (e.g., stress, tissue type)
traitData <- read.csv("sample_traits.csv", row.names = 1,sep = ",")
traitData
traitData$Genotype <- as.numeric(factor(traitData$Genotype))
traitData$Condition <- as.numeric(factor(traitData$Condition))
# Check the updated data
str(traitData)

moduleTraitCor <- cor(MEs, traitData, use = "p")
moduleTraitCor

# For example, pick "blue" module
module <- "blue"
modGenes <- moduleColors == module
modGenes

# Extract gene names (column names of datExpr)
genesInModule <- colnames(datExpr)[modGenes]
# Print them
print(genesInModule)

allModules <- gsub("^ME", "", colnames(MEs))
allModules

# Loop through each module
for (module in allModules) {
  cat("\n========== MODULE:", module, "==========\n")
  
  modGenes <- moduleColors == module
  
  # Use colnames or rownames depending on your data structure
  genesInModule <- colnames(datExpr)[modGenes]
  
  print(genesInModule)
  #fileName <- paste0(module, "_module_genes.txt")
  fileName <- paste0("up_module_genes_",module,".txt")
  write.table(genesInModule, file = fileName,
              row.names = FALSE, col.names = FALSE, quote = FALSE)
}

#Step 7: Identify Hub Genes in a Module
# Calculate module membership (kME)
kME <- signedKME(datExpr, MEs)
kME
hubGenes <- names(sort(kME[modGenes, paste0("kME", module)], decreasing = TRUE))[1:10]
print(hubGenes)

#Blue model
sorted_kMEblue_df <- data.frame(Gene = rownames(kME), kMEblue = kME[, "kMEblue"])
sorted_kMEblue_df <- sorted_kMEblue_df[order(-sorted_kMEblue_df$kMEblue), ]
head(sorted_kMEblue_df, 10)

# Define the modules of interest
modules <- c("blue", "yellow")

# Loop through each module
for (module in modules) {
  # Dynamically create the column name for kME (e.g., "kMEblue", "kMEbrown")
  kME_colname <- paste0("kME", module)
  # Create a data frame with gene names and their kME values for the current module
  sorted_df <- data.frame(Gene = rownames(kME), kME = kME[, kME_colname])
  # Sort the data frame by kME value in decreasing order
  sorted_df <- sorted_df[order(-sorted_df$kME), ]
  # Get the top 10 hub genes
  top_hub_genes <- head(sorted_df, 10)
  # Print the result
  cat("module:", module, "\n")
  print(top_hub_genes)
}


#Get P_value
#Get P_Value
# Define your modules of interest
modules <- c("blue", "brown", "green", "yellow")

# Initialize a list to store results
top_genes_per_module <- list()

# Loop through each module
for (module in modules) {
  kME_col <- paste0("ME", module)
  
  # Skip if column is missing
  if (!(kME_col %in% colnames(kMEtable))) {
    warning(paste("Module", module, "not found in kMEtable. Skipping."))
    next
  }
  
  # Get kME and p-values for all genes in this module
  kME_vals <- kMEtable[[kME_col]]
  p_vals <- kME_pvalues[[kME_col]]
  gene_names <- rownames(kMEtable)
  
  # Create data frame
  df <- data.frame(Gene = gene_names, kME = kME_vals, p_value = p_vals)
  
  # Sort by descending kME
  top_genes <- df[order(-df$kME), ][1:10, ]
  
  # Store results
  top_genes_per_module[[module]] <- top_genes
  
  # Print
  cat("\nTop 10 genes for module", module, ":\n")
  print(top_genes)
}
