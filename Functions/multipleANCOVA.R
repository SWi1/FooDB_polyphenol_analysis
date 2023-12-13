# ANCOVA with multiple testing adjustments for analyzing multiple taxa on outcomes
# Stephanie Wilson, June 2023

# Requirements
## data = dataframe that includes as columns, each taxonomic class, each outcome, and covariates of interest
## This particular script includes a model with Age, Sex, and BMI, 
## and a secondary model with Age, Sex, BMI, fiber intake, and total HEI score.
## The secondary model is used if diet_control == TRUE.
## Transformations is a dataframe with two columns: Polyphenol class and its bestNormalize recommendation.

# Outputs
## Dataframe with each predictor estimates, p-values, and adjusted p-values for each model. 


# Perform ANCOVA for each class
multipleANCOVA = function(data, class_names, outcome, diet_control, transformations){
 
  #library requirement
  library(bestNormalize); library(tidyverse)
  
  # Create an empty list to store the ANCOVA results
  finaloutput = data.frame()
  
  for (class in class_names) {
  
  #Extract recommended transformation for taxonomic class    
  transform_recommendation = (transformations %>%
    filter(Class == class))[1,2]
  
  #Retrieve the function object
  transform = match.fun(transform_recommendation)
  
  #Transformed predictor and pulling out the transformed data
  class_transform = transform(data[[class]])$x.t
    
  # Choose the appropriate model based on the diet_control input
    if (diet_control==TRUE) {
      # Fit the ANCOVA model with dietary covariates
      model = lm(outcome ~ class_transform + Age + Sex + BMI + avg_total_fiber + hei_asa24_totalscore, data = data)
    } else {
      # Fit the ANCOVA model without dietary  covariates
      model = lm(outcome ~ class_transform + Age + Sex + BMI, data = data)
    }
  
  # Perform ANCOVA
  ancova_result = Anova(model, type = "III")
  
  # Perform summary on each
  summary = summary(model)
  
  # Pull out the Coefficients
  coefficient = summary$coefficients[ ,1]
  
  # Extract the p-values from the ANCOVA results
  p_values = ancova_result$`Pr(>F)`[1:length(coefficient)]
  
  # Perform FDR correction for total number of taxonomic class)
  #Then pull the p-values for each coefficient. Last one has been empty.
  fdr_adjusted_p_values = p.adjust(p_values, method = "fdr", 
                                  n = length(class_names))[1:length(coefficient)]
  
  # Store the results in the list
  output = data.frame(
    Class = class,
    Class_transformation = transform_recommendation,
    Coefficient = coefficient,
    P_Value = format(p_values, scientific = 999, digits = 4),
    Adjusted_P_Value = format(fdr_adjusted_p_values, scientific = 999, digits = 4)) %>%
    rownames_to_column(var = 'Variable') %>%
    relocate(Variable, .before = Coefficient)
  
  message(class, '...........DONE')
  
  finaloutput = rbind(finaloutput, output)
  }
  return(finaloutput)
}
