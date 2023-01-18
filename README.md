# Polyphenol_Quantification_FooDB# READ ME
## Stephanie Wilson, January 2022

## Summary


## Required Software
  - R 4.2.1
  - RStudio ‘2022.12.0.353’
  - Python 3.9.13
  
## Suggested Order of Scripts
Scripts in each set are intended to be run sequentially.  

  1) Ingredientize
    - Script 01_ingredientize_unmatchedfoods_asa24_fndds.Rmd
    - Script 02_ingredientize_mixedfoods.Rmd
    - Script 03_ingredientize_code_remap.Rmd
    - Script 04_ingredientize_merge.Rmd
    
  2) FooDB to ASA Ingredient Descriptions
    - Script 01_FooDB_PhenolID.Rmd
    - Script 02_FooDB_FooDBCleaning.ipynb
    - Script 03_FooDB_TextProcessing.ipynb	
    - Script 04_FooDB_PhenolContent.Rmd
    - Script 05_FooDB_ManualMatch100.Rmd	
    - Script 06_FooDB_FNDDS_FullMatch_Part1.Rmd
    - Script 07_FooDB_FNDDS_FullMatch_Part2.ipynb	
    - Script 08_FooDB_FNDDS_FullMatch_Part3.Rmd
    - Script 09_FooDB_FNDDS_FullMatch_Part4.Rmd
    - Script 10_FoODB_FNDDS_FullMatch_Part5.Rmd

## Outputs
Outputs from Ingredientization
    - Script 01, fndds_missing_foods.csv
    - Script 02, asa_fndds_matches.csv
    - Script 03, ingred_recode_remapped10202022.csv
    - Script 04, ingredientized_asa_10-2022.csv

Outputs from 'FooDB to ASA Ingredient Descriptions'
    - Script 01, FooDB_phenols.csv, Endogenous_phenols.csv (optional)
    - Script 02, Content_updated.csv, Food_updated.csv
    - Script 03, Food_V2_descripcleaned.csv, asa_descripcleaned.csv
        remap_descrip_cleaned.csv
    - Script 04, FooDB_phenols_Content.csv
    - Script 05, Manual_Match100.csv
    - Script 06, asa_descripcleaned_codematched.csv
    - Script 07, asa_foodb_descrip_dependencies.csv
    - Script 08, asa_foodb_descrip_dependencies_updated.csv, missing_foodb_descrip_part1.csv, foodb_macros_g.csv
    - Script 09, codematched_semifinal.csv
    - Script 10, codematched_final.csv
