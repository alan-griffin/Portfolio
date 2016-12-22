# Kaggle - Digit Recognition
# Initial Run w/ 50 trees -> 96.5% Accuracy

# Multiplying no. trees to 500 results in 0.3% Accuracy gain
# Real run-time trade-off though

library(randomForest)

setwd("/Users/Al/Desktop/Kaggle/Digit Recognition/")

train = read.csv("train.csv") ; test = read.csv("test.csv")

# Use forest to predict digit label
rf = randomForest(as.factor(label) ~., data = train, ntree = 50
                  , importance = TRUE )

Prediction = predict(rf, test, type = "response")
test$label = as.numeric(as.character(Prediction))
remove(Prediction, rf)
x = seq(1, nrow(test), 1)
digit = data.frame(x, test$label)
colnames(digit) <- c("ImageId","Label")
write.csv(digit, "digit_pred.csv", row.names=FALSE)
remove(digit, x, train, test)