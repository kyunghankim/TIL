mushrooms<-read.csv(("mushrooms.csv"))
names(mushrooms)
table(mushrooms$veil_type)
mushrooms_clean<-mushrooms[-17]
mushrooms_labels<-mushrooms_clean$type
len_mushrooms<-length(mushrooms_labels)
len_mushrooms*0.7
str(mushrooms_clean)
mushrooms_train<-mushrooms_clean[1:5687,]
mushrooms_test<-mushrooms_clean[5688:8124,]

mushrooms_train_labels<-mushrooms_clean[1:5687,]$type
mushrooms_test_labels<-mushrooms_clean[5688:8124,]$type

mushrooms_classifier<-naiveBayes(mushrooms_train,
                                 mushrooms_train_labels)

mushrooms_test_pred<-predict(mushrooms_classifier,
                             mushrooms_test)
mushrooms_test_pred
library(gmodels)
CrossTable(mushrooms_test_pred,mushrooms_test_labels,
           prop.t=FALSE, prop.r=FALSE,
           dnn=c("predicted","actual"))

mushrooms_classifier2<-naiveBayes(mushrooms_train,
                                  mushrooms_train_labels,
                                  laplace = 1)
mushrooms_test_pred2<-predict(mushrooms_classifier2,
                              mushrooms_test)
CrossTable(mushrooms_test_pred2,mushrooms_test_labels,
           prop.t=FALSE, prop.r=FALSE,
           dnn=c("predicted","actual"))
