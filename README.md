# Analysis of Apple Mobility Data in the Era of COVID-19

Andrae Ladores  
vcladores@dons.usfca.edu  

The goal of this project is to analyze the mobility data made by available by Apple

The data is available from the following URL:
https://covid19.apple.com/mobility

Uses dplyr to work with the data and also ggplot2 to visualize the dataset. 

### Change Log
* 2021-03-27: Parameterize Rmd and add bash script to drive knitting 
* 2021-03-14: Created an Rmarkdown file that can fully "knit" all the code plus some new ggplot2 codes into a well-organized html file
* 2021-02-26: Added for loops to both state subset script and tally script, so the state subset code can subset multiple states and the tally code can use dplyr to tally and organize the states in terms of transportation types. 
* 2021-02-26: Separated dplyr script into a function that the main script calls to
* 2021-02-25: Created second script to use dplyr to tally up count of the cities and counties in a selected state that have different tranportation type data
* 2021-02-24: Added gitkeep to all major directories and created & linked project repo to Github
* 2021-02-22: Initialized a git repository for this project
* 2021-02-21: A new version of the data file was downloaded, and I also worked to change the code to be more general and allow for any state to be subset from the larger file.
* 2021-02-08: The data was originally downloaded for analysis.
