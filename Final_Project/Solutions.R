# BIOF043 - Final Project
# Shahin Shahsavari
# 11/03/2022

# Load the required libraries

library(tidyverse)


# Load the `~/Day4/datasets/medicare_subset_claims.tsv` file in R

medicare_claims <- read_tsv("~/day4/data/raw/medicare_subset_claims.tsv")


# Identify the columns of this data frame using glimpse()

glimpse(medicare_claims)


# Use `count()` on the column that identifies the state

medicare_claims %>%
  count(provider_state)


# Filter the dataframe and find all the Buprenorphine claims
# (hint: This is in the drug_name column).

medicare_claims %>%
  filter(drug_name == "BUPRENORPHINE")


# Which State has the highest number of Buprenorphine claims?

medicare_claims %>%
  filter(drug_name == "BUPRENORPHINE") %>%
  count(provider_state) %>%
  arrange(desc(n))


# * We just found out that sometimes the providers use the terms "BUPRENORPHINE HCL"
# or "BUPRENORPHINE-NALOXONE". Revise your filter to include those as well.
# Store the output into buprenorphine_claims


buprenorphine_claims <- medicare_claims %>%
  filter(drug_name == "BUPRENORPHINE" | drug_name == "BUPRENORPHINE HCL" | drug_name == "BUPRENORPHINE-NALOXONE")


# Use count to generate the number of buprenorphine claims by state
# The use geom_bar to plot the aggregate counts

buprenorphine_state_count <- buprenorphine_claims %>%
                               count(provider_state)
ggplot() +
  geom_bar(data = buprenorphine_state_count,
           aes(x = reorder(provider_state,-n), y = n),
           stat = "identity")


# Load the ~/Day4/datasets/medicare_providers.csv file in R

providers <- read_csv("~/day4/data/raw/medicare_providers.csv")


# Use left_join() to merge the providers by name specialty with the claims dataframe

joined_claims_bup <- left_join(buprenorphine_claims, providers, by = "provider_ID")


# What specialty prescribe buprenorphine the most?

joined_claims_bup %>%
  count(specialty_description) %>%
  arrange(desc(n))


# Using mutate(), add a new column dividing the values of total_drug_cost by total_claim_count. Call this column cost_per_claim

joined_claims_bup %>%
  mutate(cost_per_claim = total_drug_cost/total_claim_count)


# Using group_by() and summarize(), find the mean the cost_per_claim column per each state.

joined_claims_bup %>%
  mutate(cost_per_claim = total_drug_cost/total_claim_count) %>%
  group_by(provider_state) %>%
  summarize(mean_per_state=mean(cost_per_claim))


# Sort this output using arrange()

joined_claims_bup %>%
  mutate(cost_per_claim = total_drug_cost/total_claim_count) %>%
  group_by(provider_state) %>%
  summarize(mean_per_state = mean(cost_per_claim)) %>%
  arrange(mean_per_state)


# use the output you just generated to print find out which state has the highest average cost_per_claim for buprenorphine

joined_claims_bup %>%
  mutate(cost_per_claim = total_drug_cost/total_claim_count) %>%
  group_by(provider_state) %>%
  summarize(mean_per_state = mean(cost_per_claim)) %>%
  arrange(mean_per_state) %>%
  tail(1)
