## code to prepare `UKregnal` dataset goes here

UKregnal <- read.csv("data-raw/UKregnal.csv")

missingGregorian <- which(is.na(UKregnal$GregorianStart))
for (i in missingGregorian) {
  jd <- julian2julianDay(UKregnal$JulianStart[i])
  UKregnal$GregorianStart[i] <- julianDay2gregorian(jd)
}

UKregnal$JulianStart <- as.Date(UKregnal$JulianStart)
UKregnal$GregorianStart <- as.Date(UKregnal$GregorianStart)

usethis::use_data(UKregnal, overwrite = TRUE)
