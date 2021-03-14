# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from any particular US state
# and then write out a csv file that only has that subset

# Andrae Ladores
# vcladores@dons.usfca.edu
# February 21, 2021

# test
input_file_name <- "data/raw_data/applemobilitytrends-2021-03-05.csv"
state_to_subset <- "New York"

# create a function to subset any US state out of all the given data
# this should also create an output CSV fie that is named based on the state
# that is subsetted
subset_mobility_data_to_state <- function(input_file_name,
                                          state_to_subset) {

  # line of code that ensure state name doesn't have any spaces
  state_no_spaces <- gsub(state_to_subset,
                          pattern = " ",
                          replacement = "_")

  # read in the complete csv file
  all_covid_data <- readr::read_csv(input_file_name)

  # subset the dataset to only include rows where the sub.region column has
  # the state name in it while having all columns.
  state_data <- all_covid_data %>%
    dplyr::filter(`sub-region` == state_to_subset)

  # check that the subsetted data actually has data in it
  if (nrow(state_data) == 0) {
    stop("ERROR, no rows matching given state name. Possibly a typo?")
  }

  # save the state data into a new csv file in the output directory
  readr::write_csv(state_data, file = paste0("output/subsetted_states_wide/",
                                      tools::file_path_sans_ext(
                                        basename(input_file_name)),
                                      "_",
                                      state_no_spaces,
                                      ".csv"))
  return(state_data)
}




