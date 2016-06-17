# Sports Analytics - Looking at last few years of Premier League Data
# Uses the results from the last two weeks as test data

pl1 = read.csv("Data/2015_16.csv")  ; pl2 = read.csv("Data/2014_15.csv")
pl3 = read.csv("Data/2013_14.csv") ; pl4 = read.csv("Data/2012_13.csv")
pl5 = read.csv("Data/2011_12.csv") ; pl6 = read.csv("Data/2010_11.csv")
test_data = read.csv("Data/test.csv")


# Some initial data exploration
names(pl1)

# Data Cleaning
# For now, get rid of divison and all betting data
# Division provides no information, while betting data not required for now
pl1 <- pl1[c(2:23)] ; pl2 <- pl2[c(2:23)]





# Have a look at the breakdown of Chelsea's form vs Leicester
# Take subset of all Chelsea's games from this season and last
c1 = subset(pl1, HomeTeam=='Chelsea') ; c2 = subset(pl1, AwayTeam=='Chelsea')
c1$Date <- as.Date(c1$Date , "%d/%m/%y"); c2$Date <- as.Date(c2$Date , "%d/%m/%y")

c1$GD  <- (c1$FTHG - c1$FTAG) ; c2$GD  <- (c2$FTAG - c2$FTHG)
c1$SOT <- (c1$HST)            ; c2$SOT <- (c2$AST)
c1$GS  <- (c1$FTHG)           ; c2$GS  <- (c2$FTAG)
form_c1 = rbind(c1,c2)

c3 = subset(pl2, HomeTeam=='Chelsea') ; c4 = subset(pl2, AwayTeam=='Chelsea')
c3$Date <- as.Date(c3$Date , "%d/%m/%y"); c4$Date <- as.Date(c4$Date , "%d/%m/%y")

c3$GD  <- (c3$FTHG - c3$FTAG)  ; c4$GD  <- (c4$FTAG - c4$FTHG)
c3$SOT <- (c3$HST)             ; c4$SOT <- (c4$AST)
c3$GS  <- (c3$FTHG)            ; c4$GS  <- (c4$FTAG)
form_c2 = rbind(c3,c4)

# Sort games by date
form_c1 = form_c1[order(form_c1$Date),] ; form_c2 = form_c2[order(form_c2$Date),]

# Do same for Leicester
l1 = subset(pl1, HomeTeam=='Leicester') ; l2 = subset(pl1, AwayTeam=='Leicester')
l1$Date <- as.Date(l1$Date , "%d/%m/%y"); l2$Date <- as.Date(l2$Date , "%d/%m/%y")

l1$GD  <- (l1$FTHG - l1$FTAG) ; l2$GD  <- (l2$FTAG - l2$FTHG)
l1$SOT <- (l1$HST)            ; l2$SOT <- (l2$AST)
l1$GS  <- (l1$FTHG)           ; l2$GS  <- (l2$FTAG)
form_l1 = rbind(l1,l2)

l3 = subset(pl2, HomeTeam=='Leicester') ; l4 = subset(pl2, AwayTeam=='Leicester')
l3$Date <- as.Date(l3$Date , "%d/%m/%y"); l4$Date <- as.Date(l4$Date , "%d/%m/%y")

l3$GD  <- (l3$FTHG - l3$FTAG)  ; l4$GD  <- (l4$FTAG - l4$FTHG)
l3$SOT <- (l3$HST)             ; l4$SOT <- (l4$AST)
l3$GS  <- (l3$FTHG)            ; l4$GS  <- (l4$FTAG)
form_l2 = rbind(l3,l4)

# Sort games by date
form_l1 = form_l1[order(form_l1$Date),] ; form_l2 = form_l2[order(form_l2$Date),]


# Data Plots

# Form comparison
par(mfrow=c(2,1))
barplot(table(c3$FTR), col='darkblue') ; title('2014-15: Chelsea Home Form')
barplot(table(c4$FTR), col='red')      ; title('2014-15: Chelsea Away Form')
par(mfrow=c(2,1))
barplot(table(c1$FTR), col='darkblue') ; title('2015-16: Chelsea Home Form')
barplot(table(c2$FTR), col='red')      ; title('2015-16: Chelsea Away Form')

par(mfrow=c(2,1))
barplot(table(l3$FTR), col='darkblue') ; title('2014-15: Leicester Home Form')
barplot(table(l4$FTR), col='red')      ; title('2014-15: Leicester Away Form')
par(mfrow=c(2,1))
barplot(table(l1$FTR), col='darkblue') ; title('2015-16: Leicester Home Form')
barplot(table(l2$FTR), col='red')      ; title('2015-16: Leicester Away Form')

# Goal Difference per game over two seasons
par(mfrow=c(2,1))
plot(form_c2$GD, col='firebrick3', xlab = 'Game No.', ylab = 'Goal Difference', cex = 1.5)
points(form_c1$GD, col='deepskyblue', pch = 19)
title("Chelsea: Goal difference over last two seasons")

plot(form_l2$GD, col='firebrick3', xlab = 'Game No.', ylab = 'Goal Difference', cex = 1.5)
points(form_l1$GD, col='deepskyblue', pch = 19)
title("Leicester: Goal difference over last two seasons")


# Difference in amount of shots on target
par(mfrow=c(2,1))
plot(form_c2$SOT, col='firebrick3', xlab = 'Game No.', ylab = 'Shots on target', cex = 1.5)
points(form_c1$SOT, col='deepskyblue', pch = 19)
title("Chelsea: Shots on target comparison over last two seasons")

