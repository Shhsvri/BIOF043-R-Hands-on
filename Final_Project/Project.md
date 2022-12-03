# Final Project

Welcome to the last part of the workshop where we put all the skills we have learned in R to analyze data.

### Project Description

Buprenorphine is a prescription drug used to treat opioid dependence. It is used on its own or formulated in combination with naloxone.

We seek to understand patterns of buprenorphine usage nationally. Using the [2017 Medicare Part D Prescriber file](https://data.cms.gov/provider-summary-by-type-of-service/medicare-part-d-prescribers/medicare-part-d-prescribers-by-provider-and-drug/data), aggregate buprenorphine claims by the state of the provider and generate a reports using the following steps:

1. Load the `~/Day4/datasets/medicare_subset_claims.tsv` file in R
2. Identify the columns of this data frame using `glimpse()`
3. Use `count()` on the column that identifies the state
   * the `count()` function counts the number of appearances of each element in a column
4. Filter the dataframe and find all the `BUPRENORPHINE` claims (hint: This is in the drug\_name column).
5. Which State has the highest number of `BUPRENORPHINE` claims?
   * you can use `count()` to generate numbers per state and `arrange()` to sort your column
6. We just found out that sometimes the providers use the terms "BUPRENORPHINE HCL" or "BUPRENORPHINE-NALOXONE". Revise your filter to include those as well. Save this output into a variable and name it `buprenorphine_claims`
7. Use `geom_bar()` to find the aggregate count of buprenorphine claims with the state names as your x axis.
   * generate the count table first, then use geom_bar to plot the aggregate counts

Next, we would like to find out which providers (by specialty) prescribe buprenorphine the most.
A second relational table is given: `medicare_providers.csv`

8. Load the `~/Day4/datasets/medicare_providers.tsv` file in R
9. Use `left_join()` to merge the providers by name specialty with the claims dataframe
10. Which specialty prescribes buprenorphine the most.

Lastly, we will get the cost of buprenorphine per claim.

11. Using `mutate()`, add a new column dividing the values of `total_drug_cost` by `total_claim_count`. Call this column `cost_per_claim`
12. Using `group_by()` and `summarize()`, find the mean the `cost_per_claim` column per each state.
13. Sort this using `arrange()`
14. Lastly, find out which state has the highest average `cost_per_claim` for buprenorphine
