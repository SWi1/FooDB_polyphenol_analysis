# Stephanie Wilson
# September 2023

# find_best_matches function

# OVERVIEW
## This approach allows you to easily find the best matches between two dataframes.
## This was designed in conjuction with pooling taxa HFE output features to create supplemental table 1. 

# INPUT: 
## The find_best_matches function takes four arguments: 
## source_dataframe (the source dataframe containing the features to match), 
## target_dataframe (the target dataframe containing the possible matches), 
## source_column (the name of the column in the source dataframe to match), and 
## target_column (the name of the column in the target dataframe to match against).

# You can customize the source_dataframe, target_dataframe, source_column, 
# and target_column variables to specify the dataframes and columns you want to use for matching.

# OUTPUT: 
## Calling find_best_matches with your custom arguments will return a dataframe with the best matches and their distances.


find_best_matches = function(source_dataframe, target_dataframe, source_column, target_column) {
  
  # Initialize vectors to store best matches and their distances
  best_matches = character(nrow(source_dataframe))
  best_distances = numeric(nrow(source_dataframe))
  
  # Loop through each row in the source_dataframe
  for (i in seq_len(nrow(source_dataframe))) {
    feature = source_dataframe[[source_column]][i]
    distances = stringdistmatrix(feature, target_dataframe[[target_column]])
    min_distance = min(distances)
    marker = source_dataframe$marker
    best_match = target_dataframe[[target_column]][which.min(distances)]
    
    best_matches[i] = best_match
    best_distances[i] = min_distance
  }
  
  # Create a new dataframe with the best matches and their distances
  best_matches_df = data.frame(
    features = source_dataframe[[source_column]],
    best_match = best_matches,
    distance = best_distances,
    marker = marker
  )
  
  return(best_matches_df)
}
