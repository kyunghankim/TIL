install.packages("jsonlite")
library(jsonlite)
#json파일
data<-fromJSON("sample.json")
head(data)
str(data)
data<-data.frame(data)
data

names(data)<-c("id","like","share",
               "comment","unique","msg","time")
head(data)

#dataframe->json
dataJson<-toJSON(data)
head(dataJson)
write(dataJson,"data.JSONtest")

#엑셀 데이터 읽기
install.packages("readxl")
library(readxl)
cust_profile<-read_excel("cust_profile.xlsx",
           sheet = "cust_profile",
           range ="B3:E8", #읽으려는 곳의 범위 
          col_names = TRUE,
          na="NA",
          skip=2)
cust_profile

##txt파일 읽기
dataset_1<-read.table("dataset_1.txt",
                      header=TRUE,
                      sep=",",
                      stringsAsFactors = TRUE,
                      na.strings = "")
dataset_1

##
install.packages("XML")
library(XML)

res<-xmlToDataFrame("test.xml")
res

###다른 방법
res2<-xmlParse(file="test.xml")
res2 # xml문서 그대로 읽기
rt<-xmlRoot(res2)
rt[[1]]
rt[[2]][[3]]
