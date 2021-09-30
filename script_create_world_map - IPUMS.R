############################################################################### 
############################################################################### 
############################################################################### 

# Script na tvorbu mapiček

############################################################################### 

# Inspirace

# https://journal.r-project.org/archive/2011-1/RJournal_2011-1_South.pdf
# https://stackoverflow.com/questions/11225343/how-to-create-a-world-map-in-r-with-specific-countries-filled-in

############################################################################### 

# Balíčky ---------------------------------------------------------------------
library(rworldmap)
library(RColorBrewer)

# Data ------------------------------------------------------------------------
data <- read.csv2("script_data - IPUMS.csv")
data <- data[,-1]

# index <- which(data$IPUMS != "")
# data <- data[index,]

# Map -------------------------------------------------------------------------

## Create multiple color codes, with Burkina Faso in its own group
malDF <- data.frame(
  country = data$CODES,
  data = data$IPUMS
  )

## Re-merge
malMap <- joinCountryData2Map(malDF,
                              joinCode = "ISO3",
                              nameJoinColumn = "country")

# Pro uložení mapy
png("map_IPUMS.png",
    width = 7000,
    height = 3500,
    units="px")

## Specify the colourPalette argument
mapCountryData(malMap, 
               nameColumnToPlot = "data", 
               mapTitle = NULL, #Země s analyzovanou vlastností",
               catMethod = "categorical",
               # missingCountryCol = gray(1), #gray(.8),
               borderCol = gray(0.3),
               colourPalette = c('white', "#D3D3D3"),
               addLegend = FALSE,
               ### Hranice mapy
               # mapRegion = "world",
               #xlim = c(-180, 180),
               #ylim = c(-30, 90),
               )

# Pro uložení mapy
dev.off()

############################################################################### 
############################################################################### 
############################################################################### 
