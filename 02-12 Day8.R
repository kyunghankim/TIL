#텍스트 분석, R 함수
myvector<-c(1:6,'a')
mylist<-list(1:6,'a')
print(mylist)
print(myvector)
mylist[1] #<- list는 숫자와 문자가 따로

obj1<-1:4
obj1
obj2<-6:10
obj2
obj3<-list(obj1,obj2)
obj3
mylist<-list(obj1,obj2,obj3)
mylist[3]
#Notation: 벡터=[], 리스트=[[]]로 표기기

mylist[[3]][1]
mylist[[3]][[1]]
#리스트에서 자료 추출시, [1]를 사용해서 list를 추출
#[[1]] 사용하면 벡터를 추출할 수 있음

mylist[[3]][[1]] # <- vector가 나옴
mylist[[3]][[1]][2]

#unlist: list를 vector형식으로 리턴
mylist<-list(1:6,'a')
mylist
unlist(mylist)
myvector==unlist(mylist)

mean(mylist[[1]][1:6])
mean(unlist(mylist)[1:6]) # <- error: unlist로 뽑을 때 문자라!!

name1<-"Donald"
myspace<-" "
name2<-"Trump"
list(name1,myspace,name2)
unlist(list(name1,myspace,name2))

#unlist:하나의 문자 형태의 객체로 합치고자 할 때
name<-c("갑","을","병","정")
gender<-c(2,1,2,1)
mydata<-data.frame(name,gender)
mydata
#attr():속성값을 저장하거나 추출할 때 
#meta data: 데이터의 데이터
#ex) gender의 메타데이터: 성별을 의미함<-meta data

attr(mydata$name,"what the variable means")<-"응답자 이름"
#name의 what the variable means의 속성이 "응답자 이름" 이라는 뜻
mydata$name

attr(mydata$gender,"what the variable means")<-"응답자 성별"
mydata$gender

myvalues<-gender
for(i in 1:length(gender)){
  myvalues[i]<-ifelse(gender[i]==1,"남성","여성")
}
myvalues

attr(mydata$gender,"what the value means")<-myvalues
mydata$gender

mydata$gender.character<-attr(mydata$gender,"what the value means")
mydata

#리스트 ->lapply
mylist<-list(1:4,6:10,list(1:4,6:10))
mylist
lapply(mylist[[3]],mean)

#tapply: text데이터에 대해 사용
wordlist<-c("the","is","a","the")
df1<-c(3,4,2,4)
df2<-rep(1,4) # <-앞에 변수를 뒤에 변수만큼 반복해서 만들어라
df2
tapply(df1,wordlist,length) #<-df1(3,4,2,4,)니까 3,4,2,4번째 원소
tapply(df2,wordlist,sum)#문서2에서 wordlist에 속한 단어가 나온횟수
tapply(df1,wordlist,sum)#문서1에서 wordlist에 속한 단어가 나온횟수

#알파벳 출력 함수
letters[3]
LETTERS[3]
letters[1:26]
LETTERS[1:26]
tolower(LETTERS[1:6])

#nchar():문자수를 세는 함수
nchar("korean",type="bytes")
nchar("한국",type="bytes")
nchar("korea\t",type="bytes")#<- '\t'를 한 개의 문자로 봄 

