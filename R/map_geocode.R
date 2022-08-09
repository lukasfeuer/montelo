#' Get GeoCode Information from Google-Maps
#'
#' Note that in case of an error, the geoAddress column will repeat it's first valid entry (this should be fixed in a future update)
#'
#' @param data data.frame with a column 'addresses' which should contain the street, house number and city separated by spaces
#'
#' @return returns a data.frame with the additional columns 'lon', 'lat' and 'geoAddresses'
#' @export
#'
map_geocode <- function(data) {
  require(ggmap)
  for(i in 1:nrow(data)) {
    try({
      result <- geocode(data$addresses[i], output = "latlona", source = "google", force = T)
      data$lon[i] <- as.numeric(result[1])
      data$lat[i] <- as.numeric(result[2])
      data$geoAddress[i] <- as.character(result[3])
    })
  }
  return(data)
}
