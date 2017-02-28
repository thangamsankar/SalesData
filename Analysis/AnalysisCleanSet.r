library(ggplot2)
dataset <- read.csv("CleanedSalesData.csv",header=TRUE)
summary(dataset)

#plot sqft against price
ggplot(df) + geom_point(data=dataset,aes(x=sale.price.n,
              y=gross.sqft), fill="DarkRed", shape=21)
#correlation coefficient
cor(dataset$gross.sqft,dataset$sale.price.n)