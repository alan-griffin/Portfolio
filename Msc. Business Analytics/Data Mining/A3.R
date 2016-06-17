# Analysis of Bicycle Counter Data
# Includes prediction on next year's totals

# Plot the monthly data for 2014
# yrange14 <- range(0, 30000)
# plot(sum14$month, sum14$TOTAL_GG, xlab = "Month", ylab = "No. People", type = 'l', ylim = yrange14, col = 'deepskyblue')
# lines(sum14$month, sum14$TOTAL_MONT, col = 'firebrick2') ; lines(sum14$month, sum14$TOTAL_RR_BL, col = 'cyan')
# lines(sum14$month, sum14$TOTAL_RR_PARK, col = 'green2')  ; #lines(sum14$month, sum14$Total_CK, col = 'darkviolet')
# lines(sum14$month, sum14$RR_TOTEM, col = 'gold')
# title('2014: Total No. People Passing through each location')
# 
# # Plot the total monthly data for 2013
# yrange13 <- range(0, 30000)
# plot(sum13$month, sum13$TOTAL_GG, xlab = "Month", ylab = "No. People", type = 'l', ylim = yrange13, col = 'deepskyblue')
# lines(sum13$month, sum13$TOTAL_MONT, col = 'firebrick2') ; lines(sum13$month, sum13$TOTAL_RR_BL, col = 'cyan')
# lines(sum13$month, sum13$TOTAL_RR_PARK, col = 'green2')  ; #lines(sum13$month, sum13$Total_CK, col = 'darkviolet')
# lines(sum13$month, sum13$RR_TOTEM, col = 'gold') ; lines(sum13$month, sum13$Total_STILL, col = 'coral')
# title('2013: Total No. People Passing through each location')
# 
# # Plot the total monthly data for 2012
# yrange12 <- range(0, 20000)
# plot(sum12$month, sum12$TOTAL_GG, xlab = "Month", ylab = "No. People", type = 'l', ylim = yrange12, col = 'deepskyblue')
# lines(sum12$month, sum12$TOTAL_MONT, col = 'firebrick2') ; lines(sum12$month, sum12$TOTAL_RR_BL, col = 'cyan')
# lines(sum12$month, sum12$TOTAL_RR_PARK, col = 'green2')  ; lines(sum12$month, sum12$Total_STILL, col = 'coral')
# title('2012: Total No. People Passing through each location')


# Plot the monthly data for each location across all years
# par(mfrow=c(2,2)) 
# 
# GG_range <- range(9000, 20000)
# plot(sum14$month, sum14$TOTAL_GG, xlab = "Month", ylab = "No. People", type = 'l', ylim = GG_range, col = 'deepskyblue')
# lines(sum13$month, sum13$TOTAL_GG, col = 'firebrick2') ; lines(sum12$month, sum12$TOTAL_GG, col = 'green2')
# title('2014-2012: Total No. People Passing through Glenegeary')
# 
# MONT_range <- range(0, 30000)
# plot(sum14$month, sum14$TOTAL_MONT, xlab = "Month", ylab = "No. People", type = 'l', ylim = MONT_range, col = 'deepskyblue')
# lines(sum13$month, sum13$TOTAL_MONT, col = 'firebrick2') ; lines(sum12$month, sum12$TOTAL_MONT, col = 'green2')
# title('2014-2012: Total No. People Passing through Montrose')
# 
# RRBL_range <- range(3000, 25000)
# plot(sum14$month, sum14$TOTAL_RR_BL, xlab = "Month", ylab = "No. People", type = 'l', ylim = RRBL_range, col = 'deepskyblue')
# lines(sum13$month, sum13$TOTAL_RR_BL, col = 'firebrick2') ; lines(sum12$month, sum12$TOTAL_RR_BL, col = 'green2')
# title('2014-2012: Total No. People Passing through Rock Road Bus Lane')
# 
# RRP_range <- range(0, 25000)
# plot(sum14$month, sum14$TOTAL_RR_PARK, xlab = "Month", ylab = "No. People", type = 'l', ylim = RRP_range, col = 'deepskyblue')
# lines(sum13$month, sum13$TOTAL_RR_PARK, col = 'firebrick2') ; lines(sum12$month, sum12$TOTAL_RR_PARK, col = 'green2')
# title('2014-2012: Total No. People Passing through Rock Road Park')

