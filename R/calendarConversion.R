julianDayMonths <- function(){
  return(c(306, 337, 0, 31, 61, 92, 122, 153, 184, 214, 245, 275))
}

julian2gregorian <- function(date) {
  jd <- julian2julianDay(date)
  return(julianDay2gregorian(jd))
}

gregorian2julian <- function(date) {
  jd <- gregorian2julianDay(date)
  return(julianDay2julian(jd))
}

gregorian2julianDay <- function(date) {
  d <- as.Date(date)
  y <- as.integer(format(d, "%Y"))
  m <- as.integer(format(d, "%m"))
  d <- as.integer(format(d, "%d"))

  Z <- y + trunc((m-14)/12)
  v <- julianDayMonths()
  f <- v[m]
  jd <- d+f+365*Z+floor(Z/4)-floor(Z/100)+floor(Z/400) + 1721118.5
  return(jd)
}

julian2julianDay <- function(date) {
  d <- as.Date(date)
  y <- as.integer(format(d, "%Y"))
  m <- as.integer(format(d, "%m"))
  d <- as.integer(format(d, "%d"))

  Z <- y + trunc((m-14)/12)
  v <- julianDayMonths()
  f <- v[m]
  jd <- d+f+365*Z+floor(Z/4) + 1721116.5
  return(jd)
}

julianDay2gregorian <- function(jd) {
  t <- jd - 1721118.5
  Z <- floor(t)
  R <- t - Z
  A <- floor((Z - 0.25)/(36524.25))
  B <- Z - 0.25 + A - floor(A/4)
  Y <- floor(B/365.25)
  C <- Z + A - floor(A/4) - floor(365.25*Y)
  M <- trunc((5*C + 456)/ 153)
  v <- c(0, 31, 61, 92, 122, 153, 184, 214, 245, 275, 306, 337)
  f <- v[(M-2)]
  D <- C - f + R
  Y <- Y + trunc(M/13)
  M <- M - 12*trunc(M/13)
  ret <- paste(Y,M,D, sep="-")
  return(ret)
}

julianDay2julian <- function(jd) {
  t <- jd - 1721116.5
  Z <- floor(t)
  R <- t - Z
  Y <- floor((Z - 0.25)/365.25)
  C <- Z - floor(365.25*Y)
  M <- trunc((5*C + 456)/ 153)
  v <- julianDayMonths()
  f <- v[M%%12]
  D <- C - f + R
  Y <- Y + trunc(M/13)
  M <- M - 12*trunc(M/13)
  ret <- paste(Y,M,D, sep="-")
  return(ret)
}

#' Convert Julian Day to Modified Julian Day
#'
#' @param jd Modified Julian Day
#' @return Corresponding Modified Julian Day number
#' @export
#' @seealso mjd2julianDay
#' @source Baum,P (2020) Date Algorithms.
#' @examples
#' julianDay2mjd(0)
#'
julianDay2mjd <- function(jd) {
  return(jd - 2400000.5)
}

#' Convert Modified Julian Day to Julian Day
#'
#' Converts a Modified Julian Day (MJD) number (as used by some satellite
#' systems) to a Julian Day number. A MJD of zero corresponds to midnight
#' on November 17, 1858.
#'
#' @param mjd Modified Julian Day
#' @return Corresponding Julian Day number
#' @export
#' @seealso julianDay2mjd
#' @source Baum,P (2020) Date Algorithms.
#' @examples
#' mjd2julianDay(0)
#'
mjd2julianDay <- function(mjd) {
  return(mjd + 2400000.5)
}
