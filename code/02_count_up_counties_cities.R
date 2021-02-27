# Script to count up the number
# of cities and counties in a state that have detailed Apple mobility data
# available and then save it to a csv file

# Andrae Ladores
# February 25, 2021
# vcladores@dons.usfca.edu


# load associated function
source("code/functions/count_cities_counties_by_type.R")

# use/test function out
count_cities_counties_by_type(
  input_subsetted_file_name = paste0("output/",
                                     "applemobilitytrends",
                                     "-2021-02-20_Alaska.csv"))

# For loop to count up multiple states
for (different_states_to_subset in c("Alabama", "California", "New York",
                                   "Montana", "Kentucky")) {
  count_cities_counties_by_type(
    input_subsetted_file_name = paste0("output/",
                                       "applemobilitytrends",
                                       "-2021-02-20_",
                                       different_states_to_subset,
                                       ".csv"))
}