# par(mfrow=c(3,1)) 
# CK_range <- range(0, 65000)
# plot(sum14$month, sum14$Total_CK, xlab = "Month", ylab = "No. People", type = 'l', ylim = CK_range, col = 'deepskyblue')
# lines(sum13$month, sum13$Total_CK, col = 'firebrick2') ;
# title('2014-2013: Total No. People Passing through Clonskeagh')
# 
# ST_range <- range(0, 20000)
# plot(sum13$month, sum13$Total_STILL, xlab = "Month", ylab = "No. People", type = 'l', ylim = ST_range, col = 'deepskyblue')
# lines(sum12$month, sum12$Total_STILL, col = 'firebrick2') ;
# title('2013-2012: Total No. People Passing through Stillorgan')
# 
# RRT_range <- range(0, 20000)
# plot(sum14$month, sum14$RR_TOTEM, xlab = "Month", ylab = "No. People", type = 'l', ylim = RRT_range, col = 'deepskyblue')
# lines(sum13$month, sum13$RR_TOTEM, col = 'firebrick2') ;
# title('2014-2013: Total No. People Passing Rock Road Totem')


# Histogram displaying freq. of total/mean no. people passing through each location 
# par(mfrow=c(4,2)) 
# 
# hist(c(sum14$TOTAL_GG, sum13$TOTAL_GG, sum12$TOTAL_GG), col = 'lightblue', main = '2014-2012: Total No. People Passing through Glenageary'
#      , xlab = 'Total People')
# hist(c(mean14$TOTAL_GG, mean13$TOTAL_GG, mean12$TOTAL_GG), col = 'lightblue', main = '2014-2012: Average No. People Passing through Glenageary'
#      , xlab = 'Av. People')
# 
# hist(c(sum14$TOTAL_MONT, sum13$TOTAL_MONT, sum12$TOTAL_MONT), col = 'lightblue', main = '2014-2012: Total No. People Passing through Montrose'
#      , xlab = 'Total People')
# hist(c(mean14$TOTAL_MONT, mean13$TOTAL_MONT, mean12$TOTAL_MONT), col = 'lightblue', main = '2014-2012: Average No. People Passing through Montrose'
#      , xlab = 'Av. People')
# 
# hist(c(sum14$TOTAL_RR_BL, sum13$TOTAL_RR_BL, sum12$TOTAL_RR_BL), col = 'lightblue', main = '2014-2012: Total No. People Passing through Rock Road Bus Lane'
#      , xlab = 'Total People')
# hist(c(mean14$TOTAL_RR_BL, mean13$TOTAL_RR_BL, mean12$TOTAL_RR_BL), col = 'lightblue', main = '2014-2012: Average No. People Passing through Rock Road Bus Lane'
#      , xlab = 'Av. People')
# 
# hist(c(sum14$TOTAL_RR_PARK, sum13$TOTAL_RR_PARK, sum12$TOTAL_RR_PARK), col = 'lightblue', main = '2014-2012: Total No. People Passing through Rock Road Park'
#      , xlab = 'Total People')
# hist(c(mean14$TOTAL_RR_PARK, mean13$TOTAL_RR_PARK, mean12$TOTAL_RR_PARK), col = 'lightblue', main = '2014-2012: Average No. People Passing through Rock Road Park'
#      , xlab = 'Av. People')
# 
# par(mfrow=c(3,2)) 
# 
# hist(c(sum14$Total_CK, sum13$Total_CK), col = 'lightblue', main = '2014-2013: Total No. People Passing through Clonskeagh'
#      , xlab = 'Total People')
# hist(c(mean14$Total_CK, mean13$Total_CK), col = 'lightblue', main = '2014-2013: Average No. People Passing through Clonskeagh'
#      , xlab = 'Av. People')
# 
# hist(c(sum14$RR_TOTEM, sum13$RR_TOTEM), col = 'lightblue', main = '2014-2013: Total No. People Passing Rock Road Totem'
#      , xlab = 'Total People')
# hist(c(mean14$RR_TOTEM, mean13$RR_TOTEM), col = 'lightblue', main = '2014-2013: Average No. People Passing Rock Road Totem'
#      , xlab = 'Av. People')
# 
# hist(c(sum13$Total_STILL, sum12$Total_STILL), col = 'lightblue', main = '2014-2012: Total No. People Passing through Stillorgan'
#      , xlab = 'Total People')
# hist(c(mean13$Total_STILL, mean12$Total_STILL), col = 'lightblue', main = '2013-2012: Average No. People Passing through Stillorgan'
#      , xlab = 'Av. People')



