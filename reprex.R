# Predict a car's number of cylinders from its number of gears using an ordinal model

# Load library
library(ordinal)

# Create data
dat <- data.frame(
  row.names = c("Mazda RX4","Mazda RX4 Wag","Datsun 710", "Hornet 4 Drive","Hornet Sportabout","Valiant","Duster 360", "Merc 240D","Merc 230","Merc 280","Merc 280C", "Merc 450SE","Merc 450SL","Merc 450SLC","Cadillac Fleetwood", "Lincoln Continental","Chrysler Imperial","Fiat 128","Honda Civic", "Toyota Corolla","Toyota Corona","Dodge Challenger", "AMC Javelin","Camaro Z28","Pontiac Firebird","Fiat X1-9", "Porsche 914-2","Lotus Europa","Ford Pantera L","Ferrari Dino", "Maserati Bora","Volvo 142E"),
  cyl = c(6,6,4,6,8,6,8,4,4,6,6,8,8,8,8,8,8,4,4,4,4,8,8,8,8,4,4,4,8,6,8,4),
  gear = c(4,4,4,3,3,3,3,4,4,4,4,3,3,3,3,3,3,4,4,4,3,3,3,3,3,4,5,5,5,5,5,4)
)

clm(cyl~gear,data=dat)
