#Create Table with desired variables

MyTable1<-prop.table(MyTable, 2)

# create a dataset
MyTableData<-as.data.frame.matrix(MyTable1)

MyTableData$SituationType<-rownames(MyTableData)

#Change names of the types of variable. 

names(MyTableData)[9]<-paste("Situation")

#Convert to Long Format

library(reshape2)

MyTableDataLong<-melt(MyTableData, id.vars=c("Situation"), value.name = "Proportion")

names(MyTableDataLong)[2]<-paste("Word_Formation_Type")

library(ggplot2)

Plotgg<-ggplot() + geom_bar(aes(y=Proportion, 
                        x = Word_Formation_Type, 
                        fill=Situation), 
                    
                        data=MyTableDataLong,
                        stat="identity")

print(Plotgg + labs(y="Proportion of Instances", x = "Word Formation Type"))
