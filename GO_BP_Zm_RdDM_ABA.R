library(ggplot2)
library(dplyr)
library(readr)

#Step1
# Read your data
enrich_df <- read.csv("gProfiler_zmays_ZmRdDM_Ref_Down.csv")  # Or read.csv if it's CSV
head(enrich_df)

#Step2
# Order terms by significance (log10 p-value) or intersection_size
top_terms <- enrich_df %>%
  arrange(desc(negative_log10_of_adjusted_p_value)) #%>%
  #slice(1:20)  # take top 20 enriched terms

# Ensure term_name is a factor ordered for better plot
top_terms <- top_terms %>%
  mutate(term_name = factor(term_name, levels = rev(unique(term_name))))

#only have BP
#filter to GO:BP only
bp_terms <- enrich_df %>%
  filter(source == "GO:BP")

top_bp <- bp_terms %>%
  arrange(desc(negative_log10_of_adjusted_p_value)) %>%
  #  slice(1:20) %>%
  mutate(term_name = factor(term_name, levels = rev(term_name)))

top_bp <- bp_terms %>%
  mutate(gene_ratio_str = paste0(intersection_size, "/", query_size)) %>%
  arrange(desc(negative_log10_of_adjusted_p_value)) %>%
  mutate(term_name = factor(term_name, levels = rev(term_name)))

pdf("Down_GO_BP_plot_Zm_RdDM.pdf", width = 10, height = 8)
ggplot(top_bp, aes(x = factor(gene_ratio_str, levels = unique(gene_ratio_str)),
                   y = term_name,
                   size = intersection_size,
                   color = negative_log10_of_adjusted_p_value)) +
  geom_point(alpha = 0.8) +
  #scale_color_gradient(low = "blue", high = "red") +
  labs(
    title = "Zea mays (RdDM_Ref) (Down-regulated)",
    x = "Gene Count / Total Gene Count",
    y = "GO Biological Process Enrichment",
    color = "-log10 Adjusted P-value",
    size = "Gene Count"
  ) +
  theme_bw(base_size = 12) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 10),
    axis.text.y = element_text(size = 12),
    plot.title = element_text(size = 10, face = "bold", hjust = 0.5)
  )
dev.off()