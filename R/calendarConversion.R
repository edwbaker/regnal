julianDayMonths <- function(){
  return(c(306, 337, 0, 31, 61, 92, 122, 153, 184, 214, 245, 275))
}

gregorian2julianDay <- function(y,m,d) {
 Z <- y + trunc((m-14)/12)
 v <- julianDayMonths()
 f <- v[m]
 jd <- d+f+365*Z+floor(Z/4)-floor(Z/100)+floor(Z/400) + 1721118.5
 return(jd)
}

julian2julianDay <- function(y,m,d) {
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
  v <- julianDayMonths()
  f <- v[M]
  D <- C - f + R
  Y <- Y + trunc(M/13)
  M <- M - 12*trunc(M/13)
  ret <- paste(Y,M,D, sep="/")
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
  f <- v[M]
  D <- C - f + R
  Y <- Y + trunc(M/13)
  M <- M - 12*trunc(M/13)
  ret <- paste(Y,M,D, sep="/")
  return(ret)
}
