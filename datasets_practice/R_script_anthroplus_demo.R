## R Script for using Anthroplus macro (WHO-2007 Growth Reference for 5-19 years Children)
#-----------------------------------------------------------------------------------------

# Load required packages (You should install them first and then you can load)
library(tidyverse)
library(anthroplus)

# Import dataset
df_anthro_plus_practice <- read.csv("https://raw.githubusercontent.com/drpakhare/Workshop-NDA/master/datasets_practice/3_dataset_practice_anthro_plus.csv")

# z-score calculation
df_z_scores <- anthroplus_zscores(
  sex = df_anthro_plus_practice$sex,
  age_in_months = df_anthro_plus_practice$agemons,
  oedema = "n",
  height_in_cm = df_anthro_plus_practice$height,
  weight_in_kg = df_anthro_plus_practice$weight
)
# df_z_scores is a dataframe containing results similar to Anthro Survey Analyser

# Export results

write.csv(df_z_scores, file = "anthro_plus_z_scores.csv")

library(gt)

gt(df_z_scores)

# Prevalence calculation
df_results <- anthroplus_prevalence(
  sex = df_anthro_plus_practice$sex,
  age_in_months = df_anthro_plus_practice$agemons,
  oedema = "n",
  height_in_cm = df_anthro_plus_practice$height,
  weight_in_kg = df_anthro_plus_practice$weight,
  sw = NULL,
  cluster = NULL,
  strata = NULL
)
# df_results is a dataframe containing results similar to Anthro Survey Analyser

# Export results

write.csv(df_results, file = "anthro_plus_prevalence.csv")
library(gt)

# Display in good looking table

gt(df_results)