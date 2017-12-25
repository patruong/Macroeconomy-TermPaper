"
Monthly date x-axis
http://stackoverflow.com/questions/17758006/time-series-plot-with-x-axis-in-year-month-in-r 
"
rm(list = ls())
layout(matrix(c(1,1,1,1),1,1,byrow=TRUE))
setwd("C:/Users/Patrick/Dropbox/Patrick/Documents/CINEK/ME2720 Macro for Business/TermPaper/csv")
getwd()

SWE_GDP<-ts(read.csv("BNP_IP_raw.csv", sep = ";", header = F), frequency = 12, start = 2005)
SWE_HOX<-ts(read.csv("HOX_index_raw.csv", sep = ";",header = F), frequency = 12, start = 2005)
SWE_CPI<-ts(read.csv("KPI_raw.csv", sep = ";",header = F), frequency = 12, start = 2005)

SWE_GDP_2009<-ts(read.csv("BNP_IP_2009_raw.csv", sep = ";",header = F), frequency = 12, start = 2009)
SWE_HOX_2009<-ts(read.csv("HOX_index_2009_raw.csv", sep = ";",header = F), frequency = 12, start = 2009)
SWE_CPI_2009<-ts(read.csv("KPI_2009_raw.csv", sep = ";",header = F), frequency = 12, start = 2009)

US_GDP<-ts(read.csv("US_GDP_Q_raw.csv", sep = ";",header = F), frequency = 12, start = 2005)
US_GDP_real<-ts(read.csv("US_GDP_real_Q_raw.csv", sep = ";",header = F), frequency = 12, start = 2005)
US_CPI<-ts(read.csv("US_CPI_raw.csv", sep = ";",header = F), frequency = 12, start = 2005)
US_CaseShiller<-ts(read.csv("US_CaseShillerHousing_raw.csv", sep = ";",header = F), frequency = 12, start = 2005)
US_PE<-ts(read.csv("SP_PE_raw.csv", sep = ";",header = F), frequency = 12, start = 2005)
US_PB<-ts(read.csv("SP_PB_IP_Q_raw.csv", sep = ";",header = F), frequency = 12, start = 2005)

US_GDP_2009<-ts(read.csv("US_GDP_Q_2009_raw.csv", sep = ";",header = F), frequency = 12, start = 2009)
US_GDP_real_2009<-ts(read.csv("US_GDP_real_Q_2009_raw.csv", sep = ";",header = F), frequency = 12, start = 2009)
US_CPI_2009<-ts(read.csv("US_CPI_2009_raw.csv", sep = ";",header = F), frequency = 12, start = 2009)
US_CaseShiller_2009<-ts(read.csv("US_CaseShillerHousing_2009_raw.csv", sep = ";",header = F), frequency = 12, start = 2009)
US_PE_2009<-ts(read.csv("SP_PE_2009_raw.csv", sep = ";",header = F), frequency = 12, start = 2009)
US_PB_2009<-ts(read.csv("SP_PB_IP_Q_2009_raw.csv", sep = ";",header = F), frequency = 12, start = 2009)



#Functions for TS analysis
RegTrend <- function(x) {
  t = seq(1:length(x))
  reg = lm(x~t)
  
  return(reg)
}

RegSeason <- function(x,p) {
  t = seq(1:length(x))
  regSes = lm(x~sin(2*pi*t/p)+cos(2*pi*t/p))
  
  return(regSes)
}
#
library("xts")

# Plots
plot(SWE_GDP, col = "blue")
plot(100+SWE_GDP-SWE_CPI, col = "blue", ylim = c(100,220), ylab = "Index", main = "Sweden index base 2005")
lines(SWE_HOX)
lines(SWE_CPI, col = "red")
grid()
legend('topleft', c('real GDP',"HOX", "CPI"), fill=c('blue',"black", "red"), inset=0.04)

plot(SWE_GDP_2009, col="blue")
plot(100+SWE_GDP_2009-SWE_CPI_2009, col = "blue", ylim=c(80,180), ylab = "Index", main = "Sweden index base 2009 ")
lines(SWE_HOX_2009)
lines(SWE_CPI_2009, col = "red")
grid()
legend('topleft', c('real GDP',"HOX", "CPI"), fill=c('blue',"black", "red"), inset=0.04)

plot(US_GDP, col = "blue", ylim=c(0,500))
lines(US_GDP - US_CPI, col = "purple")

plot(US_GDP_real, col = "blue", ylim=c(70,200), ylab = "Index", main = "US index base 2005")
lines(US_CPI, col = "red")
lines(US_PB, col = "green")
lines(US_CaseShiller)
grid()
legend('topleft', c('real GDP',"Case-Chiller", "CPI", "PB"), fill=c('blue',"black", "red", "green"), inset=0.04)

plot(US_GDP_real_2009, col = "blue", ylim=c(70,200), ylab = "Index", main = "US index base 2009")
lines(US_CPI_2009, col = "red")
lines(US_PB_2009, col = "green")
lines(US_CaseShiller_2009)
grid()
legend('topleft', c('real GDP',"Case-Shiller", "CPI", "PB"), fill=c('blue',"black", "red", "green"), inset=0.04)


#Corr-matrix
library("corrplot")
d <- data.frame(GDP=SWE_GDP,HOX= SWE_HOX, CPI=SWE_CPI)
names(d) <- c("GPD","HOX","CPI")
corrplot(cor(d),method ="number")

d <- data.frame(GDP=SWE_GDP_2009,HOX= SWE_HOX_2009, CPI=SWE_CPI_2009)
names(d) <- c("GPD","HOX","CPI")
corrplot(cor(d),method ="number")

d <- data.frame(GDP=US_GDP_real[1:133],CS=US_CaseShiller[1:133], CPI=US_CPI[1:133], PB=US_PB[1:133])
names(d) <- c("GPD","HOX","CPI","PB")
corrplot(cor(d),method ="number")

d <- data.frame(GDP=US_GDP_real_2009[1:85],CS=US_CaseShiller_2009[1:85], CPI=US_CPI_2009[1:85], PB=US_PB_2009[1:85])
names(d) <- c("GPD","HOX","CPI","PB")
corrplot(cor(d),method ="number")
