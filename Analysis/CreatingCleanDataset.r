#read file with raw data
bk <- read.csv("/Data/rollingsales_statenisland.csv",skip=4,header=TRUE)

## Check the data
head(bk)
summary(bk)
str(bk)
#variable names to lower case for easy use
names(bk) <- tolower(names(bk))
# We create the new numeric variables that is a "clean' version of raw data variables.
#by removing not actual sales - without sale price or with sale price equal to 0
#the same with other variables. Because it's unlikely to see sold building (and we
#are interested only in buildings) with 0 sqft
#which means it's impossible to make a correct analysis on a row with unaccurate data.
bk$sale.price.n <- as.numeric(gsub("[^[:digit:]]","", bk$sale.price))
bk$gross.sqft <- as.numeric(gsub("[^[:digit:]]","", bk$gross.square.feet))
bk$land.sqft <- as.numeric(gsub("[^[:digit:]]","", bk$land.square.feet))
bk$years.built <- as.numeric(as.character(bk$year.built))
#create dataset with actual sales
cs=subset(bk,bk$sale.price.n>0&bk$gross.sqft>0&bk$land.sqft>0&bk$year.built>0)
#remove columns
cs$sale.price=NULL
cs$gross.square.feet=NULL
cs$land.square.feet=NULL
cs$year.built=NULL

#checking for outliers and decaiding what to do with them 
#this code is taken from https://www.r-bloggers.com/identify-describe-plot-and-remove-the-outliers-from-the-dataset/
outlierKD <- function(dt, var) {
  var_name <- eval(substitute(var),eval(dt))
  na1 <- sum(is.na(var_name))
  m1 <- mean(var_name, na.rm = T)
  par(mfrow=c(2, 2), oma=c(0,0,3,0))
  boxplot(var_name, main="With outliers")
  hist(var_name, main="With outliers", xlab=NA, ylab=NA)
  outlier <- boxplot.stats(var_name)$out
  mo <- mean(outlier)
  var_name <- ifelse(var_name %in% outlier, NA, var_name)
  boxplot(var_name, main="Without outliers")
  hist(var_name, main="Without outliers", xlab=NA, ylab=NA)
  title("Outlier Check", outer=TRUE)
  na2 <- sum(is.na(var_name))
  cat("Outliers identified:", na2 - na1, "n")
  cat("Propotion (%) of outliers:", round((na2 - na1) / sum(!is.na(var_name))*100, 1), "n")
  cat("Mean of the outliers:", round(mo, 2), "n")
  m2 <- mean(var_name, na.rm = T)
  cat("Mean without removing outliers:", round(m1, 2), "n")
  cat("Mean if we remove outliers:", round(m2, 2), "n")
  dt[as.character(substitute(var))] <- invisible(var_name)
  assign(as.character(as.list(match.call())$dt), dt, envir = .GlobalEnv)
  cat("Outliers successfully removed", "n")
  return(invisible(dt))
}

#our outliers drag data to the left and it's unlikely the property would be sold for a price around 1$ or
#few hundred dollars. The same thing with gross sqft. In real dataset I would rather check every outlier
#if it's a real or just a some kind of a mistake, but due to this impossible and data looks rather
#better without outliers, we remove outliers. The best sign of weird signs I think is the ratio price/sqft
#so we will remove outliers that behave weird there.

#apply this function until we get 0% proportion. This way will get meaningful dataset.
outlierKD(cs,cs.pricePERsqft)
cleanset=subset(cs,!is.na(cs$cs.pricePERsqft))

#create csv with clean data
write.csv(cleanset,file='/Data/CleanedSalesData.csv')
