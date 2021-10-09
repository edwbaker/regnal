## code to prepare `ScotlandRegnal` dataset goes here

ScotlandRegnal <- read.csv("data-raw/ScotlandRegnal.csv")

missingGregorian <- which(ScotlandRegnal$GregorianStart=="" | is.na(ScotlandRegnal$GregorianStart))
for (i in missingGregorian) {
  jd <- julian2julianDay(ScotlandRegnal$JulianStart[i])
  ScotlandRegnal$GregorianStart[i] <- julianDay2gregorian(jd)
}

missingJulian <- which(ScotlandRegnal$JulianStart=="" | is.na(ScotlandRegnal$JulianStart))
for (i in missingJulian) {
  jd <- gregorian2julianDay(ScotlandRegnal$GregorianStart[i])
  ScotlandRegnal$JulianStart[i] <- julianDay2julian(jd)
}

ScotlandRegnal$JulianStart <- as.Date(ScotlandRegnal$JulianStart)
ScotlandRegnal$GregorianStart <- as.Date(ScotlandRegnal$GregorianStart)

usethis::use_data(ScotlandRegnal, overwrite = TRUE)
