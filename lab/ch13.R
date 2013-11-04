



#####################################################################
# Chapter 13                                                        #
#####################################################################

############################ Case 13.02 #############################
case1302 = read.csv("case1302.csv")
names(case1302) = tolower(names(case1302))
summary(case1302) 
case1302$company = factor(case1302$company, paste("C",1:10, sep=""))

plotting.character=1+18*(as.numeric(case1302$treat)-1)
plot(score~as.numeric(company), case1302, pch=plotting.character,
     xlab="Company", ylab="Platoon score", main="Compare to Display 13.14")
abline(v=1:10, lty=2, col="gray")
legend("topright", c("Control","Pygmalion"), pch=1:2, bg="white")

# Compare to Display 13.16
mod = lm(score~company*treat, case1302)
anova(mod) 

# Compare to Display 13.18
mod = lm(score~company+treat, case1302)
summary(mod)

# Compare to Display 13.17
plot(mod,1)



