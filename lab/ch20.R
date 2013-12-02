

case2001 = read.csv("case2001.csv")
names(case2001) = tolower(names(case2001))
case2001 # Compare to Display 20.1

mod = glm(status=="SURVIVED" ~ age*sex,binomial, case2001)
summary(mod) # compare to Display 20.5

mod = glm(status=="SURVIVED" ~ age+sex,binomial, case2001)
summary(mod) # compare to Display 20.6

mod = glm(status=="SURVIVED" ~ age*sex+sex*I(age^2),binomial, case2001)
summary(mod) # compare to Display 20.8

ch = rep(NA, nrow(case2001))
ch[case2001$sex=="FEMALE"] = 17
ch[case2001$sex=="MALE"] = 1

set.seed(1)
mod = glm(status=="SURVIVED" ~ age+sex,binomial, case2001)
plot(jitter(as.numeric(status)-1,.1)~age, case2001, pch=ch,
     ylab="Survived", yaxt='n', main="Compare to Display 20.9")
axis(2,c(0,1),c("No","Yes"))
legend("topright", c("Female","Male"), pch=c(17,1))
expit = function(age,b) return(1/(1+1/exp(b[1]+b[2]*age)))
xx = 10:70
lines(xx,expit(xx,coef(mod)[1:2]))
lines(xx,expit(xx,c(coef(mod)[1]+coef(mod)[3], coef(mod)[2])))
text(37,.7,"Females")
text(20,.4,"Males")




case2002 = read.csv("case2002.csv")
names(case2002) = tolower(names(case2002))
case2002 # Compare to Display 20.2

mod = glm(lc~sex+ag+ss+yr+bk, binomial, case2002)
summary(mod) # Compare to Display 20.7 (full model)

mod = glm(lc~sex+ag+ss+yr   , binomial, case2002)
summary(mod) # Compare to Display 20.7 (reduced model)

mod = glm(lc~sex+ag+ss+yr*cd+I(yr^2)+I(cd^2)   , binomial, case2002)
summary(mod)

mod = glm(lc~sex+ag+ss+yr*cd+I(yr^2)+I(cd^2)+bk, binomial, case2002)
summary(mod)

ch = rep(NA,nrow(case2002))
ch[case2002$bk=="BIRD" & case2002$lc=="LUNGCANCER"] = 17
ch[case2002$bk=="NOBIRD" & case2002$lc=="LUNGCANCER"] = 19
ch[case2002$bk=="BIRD" & case2002$lc=="NOCANCER"] = 2
ch[case2002$bk=="NOBIRD" & case2002$lc=="NOCANCER"] = 1

plot(yr~ag, case2002, pch=ch, main="Compare to Display 20.10")
legend("topleft", c("Bird, Cancer","--, Cancer","Bird,--","--,--"),
       pch=c(17,19,2,1)) 


