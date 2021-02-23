# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from any particular US state
# and then write out a csv file that only has that subset
# uses functions in the code/function directory

# Andrae Ladores
# vcladores@dons.usfca.edu
# February 21, 2021

# load created function
source("code/functions/subset_mobility_data_to_state.R")

# test out the function created
subset_mobility_data_to_state(
  input_file_name = "data/raw_data/applemobilitytrends-2021-02-20.csv",
  state_to_subset = "Alasks")
