---
title: "E. coli research"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown
```{r}
source("scripts/load_ecoli.R")
```


This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r cars}
summary(metadata)
```

## Including Plots

You can also embed plots, for example:

```{r pressure, echo=FALSE}
ggplot(metadata) + 
  geom_point(aes(x = sample, y= genome_size))
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
