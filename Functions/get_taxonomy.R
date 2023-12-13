### A function to obtain xml and compound taxonomy classifications from FooDB.ca
### Stephanie Wilson
### February 2023


#works to get xml documents from FooDB compound urls
#combine with get classifications
get_taxonomy = function(URL){
  url = URL
  page = read_xml(url)
  
  ## Set up with conservative throttle
  Sys.sleep(3)
  
  kingdom = xml_text(html_elements(page, xpath = '//kingdom'))
  superklass = xml_text(html_elements(page, xpath = '//super_class'))
  klass = xml_text(html_elements(page, xpath = '//class'))
  subklass = xml_text(html_elements(page, xpath = '//sub_class'))
  directparent = xml_text(html_elements(page, xpath = '//direct_parent'))
  
  #Create and return dataframe with the taxonomy information
  data = data.frame(kingdom, superklass, klass, subklass, directparent)
  return(data)
}