# Analyze Glenageary: No. people on Bicycle vs. Walking

# GGB_range <- range(1000, 5000)
# plot(sum14$month, sum14$GG_BIKE_IN, xlab = "Month", ylab = "No. People", type = 'l', ylim = GGB_range, col = 'deepskyblue')
# lines(sum13$month, sum13$GG_BIKE_IN, col = 'firebrick2') ; lines(sum12$month, sum12$GG_BIKE_IN, col = 'green2')
# lines(sum14$month, sum14$GG_BIKE_OUT, col = 'gold') ; lines(sum13$month, sum13$GG_BIKE_OUT, col = 'darkorchid')
# lines(sum12$month, sum12$GG_BIKE_OUT, col = 'orangered')
# title('2014-2012: Total No. People Cycling in/out of Glenageary')
# 
# GGW_range <- range(3000, 6000)
# plot(sum14$month, sum14$GG_WALK_IN, xlab = "Month", ylab = "No. People", type = 'l', ylim = GGW_range, col = 'deepskyblue')
# lines(sum13$month, sum13$GG_WALK_IN, col = 'firebrick2') ; lines(sum12$month, sum12$GG_WALK_IN, col = 'green2')
# lines(sum14$month, sum14$GG_WALK_OUT, col = 'gold') ; lines(sum13$month, sum13$GG_WALK_OUT, col = 'darkorchid')
# lines(sum12$month, sum12$GG_WALK_OUT, col = 'orangered')
# title('2014-2012: Total No. People Walking in/out of Glenageary')

# MGGW_range <- range(100, 200)
# plot(mean14$month, mean14$GG_WALK_IN, xlab = "Month", ylab = "No. People", type = 'l', ylim = MGGW_range, col = 'deepskyblue')
# lines(mean13$month, mean13$GG_WALK_IN, col = 'firebrick2') ; lines(mean12$month, mean12$GG_WALK_IN, col = 'green2')
# lines(mean14$month, mean14$GG_WALK_OUT, col = 'gold') ; lines(mean13$month, mean13$GG_WALK_OUT, col = 'darkorchid')
# lines(mean12$month, mean12$GG_WALK_OUT, col = 'orangered')
# title('2014-2012: Av. No. People Walking in/out of Glenageary')


# Locations we are trying to predict:
# Have Glenegeary, Montrose, Rock Rose Bus Lane, Rock Rose Park, Clonskeagh
# No test data available for Stillorgan and Rock Road Totem

# First Prediction Model - Average over the years 2014-12 to predict 2015
GGSum = (sum14$TOTAL_GG + sum13$TOTAL_GG + sum12$TOTAL_GG) / 3 ; RRBLSum = (sum14$TOTAL_RR_BL + sum13$TOTAL_RR_BL + sum12$TOTAL_RR_BL) / 3
MontSum = (sum14$TOTAL_MONT + sum13$TOTAL_MONT + sum12$TOTAL_MONT) / 3 ; RRPSum = (sum14$TOTAL_RR_BL + sum13$TOTAL_RR_BL + sum12$TOTAL_RR_BL) / 3
CKSum = (sum14$Total_CK + sum13$Total_CK) / 2 ; GGBikeINSum = (sum14$GG_BIKE_IN + sum13$GG_BIKE_IN + sum12$GG_BIKE_IN) / 3
GGBikeOUTSum = (sum14$GG_BIKE_OUT + sum13$GG_BIKE_OUT + sum12$GG_BIKE_OUT) / 3
training_data_sum = data.frame(GGSum,MontSum, RRBLSum, RRPSum, CKSum, GGBikeINSum, GGBikeOUTSum)

