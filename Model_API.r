# Setting the directory
#setwd("C:/Users/Admin")
#Load Library
library(caret)
library(randomForest)
library(e1071)
library(plumber)

predictor<- function(id){
  
  data<-read.csv('data2.csv')
  f <- c('def','inc_brac4','inc_brac3','inc_brac2','inc_brac1','income_missing',
         'kin_missing','credit_score_m')
  data[,f] <-lapply(data[,f],as.factor)
  record<-data[id,]
  load('rf_creditscoring_model.RDATA')
  pred <- predict(final_fit, newdata= record,type="prob")
  return (pred)
}

#*@get /predict
function(id=""){
  results<-predictor(id)
  results<-list(model_results=results)
  return(results)
}

