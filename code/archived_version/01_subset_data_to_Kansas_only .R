# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from Kansas only
# and then write out a csv file that only has that subset

# Andrae Ladores
# vcladores@dons.usfca.edu
# February 8, 2021

# read in the complete csv file
all_covid_data <- read.csv("data/raw_data/applemobilitytrends-2021-02-05.csv")

# subset the dataset to only include rows where the sub.region column has
# "Kansas" in it while having all columns.
# Be careful to exclude "Arkansas"!
kansas_data <- all_covid_data[all_covid_data$sub.region == "Kansas", ]

# save the Kansas data into a new csv file in the output directory
write.csv(kansas_data, file = "output/kansas_apple_mobility_data.csv")
