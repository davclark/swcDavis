# Make a matrix with one column each for three countries (your choice),
# one row for each year, each "cell" is gdpPercap

require(reshape2)

#another comment
source(file.path("scripts", "load_data.R"))

#do analysis for these countries
desired.countries <- c('Afghanistan', 'China', 'Argentina')

#get data for interesting countries
three.countries <- subset(gDat, 
              country %in% desired.countries)


acast(three.countries, year ~ country, value.var='gdpPercap')
wide.country.df <- dcast(gDat, year ~ country, value.var='gdpPercap')

#load moar stuff with fun
#plyr is not so trivial to learn, but pays off very quickly
require(plyr)


wide.country.array <- acast(gDat, year ~ country, 
            subset=.(country %in% desired.countries),
            value.var='gdpPercap')

detrend <- function(var, year) {
  resid(lm(var ~ year)) + mean(var, na.rm = TRUE)
}

# We can use this on a single dataset like so:
detrend(wide.country.array[,2], as.integer(row.names(wide.country.array)))

ddply(three.countries, "country", transform, 
      deviation = detrend(gdpPercap, year),
      reduced=gdpPercap-10000)

# This works, but is weird!
ddply(three.countries, "country", summarize, 
      deviation = detrend(gdpPercap, year),
      reduced=gdpPercap-10000)

ddply(three.countries, "country", summarize, 
      mean.gdp = mean(gdpPercap))