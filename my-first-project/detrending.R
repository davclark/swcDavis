# These are my generally useful functions
require(plyr)

detrend <- function(var, year) {
  resid(lm(var ~ year)) + mean(var, na.rm = TRUE)
}

# Takes a dataframe with a country column, and detrends a given column with ddply
detrend.countries <- function(countries.df) {
  ddply(countries.df, "country", 
        transform, 
        deviation = 
        # XXX - make this more general?
          detrend(gdpPercap, year))
}