GGMean = (mean14$TOTAL_GG + mean13$TOTAL_GG + mean12$TOTAL_GG) / 3 ; RRBLMean = (mean14$TOTAL_RR_BL + mean13$TOTAL_RR_BL + mean12$TOTAL_RR_BL) / 3
MontMean = (mean14$TOTAL_MONT + mean13$TOTAL_MONT + mean12$TOTAL_MONT) / 3 ; RRPMean = (mean14$TOTAL_RR_BL + mean13$TOTAL_RR_BL + mean12$TOTAL_RR_BL) / 3
CKMean = (mean14$Total_CK + mean13$Total_CK) / 2 ; GGBikeInMean = (mean14$GG_BIKE_IN + mean13$GG_BIKE_IN + mean12$GG_BIKE_IN) / 3
GGBikeOUTMean = (mean14$GG_BIKE_OUT + mean13$GG_BIKE_OUT + mean12$GG_BIKE_OUT) / 3
training_data_mean = data.frame(GGMean,MontMean, RRBLMean, RRPMean, CKMean, GGBikeInMean, GGBikeOUTMean)


sum15 = ddply(data15, .(month), summarize, TOTAL_GG = sum(Glenageary), GG_BIKE_IN = sum(Bicycle_IN), GG_BIKE_OUT = sum(Bicycle_OUT)
              , TOTAL_MONT = sum(N11.Montrose), TOTAL_RR_BL = sum(Rock.Road..Bus.Lane.Beside.Park)
              , TOTAL_RR_PARK = sum(Rock.Road..Park), Total_CK = sum(Totem.Clonskeagh.Road..Data.Only.))
mean15 = ddply(data15, .(month), summarize, TOTAL_GG = mean(Glenageary), GG_BIKE_IN = mean(Bicycle_IN), GG_BIKE_OUT = mean(Bicycle_OUT)
              , TOTAL_MONT = mean(N11.Montrose), TOTAL_RR_BL = mean(Rock.Road..Bus.Lane.Beside.Park)
              , TOTAL_RR_PARK = mean(Rock.Road..Park), Total_CK = mean(Totem.Clonskeagh.Road..Data.Only.))
              
test_data_sum = data.frame(sum15$TOTAL_GG, sum15$TOTAL_MONT, sum15$TOTAL_RR_BL, sum15$TOTAL_RR_PARK, sum15$Total_CK, sum15$GG_BIKE_IN, sum15$GG_BIKE_OUT)
test_data_mean = data.frame(mean15$TOTAL_GG, mean15$TOTAL_MONT, mean15$TOTAL_RR_BL, mean15$TOTAL_RR_PARK, mean15$Total_CK, mean15$GG_BIKE_IN, mean15$GG_BIKE_OUT)

GGPredSum = abs(training_data_sum$GGSum - test_data_sum$sum15.TOTAL_GG) ; MONTPredSum = abs(training_data_sum$MontSum - test_data_sum$sum15.TOTAL_MONT)
RRBLPredSum = abs(training_data_sum$RRBLSum - test_data_sum$sum15.TOTAL_RR_BL) ; RRPPredSum = abs(training_data_sum$RRPSum - test_data_sum$sum15.TOTAL_RR_PARK)
CKPredSum = abs(training_data_sum$CKSum - test_data_sum$sum15.Total_CK) ; GGINPredSum = abs(training_data_sum$GGBikeINSum - test_data_sum$sum15.GG_BIKE_IN)
GGOUTPredSum = abs(training_data_sum$GGBikeOUTSum - test_data_sum$sum15.GG_BIKE_OUT)

pred_data_sum = data.frame(GGPredSum, MONTPredSum, RRBLPredSum, RRPPredSum, CKPredSum, GGINPredSum, GGOUTPredSum)

GGPredMean = abs(training_data_mean$GGMean - test_data_mean$mean15.TOTAL_GG) ; MONTPredMean = abs(training_data_mean$MontMean - test_data_mean$mean15.TOTAL_MONT)
RRBLPredMean = abs(training_data_mean$RRBLMean - test_data_mean$mean15.TOTAL_RR_BL) ; RRPPredMean = abs(training_data_mean$RRPMean - test_data_mean$mean15.TOTAL_RR_PARK)
CKPredMean = abs(training_data_mean$CKMean - test_data_mean$mean15.Total_CK) ; GGINPredMean = abs(training_data_mean$GGBikeInMean - test_data_mean$mean15.GG_BIKE_IN)
GGOUTPredMean = abs(training_data_mean$GGBikeOUTMean - test_data_mean$mean15.GG_BIKE_OUT)

