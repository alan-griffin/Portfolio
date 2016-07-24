library(randomForest)

setwd("/Users/Al/Desktop/Kaggle/Titanic/")

train = read.csv("train.csv") ; test = read.csv("test.csv")

train$Name = NULL ; train$Ticket = NULL ; train$Cabin = NULL
test$Name = NULL ; test$Ticket = NULL ; test$Cabin = NULL


# Find average age of male and female passengers - Train
train[is.na(train)] = 0
s1 = subset(train, Pclass == '1') ; s2 = subset(train, Pclass == '2') ; s3 = subset(train, Pclass == '3')
av_fare_first = mean(s1$Fare) ; av_fare_second = mean(s2$Fare) ; av_fare_third = mean(s3$Fare) 

s4 = subset(s1, Sex == 'male') ; s5 = subset(s1, Sex == 'female')
s6 = subset(s2, Sex == 'male') ; s7 = subset(s2, Sex == 'female')
s8 = subset(s3, Sex == 'male') ; s9 = subset(s3, Sex == 'female')
av_age_M_first = median(s4$Age) ; av_age_F_first = median(s5$Age)
av_age_M_second = median(s6$Age) ; av_age_F_second = median(s7$Age)
av_age_M_third = median(s8$Age) ; av_age_F_third = median(s9$Age)
# Then replace zero's with median age
for ( i in 1:nrow(train) ){
  if (train[i,5] == 0){ 
    if (train[i,3] == '1') { 
      if (train[i,4] == 'male') {
        train[i,5] = av_age_M_first
      }
      else { train[i,5] = av_age_F_first }
    }
    if (train[i,3] == '2') { 
      if (train[i,4] == 'male') {
        train[i,5] = av_age_M_second
      }
      else { train[i,5] = av_age_F_second }
    }
    if (train[i,3] == '3') { 
      if (train[i,4] == 'male') {
        train[i,5] = av_age_M_third
      }
      else { train[i,5] = av_age_F_third }
    }
  }
  
  if (train[i,8] == 0){
    if(train[i,3] == 1){
      train[i,8] = av_fare_first
    }
    if(train[i,3] == 2){
      train[i,8] = av_fare_second
    }
    if(train[i,3] == 3){
      train[i,8] = av_fare_third
    }
  }
}
remove(av_age_F_first, av_age_F_second, av_age_F_third)
remove(av_age_M_first, av_age_M_second, av_age_M_third)
remove(s1,s2,s3,s4,s5,s6,s7,s8,s9)

# Find average age of male and female passengers - Test
test[is.na(test)] = 0
s1 = subset(test, Pclass == '1') ; s2 = subset(test, Pclass == '2') ; s3 = subset(test, Pclass == '3')
av_fare_first = mean(s1$Fare) ; av_fare_second = mean(s2$Fare) ; av_fare_third = mean(s3$Fare) 
s4 = subset(s1, Sex == 'male') ; s5 = subset(s1, Sex == 'female')
s6 = subset(s2, Sex == 'male') ; s7 = subset(s2, Sex == 'female')
s8 = subset(s3, Sex == 'male') ; s9 = subset(s3, Sex == 'female')
av_age_M_first = median(s4$Age) ; av_age_F_first = median(s5$Age)
av_age_M_second = median(s6$Age) ; av_age_F_second = median(s7$Age)
av_age_M_third = median(s8$Age) ; av_age_F_third = median(s9$Age)
# Then replace zero's with median age
for ( i in 1:nrow(test) ){
  if (test[i,4] == 0){ 
    if (test[i,2] == '1') { 
      if (test[i,3] == 'male') {
        test[i,4] = av_age_M_first
      }
      else { test[i,4] = av_age_F_first }
    }
    if (test[i,2] == '2') { 
      if (test[i,3] == 'male') {
        test[i,4] = av_age_M_second
      }
      else { test[i,4] = av_age_F_second }
    }
    if (test[i,2] == '3') { 
      if (test[i,3] == 'male') {
        test[i,4] = av_age_M_third
      }
      else { test[i,4] = av_age_F_third }
    }
  }
  
  if (test[i,7] == 0){
    if(test[i,2] == 1){
      test[i,7] = av_fare_first
    }
    if(test[i,2] == 2){
      test[i,7] = av_fare_second
    }
    if(test[i,2] == 3){
      test[i,7] = av_fare_third
    }
  }
}
remove(av_age_F_first, av_age_F_second, av_age_F_third)
remove(av_age_M_first, av_age_M_second, av_age_M_third)
remove(s1,s2,s3,s4,s5,s6,s7,s8,s9)
remove(i, av_fare_third, av_fare_first, av_fare_second)


# Replace the two missing 'embarked' values with most common value
train[62, 9] = 'S' ; train[830, 9] = 'S'

m = matrix(0, nrow = nrow(train))
for ( i in 1:nrow(train) ){
  if (train[i,4] == 'female'){ m[i] = 1 }
}
train$Sex = m

m = matrix(0, nrow = nrow(test))
for ( i in 1:nrow(test) ){
  if (test[i,3] == 'female'){ m[i] = 1 }
}
test$Sex = m

m = matrix(0, nrow = nrow(train))
for ( i in 1:nrow(train) ){
  if (train[i,9] == 'S'){ m[i] = 1 }
  if (train[i,9] == 'Q'){ m[i] = 2 }
  if (train[i,9] == 'C'){ m[i] = 3 }
}
train$Embarked = m

m = matrix(0, nrow = nrow(test))
for ( i in 1:nrow(test) ){
  if (test[i,8] == 'S'){ m[i] = 1 }
  if (test[i,8] == 'Q'){ m[i] = 2 }
  if (test[i,8] == 'C'){ m[i] = 3 }
}
test$Embarked = m
remove(m, i)



# Random Forest Entry : .76555 
x = .625
cut = c(x, 1 - x)
rf = randomForest(as.factor(Survived) ~., data = train, ntree = 2000
                   , importance = TRUE)

Prediction = predict(rf, test, type = "response")
#print(median(Prediction))
a = table(predict(rf), train$Survived) ; print(t(a))
acc = (a[1,1] + a[2,2]) / nrow(train)
print(paste("Accuracy = ", acc))
remove(x, cut, acc, a)

m = matrix(nrow = 418) ; m[,1] = Prediction ; m[,1] = m[,1] - 1
test$Survived = m[,1]
remove(rf, Prediction, m)

write.csv(test, "titanic_pred.csv")


# # Logistic Regression Baseline : .73
# model = glm(Survived ~., data = train, family = binomial(link = 'logit'))
# results = predict(model, newdata = test, type='response')
# results = ifelse(results > 0.5, 1, 0)
# p = data.frame(test$PassengerId, results)
# p$PassengerId = p$test.PassengerId ; p$Survived = p$results
# p$test.PassengerId = NULL ; p$results = NULL
# remove(results, model)
# write.csv(p, "titanic_pred.csv")


# Pre-tuned SVM - ~ .7 Accuracy
# model = svm(as.factor(Survived) ~ ., data = train, cost = 16, gamma = 0.5)
# Prediction = predict(model, test, type = "response")
# a = table(predict(model), train$Survived) ; print(t(a))
# acc = (a[1,1] + a[2,2]) / nrow(train)
# print(paste("Accuracy = ", acc))
# 
# m = matrix(nrow = 418) ; m[,1] = Prediction ; m[,1] = m[,1] - 1
# test$Survived = m[,1]
# remove(model, Prediction, m, a, acc)
# write.csv(test, "titanic_pred.csv")