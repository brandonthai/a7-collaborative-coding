build_chart_1 <- function(data) {
  
  # changes the names of the columns in original data
  names(data) <- c('ClassStanding', 'InfoProspective', 'OS', 'TerminalExperience', 'Git Familiarity', 
                   'MarkDownFamiliarity', 'RFamiliarity', 'ProgrammingExperience', 'CountriesVisited', 
                   'CatOrDog', 'SeahawksFan')
  
  # create new data frame that summarizes the number of students with different git experience
  git_familiarity_data <- data %>% group_by(`Git Familiarity`) %>%
      summarise("Number of Students" = n())
  
  # creating a bar chart comparing the number of students with what level of git familiarity 
  p <- plot_ly(git_familiarity_data,
              x = `Git Familiarity`,
              y = `Number of Students`,
              type = "bar") %>%
  
  # setting the layout (x axis, y axis, title)
  layout(title = 'Familiarity with Git')
  
  return(p)
}
