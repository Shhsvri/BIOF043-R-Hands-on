# Load the `~/Day4/datasets/medicare_subset_claims.tsv` file in R

medicare_claims <- read_tsv("~/Day4/datasets/medicare_subset_claims.tsv")


# Identify the columns of this data frame using glimpse()

glimpse(medicare_claims)


# Use `count()` on the column that identifies the state

medicare_claims %>%
  count(provider_state)


# Filter the dataframe and find all the BUPRENORPHINE claims
# (hint: This is in the drug_name column).

medicare_claims %>%
  filter(drug_name == "BUPRENORPHINE")


# Which State has the highest number of BUPRENORPHINE claims?

medicare_claims %>%
  filter(drug_name == "BUPRENORPHINE") %>%
  count(provider_state) %>%
  arrange(desc(n))


# * We just found out that sometimes the providers use the terms "BUPRENORPHINE HCL"
# or "BUPRENORPHINE-NALOXONE". Revise your filter to include those as well.

buprenorphine_sorted_by_state <- medicare_claims %>%
  filter(drug_name == "BUPRENORPHINE" | drug_name == "BUPRENORPHINE HCL" | drug_name == "") %>%
  count(provider_state) %>%
  arrange(n)


# Use geom_bar to find the aggregate count of buprenorphine claims with the state names 
# as your x axis.

ggplot() +
  geom_bar(data = buprenorphine_sorted_by_state,
           aes(x = reorder(provider_state,-n), y = n),
           stat = "identity")


# Load the ~/Day4/datasets/medicare_providers.csv file in R

providers <- read_csv("~/Day4/datasets/medicare_providers.csv")


# Use left_join() to merge the providers by name specialty with the claims dataframe

joined_claims_df <- left_join(medicare_claims, providers, by = "provider_ID")


# Which specialty prescribe buprenorphine the most?

joined_claims_df %>%
   count(specialty_description) %>%
   arrange(desc(n))

# Using mutate(), add a new column dividing the values of total_drug_cost by total_claim_count. Call this column cost_per_claim

joined_claims_df %>%
  mutate(cos_per_claim = total_drug_cost/total_claim_count)


# Using group_by() and summarize(), find the mean the cost_per_claim column per each state.

joined_claims_df %>%
  mutate(cost_per_claim = total_drug_cost/total_claim_count) %>%
  group_by(provider_state) %>%
  summarize(mean(cost_per_claim))


# Sort this output using arrange()

joined_claims_df %>%
  mutate(cost_per_claim = total_drug_cost/total_claim_count) %>%
  group_by(provider_state) %>%
  summarize(mean_per_state = mean(cost_per_claim)) %>%
  arrange(mean_per_state)


# use the output you just generated to print find out which state has the highest average cost_per_claim for buprenorphine

joined_claims_df %>%
  mutate(cost_per_claim = total_drug_cost/total_claim_count) %>%
  group_by(provider_state) %>%
  summarize(mean_per_state = mean(cost_per_claim)) %>%
  arrange(mean_per_state) %>%
  tail(1)
