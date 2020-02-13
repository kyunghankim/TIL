#자연어 처리는 다양한 분야에 쓰임
#음성분석에도 쓰임, 음성을 텍스트로 저장

install.packages("stringr")
library(stringr)


rwiki<-"R is a programming language and software environment for statistical computing and graphics supported by the R Foundation for Statistical Computing.
The R language is widely used among statisticians and data miners for developing statistical software and data analysis.
Polls, surveys of data miners, and studies of scholarly literature databases show that R's popularity has increased substantially in recent years.
R is a GNU package. The source code for the R software environment is written primarily in C, Fortran, and R. 
R is freely available under the GNU General Public License, and pre-compiled binary versions are provided for various operating systems. 
While R has a command line interface, there are several graphical front-ends available."
str_extract(rwiki,"software environment")
str_extract(rwiki,"KOPSI")
str_extract_all(rwiki,"software environment")
str_extract_all(rwiki,"software environment",simplify = TRUE)
#자료구조가 matrix로 나옴
myextract<-str_extract_all(rwiki,"[[:upper:]]{1}[[:alpha:]]{0,}")
#[[:upper:]]{1}: 대문자가 1개만 나와야 한다
#[[:upper:]]{1}[[:alpha:]]{0,}: 대문자 뒤로 알파벳이 0개이상
table(myextract) #<- 단어들의 빈도
str_locate(rwiki,'R')
str_locate_all(rwiki,"software environment")
#base: repexpr,gregexpr <-R이 설치가 되면 기본적으로 설치됨
#첫 번째 글자가 대문자로 시작되는 단어들의 위치
str_locate_all(rwiki,"[[:upper:]]{1}[[:alpha:]]{0,}")
mylocate<-str_locate_all(rwiki,"[[:upper:]]{1}[[:alpha:]]{0,}")
dim(mylocate)#그냥하면 null: 리스트 안에 또 리스트가 있어서!
class(mylocate)
mydata<-data.frame(mylocate[[1]])
mydata
mydata$myword<-myextract[[1]]
mydata
#mydata에 myword.length 열 추가,
length(myextract[[1]][19])
mydata$myword.length<-
length(mydata$myword)
mydata$myword.length<-(mydata$end-mydata$start+1)
head(mydata)

str_replace(rwiki,"software environment","software_environment")
temp<-str_replace_all(rwiki,"software environment","software_environment")
str_extract_all(rwiki,"software_environment")
str_extract_all(temp,"software_environment|software|environment")
str_extract_all(rwiki,"software_environment|software|environment")

#R -> R_computer.language_로 변경
#C -> C_computer.language_로 변경

temp<-str_replace_all(temp,"R","R_computer.language_")
temp<-str_replace_all(temp,"C","C_computer.language_")

#temp에서 _computer.language_표현이 붙은 부분에는 어떤단어인지
#빈도가 어떤지 출력
str_extract_all(temp,
                "[[:alpha:]]{0,}_computer.language_[[:alpha:]]{0,}")
table(str_extract_all(temp,
                "[[:alnum:]]{1}_computer.language_"))
#[[:alnum:]]은 숫자까지도 포함해서 
#text data의 문단을 구분(줄바꿈)
rwikipara<-str_split(rwiki,"\n")
rwikipara[[1]]

#문단별로 문장을 구분(.)
rwikisent<-str_split(rwikipara[[2]],"\\.") #<- .을 그냥 쓰면 안나옴

#str_split_fixed함수
class(rwikisent)
unlist(rwikisent)
#unlist: list->vector
my2sentences<-unlist(rwikisent)[c(4,7)]
my2sentences
#각 문장의 단어수 출력
#mylength1<-1번째 문장의 단어의 갯수,...
mylength1<-length(unlist(str_split(my2sentences[1]," ")))
mylength2<-length(unlist(str_split(my2sentences[2]," ")))
mylength1;mylength2

#str_split_fixed
str_split_fixed(my2sentences," ", 5)
myfixed.short<-str_split_fixed(my2sentences," ", 5)
myfixed.long<-str_split_fixed(my2sentences," ", 13)
myfixed.long

