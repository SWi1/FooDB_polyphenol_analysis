# READ ME

Stephanie M.G. Wilson, December 2023

## Summary

This directory includes scripts for the analysis of polyphenol intake and inflammation outcomes in healthy adults. Inflammation outcomes include high-sensitivity C-Reactive Protein (systemic inflammation), lipopolysaccharide binding protein (intestinal permeability), fecal calprotectin (gastrointestinal inflammation), fecal myeloperoxidase (gastrointestinal inflammation), and fecal neopterin (gastrointestinal inflammation). Polyphenol intake is summarized at three levels of resolution including total, class, and compound-level. Compound-level analyses utilize programs for hiearchical feature engineering of polyphenol features and random forest regressions.

Analysis has four main focus points:

1) Examination of Total Polyphenol Intake and its Food Contributors
2) Relationship between Total Polyphenol Intake and Inflammation Outcomes
3) Relationship between Polyphenol Class Intake and Inflammation Outcomes
4) Relationship between Polyphenol Compound Intake and Inflammation Outcomes

## Required Software

-   R 4.2.2 (or newer)
-   RStudio '2023.9.1.494' (or newer)
-   (TaxaHFE version 2.0)[https://github.com/aoliver44/taxaHFE]
-   (dietML) [https://github.com/aoliver44/nutrition_tools]

## Required Files

FooDB  
- FooDB_polyphenols_V2.csv  

FL100 Participant Data (Not public)  
- FL100_Binning_Data.csv  
- fl100_recalls_qcd.csv  
- CTSC24532USDAWHNRCNu-HEIscoreWithEthnicit_DATA_2023-05-31_1343.csv  
- CTSC24532USDAWHNRCNu-CRPData_DATA_LABELS_2023-05-30_1348.csv  
- FL100_SES.csv  

## Suggested Order of Scripts

Scripts in each set are intended to be run sequentially.

**File Prep**  
1) A0_Merge_Variables.Rmd
2) A0A_Scrape_Taxonomy.Rmd
3) A0B_Exploration.Rmd

**Broad Summaries**  
4) A1_Polyphenol_Mappable_Proportion.Rmd  
5) A2_Polyphenol_Intake_Summary.Rmd  
6) A2A_PUBFIG_Participant_Polyphenol_Summary.Rmd  

**Total Polyphenol + Inflammation Analysis**   
7) A3_Total_Analyses_Inflammation.Rmd  

**Polyphenol Class + Inflammation Analysis**  
8) A4_Class Analysis.Rmd  
9) A4A_PUBFIG_Class_Heatmap.Rmd  
10) A4B_PUBFIG_Class_Plots.Rmd  
11) A4B_PUBFIG_Class_Plots.Rmd  

**Polyphenol Compound + Inflammation Analysis**   
12) ML3_dietML_Polyphenol_Food_Intakes.Rmd  
13) ML3A_dietML_Feature_Formatting.Rmd  
14) ML3B_dietML_RDSpaths_Performance.Rmd  
15) ML3C_PUBFIG_Beeswarm.Rmd  
16) ML3D_PUBFIG_Polyphenol_Features_Food_Sources.Rmd  
17) ML3E_PUBFIG_Regression_Plots.Rmd  
