library(dplyr)
library(plotly)

make_chart_2 <- function(class_data) {
  
  # Rename columns 
  names(class_data) <- c('ClassStanding', 'InfoProspective', 'OS', 'TerminalExperience', 'GitFamiliarity', 
                   'MarkDownFamiliarity', 'RFamiliarity', 'Programming Experience', 'CountriesVisited', 'CatOrDog', 'SeahawksFan')
  
  # Summarize data by programming language and its sum
  class_data <- class_data %>%
                  group_by(`Programming Experience`) %>%
                  summarise(
                    "Number of Students" = n()
                  )
  # Plot the data into a bar graph
  p <- plot_ly(
    data = class_data, 
    x = `Programming Experience`,
    y = `Number of Students`,
    type = "bar") %>%
    
  layout(title = "Aggregate of Students and Programming Experience")
  
  return(p)
}
