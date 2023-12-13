# Compound Level Analysis
## Part I: hierarchical feature engineering of polyphenol features
Stephanie Wilson, October 2023

# PULL CONTAINER for updated version if needed.
# docker pull aoliver44/taxa_hfe:2.0

# Navigate to Folder
cd /Users/stephanie.wilson/Desktop/SYNC/Scripts/FL100_Polyphenol_Analysis/HFE

# Initiate DOCKER, DEVELOPMENT 2.0 
docker run --rm -it -v `pwd`:/home/docker -w /home/docker aoliver44/taxa_hfe:2.0 bash

## SUBCLINICAL CONTINUOUS
### NO LBP, CAL set cutoffs for all GI markers

    ### CRP continuous 
    taxaHFE --subject_identifier subject_id --label crp_boxcox --lowest_level 2 --feature_type numeric --seed 35 /home/docker/metadata_CRP_subclinical.txt /home/docker/input_file_relabund.txt /home/docker/Subclinical/CRP_output.csv
    
    ### NEO continuous 
    taxaHFE --subject_identifier subject_id --label neo_boxcox --lowest_level 2  --feature_type numeric --seed 35 /home/docker/metadata_fecal_subclinical.txt /home/docker/input_file_relabund.txt /home/docker/Subclinical/NEO_output.csv

    ### CAL continuous 
    taxaHFE --subject_identifier subject_id --label fecal_calprotectin --lowest_level 2  --feature_type numeric --seed 35 /home/docker/metadata_fecal_subclinical.txt /home/docker/input_file_relabund.txt /home/docker/Subclinical/CAL_output.csv

    ### MPO continuous 
    taxaHFE --subject_identifier subject_id --label mpo_boxcox --lowest_level 2  --feature_type numeric --seed 35 /home/docker/metadata_fecal_subclinical.txt /home/docker/input_file_relabund.txt /home/docker/Subclinical/MPO_output.csv

    exit