#' Create rook contiguity weights from sf objects
#'
#' @param a sf object
#' @param b (optional) sf object
#'
#' @return
#' @export
#'
#' @examples
#' ncovr_rook <- st_rook(ncovr)
#' str(ncovr_rook)
#'
st_rook <- function(a, b = a) {
  sf::st_relate(a, b, pattern = "F***1****")
}

#' Create queen contiguity weights from sf objects
#'
#' @param a sf object
#' @param b (optional) sf object
#'
#' @return
#' @export
#'
#' @examples
#' ncovr_queen <- st_queen(ncovr)
#' str(ncovr_queen)
#'
st_queen <- function(a, b = a) {
  sf::st_relate(a, b, pattern = "F***T****")
}

#' Convert sparse geometric binary objects to nb objects
#'
#' @param sgbp sparse geometric binary object, returned by st_rook or st_queen
#'
#' @return
#' @export
#'
#' @examples
#' ncovr_rook <- st_rook(ncovr)
#' rook_nb <- st_as_nb(ncovr_rook)
#'
#' str(rook_nb)
#' summary(rook_nb)
#' class(rook_nb)
st_as_nb <- function(sgbp, ...) {
  attrs <- attributes(sgbp)
  sgbp <- lapply(sgbp, function(i) { if(length(i) == 0L) 0L else i } )
  attributes(sgbp) <- attrs
  class(sgbp) <- "nb"
  sgbp
}

#' Extract centroid coordinates as a matrix of an sf polygon object for plotting a connectivity graph
#'
#' @param x sf object
#'
#' @return
#' @export
#'
#' @examples
#' coords <- st_centroid_coords(ncovr)
#' ncovr_rook <- st_rook(ncovr)
#' rook_nb <- st_as_nb(ncovr_rook)
#'
#' plot(rook_nb, coords, lwd=.2, col="blue", cex = .5)
st_centroid_coords <- function(x) {
  longitude <- purrr::map_dbl(x$geometry, ~sf::st_centroid(.x)[[1]])
  latitude <- purrr::map_dbl(x$geometry, ~sf::st_centroid(.x)[[2]])
  coords <- cbind(longitude, latitude)

  coords
}
