mushrooms<-read.csv("mushrooms.csv")
str(mushrooms)
class(mushrooms)
table(mushrooms)
mushrooms_type<-mushrooms$type

set.seed(123)
train_sample<-sample(8124,5687)
str(train_sample)
mushrooms_train<-mushrooms[train_sample,]
mushrooms_test<-mushrooms[-train_sample,]

names(mushrooms_train[-1])
names(mushrooms)
mushrooms_refined<-mushrooms[-17]
mushrooms_train<-mushrooms_refined[train_sample,]
mushrooms_test<-mushrooms_refined[-train_sample,]
mushrooms_model<-C5.0(mushrooms_train[-1],
                      mushrooms_train$type)

#predict 해보기
mushrooms_pred<-predict(mushrooms_model,
                     mushrooms_test[-1])
CrossTable(mushrooms_test$type,mushrooms_pred,
           prop.c=FALSE, prop.r=FALSE,
           dnn=c("actual","predicted"))
#부스팅 10개
mushrooms_boost10<-C5.0(mushrooms_train[-1],
                     mushrooms_train$type,trials = 10)
summary(mushrooms_boost10)


mushrooms_boost_pred10<-predict(mushrooms_boost10,
                                mushrooms_test)
CrossTable(mushrooms_test$type,mushrooms_boost_pred10,
           prop.c=FALSE, prop.r=FALSE,
           dnn=c("actual","predicted"))

