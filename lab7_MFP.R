# Farees Patel
# Lab 7 Maps and Visualization 

# load the packages
library('ggplot2')
library('ggmap')
 
#1

# show map of syracuse using ggplot
syr <- geocode('syracuse university, syracuse, ny')
syr.map <- get_map(location = syr, zoom = 11)
syr.map <- ggmap(syr.map)
syr.map

# read the dataset
crimeData <- read.csv('crimeInSYR.csv', header = FALSE)
# add column names to the dataset
colnames(crimeData) <- (c('Type', 'Address', 'City', 'Time'))

# get lat/lon for all addresses
gCodes <- geocode(paste(as.character(crimeData$Address), crimeData$City))
syrCrimesDF <- data.frame(gCodes)
crimeData$gCodes <- gCodes

# create a map with ¡®points¡¯ for each of the crimes
map.crime <- syr.map + geom_point(data = crimeData, aes(x = gCodes$lon, y = gCodes$lat, alpha = 0.1), 
                                  color = 'darkred')
map.crime

#2

# create a density map
gg <- syr.map
gg <- gg + stat_density2d(aes(x = gCodes$lon, y = gCodes$lat, fill = ..level.., alpha = ..level..), 
                    data = crimeData,
                    geom  = 'polygon')+
  scale_fill_gradient(low = 'black', high = 'green') +
  scale_alpha(range = c(0.00, 0.25)) +
  ggtitle('plot density for crimes') + 
  theme(plot.title = element_text(lineheight = 3.5, face = 'bold'))
# show the density map
gg

#End of Lab-7