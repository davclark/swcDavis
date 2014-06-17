# Make a matrix with one column each for three countries 
# (your choice), one row for each year, each "cell" is 
# gdpPercap

source(file.path("scripts", "load_data.R"))

#these are interesting countries :)
country.names <- c('Afghanistan', 'China', 'Argentina')



country.index <- gDat$country == country.names[1]
gdp.matrix <- gDat$gdpPercap[country.index]
for(i in seq(2,3)) {
  country.index <- gDat$country == country.names[i]
  cbind(gdp.matrix, gDat$gdpPercap[country.index])
}