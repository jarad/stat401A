TimeOfDeath = read.csv("TimeOfDeath.csv")

# Quick summary
summary(TimeOfDeath)

# A quick plots
boxplot(TimeOfDeath)
hist(TimeOfDeath$hours)
plot(hypoxanthine~I(hours>40), TimeOfDeath)
boxplot(hypoxanthine~I(hours>40), TimeOfDeath)
plot(hypoxanthine~hours, data=TimeOfDeath)
pairs(TimeOfDeath)

# Fit the regression model (without observation 84)
mod = lm(hypoxanthine~hours, 
         data  =TimeOfDeath,
         subset=hours<60)

# Diagnostic plots (this uses plot.lm implicitly)
plot(mod, 1:6)

# A more sophisticated plot
plot(hypoxanthine~hours, 
     data=TimeOfDeath, 
     xlab="Time since death (hours)",
     ylab="Hypoxanthine level",
     main="Hypoxanthine level vs time since death",
     pch =19, 
     xlim=c(0,60), 
     ylim=c(0,200))


# Plot the regression line
abline(mod, col=1, lwd=3, lty=1)

# Create a new data frame for intervals
new = data.frame(hours=seq(0,60))

# Add confidence intervals
predict = predict(mod, new, interval="confidence")
lines(new$hours, predict[,2], lty=2, col=2, lwd=3)
lines(new$hours, predict[,3], lty=2, col=2, lwd=3)

# Create Scheffe band
predict = predict(mod, new, se.fit=T)
M = sqrt(2*qf(.95,2,predict$df))
lines(new$hours,
      predict$fit+M*predict$se.fit, 
      lty=3, col=3, lwd= lw)
lines(new$hours,
      predict$fit-M*predict$se.fit, 
      lty=3, col=3, lwd= lw)

# Create prediction band
predict = predict(mod, new, interval="prediction")
lines(new$hours, predict[,2], lty=4, col=4, lwd= lw)
lines(new$hours, predict[,3], lty=4, col=4, lwd= lw)

# Add legend
legend("topleft", 
       legend=c("Regression line", 
                "Confidence band", 
                "Scheffe band", 
                "Prediction band"), 
       lty=1:4, col=1:4, lwd= lw)
abline(h=80, lty=1, col='gray', lwd=2)
abline(v=cal[1], lty=1, col='gray', lwd=2)



# For further help try ?<function name>
# Check under See Also
?plot
?plot.boxplot
?plot.default
?plot.lm
?lines
?points
?abline







