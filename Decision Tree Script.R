#upload Noun Worksheet data 
#Name 'MyData'. 
#Add semelfactive level

MyData$LA <- factor(MyData$LA, levels = c(levels(MyData$LA), "SEM"))

#Create Tree 

MyData$LA<-as.factor(MyData$LA)
MyData$WF<-as.factor(MyData$WF)
MyData$Borrowing<-as.factor(MyData$Borrowing)
MyData$Compound<-as.factor(MyData$Compound)
MyData$MDA<-as.factor(MyData$MDA) 
MyData$MDN<-as.factor(MyData$MDN)
MyData$MDV<-as.factor(MyData$MDV)
MyData$Other<-as.factor(MyData$Other)
MyData$TC<-as.factor(MyData$TC)
MyData$Underived<-as.factor(MyData$Underived)
MyData$Abs.Conc<-as.factor(MyData$Abs.Conc)
MyData$Count.Mass<-as.factor(MyData$Count.Mass)
MyData$Register<-as.factor(MyData$Register)

set.seed(129)

my.model.tree = ctree(MyData$LA ~ MyData$Borrowing + MyData$Compound + MyData$MDA + MyData$MDN + MyData$MDV +MyData$Other + MyData$TC + MyData$Underived + MyData$Count.Mass + MyData$Abs.Conc + MyData$Register, data = MyData)

#Plot Tree 

plot(my.model.tree)

