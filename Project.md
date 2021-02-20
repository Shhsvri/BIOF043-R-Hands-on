# Capstone Project 1

Welcome to the last part of the workshop where we put all the skills we have learned in R to analyze data.

### Project 1

Buprenorphine is a prescription drug used to treat opioid dependence. It is used on its own or formulated in combination with naloxone.

We seek to understand patterns of buprenorphine usage nationally. Using the 2017 Medicare Part D Prescriber file, aggregate buprenorphine claims by the state of the provider and report the top 5 states by volume of buprenorphine usage.

* Load the `~/Day4/datasets/medicare_subset_claims.tsv` file in R
* Identify the columns of this data frame using `glimpse()`
* Use `count()` on the column that identifies the state
	* the `count()` function counts the number of appearances of each element in a column
* Filter the dataframe and find all the `BUPRENORPHINE` claims (hint: This is in the drug\_name column).
* Which State has the highest number of `BUPRENORPHINE` claims?
	* you can use `arrange()` to sort your column
* We just found out that sometimes the providers use the terms "BUPRENORPHINE HCL" or "BUPRENORPHINE-NALOXONE". Revise your filter to include those as well.
* Use `geom_histogram` to find the aggregate count of buprenorphine claims with the state names as your x axis.

Next, we would like to find out which providers (by specialty) prescribe buprenorphine the most.
A second relational table is given: `medicare_providers.csv`

* Load the `~/Day4/datasets/medicare_providers.csv` file in R
* Use `left\_join()` to merge the providers by name specialty with the claims dataframe
* Which specialty prescribe buprenorphine the most.

Lastly, we will get the cost of buprenorphine per claim.

* Using `mutate()`, add a new column dividing the values of `total_drug_cost` by `total_claim_count`. Call this column `cost_per_claim`
* Using `group\_by()` and `summarize()`, find the mean the `cost_per_claim` column per each state.
* Sort this using `arrange()`
* Lastly, find out which state has the highest average `cost_per_claim` for buprenorphine

## Solutions will be posted at 3PM today.
