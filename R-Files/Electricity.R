# Line Graph

Line <- ggplot(Electricity, aes(Month, Values, color = Type)) +
  geom_line(size = .5) +
  xlab("Month") +
  ylab("Values") +
  ggtitle("Line Graph of Electricity") +
  theme_minimal()

ggplotly(Line)

Line <- plotly::ggplotly(Line)
saveWidget(Line, file = "html/Electricity-Line.html")

# Stacked Bar Chart

Stacked <- ggplot(Electricity, aes(x = Month, y = Values, fill = Type)) +
  geom_bar(stat = "identity") +
  scale_fill_brewer(palette = "Set3") +
  ggtitle("Stacked Bar Chart of Electricity")

ggplotly(Stacked)

Stacked <- plotly::ggplotly(Stacked)
saveWidget(Stacked, file = "html/Electricity-Stacked.html")

# Bar Chart

Bar <- ggplot(Electricity, aes(Type, Values, fill = Type)) +
  geom_bar(stat = "identity") +
  ggtitle("Bar Chart of Electricity") +
  coord_flip()

ggplotly(Bar)

Bar <- plotly::ggplotly(Bar)
saveWidget(Bar, file = "html/Electricity-Bar.html")
