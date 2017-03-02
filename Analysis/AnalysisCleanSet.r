library(ggplot2)
library(sm)
library(scales)
#upload clean dataset
dataset <- read.csv("Data/CleanedSalesData.csv",header=TRUE)
summary(dataset)

#plot sale price vs sqft

ggplot(dataset) + geom_point(data=dataset,aes(x=sale.price.n,
                                              y=gross.sqft), fill="DarkRed", shape=21)+scale_x_continuous(labels = comma)+scale_y_continuous(labels=comma)


#correlation coefficient
cor(dataset$gross.sqft,dataset$sale.price.n)
#reduced dataset. To see data claster closer
newset=subset(dataset,dataset$sale.price.n<1400000)
ggplot(dataset) + geom_point(data=newset,aes(x=sale.price.n,
                                             y=gross.sqft), fill="DarkRed", shape=21)+scale_x_continuous(labels = comma)+scale_y_continuous(labels = comma)
#correlation coeficcient realy sensitive to outliers
cor(newset$gross.sqft,newset$sale.price.n)
#boxplots
options(scipen=10000)
boxplot(dataset$gross.sqft,outline=FALSE,col="DarkRed", names="SQFT")
boxplot(dataset$sale.price.n,outline=FALSE,col="DarkRed",names="Sale price")

#qqplot of price to sqft
qqplot(x=dataset$sale.price.n,y=dataset$gross.sqft,col=rainbow(20))

#normal qqplot for ratio price to sqft
qqnorm(dataset$cs.pricePERsqft,col="Orange")
qqline(dataset$cs.pricePERsqft,col="Blue")

#hist with density curve Taken from http://www.statmethods.net/graphs/density.html
#because outlier drags to a high right scew logarithmic transformation was used
param.sale=log(dataset$sale.price.n)
h<-hist(param.sale, breaks=10, col="darkred", xlab="Sales Price", 
        main="Histogram with Normal Curve") 
xfit<-seq(min(param.sale),max(param.sale),length=40) 
yfit<-dnorm(xfit,mean=mean(param.sale),sd=sd(param.sale)) 
yfit <- yfit*diff(h$mids[1:2])*length(param.sale) 
lines(xfit, yfit, col="darkorchid3", lwd=2)
#because outlier drags to a high right scew logarithmic transformation was used
param.gross=log(dataset$gross.sqft)
h<-hist(param.gross, breaks=10, col="maroon2", xlab="Gross SQFT", 
        main="Histogram with Normal Curve") 
xfit<-seq(min(param.gross),max(param.gross),length=40) 
yfit<-dnorm(xfit,mean=mean(param.gross),sd=sd(param.gross)) 
yfit <- yfit*diff(h$mids[1:2])*length(param.gross) 
lines(xfit, yfit, col="yellowgreen", lwd=2)
#histogram with density curve for ratio price to sqft
#there is not need in logarithmic transformation
param.PriceSQFT=dataset$cs.pricePERsqft
h<-hist(param.PriceSQFT, breaks=10, col="orangered2", xlab="Ratio price to sqft", 
        main="Histogram with Normal Curve") 
xfit<-seq(min(param.PriceSQFT),max(param.PriceSQFT),length=40) 
yfit<-dnorm(xfit,mean=mean(param.PriceSQFT),sd=sd(param.PriceSQFT)) 
yfit <- yfit*diff(h$mids[1:2])*length(param.PriceSQFT) 
lines(xfit, yfit, col="lightslateblue", lwd=2)