#rwikisent 문장*단어 행렬
length.sentences<-rep(NA,
                      length(unlist(rwikisent)))
for(i in 1:length(length.sentences)){
  length.sentences[i]<-
    length(unlist(str_split(unlist(rwikisent)[i]," ")))
}


max.length.sentences<-max(length.sentences)

sent.word.matrix<-str_split_fixed(unlist(rwikisent)," ",max.length.sentences)
mydata<-data.frame(sent.word.matrix)
mydata

rownames(mydata) #sent.1 , sent.2, ... sent.9
colnames(mydata) #word.1 , ..., word.22

paste("abc",1:5,sep=",")
paste("sent",1:9,sep=".")
paste("word",1:22,sep=".")

length(unlist(rwikisent))

rownames(mydata)<-paste("sent",
                        1:length(unlist(rwikisent)),
                        sep=".")
colnames(mydata)<-paste("word",
                        1:max.length.sentences,
                        sep=".")
mydata[,5] # <-각문장마다 5번째 단어
mydata[3,1:10]
#자연어처리할 때 문장 단어들을 이런식으로 분류해서 분석

#표현식 의미                               동등 표현식
"." 개행을 제외한 모든문자 (공백포함)     [^\n\r]
"\w" 영소문자, 영대문자, 숫자, _(언더바)  [A-Za-z0-9_]
"\d" 숫자, _(언더바)                      [0-9]
"\s" 공백, 탭, 개행

#R
class(rwiki)
str_count(rwiki,"R")
str_count(rwikipara,"R")
rwikipara[[1]]
str_count(rwikipara[[1]],"R")
rwikisent
str_count(rwikisent[[1]],"R")
str_count(rwikisent[[2]],"R") # 2번쨰 문단의 R의 갯수

str_count(unlist(rwikisent),"R")

#rwikisent에서
#R이라는 단어가 등장한 후에 stat으로 시작하는 단어의 빈도
str_extract_all(rwikisent,"R")
str_count(unlist(rwikisent),"R.{1,}stat[[:lower:]]{1,}")
#R뒤에 문자가 한개이상 나오면서 stat이 나오는 빈도

#s,S구분이 필요 없는 경우
str_count(unlist(rwikisent),
          "R.{1,}(s|S)tat[[:lower:]]{1,}")
unlist(rwikisent)[1:2]
str_extract_all(unlist(rwikisent[1]),
                "R.{1,}(s|S)tat[[:lower:]]{1,}")
#R과 stat사이에 R이라는 표현이 있으면 안됨
str_count(unlist(rwikisent),
          "R[[:lower:][A-Q][S-Z][:digit:][:space:]]{1,}(s|S)tat[[:alpha:]]{1,}")
#R 다음에 A-Q, S-Z,숫자,공백까지 다 올수 있음
# R만 뺀 알파벳이 올수 있도록
str_count(unlist(rwikisent),
          "R{1}[^R]{1,}(s|S)tat[[:alpha:]]{1,}")
# ^로 R을 빼고 나머지가 올 수 있도록 만들어줌(같은 결과)

#substr(),str_sub()
str_sub(unlist(rwikisent[1],1,30)) #1문단의 각문장의 1~30단어까지
str_dup("software",3)
rep("software",3) #결과 다름
paste(rep("software",3),collapse = "")
str_dup("software",3)==paste(rep("software",3),collapse = "")


#글자수 세기
str_length(unlist(rwikisent))
nchar(unlist(rwikisent))

name<-c("Joe","Jack","Jackie","Jefferson")
donation<-c("$1","$111","$11111","$1111111")

mydata<-data.frame(name,donation)
mydata

name2<-str_pad(mydata$name,
               width=15,side = "right")
#side=right 왼쪽 정렬됨(공백문자를 오른쪽으로)
donation2<-str_pad(mydata$name,
                   width = 15,side="both",pad="~")
name2;donation2
mydata2<-data.frame(name2,donation2)
mydata2

str_length(mydata2$name2)
str_length(mydata$name)
#패딩된 공백문자를 제거
name3<-str_trim(mydata2$name2,side='right')
name3

