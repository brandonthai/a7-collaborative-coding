require('dplyr')

# A function that takes in a dataset and returns a list of info about it:
info_function <- function(dataset) {
  ret <- list()
  names(dataset) <- c('ClassStanding', 'InfoProspective', 'OS', 'TerminalExperience', 'GitFamiliarity', 'MarkDownFamiliarity', 'RFamiliarity', 'ProgrammingExperience', 'CountriesVisited', 'CatOrDog', 'SeahawksFan')
  ret$numOfResponse <- nrow(dataset)
  ret$numOfFreshman <- nrow(filter(dataset, ClassStanding == "Freshman"))
  ret$numOfSophomore <- nrow(filter(dataset, ClassStanding == "Sophomore"))
  ret$numOfJunior <- nrow(filter(dataset, ClassStanding == "Junior"))
  ret$numOfSenior <- nrow(filter(dataset, ClassStanding == "Senior"))
  ret$numOfMac <- nrow(filter(dataset, OS == 'Mac'))
  ret$numOfWindows <- nrow(filter(dataset, OS == 'Windows'))
  ret$OSApplyToInfo <- dataset %>%
                    group_by(OS) %>%
                    filter(InfoProspective == 'Yes') %>%
                    summarise(InfoProspectives = n())
  ret$GradeApplyToInfo <- dataset %>%
                    group_by(ClassStanding) %>%
                    filter(InfoProspective == 'Yes') %>%
                    summarise(InfoProspectives = n())
  return (ret)
}