pred_data_mean = data.frame(GGPredMean, MONTPredMean, RRBLPredMean, RRPPredMean, CKPredMean, GGINPredMean, GGOUTPredMean)

months = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
par(mfrow=c(1,2))
barplot(t(pred_data_sum$GGPredSum), main="Glenageary: Distance of Predicted Sum from Test Data Sum", names.arg = months
        , xlab = 'Months', ylab = 'Distance of predicted value from true value', col = "gold")
barplot(t(pred_data_mean$GGPredMean), main="Glenageary: Distance of Predicted Mean from Test Data Mean", names.arg = months
        , xlab = 'Months', ylab = 'Distance of predicted value from true value', col = "firebrick2" )

par(mfrow=c(1,2))
barplot(t(pred_data_sum$GGINPredSum), main="Glenageary - Bike In: Distance of Predicted Sum from Test Data Sum", names.arg = months
        , xlab = 'Months', ylab = 'Distance of predicted value from true value', col = "gold")
barplot(t(pred_data_mean$GGINPredMean), main="Glenageary - Bike In: Distance of Predicted Mean from Test Data Mean", names.arg = months
        , xlab = 'Months', ylab = 'Distance of predicted value from true value', col = "firebrick2" )

par(mfrow=c(1,2))
barplot(t(pred_data_sum$GGOUTPredSum), main="Glenageary - Bike Out: Distance of Predicted Sum from Test Data Sum", names.arg = months
        , xlab = 'Months', ylab = 'Distance of predicted value from true value', col = "gold")
barplot(t(pred_data_mean$GGOUTPredMean), main="Glenageary - Bike Out: Distance of Predicted Mean from Test Data Mean", names.arg = months
        , xlab = 'Months', ylab = 'Distance of predicted value from true value', col = "firebrick2" )

par(mfrow=c(1,2))
barplot(t(pred_data_sum$MONTPredSum), main="Montrose: Distance of Predicted Sum from Test Data Sum", names.arg = months
        , xlab = 'Months', ylab = 'Distance of predicted value from true value', col = "gold")
barplot(t(pred_data_mean$MONTPredMean), main="Montrose: Distance of Predicted Mean from Test Data Mean", names.arg = months
        , xlab = 'Months', ylab = 'Distance of predicted value from true value', col = "firebrick2" )

par(mfrow=c(1,2))
barplot(t(pred_data_sum$RRBLPredSum), main="Rock Road Bus Lane: Distance of Predicted Sum from Test Data Sum", names.arg = months
        , xlab = 'Months', ylab = 'Distance of predicted value from true value', col = "gold")
barplot(t(pred_data_mean$RRBLPredMean), main="Rock Road Bus Lane: Distance of Predicted Mean from Test Data Mean", names.arg = months
        , xlab = 'Months', ylab = 'Distance of predicted value from true value', col = "firebrick2" )

par(mfrow=c(1,2))
barplot(t(pred_data_sum$RRPPredSum), main="Rock Road Park: Distance of Predicted Sum from Test Data Sum", names.arg = months
        , xlab = 'Months', ylab = 'Distance of predicted value from true value', col = "gold")
barplot(t(pred_data_mean$RRPPredMean), main="Rock Road Park: Distance of Predicted Mean from Test Data Mean", names.arg = months
        , xlab = 'Months', ylab = 'Distance of predicted value from true value', col = "firebrick2" )

par(mfrow=c(1,2))
barplot(t(pred_data_sum$CKPredSum), main="Clonskeagh: Distance of Predicted Sum from Test Data Sum", names.arg = months
        , xlab = 'Months', ylab = 'Distance of predicted value from true value', col = "gold")
barplot(t(pred_data_mean$CKPredMean), main="Clonskeagh: Distance of Predicted Mean from Test Data Mean", names.arg = months
        , xlab = 'Months', ylab = 'Distance of predicted value from true value', col = "firebrick2" )