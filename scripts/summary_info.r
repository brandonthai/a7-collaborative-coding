require('dplyr')

data <- read.csv('../data/intro_survey_data.csv', stringsAsFactors = FALSE)

names(data) <- c('ClassStanding', 'InfoProspective', 'OS', 'TerminalExperience', 'GitFamiliarity', 'MarkDownFamiliarity', 'RFamiliarity', 'ProgrammingExperience', 'CountriesVisited', 'CatOrDog', 'SeahawksFan')

numOfResponse <- nrow(data)
numOfFreshman <- nrow(filter(data, ClassStanding == "Freshman"))
numOfSophomore <- nrow(filter(data, ClassStanding == "Sophomore"))
numOfJunior <- nrow(filter(data, ClassStanding == "Junior"))
numOfSenior <- nrow(filter(data, ClassStanding == "Senior"))
OSApplyToInfo <- data %>%
                  group_by(OS) %>%
                  filter(InfoProspective == 'Yes') %>%
                  summarise(InfoProspectives = n())
GredeApplyToInfo <- data %>%
                  group_by(ClassStanding) %>%
                  filter(InfoProspective == 'Yes') %>%
                  summarise(InfoProspectives = n())

# A function that takes in a dataset and returns a list of info about it:
info_function <- function(dataset) {
  ret <- list()
  ret$numOfResponse <- nrow(dataset)
  ret$numOfFreshman <- nrow(filter(dataset, ClassStanding == "Freshman"))
  ret$numOfSophomore <- nrow(filter(dataset, ClassStanding == "Sophomore"))
  ret$numOfJunior <- nrow(filter(dataset, ClassStanding == "Junior"))
  ret$numOfSenior <- nrow(filter(dataset, ClassStanding == "Senior"))
  ret$numOfMac <- nrow(filter(dataset, OS == 'Mac'))
  ret$numoOfWindows <- nrow(filter(dataset, OS == 'Windows'))
  ret$OSApplyToInfo <- dataset %>%
                    group_by(OS) %>%
                    filter(InfoProspective == 'Yes') %>%
                    summarise(InfoProspectives = n())
  ret$GredeApplyToInfo <- dataset %>%
                    group_by(ClassStanding) %>%
                    filter(InfoProspective == 'Yes') %>%
                    summarise(InfoProspectives = n())
  return (ret)
}