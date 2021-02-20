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

The first argument to `read_csv()` is the most important: it's the path to the file to read.

```{r, message = TRUE}
heights <- read_csv("data/heights.csv")
```

`read_csv()` uses the first line of the data for the column names, which is a very common
convention. There are two cases where you might want to tweak this behaviour:

We also have a tsv file in our Day4 data folder.

What happens when you try the following?

```{r}
read_csv("data/heights.tsv")
```
