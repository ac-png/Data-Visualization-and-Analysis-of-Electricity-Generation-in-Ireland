# Map

Accomodation_Map <- leaflet(data = Accomodation) %>%
  addTiles() %>%
  addCircleMarkers(lat = ~Latitude, lng = ~Longitude, label = ~paste("Label:", Category), radius = 5)

saveWidget(Accomodation_Map, file = "html/Accomodation-Map.html")

# Map (Adding Colors & Legend)

qpal <- colorFactor("Paired", Accomodation$Category)

Accomodation_Map <- leaflet(data = Accomodation) %>%
  addTiles() %>%
  addCircleMarkers(
    lat = ~Latitude, 
    lng = ~Longitude, 
    label = ~paste("Label:", Category),
    color = ~qpal(Category),
    opacity = 0.5, 
    fillOpacity = 0.2, 
    radius = 2
  ) %>%
  addLegend(pal = qpal, values = ~Category, title = "Accommodation Category")

saveWidget(Accomodation_Map, file = "html/Accomodation-ColouredMap.html")


# Filtered Map

Acc_Donegal <- Accomodation %>%
  filter(County == "Donegal", Category %in% c('Hotel', 'B&B'))

Labels <- paste('<p>', 'Telephone:', Acc_Donegal$Telephone, '<p>', '<p>', 'Website:', '<a href="', Acc_Donegal$Url, '" target="_blank">', Acc_Donegal$Url, '<a>', '<p>')

category_colors <- c("blue", "green")

qpal <- colorFactor(palette = category_colors, domain = Acc_Donegal$Category)

Acc_Donegal %>%
  leaflet() %>%
  addTiles(group = 'Open Street') %>%
  addProviderTiles(providers$SafeCast, group = 'Safecast') %>%
  addCircleMarkers(
    lat = ~Latitude, 
    lng = ~Longitude, 
    label = lapply(Labels, HTML),
    fillColor = ~qpal(Category),
    group = ~Category,
    radius = 5
  ) %>%
  addLegend(pal = qpal, values = ~Category, title = "Category") %>%
  addLayersControl(
    baseGroups = c('Open Street', 'Safecast'),
    overlayGroups = c('Hotel', 'B&B'),
    options = layersControlOptions(collapsed = FALSE)
  ) %>%
  saveWidget(file = "html/Accomodation-FilteredMap.html")
