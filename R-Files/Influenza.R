# Boxplot

Boxplot <- ggplot(Influenza, aes("", Age, color = PatientType)) +
  geom_boxplot(outlier.shape = NA) +
  labs(title = "Age of Patients with Influenza", x = "", y = "Age") +
  facet_grid(PatientType ~ Disease * Gender, scales = "free")

ggplotly(Boxplot)

Boxplot <- plotly::ggplotly(Boxplot)
saveWidget(Boxplot, file = "html/Influenza-Boxplot.html")

# Jitterplot

Jitterplot <- ggplot(Influenza, aes(x = "", y = Age, fill = PatientType, color = PatientType)) +
  geom_jitter(alpha = 1, size = 0.75) +
  labs(title = "Age of Patients with Influenza", x = "", y = "Age") +
  facet_grid(PatientType ~ Disease * Gender, scales = "free")

ggplotly(Jitterplot)

Jitterplot <- plotly::ggplotly(Jitterplot)
saveWidget(Jitterplot, file = "html/Influenza-Jitterplot.html")

# Histogram

Histogram <- ggplot(Influenza, aes(x = Age, fill = PatientType)) +
  geom_histogram(bins = 10) +
  facet_grid(PatientType ~ Disease * Gender, scales = "free")

ggplotly(Histogram)

Histogram <- plotly::ggplotly(Histogram)
saveWidget(Histogram, file = "html/Influenza-Histogram.html")