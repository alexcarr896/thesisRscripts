#Post-hoc fisher exact test for nominal data
#Put in contingency table (data) under the name 'imput'

Input =("
Etymology   STA  ACT   ACC   ACH   SEM   OBJ
MDV         7    13    15    3     0     55        
TC          3    24    17    10    1     38    
Borrowing   57   115   81    9     0     782   
MDA         20   1     0     0     0     20    
MDN         3    6     0     0     0     30    
Compound    0    1     5     0     0     57    
Underived   12   15    8     4     1     217   
Other       0    5     7     0     0     52    
")

#Transform the contingency table into a matrix

DMatrix = as.matrix(read.table(textConnection(Input),
                              header=TRUE, 
                              row.names=1))

#See matrix
DMatrix

#Do fisher test on matrix to see if there is a significant dependance overall. 

fisher.test(DMatrix,simulate.p.value = TRUE,
            alternative="two.sided")

#download 'rcompanion' package

library(rcompanion)

#Do pairwise fisher tests to see where the significant differences lie within the matrix. 
#Make sure fisher =TRUE and g test/chisq are FALSE. Digits '3' will stop each number at 3 digits that aren't 0. 
#E.g. 0.0123000000 as opposed to 0.1234567543234567

PT = pairwiseNominalIndependence(DMatrix, 
                                 fisher = TRUE,
                                 gtest  = FALSE,
                                 chisq  = FALSE,
                                 simulate.p.value=TRUE,
                                 digits = 3
                                 )

#See results of PT (Pairwise tests)
PT

library(vcd)
#measure the EFFECT SIZE - need vcd packages described above^
table(All_nreps$WF, All_nreps$LA)->MyTable1

assocstats(MyTable1)
