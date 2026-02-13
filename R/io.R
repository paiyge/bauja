#' Read a list of buoy info, and give user the option to make it a spatial
#' object.
#' 
#' @export
#' @param form one of "table" or spatial table ("sf")
#' @returns table or an sf table
read_buoy_list = function(form = c("table", "sf")[1]){ # you get to be one of the two and Im picking one for you by default (sf)
  
  x = buoydata::buoy_data |>  # name space declaration -> you can also do this directly in the package.R but its not always worth it
    dyplyr::as_tibble()
  
  if(tolower(form[1]) == "sf"){ # because someone will probably provide both instead of just one
    x = sf::st_as_sf(x,
                     coords = c("LON", "LAT"),
                     crs = 4326)
  }
  return(x)
}