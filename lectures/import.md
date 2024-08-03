# Data Import and Export

## Introduction

So far, we have worked with a variety of data provided by R packages. Today, we start working
our own data. There are a variety of different file types used for storing tabular data such as:

- csv: comma-separated values
- tsv: tab-separated values
- xlsx: Open XML Spreadsheet

### Prerequisites

We will need the **readr** package, which is part of the core tidyverse

```{r setup, message = FALSE}
library(tidyverse)
```

* `read_csv()` reads comma delimited files, `read_csv2()` reads semicolon
  separated files (common in countries where `,` is used as the decimal place)

* `read_tsv()` reads tab delimited files

* `read_delim()` reads in files with any delimiter.

These functions all have similar syntax: once you've mastered one, you can use the others with
ease. For the rest of this chapter we'll focus on `read_csv()`. Not only are csv files one of
the most common forms of data storage, but once you understand `read_csv()`, you can easily
apply your knowledge to all the other functions in readr.

The first argument to `read_tsv()` is the most important: it's the path to the file to read.

```{r, message = TRUE}
setwd("~/Day4/datasets")
raw_counts <- read_tsv("RNAseq_raw_counts.tsv")
View(raw_counts)
```

`read_tsv()` uses the first line of the text file for the column names, which is a very common convention.

We also have a csv file in our Day4 data folder.

What happens when you try the following?

```{r}
metadata <- read_tsv("metadata.csv")
View(metadata)
read_csv("metadata.csv")
View(metadata)
```

- Let's use `glimpse()` to get an overview of what is in this table

```{r}
glimpse(raw_counts)
```

- Next, we would like to select only three of the columns in our raw\_counts dataframe: geneID, read_count_AS1, and read_count_NC1 store the result in a new variable called: raw\_counts\_subset1

```{r}
raw_counts_subset1 <- raw_counts %>%
   select(EntrezID, Treated_1, Control_1)

glimpse(raw_counts_subset1)

ggplot(raw_counts_subset1) +
   geom_histogram(aes(x = Treated_1), bins = 100) + 
   xlim(-5, 500)  +
   xlab("Raw expression counts") +
   ylab("Number of genes")
```

- Lastly, let's filter out the genes with low RNAseq count values

```{r}
raw_counts_subset1_filtered <- raw_counts_subset1 %>%
  filter(Treated_1 > 20)

ggplot(raw_counts_subset1_filtered) +
   geom_histogram(aes(x = Treated_1), stat = "bin", bins = 200) + 
   xlim(-5, 500)  +
   xlab("Raw expression counts") +
   ylab("Number of genes")
```
