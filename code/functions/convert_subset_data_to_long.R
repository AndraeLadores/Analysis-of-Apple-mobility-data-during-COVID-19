# We want to turn California subsetted wide data into long data
# We also want to fix the date

# load in tidyr and readr
library("tidyr")
library("readr")


convert_long_state_data <- function(input_wide_subsetted_data) {

  # read in file
  state_wide_data <- readr::read_csv(input_wide_subsetted_data)

  # Make table long instead of wide, try to fix it/make it show on an object
  fixed_wide_state_data <- state_wide_data %>%
    tidyr::pivot_longer(
      cols = starts_with("202"),
      names_to = "Date",
      names_prefix = "X",
      values_to = "Frequency"
    )

  readr::write_csv(fixed_wide_state_data,
                   file = paste0("output/subsetted_states_long/",
                                 "long",
                                 "_",
                                 tools::file_path_sans_ext(
                                   basename(input_wide_subsetted_data)),
                                 ".csv"))

  return(fixed_wide_state_data)
}
