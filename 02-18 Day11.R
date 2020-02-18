#말뭉치 구성
library(tm)
my.text.location<-"c:/kkhsarotto/ymbaek_papers"


mypaper<-VCorpus(DirSource(my.text.location))
mypaper
#meta():메타데이터 구성
summary(mypaper)
mypaper[[2]] #두 번째 문서
mypaper[[2]]$content
mypaper[[2]]$meta # <- 데이터에 대한 정보

meta(mypaper[[2]],tag = 'author')<-"g.d.Hong"
mypaper[[2]]$meta # <- meta의 author를 지정해준걸로 바뀜

#tm_map()사용법: tm_map(코퍼스,사전처리함수)

#특수기호(-,/.;'[] 등등) 전후 단어 조사 함수
library(stringr)
myfunc<-function(x){
  str_extract_all(x,"[[:alnum:]]{1,}[[:punct:]]{1}[[:alnum:]]{1,}")
  #글자숫자 1개이상, 특수문자 1개, 글자숫자 1개이상
}
mypuncts<-lapply(mypaper,myfunc)
table(unlist(mypuncts))


#수치 자료 조사 함수
myfunc<-function(x){
  str_extract_all(x,"[[:digit:]]{1,}")
  #숫자만 1개이상
}
mydigits<-lapply(mypaper,myfunc)
table(unlist(mydigits))

#고유명사 추출
myfunc<-function(x){
  str_extract_all(x,"[[:upper:]]{1}[[:alpha:]]{1,}")
  #숫자만 1개이상
}
myuppers<-lapply(mypaper,myfunc)
table(unlist(myuppers))

mypaper[[1]]$content

mytempfunc<-function(myobject,oldexp,newexp){
  newobject<-tm_map(myobject,
         content_transformer(
    function(x,pattern) gsub(pattern,newexp,x)), 
    oldexp)
newobject  
}
mypaper<-mytempfunc(mypaper,"-collar","collar")

mypaper<-mytempfunc(mypaper,"e\\.g\\","for example")
mycorpus<-mytempfunc(mypaper,"and/or","and or")

mycorpus<-tm_map(mycorpus,removePunctuation)
mycorpus<-tm_map(mycorpus,stripWhitespace)
mycorpus<-tm_map(mycorpus,content_transformer(tolower))
mycorpus<-tm_map(mycorpus,removeWords,words=stopwords(("SMART"))
#어근동일화
mycorpus<-tm_map(mycorpus,stemDocument,language='en')

#문자 갯수 계산 함수
mycharfunc<-function(x){
  str_extract_all(x, ".")
}
mychar<-lapply(mypaper,mycharfunc)
mychar
myuniquechar0<-length(table(unlist(mychar)))
sum(table(unlist(mychar))) #<- 글자 갯수

#단어수 계산 함수
mywordfunc<-function(x){
  str_extract_all(x,boundary("word"))
}
myword<-lapply(mypaper,mywordfunc)
myuniquechar0<-length(table(unlist(myword)))
mytotalchar0<-sum(table(unlist(mychar)))
myword<-lapply(mypaper,mywordfunc)
myuniqueword0<-length(table(unlist(myword))) 
mytotalword0<-sum(table(unlist(myword))) 


"""
mychar<-lapply(mypaper, mycharfunc)
myuniquechar0<-length(table(unlist(mychar))) #79문자 사용
mytotalchar0<-sum(table(unlist(mychar)))#24765글자
myword<-lapply(mypaper,mywordfunc)
myuniqueword0<-length(table(unlist(myword))) #1151 개 종류 단어
mytotalword0<-sum(table(unlist(myword))) #총 3504 개 단어 사용 
"""
#전처리 이후
mychar<-lapply(mycorpus,mycharfunc)
myuniquechar1<-length(table(unlist(mychar)))
mytotalchar1<-sum(table(unlist(mychar)))
myword<-lapply(mucorpus,mywordfunc)
myuniqueword1<-length(table(unlist(myword)))
mytotalword1<-sum(table(unlist(myword)))

#전처리 전 글자수 79, 전처리후 41
c(myuniquechar0,myuniquechar1)
#좀 있다 수정
c(mytotalchar0,mytotalchar1)
#
c(myuniqueword0,myuniqueword1)
c(mytotalword0,mytotalword1)                    #다시 만들기
results.comparing<-rbind()

colnames(results.comparing)<-c("before","after")
rownames(results.comparing)<-c("고유문자수","고유단어수")

#문서*단어 행렬 구성
dtm.e<-DocumentTermMatrix(mycorpus)
dtm.e # tf: 단어의 빈도수

#가로줄 이름(문서이름):
rownames(dtm.e[,])

#단어들
colnames(dtm.e[,])

#행렬의 내용 참조
library(arules)
inspect(dtm.e[])
dtm.e

dtm.e.tfidf<-DocumentTermMatrix(mycorpus,
                   control = list(weight=function(x) weightTfIdf(x,normalize = FALSE)))
dtm.e.tfidf
inspect(dtm.e.tfidf)

#TF는 크지만 TFIDF는 작은 단어들 검출
as.matrix(dtm.e[,])
as.matrix(dtm.e.tfidf[,])

install.packageses("KoNPL")
library("koNLP")

#############################################
*인공신경망(ANN):
  필기체인식, 음성 인식, 자율주행차, 드론, 스마트 장치 자동화

concrete<-read.csv("concrete.csv")







