# ctrl- L to Clear screen
# ctrl + enter to Run selection
devtools::install_github("kjhealy/socviz")
library(tidyverse)
library(socviz)
library(here)
library(gapminder)

gapminder

# Examples https://www.oreilly.com/library/view/r-for-data/9781491910382/ch01.html
# https://moderndive.com/2-viz.html#ggplot2-package

#################################################

#https://socviz.co/makeplot.html#makeplot
p <- ggplot(data = gapminder, # <= Data
            mapping = aes(x = gdpPercap, # <= AES:  aesthetic attributes of the geometric object
                          y = lifeExp))

p # Why does nothing show????

p + geom_point() # <= geom: the geometric object in question

##############################################
p <- ggplot(data = gapminder,
           mapping = aes(x = gdpPercap,
                          y=lifeExp))
p + geom_smooth()

#############################################

# combine plots

p <- ggplot(data = gapminder, 
            mapping = aes(x = gdpPercap, 
                          y = lifeExp))
p + geom_smooth() + geom_point() 

#############################################
p <- ggplot(data = gapminder, 
            mapping = aes(x = gdpPercap, 
                          y = lifeExp))
p + geom_smooth(method = "lm") + geom_point() # linear smoothing

###########################################
# Final Chart
#Labels
p <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y=lifeExp))
p + geom_point(alpha = 0.3) +
  geom_smooth(method = "gam") +
  scale_x_log10(labels = scales::dollar) +
  labs(x = "GDP Per Capita", y = "Life Expectancy in Years",
       title = "Economic Growth and Life Expectancy",
       subtitle = "Data points are country-years",
       caption = "Source: Gapminder.")

###################################################################
#Lets use the NYCFlights data
install.packages("nycflights13")
library(nycflights13)

View(weather)
# data wrangling using dplyr
early_january_weather <- weather %>% 
  filter(origin == "EWR" & month == 1 & day <= 15)

# Line graphs
ggplot(data = early_january_weather, 
       mapping = aes(x = time_hour, y = temp)) +
  geom_line()


# Histograms
ggplot(data = early_january_weather, mapping = aes(x = temp)) +
  geom_histogram(bins = 30, color = "white")

# facets

ggplot(data = weather, mapping = aes(x = temp)) +
  geom_histogram(bins = 50, binwidth = 5, color = "white") +
  facet_wrap(~month) # display facets by month
#####################################################################

