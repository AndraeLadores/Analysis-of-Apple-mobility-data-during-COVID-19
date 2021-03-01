# Script of a function to count up the number
# of cities and counties in a state that have detailed Apple mobility data
# available and then save it to a csv file

# Andrae Ladores
# February, 25, 2021
# vcladores@dons.usfca.edu

# function to count and tally transportation types within cities or counties
# a previously subsetted state
count_cities_counties_by_type <- function(input_subsetted_file_name) {

   # load in "dplyr" package
  library("dplyr")

  # we want to get a count of the number of cities and counties
  # in a given state that have transportation data
  # The input to this will be the output of the previous script
  # namely the stave csv files that were already subsetted

  # load in the dataset from the previous script
  state_to_count_cities_counties <- read.csv(input_subsetted_file_name)

  if (nrow(state_to_count_cities_counties) == 0) {
    stop("ERROR. Check file name for typos and if it exists (subsetted) -
         most likely an error during the process of subetting the state.")
  }

  # dplyr chains to select specified columns, to group geotype
  # and transportation, and to tally the results in a tabular format
  count_cities_counties_by_type <- state_to_count_cities_counties %>%
    select(geo_type, region, transportation_type) %>%
    group_by(geo_type, transportation_type) %>%
    tally()


   # write out the result of the dplyr chain
  write.csv(count_cities_counties_by_type,
            file = paste0("output/",
                          "cities",
                          "_",
                          "counties",
                          "_",
                          "counted",
                          "_",
                          tools::file_path_sans_ext(
                            basename(input_subsetted_file_name)),
                          ".csv"))

}
