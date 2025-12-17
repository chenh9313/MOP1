library(ggplot2)
library(dplyr)
library(readr)

#Step1
# Read your data
enrich_df <- read.csv("gProfiler_sbicolor.csv")  # Or read.csv if it's CSV
head(enrich_df)

#Step2
# Order terms by significance (log10 p-value) or intersection_size
top_terms <- enrich_df %>%
  arrange(desc(negative_log10_of_adjusted_p_value)) %>%
  slice(1:20)  # take top 20 enriched terms

# Ensure term_name is a factor ordered for better plot
top_terms <- top_terms %>%
  mutate(term_name = factor(term_name, levels = rev(unique(term_name))))

#Step3
ggplot(top_terms, aes(x = intersection_size,
                      y = term_name,
                      size = intersection_size,
                      color = negative_log10_of_adjusted_p_value)) +
  geom_point(alpha = 0.8) +
  scale_color_gradient(low = "blue", high = "red") +
  labs(
    title = "Functional Enrichment Dot Plot",
    x = "Intersection Size (Gene Count)",
    y = "Term",
    color = "-log10 Adjusted P-value",
    size = "Gene Count"
  ) +
  theme_bw(base_size = 14) +
  theme(
    axis.text.y = element_text(size = 12),
    axis.text.x = element_text(size = 12),
    plot.title = element_text(size = 16, face = "bold")
  )

#Step4
#Split by Source (GO:MF, GO:BP, KEGG...)
ggplot(top_terms, aes(x = intersection_size,
                      y = term_name,
                      size = intersection_size,
                      color = negative_log10_of_adjusted_p_value)) +
  geom_point(alpha = 0.8) +
  scale_color_gradient(low = "blue", high = "red") +
  labs(
    title = "Functional Enrichment Dot Plot",
    x = "Intersection Size (Gene Count)",
    y = "Term",
    color = "-log10 Adjusted P-value",
    size = "Gene Count"
  ) +
  facet_wrap(~source, scales = "free_y", ncol = 1) +  # one column per ontology
  theme_bw(base_size = 14) +
  theme(
    axis.text.y = element_text(size = 10),
    axis.text.x = element_text(size = 12),
    plot.title = element_text(size = 16, face = "bold")
  )

