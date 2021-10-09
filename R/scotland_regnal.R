#' Start dates of Scottish regnal years.
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
#' @source Dunbar, AH (1906) A Revised Chronology of Scottish History 1005 - 1625.
"ScotlandRegnal"
utils::globalVariables(c("ScotlandRegnal"))
