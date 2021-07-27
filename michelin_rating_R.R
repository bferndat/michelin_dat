#SQL Query combines three different sheets that were seperated by Michelin star rating into one master sheet

#SELECT name, year, latitude, longitude, city, region, zipCode, cuisine, price, '1' AS MichelinRate
#FROM `st-sql-data-sizes.mich_rest.one_star`
#UNION ALL 
#SELECT name, year, latitude, longitude, city, region, zipCode, cuisine, price, '2' AS MichelinRate
#FROM `st-sql-data-sizes.mich_rest.two_star`
#UNION ALL
#SELECT name, year, latitude, longitude, city, region, zipCode, cuisine, price, '3' AS MichelinRate
#FROM `st-sql-data-sizes.mich_rest.three_star`
#ORDER BY price;

#loading necessary packages
library(tidyverse)
library(ggplot2)
install.packages('naniar')
library(naniar)

#import csv
mich <- read.csv("~/R data projects/michelin_rating_combined.csv")
View(mich)

#convert $ price rating to numerical value
mich1<- mich %>% 
  replace_with_na(replace = list(price = 'N/A')) %>% #handle N/A c=values so they aren't counted in new column
  mutate(priceRate = nchar(price))

View(mich1)
tail(mich1)

#Plot 1, bar plot of amount of restaurants per price rating (originally in $'s but converted to num scale)
ggplot(data = mich1) + 
  geom_bar(aes(x = priceRate), fill = 'red') +
  labs(x = 'Price Rating', y = 'Count', title = 'Number of Michelin Rated Restaurants by Expensiveness')

#Plot 2, bar plot of amount of restaurants per region
ggplot(data = mich1) +
  geom_bar(aes(x = region), fill = 'steelblue', na.rm = FALSE) +
  labs(x = 'Region', y = 'Count', title = 'Number of Michelin Rated Restaurants by Region') +
  coord_flip()

#Plot 3, bar plot of amount of restaurants per cuisine type
ggplot(data = mich1) +
  geom_bar(aes(x = cuisine), fill = 'brown') +
  labs(x = 'Cuisine Type', y = 'Count', title = 'Number of Michelin Rated Restaurants by Cuisine Type') +
  coord_flip()