nchar("korea, 
      Republic of")
nchar("korea, \nRepublic of")
print("korea, \n Republic of")

#문장을 단어로 분리
mysentence<-"Learning R is so interesting"
strsplit(mysentence, split = " ") #<- 공백문자로 분리해라

#단어를 문자로 분리
mywords<-strsplit(mysentence, split = " ")
mywords # <- 자료구조:list
strsplit(mywords[[1]][5],split = "")

#변수 초기화 할때 
myletters<-list(rep(NA,5))

for (i in 1:5){
  myletters[i]<-strsplit(mywords[[1]][i],split = "")
}
myletters

#문자를 합쳐서 단어로 구성
paste(1,2,3)
paste(myletters[[1]],collapse = '#')
paste(myletters[[1]],collapse = '') #<- 공백으로 문자들을 연결 

mywords2<-list(rep(NA,5))
for (i in 1:5){
  mywords2[i]<-paste(myletters[[i]],collapse = "")
}
mywords2
paste(mywords2,collapse = " ")

rwiki<-"R is a programming language and software environment for statistical computing and graphics supported by the R Foundation for Statistical Computing. The R language is widely used among statisticians and data miners for developing statistical software and data analysis. Polls, surveys of data miners, and studies of scholarly literature databases show that R's popularity has increased substantially in recent years.
R is a GNU package. The source code for the R software environment is written primarily in C, Fortran, and R. R is freely available under the GNU General Public License, and pre-compiled binary versions are provided for various operating systems. While R has a command line interface, there are several graphical front-ends available."
rwiki
#문단단위로 구분
rwikipara<-strsplit(rwiki,split = '\n')
strsplit(rwikipara[[1]],split = "\\. ") #<- 문장단위로 나누기
# \\를 붙히면 특수 단어로 보는게 아니라 원래 . 으로 볼 수 있음

rwikisent<-strsplit(rwikipara[[1]],split = "\\. ") 
strsplit(rwikisent[[2]],split = " ")

rwikiword<-list(NA,NA)
rwikiword

for(i in 1:2){
  rwikiword[[i]]<-strsplit(rwikisent[[i]],split = " ")
}
rwikiword
#rwikiword[[1]][[2]]에서 language 출력하기
rwikiword[[1]][[2]][3]

#regexpr함수: 정규표현식, 처음 등장하는 텍스트의 위치 출력
mysentence<-"Learning R is so interesting"
regexpr("ing",mysentence)
# ing가 있는 위치, 타입, bytes인지 까지 나옴
class(regexpr("ing",mysentence))

loc.begin<-as.vector(regexpr("ing",
                             mysentence))
loc.begin
loc.length<-attr(regexpr('ing',mysentence),'match.length')
loc.end<-loc.begin+loc.length-1

#gregexr():패턴이 등장하는 모든 text의 위치 출력
gregexpr('ing',mysentence)
length(gregexpr('ing',mysentence)[[1]]) #<- 패턴의 발견 수

loc.begin<-as.vector(gregexpr("ing",mysentence)[[1]])
loc.begin

loc.length<-attr(gregexpr('ing',mysentence)[[1]],'match.length')
loc.end<-loc.begin+loc.length-1

loc.length
loc.end #<- -1이 요소끼리 뺄셈 해줌

mysentence
regexec("interesting", mysentence)
regexec("interestin(g)", mysentence)#<- interesting의 위치,g의위치
regexec('so (interestin(g))', mysentence)

mysentences<-unlist(rwikisent)
regexpr("software", mysentences)
gregexpr("software", mysentences)

sub('ing','ING',mysentence)
gsub('ing','ING',mysentence)

mytemp<-regexpr("software",mysentences)
my.begin<-as.vector(mytemp)
my.begin
my.begin[my.begin==-1]<-NA
my.end<-my.begin+attr(mytemp,"match.length")-1
my.end

length(my.begin)
mylocs<-matrix(NA,nrow=length(my.begin),ncol=2)
mylocs
colnames(mylocs)<-c("begin","end")
rownames(mylocs)<-paste("sentence",
                         1:length(my.begin),sep=".")

paste("hi","hello")

mylocs

for(i in 1:length(my.begin)){
  mylocs[i,]<-cbind(my.begin[i],my.end[i]) #column별로 더하는 cbind!
}
mylocs

#(오후) grep,grepl:특정 표현이 텍스트에 있는지 확인
#grep은 위치를 알려주고 grepl은 TRUE,FALSE로
mysentences
grep("software",mysentences)
grepl("software",mysentences)

#고유명사 처리: ex) 2단어지만 1명을 의미하는 경우
"Donald Trump"=>"Donald_Trump"
sent1<-rwikisent[[1]][1]
sent1
new.sent1<-gsub("R Foundation for Statistical Computing",
     "R_Foundation_for_Statistical_Computing",
     sent1)#"R Foundation for Statistical Computing"를 하나의 단어로!

length(strsplit(sent1, split = " ")[[1]])
sent1
table(strsplit(sent1, split = " ")) #각 단어들이 몇번 나왔는지
sum(table(strsplit(sent1, split = " ")))#갯수 합치기

new.sent1

#단어 제거
#gsub("대상의 단어","뭐로 바꿀지",대상)
drop.sent1<-gsub("and |by |for |the","",new.sent1)
sum(table(strsplit(drop.sent1, split = " ")))

mysentence
regexpr("ing",mysentence)
mypattern<-regexpr("ing",mysentence)
regmatches(mysentence,mypattern)#<-mysentence에 mypattern을 추출

mypattern<-gregexpr("ing",mysentence)
regmatches(mysentence,mypattern) #gregexpr로바꾸어 모든"ing"추출

#invert 옵션: 반대 표현
mypattern<-regexpr("ing",mysentence)
regmatches(mysentence,mypattern,invert = TRUE)#"ing"를 뺀 나머지

mypattern<-gregexpr("ing",mysentence)
regmatches(mysentence,mypattern,invert = TRUE)

strsplit(mysentence,split="ing")
gsub("ing","",mysentence) # "ing"가 빠진 하나의 문자로 나옴

substr(mysentence,1,20)

substr(mysentences,1,20)

my2sentences<-c("Learning R is so interesting",
                "He is a fascinating singer")
#ing로 긑나는 모든 단어를 검출
mypattern0<-gregexpr("ing",my2sentences)
regmatches(my2sentences,mypattern0)#<-단어를 추출하는 함수
#첫 번째 문장에 ing2개, 2번째 문장에 ing2개

#ing앞에 알파벳표현 확인 [[:alpha:]] <-붙혀주면됨
mypattern1<-gregexpr("[[:alpha:]]+(ing)",my2sentences)
regmatches(my2sentences,mypattern1)

#[[:alpha:]]+ing(ing로 끝나는 단어)=> \\b 를 쓰면됨
mypattern2<-gregexpr("[[:alpha:]]+(ing)\\b",my2sentences)
regmatches(my2sentences,mypattern2)

#7개의 문장 모두에 대해 ing로 끝나는 영어단어 출력
mypattern3<-gregexpr("[[:alpha:]]+(ing)\\b",mysentences)
myings<-regmatches(mysentences,mypattern3)
unlist(myings) #<- list해체체
table(unlist(myings)) 
#문서 전체에서 ing로 끝나는 단어 모두 추출
#빈도수 조사까지 

mypattern<-gregexpr("[[:alpha:]]+(ing)\\b",
                    tolower(mysentences))
mypattern
myings<-regmatches(tolower(mysentences),mypattern)
table(unlist(myings))

#대소문자 구분없이 stat~ 시작되는 단어 추출
mypattern11<-gregexpr("(stat)[[:alpha:]]+",
                    tolower(mysentences))
mypattern11
myings<-regmatches(tolower(mysentences),mypattern11)
table(unlist(myings))

mypattern<-gregexpr("[[:upper:]]",mysentences) #<- 대문자들
my.uppers<-regmatches(mysentences,mypattern)
my.uppers #<- 대문자들만 나오기
table(unlist(my.uppers)) #<-어떤 대문자들이 몇개 있는지

mypattern=gregexpr("[[:lower:]]",mysentences) #<- 소문자
my.lowers<-regmatches(mysentences,mypattern)
table(unlist(my.lowers))

mypattern=gregexpr("[[:upper:]]",toupper(mysentences)) #<- 소문자
my.alphas<-regmatches(toupper(mysentences),mypattern)
mytable<-table(unlist(my.alphas))
mytable[mytable==max(mytable)] #<-A가 71번으로 제일 많이 쓰임

sum(mytable)
library(ggplot2)
class(mytable)
#ggplot 할 때 dataframe으로 변환 후

mydata<-data.frame(mytable)
ggplot(data = mydata,
       aes(x=Var1, y=Freq, fill=Var1))+
  geom_bar(stat='identity')+
  guides(fill=FALSE)+
  geom_hline(aes(yintercept=median(mytable)))+
  xlab("알파벳")+
  ylab("빈도수")



