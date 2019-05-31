download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder_data.csv", destfile = "data/gapminder_data.csv")
data <- read.csv("data/gapminder_data.csv", stringsAsFactors = FALSE)  

data$pop <- data$pop / 1e6
data$life_exp_above_80 <- data$lifeExp > 80