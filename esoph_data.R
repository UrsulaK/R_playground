# to view the esoph data
View(esoph)
# to edit the data frame
edit(esoph)
# to get some information
summary(esoph)
# getting help for the data in the end you can find an example
help(esoph)
# testing the example in the help 
require(stats)
require(graphics) # for mosaicplot
summary(esoph)
## effects of alcohol, tobacco and interaction, age-adjusted
model1 <- glm(cbind(ncases, ncontrols) ~ agegp + tobgp * alcgp,
              data = esoph, family = binomial())
anova(model1)
## Try a linear effect of alcohol and tobacco
model2 <- glm(cbind(ncases, ncontrols) ~ agegp + unclass(tobgp)
              + unclass(alcgp),
              data = esoph, family = binomial())
summary(model2)
## Re-arrange data for a mosaic plot
ttt <- table(esoph$agegp, esoph$alcgp, esoph$tobgp)
o <- with(esoph, order(tobgp, alcgp, agegp))
ttt[ttt == 1] <- esoph$ncases[o]
tt1 <- table(esoph$agegp, esoph$alcgp, esoph$tobgp)
tt1[tt1 == 1] <- esoph$ncontrols[o]
tt <- array(c(ttt, tt1), c(dim(ttt),2),
            c(dimnames(ttt), list(c("Cancer", "control"))))
mosaicplot(tt, main = "esoph data set", color = TRUE)
# end of example

# tried to figure out some information on my own
ttt
install.packages("devtools")
library(devtools)
install_github("easyGgplot2", "kassambara")

p1 <- boxplot(esoph$ncases ~ esoph$alcgp)
p2 <- boxplot(esoph$ncases ~ esoph$tobgp,col = "blue")
p3 <- boxplot(esoph$ncases ~ esoph$agegp,col = "red")

