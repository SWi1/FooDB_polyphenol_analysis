# READ ME

Stephanie M.G. Wilson, December 2023

## Summary

This repository contains scripts for dietary polyphenol estimation and inflammation outcome analyses from the USDA FL100 Phenotyping Study. Scripts are grouped into the following directories: Ingredientize, Mapping, Estimation, and Analyses. Estimates of dietary polyphenol intake are derived from mapping FooDB polyphenol content data to ingredientized dietary recall data.

## Required Software

-   R 4.2.2 (or newer)
-   RStudio '2022.12.0.353' (or newer)
-   Python 3.9.13
-   [TaxaHFE version 2.0](https://github.com/aoliver44/taxaHFE)
-   [dietML](https://github.com/aoliver44/nutrition_tools)

## Required Files

**Data Availability**: Food composition database data that is already publicly available is provided on this GitHub repository. Requests for non-metagenomic data from the USDA ARS WHNRC Nutritional Phenotyping Study used in this analysis should be made via an email to the senior WHNRC author on the publication of interest. Requests will be reviewed quarterly by a committee consisting of the study investigators. 

-   **FNDDS 2017-2018 Data**, Downloadable as xlsx files fom the [USDA ARS Beltsville Food Surveys Research Group](https://www.ars.usda.gov/northeast-area/beltsville-md-bhnrc/beltsville-human-nutrition-research-center/food-surveys-research-group/docs/fndds-download-databases/). 

    1)  '2017-2018 FNDDS At A Glance - Ingredient Nutrient Values.xlsx'
    2)  '2017-2018 FNDDS At A Glance - FNDDS Ingredients.xlsx'
    
-   **FooDB Data Sets**, Downloadable as FooDB CSV File from [foodb.ca/downloads](https://foodb.ca/downloads). FooDB Data Dictionary for Content, Compound, and Food csv files is provided [here](https://github.com/SWi1/FooDB_polyphenol_analysis/blob/main/FooDB/README.md).

    1)  Content.csv (requires additional bzip2)
    2)  Compound.csv (requires additional bzip2)
    3)  Food.csv
    4)  dt_compound_index.json, Milk-Specific
    
-   **SDF**, SDF, or structure-data format, files contain atom and bond information to visualize compounds. Chemical visualization software (Ex. MarvinView) can read SDF files to view structures.

    1) FooDB SDF downloadable from GitHub [page](https://github.com/SWi1/Polyphenol_Quantification_FooDB/blob/main/FooDB/FooDB2_polyphenols_ID.sdf)
    2) Milk (Poly)phenolic Scrape from FooDB.ca SDF [page](https://github.com/SWi1/FooDB_polyphenol_analysis/blob/main/FooDB/milk.sdf)
  
    
-   **Dietary Recall Data**, Downloadable as Items Analysis File from ASA24 Researcher Site. The dietary data utilized in the USDA Phenotyping Study underwent quality control. Methods are outlined in the paper: [*'Effect of Manual Data Cleaning on Nutrient Intakes Using the Automated Self-Administered 24-Hour Dietary Assessment Tool (ASA24)'*](https://doi.org/10.1093/cdn/nzab005).

-   **Phenol Explorer Data**, From Phenol Explorer online, Version 3.6
    
    1)  PhenolExplorer-RFTable_20190204.xlsx
    2)  compounds-classification_20230504.csv
    3)  foods-classification.csv
 
## Suggested Order of Scripts

Scripts in each set are intended to be run sequentially.

1)  **Ingredientize**. Adapted to R from Python Scripts created by Jules Larke. This script takes ASA24 Recall Data and iteratively breaks down mixed foods into their underlying ingredients.
    -   01_ingredientize_unmatchedfoods_asa24_fndds.Rmd.
    -   02_ingredientize_mixedfoods.Rmd
    -   03_ingredientize_code_remap.Rmd
    -   04_ingredientize_merge.Rmd
    
