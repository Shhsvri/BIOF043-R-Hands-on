# Capstone Projects

Welcome to the last part of the workshop where we put all the skills we have learned in R to do data science.

## agenda

We have two projects:\

1. From Medicare-Part-D data, we will generate visualizations showing the states that prescribe **Buprenorphine** the most, per capita.

2. From publicly available RNAseq data, we will find a list of differentially expressed genes comparing our study and control samples.


### Project 1

 Buprenorphine is a prescription drug used to treat opioid dependence. It is used on its own or formulated in combination with naloxone.

 We seek to understand patterns of buprenorphine usage nationally. Using the 2017 Medicare Part D Prescriber file (below), aggregate buprenorphine claims by the state of the provider and report the top 5 states by volume of buprenorphine usage.

**Provide a list of the top 5 states by volume of buprenorphine usage. You will need to:** 

- Download the data and methodology document here: https://data.cms.gov/Medicare-Part-D/Medicare-Provider-Utilization-and-Payment-Data-201/77gb-8z53

- Identify rows that describe claims for buprenorphine, including when formulated in combination with naloxone or other drugs.

- Identify a column that can be aggregated to describe per state usage of buprenorphine. Note that we seek to understand the total volume of buprenorphine by state, but claims vary in how many days' supply was prescribed.

- Use the methodology document to correctly complete these tasks (no other data or research is required to complete this assessment).

**DATA VISUALIZATION**

 Use the data set provided in the previous section to produce a graphic visualization for a general audience that illustrates buprenorphine usage for all 50 states, accentuating the top five states by usage.

**Generating RMarkdown Report**

Generate an RMarkdown report in your RStudio session and copy your code into code blocks. After each block, run your code to ensure it works.
