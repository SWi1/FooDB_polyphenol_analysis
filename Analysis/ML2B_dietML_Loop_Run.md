# Compound Level Analysis
## Part II: Random Forest Regression of taxaHFE-selected polyphenol features and study covariates
Stephanie Wilson, October 2023

Prerequisites: 
    1. Relies on A0_Merge_Variables.Rmd to place the ML variables into correct folders
    2. Make sure the latest docker is installed from [dietML program](https://github.com/aoliver44/nutrition_tools)
    3. The output.txt from HFE MUST BE moved or copied into the corresponding marker ML folder. 
    4. Docker must be running.

###################################################
# LOOP FOR SUBCLINICAL VARIABLES, CONTINUOUS
###################################################

## Define your base directory
BASE_DIR="/Users/stephanie.wilson"

## List FOR SUBCLINICAL VARIABLES
DIRS=("Desktop/SYNC/Scripts/FL100_Polyphenol_Analysis/HFE/Subclinical/CRP_dietML" "Desktop/SYNC/Scripts/FL100_Polyphenol_Analysis/HFE/Subclinical/CAL_dietML" "Desktop/SYNC/Scripts/FL100_Polyphenol_Analysis/HFE/Subclinical/MPO_dietML" "Desktop/SYNC/Scripts/FL100_Polyphenol_Analysis/HFE/Subclinical/NEO_dietML")

## Loop dietML through each directory

for DIR in "${DIRS[@]}"; do
    # Step 1: Navigate to the new directory
    cd "$BASE_DIR/$DIR"

 ## Step 2: Initiate Docker Container in detached mode
    docker run --rm -itd -v `pwd`:/home/docker -w /home/docker aoliver44/nutrition_tools:latest bash

  ## Step 3: Run special Docker container commands within the container
    docker exec -it $(docker ps -lq) bash -c '
        generic_read_in --subject_identifier subject_id /home/docker/ /home/docker/output/
        
        generic_combine --subject_identifier subject_id --label feature_of_interest --cor_level 0.99 --cor_choose TRUE --preserve_samples FALSE /home/docker/output/ merged_data.csv
        
        dietML --subject_identifier subject_id --train_split 0.8  --label feature_of_interest --model rf --type regression --metric mae --shap TRUE --ncores 4 /home/docker/output/merged_data.csv /home/docker/output/
    '
    ## Step 4: Stop and remove the Docker container
    docker stop $(docker ps -lq)

    ## Step 4: Return to the base directory
    cd "$BASE_DIR"
done