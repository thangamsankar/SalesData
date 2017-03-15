GDP_data <- GDP_data[, c(1,2,4,5)]
colnames(GDP_data) <- c("CountryCode", "Ranking", "CountryName", "GDP_Amount")
GDP_data$GDP_Amount <- as.numeric(gsub(",", "", GDP_data$GDP_Amount))

# count of NA values
GDP_NA_Country <- sum(is.na(GDP_data$CountryCode))
GDP_NA_Ranking <- sum(is.na(GDP_data$Ranking))
GDP_NA_Amount <- sum(is.na(GDP_data$GDP_Amount))
GDP_NA_Count <- sum(is.na(GDP_data))
EDU_NA_Country <- sum(is.na(EDU_data$CountryCode))
EDU_NA_Income  <- sum(is.na(EDU_data$Income.Group))
EDU_NA_Count <- sum(is.na(EDU_data))
# remove empty columns and NA values
GDP_data <- GDP_data[!is.na(GDP_data$CountryCode),]
GDP_data <- GDP_data[!is.na(GDP_data$Ranking),]
GDP_data <- Filter(function(x)!all(is.na(x) | x == ""), GDP_data)
EDU_data <- Filter(function(x)!all(is.na(x)), EDU_data)
nrow(GDP_data)