#양쪽에 패딩(~)기호를 모두 제거
mydata2$donation2
mydata2$donation2<-str_remove_all(mydata2$donation2,'~')
mydata2$donation2

str_replace_all(mydata2$donation2,'~'," ")
donation3<-str_trim(str_replace_all(mydata2$donation2,'~'," "))

mydata3<-data.frame(name3,donation3)
mydata;mydata3

#자연어 처리 과정(최신)
#기본: Word2Vec, Seq2Seq
#BERT,Glove...
#단어를 나누는 것: ngram
#Word2Vec:
"Play, run, rise...등의 단어를 벡터공간으로!
파이썬에서 OneHotEncoding으로 했었음
벡터공간에 옮겨서 덧셈,뺄셈 함
핸즈온 머신러닝 p516쪽 
"
예)
오늘 나는 멀티캠퍼스가 있는 역삼동에 간다
나는 오늘 역삼동에 있는 멀티캠퍼스에 간다
2-gram(문장의 유사도를 구할 때)
나는 오늘
오늘 역삼동에
...
멀티캠퍼스에 간다


mytext<-c("software environment",
  "software  environment",
  "software\tenvironment")
mytext
#white space(공란) 제거
str_split(mytext," ")

sapply(str_split(mytext," "),length)
lapply(str_split(mytext," "),length)

mytext.nowhitespace<-str_replace_all(mytext,'[[:space:]]{1,}'," ")
mytext.nowhitespace

sapply(str_split(mytext.nowhitespace," "),length)
lapply(str_split(mytext.nowhitespace," "),length)

mytext<-"The 45th President of the United States,
Donald Trump, states that he knows
how to play trump with the former president"

myword<-unlist(str_extract_all(mytext,boundary("word")))
table(myword)

#같은 단어들을 구분하기위해 이런 작업들을 해줘야함
table(tolower(myword))
myword<-str_replace(myword,"Trump","Trump_unique_")
myword<-str_replace(myword,"States","States_unique_")
table(myword)

mytext<-c("He is one of statisticians agreeing that R is the No. 1 statistical software.",
          "He is one of statisticians agreeing that R is the No. one statistical software.")
mytext
mytext2<-str_split(str_replace_all
                   (mytext,"[[:digit:]]{1,}[[:space:]]{1,}","")," ")
str_c(mytext2[[1]],collapse = " ")
str_c(mytext2[[2]],collapse = " ")

ex:"나는 1995년에 태어났습니다."

#숫자자료 표시하기
mytext3<-str_split(str_replace_all
                   (mytext,"[[:digit:]]{1,}[[:space:]]{1,}","_number_")," ")
mytext3
mytext<-"Kim et al. (2020) argued that the state of"
str_split(mytext,"\\.")
#성 er al.(년도)=>하나의 단어로
              #=>_reference_

mytext<-c("She is an actor","She is the actor")
#a an the 불용어로
mystopword<-'(\\ban )|(\\bthe )'
str_replace_all(mytext,mystopword,"")

library('tm')
stopwords('en')
length(stopwords('SMART'))

#어근 동일화 프로그램
mytext<-c("I am a boy. You are a boy. He might be a boy")

mystemmer.func<-function(mytextobj){
  mytextobj<-str_replace(mytextobj,
                         "(\\bam)|(\\bare)|(\\bis)|(\\bwas)|(\\bwere)|(\\bbe)","be")
}
mytext.stem<-mystemmer.func(mytext)
mytext.stem
#I be a boy. ...

"오늘 강남에서 맛있는 스파게티를 먹었다."
"강남에서 먹었던 오늘의 스파게티는 맛있었다."
#글자기반 n-gram 기반 유사도
#n=2
#=>오늘,늘,강, ... ,다.
#강남, 남에, ...,다...

install.packages("tidytext")
library(tidytext)
install.packages("tidyr")
library(tidyr)
#감성어휘사전=>감성분석 (이미 구축되어있음)
get_sentiments('afinn')
install.packages('textdata')
library(nrc)
get_sentiments("bing")
get_sentiments("nrc")


mynrc<-data.frame(get_sentiments("nrc"))
table(mynrc$sentiment)





