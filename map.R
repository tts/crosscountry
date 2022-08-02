library(sf)
library(tidyverse)
library(leaflet)

saariselka_2022_01_17 <- read_sf("1_17_22 15_04.gpx", layer = "track_points") %>% 
  separate(col = time, into = c("date", "timepoint"), sep = " ", remove = FALSE) %>% 
  st_combine() %>%
  st_cast(to = "LINESTRING") %>%
  st_sf()

saariselka_2022_01_18 <- read_sf("1_18_22 12_55.gpx", layer = "track_points") %>% 
  separate(col = time, into = c("date", "timepoint"), sep = " ", remove = FALSE) %>% 
  st_combine() %>%
  st_cast(to = "LINESTRING") %>%
  st_sf()

saariselka_2022_01_19 <- read_sf("1_19_22 10_29.gpx", layer = "track_points") %>% 
  separate(col = time, into = c("date", "timepoint"), sep = " ", remove = FALSE) %>% 
  st_combine() %>%
  st_cast(to = "LINESTRING") %>%
  st_sf()

saariselka_2022_01_20 <- read_sf("1_20_22 10_30.gpx", layer = "track_points") %>% 
  separate(col = time, into = c("date", "timepoint"), sep = " ", remove = FALSE) %>% 
  st_combine() %>%
  st_cast(to = "LINESTRING") %>%
  st_sf()

map_leaflet <- leaflet() %>%
  addProviderTiles(providers$Stamen.Toner) %>% 
  addPolylines(data = saariselka_2022_01_17, color = "black", opacity = 0.3) %>% 
  addPolylines(data = saariselka_2022_01_18, color = "gray", opacity = 0.3) %>% 
  addPolylines(data = saariselka_2022_01_19, color = "magenta", opacity = 0.3) %>% 
  addPolylines(data = saariselka_2022_01_20, color = "orange", opacity = 0.3)

mapview::mapshot(map_leaflet, file = "saariselka.png")

