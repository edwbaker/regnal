#' Start dates of UK regnal years.
#'
#' A dataset containing the start date of regnal years, the ruling
#' monarch(s) of those regnal years, and abbreviated name forms of the
#' monarch(s).
#'
#' @format A data frame with 4 variables:
#' \describe{
#'   \item{Reign}{Monarch, full name}
#'   \item{JulianStart}{Start date in Julian system, YYYY-MM-DD}
#'   \item{GregorianStart}{Start date in Gregorian system, YYYY-MM-DD}
#'   \item{Abbreviation}{Abbreviated form of data in Reign}
#'   \item{RegnalYear}{Used to store compound and complex years}
#' }
#' @source Harvey, P (1975) The Oxford Companion to English Literature.
"UKregnal"
utils::globalVariables(c("UKregnal"))
