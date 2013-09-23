################### Displays from Chapter 5 ######################
mice = read.csv("case0501.csv")
names(mice) = tolower(names(mice)) # makes variable names lower case

head(mice,10)

boxplot(lifetime~diet,mice, main="Compare to Display 5.1")

# Compare to Display 5.2
my.fun = function(x) {
	return(round(c(length(x), min(x), max(x), mean(x), sd(x), 
	               t.test(x)$conf.int[1:2]),1))
}
by(mice$lifetime, mice$diet, my.fun)

spock = read.csv("case0502.csv")
names(spock) = tolower(names(spock))
head(spock,10)

boxplot(percent~judge, spock, main="Compare to Display 5.5")

# Compare to Display 5.10
anova(lm(percent~judge, spock))

spock$others = spock$judge == "Spock's"
head(spock,15)

# Compare to Display 5.12
mod0 = lm(percent~1, spock)
mod1 = lm(percent~others, spock)
mod2 = lm(percent~judge, spock)
anova(mod0,mod2)
anova(mod0,mod1,mod2)


# For homework
plot(mod2)
plot(predict(mod2), residuals(mod2))

