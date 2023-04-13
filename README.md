# READ ME
Stephanie Wilson, February 2023

## Summary
These scripts are for the project related to the identification and quantification of dietary polyphenols in the USDA FL100 Phenotyping Study Cohort. Dietary polyphenolic data is derived from FooDB which these scripts also address.

## Required Software

-   R 4.2.1 (or newer)
-   RStudio '2022.12.0.353' (or newer)
-   Python 3.9.13

## Required Files

- **FNDDS 2017-2018 Data**, Downloadable as xlsx files fom the [USDA ARS Beltsville Food Surveys Research Group](https://www.ars.usda.gov/northeast-area/beltsville-md-bhnrc/beltsville-human-nutrition-research-center/food-surveys-research-group/docs/fndds-download-databases/)
    1) '2017-2018 FNDDS At A Glance - Ingredient Nutrient Values.xlsx'
    2) '2017-2018 FNDDS At A Glance - FNDDS Ingredients.xlsx'

-   **FooDB Data Sets**, Downloadable as FooDB CSV File from [foodb.ca/downloads](https://foodb.ca/downloads)
    1)  Content.csv (requires additional bzip2)
    2)  Compound.csv (requires additional bzip2)
    3)  Food.csv  

-   **FooDB Polyphenols SDF**, Downloadable from GitHub [page](ADDLINK)
    1)   SDF files contain atom and bond information to visualize compounds. Chemical visualization software (authors used MarvinView) can read SDF files to view these polyphenol structures.

-   **Dietary Recall Data**, Downloadable as Items Analysis File from ASA24 Researcher Site
    -   The dietary data utilized in the USDA Phenotyping Study underwent quality control. Methods are outlined in the paper: [*'Effect of Manual Data Cleaning on Nutrient Intakes Using the Automated Self-Administered 24-Hour Dietary Assessment Tool (ASA24)'*](https://doi.org/10.1093/cdn/nzab005)  

## Suggested Order of Scripts

Scripts in each set are intended to be run sequentially.

1)  Ingredientize - Adapted to R from Python Scripts created by Jules Larke.
    -   01_ingredientize_unmatchedfoods_asa24_fndds.Rmd.
    -   02_ingredientize_mixedfoods.Rmd
    -   03_ingredientize_code_remap.Rmd
    -   04_ingredientize_merge.Rmd

2)  FooDB to ASA Ingredient Descriptions
    -   01_FooDB_FooDBCleaning.ipynb
    -   02_FooDB_TextProcessing.ipynb
    -   03_FooDB_ManualMatch100.Rmd
    -   04_FooDB_FNDDS_FullMatch_Part1.Rmd
    -   05_FooDB_FNDDS_FullMatch_Part2.ipynb
    -   06_FooDB_FNDDS_FullMatch_Part3.Rmd
    -   07_FooDB_FNDDS_FullMatch_Part4.Rmd
    -   08_FoODB_FNDDS_FullMatch_Part5.Rmd

3)  Polyphenol Quantification
    -   Q1_Polyphenol_Quantification_PhenolID.Rmd
    -   Q2_Polyphenol_Quantification_Content.Rmd
    -   Q3_Polyphenol_Quantification_ASAmerge.Rmd
  

## Outputs

1)  Ingredientize

    -   Script 01, fndds_missing_foods.csv
    -   Script 02, asa_fndds_matches.csv
    -   Script 03, ingred_recode_remapped10202022.csv
    -   Script 04, ingredientized_asa_10-2022.csv (**KEY FILE**)  

2)  FooDB to ASA Ingredient Descriptions

    -   Script 01, Content_updated.csv.bz2, Food_updated.csv
    -   Script 02, Food_V2_descripcleaned.csv, asa_descripcleaned.csv. remap_descrip_cleaned.csv
    -   Script 03, Manual_Match100.csv
    -   Script 04, asa_descripcleaned_codematched.csv
    -   Script 05, asa_foodb_descrip_dependencies.csv
    -   Script 06, asa_foodb_descrip_dependencies_updated.csv, missing_foodb_descrip.csv, foodb_macros_g.csv
    -   Script 08, codematched_semifinal.csv
    -   Script 08, codematched_final.csv(**KEY FILE**)  

3)  Polyphenol Quantification

    -   Script 01, FooDB_phenols.csv (**KEY FILE**), Endogenous_phenols.csv (optional)
    -   Script 02, FooDB_phenols_Content.csv.bz2 (**KEY FILE**)
    -   Script 03, FooDB_phenol_content_ASAmerged.csv.bz2 (**KEY FILE**)
