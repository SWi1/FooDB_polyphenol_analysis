# sim_score Function for text similarity analysis
## January 2023, Stephanie Wilson

## A function to examine the similarity between two columns of string data. 
## Text similarity metrics accepted by the stringsim() function in the _stringdist_ package.
## Built with package ‘stringdist’ version 0.9.10 and 'tidyverse' version 2.0.0

sim_score = function(x, asa_descrip, foodb_descrip){
  metric = x #where x is a list of text similarity metrics accepted by stringsim()
  asa_descrip = asa_descrip #df column of descriptions
  foodb_descrip = foodb_descrip #df column of descriptions
  output = data.frame(matrix(ncol=length(metric), nrow=length(asa_descrip)))
  
  
  for(i in seq_along(metric)){ #run similarity for each metric
    output[[i]] = stringsim(asa_descrip, foodb_descrip, 
                            method = metric[[i]], p = 0.1)
  }
  colnames(output) = metric # rename column names
  output = output %>% add_column(asa_descrip, foodb_descrip) %>% # add columns
    relocate(asa_descrip, foodb_descrip) # relocate descriptions to front
  return(output)
}