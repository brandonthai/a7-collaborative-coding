require('dplyr')

data <- read.csv('../data/intro_survey_data.csv', stringsAsFactors = FALSE)



numOfResponse <- nrow(data)
numOfFreshman <- nrow(filter(data, What.is.your.current.class.standing. == 'Freshman'))

# A function that takes in a dataset and returns a list of info about it:
info_function <- function(dataset) {
  ret <- list()
  ret$numOfResponse <- nrow(dataset)
  ret$numOfFreshman
  ret$numOfSophomore
  ret$numOfJunior
  ret$numOfSenior
  ret$numOfMac
  ret$numoOfWindow
  
  return (ret)
}