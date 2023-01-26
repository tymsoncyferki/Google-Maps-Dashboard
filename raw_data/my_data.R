library(dplyr)

dfraw <- read.csv("raw_data/december_data_t", encoding = 'UTF-8')


df <- dfraw %>%
  mutate(placeVisit_location_name = case_when(
    grepl("Ceglana", placeVisit_location_address) ~ "Gołków",
    grepl("Widok 19", placeVisit_location_address) ~ "Home",
    grepl("Kołobrzeska 52", placeVisit_location_address) ~ "Konstancin",
    grepl("Czerniakowska 73", placeVisit_location_address) ~ "Magazyn",
    TRUE ~ placeVisit_location_name
  ))

dfraw %>%
  group_by(placeVisit_location_name, placeVisit_location_address) %>%
  summarise(n = n()) %>%
  print(n = 31)

write.csv(df, "raw_data/january_data_t")
