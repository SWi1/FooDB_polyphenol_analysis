# Aggregate and Summarize multiple models
# Stephanie Wilson, August 2023

# Requirements
## data
##  compiled list of out model outputs (model output as list as well)

## model_names
##  list of outcome names, one for each model in data

## diet_control
##  TRUE when model includes dietary predictors (Total Fiber, HEI score), 
##  FALSE when it does not include the dietary predictors

# Outputs
## Dataframe in long form with each model's coefficient estimates, st. error, t values, and p-values. 

summarizemodels = function(data, model_names, diet_control){
  
  #library requirement
  library(tidyverse)
  
  # Create an empty list to store the results
  finaloutput = data.frame()
  data = data
  diet_control = diet_control
  for (name in model_names) {
    
    # Perform summary on each
    summary = summary(data[[name]])
    
    # Pull out the coefficients data and rename
    output = as.data.frame(summary$coefficients) %>%
      rownames_to_column() %>%
      rename('Variable' = 1,
             'Estimate' = 2,
             'Std. Error' = 3, 
             't.value' = 4,
             'p.value' = 5) %>% 
      mutate(outcome = name,
             diet_control = ifelse(diet_control == TRUE, 'With Dietary Predictors',
                                   'Without Dietary Predictors'))
    
    finaloutput = rbind(finaloutput, output)
  }
  return(finaloutput)
}
