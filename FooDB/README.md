#README
# About FooDB & Data Dictionary

Stephanie Wilson, January 2022


FooDB is promoted as the world's largest and most comprehensive food composition database. Within the downloadable files from FooDB version 1 (accessed September 2022), there are a reported 70,926 compounds and 992 foods. These compounds are derived from numerous databases and sources such as those listed below. n here shows the number of content entries from each database.

## FooDB Data Dictionary

FooDB has several dozen data files freely accessible online for download. Below is a data dictionary for three key FooDB downloadable files: Compound.csv, Content.csv, and Food.csv. These files were downloaded from [FooDB.ca](www.foodb.ca) in September 2022.


## Compound.csv

Compound.csv contains data on compounds including name, chemical structure identifiers, and taxonomic data.

| Column    | Data Type | Description                                 | Notes                      |
|-------------|-------------|---------------------------------|-------------|
| id        | integer   | Compound ID within data table               | Maps to Content\$source_id. Does not match public_id   |
| public_id | string    | Compound ID displayed on foodb.ca (FDB000004) |   |
| name      | string    | compound name |   |
| moldb_iupac | factor  | Mislabeled. Appears to be state data |    |
| state |   |   |   |
| annotation_quality | text | Additional information about the compound |   |
|description | text | Mislabeled. Appears to be CAS number data. | Listed in FooDB.ca as 'Manual written or computer generated compound description' | 
| cas_number | text | Mislabeled. Appears to be SMILES data. |  |
| moldb_inchikey | text | Mislabeled. Appears to be InChI identifier. | |
| moldb_inchi | decimal | Mislabeled. Appears to be monoisotopic molecular weight |    | 
| moldb_smiles | text | Mislabeled. Appears to be InChI Key. |  | 
| moldb_mono_mass | text | Mislabeled. Appears to be IUPAC name |   |
| kingdom | text | Chemical kingdom. |  |
| superklass | text | Chemical superclass. |    |
| klass | text  | Chemical class. | |
| subklass | text | Chemical subclass. |    |


## Content.csv

Content.csv contains food composition data of compounds. Of note is that data from the initial database or source has been preserved.

| Column | Data Type | Description | Notes |
|--------|-----------|-------------|-------|
|  id | integer | Content ID within data table |    |
|   source_id | integer | Nutrient or Compound ID  |  Maps to Compound\$id. Filtering on Compound or Nutrient may be first needed to ensure accurate mapping.     |
|   source_type | factor  | Nutrient or Compound   |        |
|   food_id | integer  | food id assigned by FooDB    |        |
|   orig_food_id | integer  | food id assigned from original data source    |        |
|   orig_food_common_name | text  | common name of food    |        |
|   orig_food_scientific_name | text |  scientific name of food  |        |
|   orig_food_part | text  | part of food analyzed in original data source |        |
|   orig_source_id | text  | compound id assigned from original data source    |        |
|   orig_source_name | text  | compound name from original data source    |        |
|   orig_content | integer  |  Average concentration (mg/100g) presented in original data source  |        |
|   orig_min | integer  | Minimum concentration (mg/100g) presented in original data source    |        |
|   orig_max | integer   |  Maximal concentration (mg/100g) presented in original data source   |        |
|   orig_unit | text  | Units presented in original data source    |        |
|   orig_citation | text | Citation from original data source  |        |
|   citation | text | Original data source  |        |
|   citation_type | text | Type of original data source  |        |
|   creator_id |  |  |    No values or data provided.   |
|   updater_id |  |  |  No values or data provided.  |
|   created_at | date/time | Date and time entry was created |        |
|   updated_at | text | Date and time entry was updated |        |
|   orig_method | text | Method used in original data source | Most are empty    |
|   orig_unit_expression | text | Units from original data source  |    Most are empty    |
|   standard_content | integer  |  Appears to be a duplicate of orig_content   |        |
|   preparation_type |  text  |  Methods of preparation or processing   |        |
|   export | binary  |  0, 1    |        |


## Food.csv

Food.csv contains information about the foods and beverages within FooDB.

| Column    | Data Type | Description                                 | Notes                      |
|-------------|-------------|---------------------------------|-------------|
| id | integer | Food ID within data table | Maps to Content\$food_id.  | 
| name | text | Food name| | 
| name_scientific | text | Scientific name of food | | 
| description | text | Detailed food description. | | 
| itis_id | integer | Integrated Taxonomic Information System (ITIS) id for food | | 
| wikipedia_id | text | Name in wikipedia search | | 
| picture_file_name | text | path for food image | | 
| picture_content_type | text | type of image | | 
| picture_file_size | integer | size of image in bytes | | 
| picture_updated_at | date/time| UTC date and time picture was updated | | 
| legacy_id | integer | | | 
| food_group | text | Classification of the food | | 
| food_subgroup | text | A more detailed classifcation of the food | | 
| food_type | factor | Type 1, Type 2, Unknown | | 
| created_at | date/time | UTC Date and time entry was created | | 
| updated_at | UTC Date and time entry was updated | | | 
| creator_id | integer | | | 
| updater_id | integer | | | 
| export_to_afcdb | binary | TRUE, FALSE | | 
| category | text | Unclear | Values are only 'specific' | 
| ncbi_taxonomy_id | integer | NCBI taxonomy number for food | | 
| export_to_foodb | binary | TRUE, FALSE| | 
| public_id |text | ID for searching food on FooDB | | 