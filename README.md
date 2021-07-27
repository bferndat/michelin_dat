# michelin_dat
Data analysis on Michelin rated restaurants across the world.

For this data analysis project I retrieved a dataset from Kaggle that pertained to Michelin rated restaurants.
Data included expensiveness, location, michelin rating and food type/category.

I first brought the dataset into excel for some minor data cleaning and preliminary analysis.

Then I brought the dataset into SQL (BigQuery).  Here, I compiled all of the tables together into one sheet.
They were originally separated by Michelin Rating (1, 2, 3), so I compiled them into one table for easier analysis.

I then brought this new csv into R to create data visualizations using ggplot2.
Using bar charts I found a few insights.

Most Michelin Rated restaurants are located in the UK, New York, or California.  These are hubs for entertainment and food,
perhaps adding some bias to the restaurant quality.

Also, most of these restaurants had an expensiveness rating of 4/5, thus showing that Michelin Rated restaurants cost a pretty penny to enjoy.

Lastly, most of the cuisine represented was "Modern" cuisine.
