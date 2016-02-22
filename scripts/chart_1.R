build_chart_1 <- function(data) {
  
  # changes the names of the columns in original data
  names(data) <- c('ClassStanding', 'InfoProspective', 'OS', 'TerminalExperience', 'GitFamiliarity', 
                   'MarkDownFamiliarity', 'RFamiliarity', 'ProgrammingExperience', 'CountriesVisited', 
                   'CatOrDog', 'SeahawksFan')
  
  # create new data frame that summarizes the number of students with different git experience
  git_familiarity_data <- data %>% group_by(GitFamiliarity) %>%
      summarise(number_of_students = n())
  
  # name for the x axis
  x <- list(
    title = "Git Familiarity"
  )
  
  
  # name for the y axis
  y <- list(
    title = "Number of Students"
  )
  
  # creating a bar chart comparing the number of students with what level of git familiarity 
  p <- plot_ly(git_familiarity_data,
              x = GitFamiliarity,
              y = number_of_students,
              type = "bar")
  # setting the layout (x axis, y axis, title)
  layout(p, xaxis = x, yaxis = y, title = 'Familiarity with Git')
  
  return(p)
}
