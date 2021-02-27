# goal of this script is to use dplyr package to count up the number
# of cities and counties in a state that have detailed Apple mobility data
# available and then save it to a csv

# Andrae Ladores
# February 25, 2021
# vcladores@dons.usfca.edu

# load the "dplyr" package
library("dplyr")

# we want to get a count of the number of cities and counties
# in a given state that have transportation data
# The input to this will be the output of the previous script
# namely the stave csv files that were already subsetted

# load in the dataset from the previous script
input_file_name <- "output/kansas_apple_mobility_data.csv"
state_data <- read.csv(input_file_name)

# starting off with dplyr chains
count_cities_counties_by_type <- state_data %>%
    select(geo_type, region, transportation_type) %>%
    group_by(geo_type, transportation_type) %>%
    tally()

# write out the result of the dplyr chain
write.csv(count_cities_counties_by_type,
          "output/kansas_cities_counties_counts.csv")
