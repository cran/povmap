#' Loading the Shape File for Austrian Districts
#'
#' The function simplifies to load the shape file for austrian districts.
#'
#' @return A shape file of class \code{SpatialPolygonsDataFrame}.
#' @details The shape file contains the borders of Austrian districts. Thus, it
#' can be used for the visualization of estimation results for Austrian
#' districts.
#' @export

load_shapeaustria <- function() {
  load(system.file("shapes/shape_austria_dis.rda", package = "povmap"),
    envir = .GlobalEnv
  )
}
