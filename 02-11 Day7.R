sms_raw<-read.csv("sms_spam_ansi.txt",
                  stringsAsFactors =FALSE) 
# stringsAsFactors: factor형으로 문자열을 읽겠냐? 
# type은 factor로 바꾸는게 맞음(원래는 charactor였는데) 
str(sms_raw)
sms_raw$type<-factor(sms_raw$type) # type의 data종류 factor로!
str(sms_raw$type) #factor로 바꼇나 확인
table(sms_raw$type)
names(sms_raw)
#text data를 정리, 표준화 해야함
#정리: sms이기 때문에 공백, 단어, 마침표 등등...
#tm패키지(텍스트마이닝패키지) 활용하기!
install.packages("tm")
library(tm)
#Notation: 코퍼스) 단어 집합 생성 -> Vcorpus()
#ex) 의료분야 코퍼스, 금융분야 코퍼스, OO분야 코퍼스
#Notation: 데이터 소스 객체생성-> vectorSource()
sms_corpus<-VCorpus(VectorSource(sms_raw$text))
sms_corpus
inspect(sms_corpus[1:2])

sms_corpus[1]
as.character(sms_corpus[[1]])
#1번부터 5번까지 문서 내용 출력(lapply함수 이용)

lapply(sms_corpus[1:5],as.character)

# R에서 text mining을 할 시 가공처리를 해야함
# 이 raw text data를 corpus로 바꾸어줘야함
# vectorsource에 넣고 vcorpus에 다시 넣으면 객체가 만들어짐
sms_corpus_clean<-tm_map(sms_corpus,
                         content_transformer(tolower))
# 최신은 tm_map로 변환이 됨 구버전은 error
class(as.character(sms_corpus_clean[[1]]))
#구버전의 R에선 아래와 같이 해야함
tm_map(sms_corpus,content_transformer(tolower))
-------------------------------------------
#매킨토시 운영체제의 경우 아래와같은 옵션
#read.csv함숭 추가할 것
# fileEncoding="cp949", encoding="UTF-8"
-------------------------------------------

#점을 제거해주는 함수
removePunctuation("hi......hello......bye")
# 점 제거하
sms_corpus_clean<-tm_map(sms_corpus_clean,removePunctuation)
inspect(sms_corpus_clean[1:5])


#숫자 제거하기
sms_corpus_clean <- tm_map(sms_corpus_clean,
                           FUN = removeNumbers)
inspect(sms_corpus_clean[1:5])
#불용어(stop words) 제거
# 불용어ex) to, and, but, or ...
stopwords()
?stopwords

#불용어 제거
sms_corpus_clean<-tm_map(sms_corpus_clean,removeWords,stopwords())
inspect(sms_corpus_clean[1:5])

#
replacePunctuation<-function(x){gsub("[[:punct:]]+"," ",x)}
#<-이punct(특수문자)가 한개 이상나오면 공백으로 바꿈

#x에 전달된 문자열에 대해 punctuation은 제거(" ")
replacePunctuation("hi+.{hello<;")

x="대한민국 대한 민국 대한민국국"
gsub("대한민국","코리아",x)

#형태소 분석,SnowballC패키지를 활용한
install.packages("SnowballC")
library(SnowballC)
wordStem() #단어의 어근을 추출할 때 사용하는 함수
wordStem(C("learn",
           "learned","learning","learns"))
wordStem("learning")
wordStem(C("learn","learned","learning","learns"))

#텍스트 문서의 전체 코퍼스에 적용
sms_corpus_clean<-tm_map(sms_corpus_clean,stemDocument)
inspect(sms_corpus_clean[1:5])

#추가 여백 제거
sms_corpus_clean<-tm_map(sms_corpus_clean,
                         stripWhitespace)
inspect(sms_corpus_clean[1:5])

lapply(sms_corpus[1:3],as.character)
#lapply(sms_corpus_clean[1:3],as.character)
inspect(sms_corpus_clean[1:3])#위 결과값과 다름
-----------------------~15pm------------------------

#토큰화(단어)
#DocumentTermMatrix():sms 메세지 코퍼스 -> 토큰화
#행: sms 메세지, 열: 단어 
# DTM행렬(Document-Term Matix)<->TDM
sms_dtm<-DocumentTermMatrix(sms_corpus_clean)

sms_dtm2<-DocumentTermMatrix(sms_corpus,
                   control=list(
                     tolower=TRUE,
                     removeNumbers=TRUE,
                     stopwords=TRUE,
                     removePunctuation=TRUE,
                     stemming=TRUE
                   ))
#sms_dtm<-DocumentTermMatrix(sms_corpus_clean)
sms_dtm_train<-sms_dtm2[1:4169,]
sms_dtm_test<-sms_dtm2[4170:5559,]

sms_train_labels<-sms_raw[1:4169,]$type
sms_test_labels<-sms_raw[4170:5559,]$type

install.packages("wordcloud")
library(wordcloud)
wordcloud(sms_corpus_clean,
          scale=c(5,0.2),   #글자빈도수와 크기
          min.freq = 50,    #최소 빈도
          rot.per=0.1,      # 90도 회전
          max.words = 100,   #최대 빈도
          random.color = T, #색지정유무
          colors=brewer.pal(10,"Paired"), #색지정
          random.order = FALSE) 
spam<-subset(sms_raw,type=="spam") # <-용법 암기
ham<-subset(sms_raw,type=="ham")
wordcloud(spam$text,
          max.words = 40,
          scale=c(3,0.5))
wordcloud(ham$text,
          max.words = 40,
          scale=c(3,0.5))

#sms_dtm_train
sms_freq_words<-findFreqTerms(sms_dtm_train,5)
#최소 5번 이상 등장한 단어어
str(sms_freq_words)



#열이 sms_freq_words인 애들로 뽑기
sms_dtm_freq_train<-sms_dtm_train[,sms_freq_words]
sms_dtm_freq_test<-sms_dtm_test[,sms_freq_words]
#행렬의 열 단위로 전달(apply씀,MARGIN=1(행단위로 전달)
#                              MARGIN=2(열단위로 전달))

convert_counts<-function(x){
  x<-ifelse(x>0,"YES","NO")
}

sms_train<-apply(sms_dtm_freq_train,MARGIN=2,convert_counts)
#sms_dtm_freq_train에 열단위로 convert_counts함수를 적용
sms_test<-apply(sms_dtm_freq_test,MARGIN=1,convert_counts)
#sms_dtm_freq_train에 행단위로 convert_counts함수를 적용
dim(sms_train)

#나이브 베이지안 필터기 생성(모델)
install.packages("e1071")
library(e1071)
sms_classifier<-naiveBayes(sms_train,sms_train_labels)
dim(sms_train_labels)

sms_test_pred<-predict(sms_classifier,
                       sms_test)
sms_test_pred
library(gmodels)
crossTable(sms_test_pred,sms_test_labels,
           prop.t=FALSE, prop.r=FALSE,
           dnn=c("predicted","actual"))

sms_classifier2<-naiveBayes(sms_train,
                           sms_train_labels,
                           laplace = 1)
sms_test_pred2<-predict(sms_classifier2,
                       sms_test)
CrossTable(sms_test_pred2,sms_test_labels,
           prop.t=FALSE, prop.r=FALSE,
           dnn=c("predicted","actual"))

