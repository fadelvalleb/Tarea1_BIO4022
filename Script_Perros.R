library(tidyverse)
library(ggplot2)


Perros <- Pantheria_DB %>% select(MSW05_Genus, X5.1_AdultBodyMass_g, MSW05_Binomial) %>%
  group_by(MSW05_Genus) %>% filter(MSW05_Genus == "Canis") %>% 
  rename(Especie = MSW05_Binomial, Peso= X5.1_AdultBodyMass_g) %>% 
  mutate(Peso_en_Kg = Peso/1000)

ggplot(Perros, aes(Especie,Peso_en_Kg)) + geom_point()