plot(form_l2$SOT, col='firebrick3', xlab = 'Game No.', ylab = 'Shots on target', cex = 1.5)
points(form_l1$SOT, col='deepskyblue', pch = 19)
title("Leicester: Shots on target comparison over last two seasons")


# Difference in goals scored
par(mfrow=c(2,1))
plot(form_c2$GS, col='firebrick3', xlab = 'Game No.', ylab = 'Goals scored', cex = 1.5)
points(form_c1$GS, col='deepskyblue', pch = 19)
title("Chelsea: Goals scored in last two seasons")

plot(form_l2$GS, col='firebrick3', xlab = 'Game No.', ylab = 'Goals scored', cex = 1.5)
points(form_l1$GS, col='deepskyblue', pch = 19)
title("Leicester: Goals scored in last two seasons")





# Association Mining
library(arules)
# Referee's influenced by home team?
ref_sample = c("Referee", "FTR")
r1 = pl1[ref_sample] ; r2 = pl2[ref_sample] ; r3 = pl3[ref_sample]
r4 = pl4[ref_sample] ; r5 = pl5[ref_sample] ; r6 = pl6[ref_sample]
ref_data = rbind(r1,r2,r3,r4,r5,r6) ; remove(r1,r2,r3,r4,r5,r6)

rules <- apriori(ref_data, parameter = list(minlen = 2, supp= 0.01, conf = 0.4)
                 , appearance = list(rhs = c("FTR=H")) )
inspect(rules)
remove(ref_data, ref_sample, rules)

# Referee's relationship with specific teams
library(tidyr)
ref_sample = c("Referee", "FTR", "HomeTeam", "AwayTeam")
r1 = pl1[ref_sample] ; r2 = pl2[ref_sample] ; r3 = pl3[ref_sample]
r4 = pl4[ref_sample] ; r5 = pl5[ref_sample] ; r6 = pl6[ref_sample]
ref_data = rbind(r1,r2,r3,r4,r5,r6) ; remove(r1,r2,r3,r4,r5,r6)

rules <- apriori(ref_data, parameter = list(minlen = 3, supp= 0.001, conf = 0.5)
                 , appearance = list(rhs = c("FTR=H", "FTR=D", "FTR=A")
                 , lhs=paste0("Referee=", unique(test_data$Referee) )) )
inspect(rules)
rules = as(rules, "data.frame")
rules = separate(data = rules, col = rules, into = c("Referee", "right"), sep = ",")
rules = separate(data = rules, col = Referee, into = c("gone", "Referee"), sep = "=")
rules = separate(data = rules, col = right, into = c("Team", "gone2"), sep = "=>")
rules = separate(data = rules, col = Team, into = c("Home/Away", "Team"), sep = "=")
rules = separate(data = rules, col = gone2, into = c("gone4", "FTR"), sep = "=")
rules = subset(rules, select = -c(gone,gone4) ) ;
rules$Team = gsub('}', '', rules$Team) ; rules$FTR = gsub('}', '', rules$FTR)
ref_rules = rules[rules$Referee %in% test_data$Referee,]
remove(ref_data, ref_rules, rules, ref_sample)




# Classification
# Now we will look at the accuaracy of this year's Betbrain betting data
library(party)
bet_sample = c("BbAvH", "FTR") ; bdata = pl1[bet_sample]
tree = ctree(bdata$FTR~., bdata)
plot(tree)

bet_sample = c("BbAvH", "FTR") ; bdata = pl2[bet_sample]
tree = ctree(bdata$FTR~., bdata)
plot(tree)

# Looking at classifying results based on shots on target
tree_sample = c("HST", "FTR")
tree_data = pl1[tree_sample]
tree2 = ctree(tree_data$FTR~., tree_data)
plot(tree2)

tree_sample2 = c("AST", "FTR")
tree_data2 = pl1[tree_sample2]
tree3 = ctree(tree_data2$FTR~., tree_data2)
plot(tree3)

# How many goals does a team need to win?
tree_goals_H = c("FTHG", "FTR")
tree_data3 = pl1[tree_goals_H]
tree4 = ctree(tree_data3$FTR~., tree_data3)
plot(tree4)

tree_goals_A = c("FTAG", "FTR")
tree_data4 = pl1[tree_goals_A]
tree5 = ctree(tree_data4$FTR~., tree_data4)
plot(tree5)
remove(tree_data, tree_data2, tree_data3, tree_data4)
remove(tree, tree2, tree3, tree4, tree5, bet_sample)
remove(bdata, tree_sample, tree_sample2, tree_goals_A, tree_goals_H)


# Clustering analysis
s = c("HS", "AS", "FTR")
shot_data = rbind(pl1[s])
c1 = shot_data
c1$FTR <- NULL
kc <- kmeans(c1, 3) 
table(shot_data$FTR, kc$cluster)
plot(c1[c("HS", "AS")], col=kc$cluster)

sot = c("HST", "AST", "FTR")
shot_target_data = rbind(pl1[sot])
c2 = shot_target_data
c2$FTR <- NULL
kc <- kmeans(c2, 3) 
table(shot_target_data$FTR, kc$cluster)
plot(c2[c("HST", "AST")], col=kc$cluster)

goals = c("FTHG", "FTAG", "FTR")
goal_data = rbind(pl1[goals])
c3 = goal_data
c3$FTR <- NULL
kc <- kmeans(c3, 3) 
table(goal_data$FTR, kc$cluster)
plot(c3[c("FTHG", "FTAG")], col=kc$cluster)