2)  **Mapping**. FooDB to ASA Ingredient Descriptions - This script utilizes natural language processing to match ingredient descriptions in ASA24 data to their equivalent food description in FooDB.
    -   01_FooDB_FooDBCleaning.ipynb
    -   02_FooDB_TextProcessing.ipynb
    -   03_FooDB_ManualMatch100.Rmd
    -   04_FooDB_FNDDS_FullMatch_Part1.Rmd
    -   04a_FooDB_ManualMatchScoring.Rmd
    -   05_FooDB_FNDDS_FullMatch_Part2.ipynb
    -   06_FooDB_FNDDS_FullMatch_Part3.Rmd
    -   07_FooDB_FNDDS_FullMatch_Part4.Rmd
    -   08_FooDB_FNDDS_FullMatch_Part5.Rmd

3)  **Estimation**. This script extracts polyphenols from FooDB and links polyphenols to their content data in FooDB and retention factors from Phenol Explorer. The final script links polyphenol compound/content data to dietary recall data.
    -   E1_Polyphenol_Estimation_PhenolID.Rmd
    -   E1A_Polyphenol_Estimation_Milk_Scrape.Rmd
    -   E1B_Polyphenol_Estimation_Milk_Phenols.Rmd
    -   E1C_Polyphenol_Estimation_Yogurt_Correction.Rmd
    -   E2_Polyphenol_Estimation_Content.Rmd
    -   E3_Polyphenol_Estimation_RF.Rmd
    -   E3A_Polyphenol_Estimation_Duke_Filtering.Rmd
    -   E4_Polyphenol_Estimation_Content_Aggregate.Rmd
    -   E5_Polyphenol_Estimation_ASAmerge.Rmd
    
4) Analyses. This directory includes scripts for the analysis of polyphenol intake and inflammation outcomes in healthy adults. Script list and additional information provided in README.md within Analysis directory.    

## Outputs

1)  Ingredientize

    -   Script 01, fndds_missing_foods.csv
    -   Script 02, asa_fndds_matches.csv
    -   Script 03, ingred_recode_remapped10202022.csv
    -   Script 04, ingredientized_asa_10-2022.csv (**KEY FILE**)

2)  FooDB to ASA Ingredient Descriptions

    -   Script 01, Content_updated.csv.bz2, Food_updated.csv
    -   Script 02, Food_V2_descripcleaned.csv, asa_descripcleaned.csv, remap_descrip_cleaned.csv
    -   Script 03, Manual_Match100.csv
    -   Script 04, asa_descripcleaned_codematched.csv, 04_scores_auto_NOTchecked.csv 
    -   Script 04a, No files.
    -   Script 05, asa_foodb_descrip_dependencies.csv
    -   Script 06, asa_foodb_descrip_dependencies_updated.csv, missing_foodb_descrip.csv, foodb_macros_g.csv
    -   Script 08, codematched_semifinal.csv
    -   Script 08, codematched_final.csv(**KEY FILE**)

3)  Polyphenol Estimation

    -   Script 01, FooDB_phenols.csv (**KEY FILE**), Endogenous_phenols.csv (optional)
    -   Script 1A,  milk_scraping_output.csv, milk_compound_data.csv
    -   Script 1B, milk_scrape_polyphenols.csv, milk_scrape_phenols.csv
    -   Script 1C,  milk_scrape_polyphenols.csv, milk_scrape_phenols.csv
    -   Script 02, FooDB_phenols_Content_premerge.csv.bz2
    -   Script 03, FooDB_Content_Citation_Counts.csv, FooDB_PE_RF.csv, PhenolExplorer_source_id_namecheck_entered (manually created)
    -   Script 03A, Duke_Filtered_Content.csv
    -   Script 04, FooDB_phenols_Content.csv.bz2 (**KEY FILE**), FooDB_phenol_content_foodsums.csv (**KEY FILE**)
    -   Script 05, FooDB_phenol_content_ASAmerged.csv.bz2 (**KEY FILE**)
