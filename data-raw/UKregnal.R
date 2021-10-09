## code to prepare `UKregnal` dataset goes here

UKregnal <- read.csv("data-raw/UKregnal.csv")

missingGregorian <- which(UKregnal$GregorianStart=="" | is.na(UKregnal$GregorianStart))
for (i in missingGregorian) {
  jd <- julian2julianDay(UKregnal$JulianStart[i])
  UKregnal$GregorianStart[i] <- julianDay2gregorian(jd)
}

missingJulian <- which(UKregnal$JulianStart=="" | is.na(UKregnal$JulianStart))
for (i in missingJulian) {
  jd <- gregorian2julianDay(UKregnal$GregorianStart[i])
  UKregnal$JulianStart[i] <- julianDay2julian(jd)
}

UKregnal$JulianStart <- as.Date(UKregnal$JulianStart)
UKregnal$GregorianStart <- as.Date(UKregnal$GregorianStart)

usethis::use_data(UKregnal, overwrite = TRUE)
