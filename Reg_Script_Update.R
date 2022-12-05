
#  (multinomial) logistic regression:



library(nnet)

library("reshape2")

#Rename data
GameData[c(2:4)]->RQ1

#Make sure that variables are turned into factors
factor(RQ1$Process_Type)->RQ1$Process_Type
factor(RQ1$LA)->RQ1$LA
factor(RQ1$Definiteness)->RQ1$Definiteness

# check that everything looks as it should
summary(RQ1)
# get some descriptive statistics
with(RQ1, table(Process_Type, LA))

# set your base category for the dependent variable
RQ1$LA <- relevel(RQ1$LA, ref = "Accomplishment")
RQ1$Process_Type <- relevel(RQ1$Process_Type, ref = "Material")
RQ1$Definiteness <- relevel(RQ1$Definiteness, ref = "Definite")
#Create model
test <- multinom(LA ~ Definiteness + Process_Type, data = RQ1)

#Run the regression
summary(test)

#Extract the coefficients
exp(coef(test))

#See how good the model is by calculating the R-Square

library("DescTools")

PseudoR2(test, which = "Nagelkerke")

#See if the predictors are significant by calculating
# p-values with a log-likelihood ratio test


library(car)
Anova(test,type="III")


library(sjPlot)

plot_model(test, "eff",title = "", axis.title = "Prediction Rate")

plot_model(test, "eff",title = "", axis.title = c("Process Type", "Prediction Rate"))

#To get prediction accuracy.

table(predict(test)==RQ1$LA)

# To show full results. 
modelData = get_model_data(test, "eff")

as.data.frame(modelData$Process_Type)


#To write this into a PDF, use this code: 

pdf("resultsFIREDEF.pdf", width = 8, height = 6)

pm = plot_model(test, "eff",title = "", axis.title = c("Process Type", "Prediction Rate"))
pm[[2]]+
  coord_flip() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))

dev.off()

pm = plot_model(test, "eff",title = "", axis.title = c("Definiteness", "Prediction Rate"))
pm[[1]]+
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))

