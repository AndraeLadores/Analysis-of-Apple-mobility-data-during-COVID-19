# We want to turn California subsetted wide data into long data
# We also want to fix the date

# Source in the function
source("code/functions/convert_subset_data_to_long.R")

# Run the function
convert_long_state_data(input_wide_subsetted_data =
                                  paste0("output/",
                                         "subsetted_states_wide",
                                         "/applemobilitytrends",
                                         "-2021-02-20_Alaska.csv"))
