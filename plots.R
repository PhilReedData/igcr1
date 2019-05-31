source("scripts/data_cleaning.R")

library("ggplot2")

ggplot(data = data, mapping = aes(x = gdpPercap, y = lifeExp)) + 
  geom_point()

# No lines or points if you miss out the last bit:
ggplot(data = data, mapping = aes(x = gdpPercap, y = lifeExp))

# Life expectancy against time:
ggplot(data = data, 
       mapping = aes(x = year, y = lifeExp, color=continent)) + 
  geom_point()


ggplot(data = data, 
       mapping = aes(x = year, y = lifeExp, by=country)) + 
  geom_line(mapping = aes(color=continent)) + geom_point()

ggplot(data = data, 
       mapping = aes(x = year, y = lifeExp, by=country)) + 
  geom_point(color="blue") +
  geom_line(mapping = aes(color=continent))

ggplot(data = data, 
       mapping = aes(x = year, y = lifeExp, by=country)) + 
  geom_point() +
  geom_line(mapping = aes(color=continent))

# statistical layers
ggplot(data = data, mapping = aes(x = gdpPercap, y = lifeExp)) + 
  geom_point(color="orange", size=3) + 
  scale_x_log10() + 
  geom_smooth(method="lm", size=1.5)


# Change the points to a different shape
# Color by continent
ggplot(data = data, 
       mapping = aes(x = gdpPercap, y = lifeExp, color = continent)) + 
  geom_point(shape=17, size=3) + 
  scale_x_log10() + 
  geom_smooth(method="lm", size=1.5)

# Panels
starts.with <- substr(data$country, start = 1, stop = 1)
head(starts.with)
tail(starts.with)
length(starts.with)
starts.with[600]

az.countries <- data[starts.with %in% c("A", "Z"), ]
summary(az.countries)
nrow(az.countries)

ggplot(data = az.countries, 
       mapping = aes(x = year, y = lifeExp, color = continent)) +
  geom_line() + facet_wrap(~ country)

ggplot(data = az.countries, 
       mapping = aes(x = year, y = lifeExp, color = continent)) +
  geom_line() + 
  facet_wrap(~ country) +
  labs (
    x = "Year",
    y = "Life expectancy",
    title = "Figure 1",
    color = "Continent"
  ) +
  theme(axis.text.x = element_text(angle = 90, hjust= 1))

# Save output
lifeExp_plot <- ggplot(data = az.countries, 
       mapping = aes(x = year, y = lifeExp, color = continent)) +
  geom_line() + 
  facet_wrap(~ country) +
  labs (
    x = "Year",
    y = "Life expectancy",
    title = "Figure 1",
    color = "Continent"
  ) +
  theme(axis.text.x = element_text(angle = 90, hjust= 1))

ggsave(filename = "results/lifeExp.png", plot = lifeExp_plot, 
       width = 12, height = 10, dpi = 300, units = "cm")

# Challenge
#  Create a density plot of GDP per capita, filled by continent.
#  Then, transform the x-axis to better visualize the data spread.
#  Add a facet layer to panel the density plots by year
ggplot(data = data, mapping = aes(x = gdpPercap)) + geom_density()

ggplot(data = data, mapping = aes(x = gdpPercap, fill = continent)) +
  geom_density(alpha=0.6) + facet_wrap(~ year) + scale_x_log10()
