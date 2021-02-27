# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from any &
# multiple US state
# and then write out a csv file that only has those subsets
# uses functions in the code/function directory

# Andrae Ladores
# vcladores@dons.usfca.edu
# February 21, 2021

# load created function
source("code/functions/subset_mobility_data_to_state.R")

# create for loop to subset multiple states
for (several_states_to_subset in c("Alabama", "California", "New York",
                                   "Montana", "Kentucky")) {
  subset_mobility_data_to_state(
    input_file_name = "data/raw_data/applemobilitytrends-2021-02-20.csv",
    state_to_subset = several_states_to_subset)
}
