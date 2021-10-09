regnalYear <- function(date, region="UK", system="UK", abbr=FALSE) {
  if (region=="UK") {
    return(regnalYearUK(date, system=system, abbr=abbr))
  }
}

regnalYearUK <- function(date, system, abbr) {
  if (system=="UK") {
    if (date < "1752-09-02") {
      system <- "Julian"
    } else {
      system <- "Gregorian"
    }
  }
  if (system=="European") {
    if (date < "1582-10-05") {
      system <- "Julian"
    } else {
      system <- "Gregorian"
    }
  }
  if (system=="Gregorian") {
    row <- max(which(date >= UKregnal$GregorianStart))
    return(regnalYearFormat(date, UKregnal[row,], system=system, abbr=abbr))
  }
  if (system=="Julian") {
    row <- max(which(date >= UKregnal$JulianStart))
    return(regnalYearFormat(date, UKregnal[row,], system=system, abbr=abbr))
  }
}

regnalYearFormat <- function(date, data, system, abbr) {
  d <- as.Date(date)
  y <- as.integer(format(d, "%Y"))
  m <- as.integer(format(d, "%m"))
  d <- as.integer(format(d, "%d"))
  if (system=="Gregorian") {
    dr <- as.Date(data$GregorianStart)
  }
  if (system=="Julian") {
    dr <- as.Date(data$JulianStart)
  }
  yr <- as.integer(format(dr, "%Y"))
  mr <- as.integer(format(dr, "%m"))
  dr <- as.integer(format(dr, "%d"))

  if (data$RegnalYear == "") {
    if (m>mr | (m==mr & d>= dr)) {
      ry <- y-yr+1
    } else {
      ry <- y-yr
    }
  } else {
    ry <- data$RegnalYear
  }

  if (abbr==TRUE) {
    return(paste(ry, data$Abbreviation))
  } else {
    return(paste(ry, data$Reign))
  }
}

