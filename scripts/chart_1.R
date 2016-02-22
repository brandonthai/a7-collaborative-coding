build_chart_1 <- function(data) {
  names(data) <- c('ClassStanding', 'InfoProspective', 'OS', 'TerminalExperience', 'GitFamiliarity', 
                   'MarkDownFamiliarity', 'RFamiliarity', 'ProgrammingExperience', 'CountriesVisited', 
                   'CatOrDog', 'SeahawksFan')
  
  git_familiarity_data <- data %>% group_by(GitFamiliarity) %>%
      summarise(number_of_students = n())
  
  x <- list(
    title = "Git Familiarity"
  )
  
  # Setting y axis title 
  y <- list(
    title = "Number of Students"
  )
  
  # Creating a bar chart
  p <- plot_ly(git_familiarity_data,
              x = GitFamiliarity,
              y = number_of_students,
              type = "bar")
    
  layout(p, xaxis = x, yaxis = y, title = 'Familiarity with Git')
  
  return(p)
}
