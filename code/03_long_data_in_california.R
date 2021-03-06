# We want to turn California subsetted wide data into long data
# We also want to fix the date

# read in file
california_long_data <- readr::read_csv(
  "output/applemobilitytrends-2021-02-20_California.csv")

# load in tidyr
library("tidyr")
library("readr")


# Make table long instead of wide, try to fix it/make it show on an object
fixed_california_data <- california_long_data %>%
tidyr::pivot_longer(
  cols = starts_with("X202"),
  names_to = "Date",
  names_prefix = "X",
  values_to = "Frequency"
)

readr::write_csv(fixed_california_data,
                 file = paste0("output/",
                               "california_mobility_data_long.csv"
                               ))

