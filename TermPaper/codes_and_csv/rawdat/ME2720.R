
rm(list = ls())
layout(matrix(c(1,1,1,1),1,1,byrow=TRUE))
setwd("C:/Users/Patrick/Dropbox/Patrick/Documents/CINEK/ME2720 Macro for Business/TermPaper/csv")
getwd()

BNP<-ts(read.csv("BNP_IP_raw.csv", sep = ";"))
HOX<-ts(read.csv("HOX_index_raw.csv", sep = ";"))
KPI<-ts(read.csv("KPI_raw.csv", sep = ";"))

BNP_gfcadj<-ts(read.csv("BNP_IP_2009_raw.csv", sep = ";"))
HOX_gfcadj<-ts(read.csv("HOX_index_2009_raw.csv", sep = ";"))
KPI_gfcadj<-ts(read.csv("KPI_2009_raw.csv", sep = ";"))



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

# Plots
plot(BNP, col = "blue")
lines(HOX)
lines(KPI, col = "red")

plot(BNP_gfcadj, col="blue")
lines(HOX_gfcadj)
lines(KPI_gfcadj, col = "red")
