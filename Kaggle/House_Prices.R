# House Prices - Advanced Regression

library(randomForest)
library(e1071)

setwd("/Users/Al/Desktop/Kaggle/House Prices - Advanced Regression/")

train = read.csv("train.csv", stringsAsFactors = FALSE) ; test = read.csv("test.csv", stringsAsFactors = FALSE)

# Need to deal with some of the NA's described in data file
# Each is prescribed a more descriptive value
train$Alley[is.na(train$Alley)] = "NAA"
train$BsmtQual[is.na(train$BsmtQual)] = "NB"
train$BsmtCond[is.na(train$BsmtCond)] = "NB"
train$BsmtExposure[is.na(train$BsmtExposure)] = "NB"
train$BsmtFinType1[is.na(train$BsmtFinType1)] = "NB"
train$BsmtFinType2[is.na(train$BsmtFinType2)] = "NB"
train$FireplaceQu[is.na(train$FireplaceQu)] = "NF"
train$GarageType[is.na(train$GarageType)] = "NG"
train$GarageFinish[is.na(train$GarageFinish)] = "NG"
train$GarageQual[is.na(train$GarageQual)] = "NG"
train$GarageCond[is.na(train$GarageCond)] = "NG"
train$PoolQC[is.na(train$PoolQC)] = "NP"
train$Fence[is.na(train$Fence)] = "NF"
train$MiscFeature[is.na(train$MiscFeature)] = "NM"

test$Alley[is.na(test$Alley)] = "NAA"
test$BsmtQual[is.na(test$BsmtQual)] = "NB"
test$BsmtCond[is.na(test$BsmtCond)] = "NB"
test$BsmtExposure[is.na(test$BsmtExposure)] = "NB"
test$BsmtFinType1[is.na(test$BsmtFinType1)] = "NB"
test$BsmtFinType2[is.na(test$BsmtFinType2)] = "NB"
test$FireplaceQu[is.na(test$FireplaceQu)] = "NF"
test$GarageType[is.na(test$GarageType)] = "NG"
test$GarageFinish[is.na(test$GarageFinish)] = "NG"
test$GarageQual[is.na(test$GarageQual)] = "NG"
test$GarageCond[is.na(test$GarageCond)] = "NG"
test$PoolQC[is.na(test$PoolQC)] = "NP"
test$Fence[is.na(test$Fence)] = "NF"
test$MiscFeature[is.na(test$MiscFeature)] = "NM"

# Need to find remaining columns with NA values
# Loop returns column index
func = function(dat){
  matrix = matrix(0, ncol(dat))
  for ( i in 1:ncol(dat)){
    s = sum(is.na(dat[,i]))
    if (s > 0 ){ matrix[i] = i } # Need to change limit across csv's
  }
  return (matrix)
}
m = func(train)
# Columns 4,26,27,43,60 still contain NA's
remove(m)

train$LotFrontage[is.na(train$LotFrontage)] = 0
test$LotFrontage[is.na(test$LotFrontage)] = 0

train$MasVnrType[is.na(train$MasVnrType)] = "NMV"
test$MasVnrType[is.na(test$MasVnrType)] = "NMV"

train$MasVnrArea[is.na(train$MasVnrArea)] = 0
test$MasVnrArea[is.na(test$MasVnrArea)] = 0

train$Electrical[is.na(train$Electrical)] = "SBrkr"
test$Electrical[is.na(test$Electrical)] = "SBrkr"

train$GarageYrBlt[is.na(train$GarageYrBlt)] = 0
test$GarageYrBlt[is.na(test$GarageYrBlt)] = 0

func = function(dat){
  matrix = matrix(0, ncol(dat))
  for ( i in 1:ncol(dat)){
    s = sum(is.na(dat[,i]))
    if (s > 0 ){ matrix[i] = i } # Need to change limit across csv's
  }
  return (matrix)
}
m = func(test)

# Still data missing in test set, some NA's in col's:
# 3,10,24,25,35,37,38,39,48,49,54,56,62,63,79
# NA replaced with most frequent value
test$MSZoning[is.na(test$MSZoning)] = "RL"
test$Utilities[is.na(test$Utilities)] = "AllPub"
test$Exterior1st[is.na(test$Exterior1st)] = "WdShing"
test$Exterior2nd[is.na(test$Exterior2nd)] = "WdShing"
test$BsmtFinSF1[is.na(test$BsmtFinSF1)] = 0
test$BsmtFinSF2[is.na(test$BsmtFinSF2)] = 0
test$BsmtUnfSF[is.na(test$BsmtUnfSF)] = 0
test$TotalBsmtSF[is.na(test$TotalBsmtSF)] = 0
test$BsmtFullBath[is.na(test$BsmtFullBath)] = 0
test$BsmtHalfBath[is.na(test$BsmtHalfBath)] = 0
test$KitchenQual[is.na(test$KitchenQual)] = "TA"
test$Functional[is.na(test$Functional)] = "Typ"
test$GarageCars[is.na(test$GarageCars)] = 0
test$GarageArea[is.na(test$GarageArea)] = 0
test$SaleType[is.na(test$SaleType)] = "WD"
remove(m, func)

for(i in 1:ncol(train)){
  if(is.character(train[,i])){
    train[,i] = as.factor(train[,i])
  }
}

for(i in 1:ncol(test)){
  if(is.character(test[,i])){
    test[,i] = as.factor(test[,i])
  }
}

for(i in 1:length(test)){
  if(is.factor(test[,i])){
    levels(test[,i]) <- levels(train[,i])
  }
}
remove(i)



# # Random Forest Entry - RMSE: .151
# rf = randomForest(SalePrice ~., data = train, ntree = 2000
#                   , importance = TRUE)
# Prediction = predict(rf, test, type = "response")
# test$SalePrice = as.numeric(as.character(Prediction))
# sub = data.frame(test$Id, test$SalePrice)
# sub[is.na(sub)] = 0
# for(i in 1:nrow(sub)){
#   if((sub[i,2]) == 0){
#     sub[i,2] = median(sub[,2])
#   }
# }
# write.csv(sub, "price_pred.csv", row.names=FALSE)
# 
# remove(i, Prediction, rf, sub)



# # Simple Linear Regression Model - RMSE: 1.69
# linreg = lm(SalePrice ~., data = train)
# Prediction = predict(linreg, test, type = "response")
# test$SalePrice = as.numeric(as.character(Prediction))
# test$SalePrice = test$SalePrice * (-1)
# sub = data.frame(test$Id, test$SalePrice)
# write.csv(sub, "price_pred.csv", row.names=FALSE)
# remove(linreg, Prediction, sub)



# SVM Model
# Radial RMSE: .129
svm.model = svm(SalePrice ~ ., data = train, cost = 1, gamma = 0.003816794
                , epsilon = 0.1, kernel = 'radial')
# Sigmoid RMSE: .156
# svm.model = svm(SalePrice ~ ., data = train, cost = 1, gamma = 0.003816794
#                 , epsilon = 0.1, coef.0 = 0, kernel = 'sigmoid')
p = predict(svm.model, newdata = test, type = 'response')
test$SalePrice = p
sub = data.frame(test$Id, test$SalePrice)
write.csv(sub, "price_pred.csv", row.names=FALSE)
remove(p, svm.model, sub)