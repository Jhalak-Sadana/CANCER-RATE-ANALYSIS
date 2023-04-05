options(scipen = 999 ) #To avoid scientific notation in the result

head(df,10) #show the first 10 rows of dataset

#build linear regression model to explain the effects of povertyEst, popEst2015, medincome, deathrate
#on Incidence rate
fit = lm(incidenceRate ~ PovertyEst + popEst2015 + medIncome + deathRate, data=df)
summary(fit)
plot(fit)
return()