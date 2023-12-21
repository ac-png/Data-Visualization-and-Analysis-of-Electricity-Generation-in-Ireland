MotorInsurance <- ggplot(Motor$data) +
  geom_mosaic(aes(weight = FinancialValues, x = product(Company, Policies), fill = Company), divider = ddecker("h"))

ggplotly(MotorInsurance)

MotorInsurance <- plotly::ggplotly(MotorInsurance)
saveWidget(MotorInsurance, file = "html/MotorInsurance.html")