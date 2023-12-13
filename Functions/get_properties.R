# Function to scrape physiochemical data from FooDB
# Stephanie Wilson
# An Expansion of the get_logP function with improvements for down webpages

# Input = URL for foodb compound page
# Output = dataframe with outputs

get_properties = function(path) {
  
  finaloutput = data.frame()
  
  for (url in path) {
    tryCatch({
      page = read_xml(url)
      
      exp_property = xml_text(html_elements(page, xpath = '//property //kind'))
      exp_property_value = xml_text(html_elements(page, xpath = '//property //value'))
      
      Sys.sleep(3)
      
      
      output = data.frame(property = exp_property, value = exp_property_value) %>%
        filter(property %in% c('mono_mass', 'smiles', 'inchi', 'inchikey')) %>%
        pivot_wider(names_from = c(property), values_from = value, values_fn = list) %>%
        mutate(compound_public_id = str_replace(url, 'https://foodb.ca/compounds/', ''))
      
      finaloutput = rbind(finaloutput, output)
      
      message(output$compound_public_id)
      
    }, error = function(e) {
      
      message(paste("Error processing:", url, "Skipping to the next one."))
    })
  }
  
  return(finaloutput)
  
}