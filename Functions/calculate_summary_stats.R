# calculate summary statistics by group

## This script provides a set of common summary statistics for an outcome by one categorical grouping variable

## Inputs 
### data = dataframe which contains the grouping variable and summary variable
### group_var = grouping variable
### summary_var = outcome of interest

## Outputs
###  Tibble where columns are the summary measures.

# Define a custom function to calculate summary statistics by group
calculate_summary_stats = function(data, group_var, summary_var) {
  data %>%
    group_by({{ group_var }}) %>%
    summarise(
      min = min({{ summary_var }}),
      q1 = quantile({{ summary_var }}, 0.25),
      median = median({{ summary_var }}),
      mean = mean({{ summary_var }}),
      sd = sd({{ summary_var }}),
      se = sd/sqrt(length({{ summary_var }})),
      q3 = quantile({{ summary_var }}, 0.75),
      max = max({{ summary_var }})
    )
}