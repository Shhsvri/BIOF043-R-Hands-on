# Relational Data

## Introduction

Most data analysis jobs require more than a single table of data. Typically you have many
tables of data, and you must combine them to answer the questions that you're interested in.
Collectively, multiple tables of data are called **relational data** because it is the
relations, not just the individual datasets, that are important.

The most common place to find relational data is in a _relational_ database management system
(or RDBMS), a term that encompasses almost all modern databases. If you've used a database
before, you've almost certainly used SQL. If so, you should find this lecture's concepts
familiar, although their expression in dplyr is a little different. Generally, dplyr is a little
easier to use than SQL because dplyr is specialised to do data analysis: it makes common data
analysis operations easier, at the expense of making it more difficult to do other things that
aren't commonly needed for data analysis.

### left\_join

left\_join is one of my most commonly used functions when I work with medical datasets.
Let's first create a few data frames which we could then merge using commong key/values.

```{r setup, message = FALSE}
df <- data.frame(x<-c(1,23,4,43,2,17),y<-c("a","b","b","b","a","d"))
dj <- data.frame(y<-c("a","b","c"),z<-c("apple","pear","orange"))
```

Now, let's view the content of each:

```{r}
View(df)
View(dj)
```

Now, we merge the two tables using the common `y` column.

```{r}
left_join(df,dj)
```

<img src="img/left_join.png" width="600">
