a<-1
a
b<-3  #b에 3을 할당
b
(a+b)/2
a*b
v1<-c(1,2,5,8,9)
v1
v2<-c(1:5)
v2
v3<-seq(1,5)
v3
v3*v2
length(v3)
v4<-seq(1,10,by=3)
v4+1
s1<-"a"
s2<-"text"
s3<-"hi"
s4<-c(s1,s2,s3)
s4
s4+1

mean(v1)
max(v1)
min(v1)
s4
paste(s4,collapse = "*")
install.packages("ggplot2")
library(ggplot2)
x<-c("a","a","b","c")
x
qplot(x)
#빈도그래프
mpg #기본으로 깔려있는 데이터
qplot(data=mpg,x=hwy)

qplot(data=mpg, x=drv, y=hwy)

qplot(data=mpg, x=drv, y=hwy, geom='line')
qplot(data=mpg, x=drv, y=hwy, geom='boxplot')
qplot(data=mpg, x=drv, y=hwy, 
      geom='boxplot', color=drv)
?qplot
eng<-c(90,80,60,70)
math<-c(50,10,20,90)
#eng<-c(90,80,60,70)

df_mid<-data.frame(eng,math)
df_mid
str(df_mid)
class<-c(1,1,2,2)
df_mid<-data.frame(eng,math,class)
df_mid
df_mid$eng
mean(df_mid$class)
mean(df_mid$math)

eng<-c(90,80,60,70)
math<-c(50,10,20,90)
df_mid<-data.frame(eng,math)
df<-data.frame(eng=c(90,80,60,70),
           math=c(50,10,20,90),class=c(1,1,2,2))
df

install.packages("readxl")
library(readxl)

df<-read_excel("excel_exam.xlsx")
df$english
df_novar<-read_excel("excel_exam_novar.xlsx")

df_novar<-read_excel("excel_exam_novar.xlsx",
                     ccol_names = F)
df_novar

df<-read.csv("csv_exam.csv")
df
str(df)
write.csv(df,file = "mydf.csv")
exam<-read.csv("csv_exam.csv")
head(exam,10)
tail(exam,10)
View(exam)
dim(exam)[0]
str(exam)
summary(exam)

str(mpg)
pi
head(mpg)
View(mpg)
summary(mpg)

df<-data.frame(v1=c(1,2,1),v2=c(2,3,2))
df
install.packages("dplyr")
library(dplyr)
#?rename
df<-rename(df,var1=v1)
df
df$v_sum<-df$var1+df$v2
df
str(mpg)
mpg$total<-(mpg$hwy+mpg$cty)/2
mpg$total
summary(mpg)
mpg<-as.data.frame(mpg)
mpg$test<-ifelse(mpg$total>=20,"pass","fail")
mpg$test
head(mpg,20)
table(mpg$test)
qplot(mpg$test)

mpg$grade<-ifelse(mpg$total>=30,"A",
                  ifelse(mpg$total>=20,"B","C"))
mpg$grade
table(mpg$grade)
qplot(mpg$grade)

1+2 %>% -5 %>% -10 %>% +2 
exam<-read.csv("csv_exam.csv")  
exam  
#exam에서 class가 1인 것만 추출하기
exam %>%  filter(class!=1) %>%filter(math>=50)
#2반이면서 영어점수가 80점이상인 데이터 추출
exam %>% filter(class==2) %>% filter(english>=80)
exam %>% filter(class==2&english>=80)
exam %>% filter(class==2|english>=80)
exam %>% filter(class==1|class==3|class==5)
exam %>% filter(class %in% c(1,3,5))
# %in%:'class가 1,3,5반중에 하나에 들어가면'
exam$math
exam %>% select(math,class)
exam %>% select(-math,-class)
#class가 1인 행에 대하여 english 추출하기
exam %>% filter(class==1) %>% select(english)
#id,math 추출 앞부분 6행까지만
head(exam$id,6)
head(exam$math,6)
exam %>% select(id,math) %>%
  head(6)
exam %>% arrange(math) 
# <-math를 기준으로 오름차순정리
exam %>% arrange(desc(math))
# <-math를 기준으로 내림차순정리
exam %>% arrange(class,math)
#파생변수
exam %>% 
  mutate(total=math+english+science) %>% 
  head
#Q) science가 60이상pass,미만fail인 test열추가
exam %>% mutate(test=ifelse(science>=60,
                            "pass","fail"))
head(exam)

#total=math+english+science
#total오름차순 정렬, 상위 10뽑기
head(exam,5)
exam %>% mutate(total=math+english+science) %>% 
  arrange(total) %>% head(10)

library(dplyr)

exam %>% summarise(mean_math=mean(math))
exam
head(exam,4)
exam %>% 
  group_by(class) %>% 
  summarise(mean_math=mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mm=mean(math),
            sm=sum(math),
            md=median(math),
            cnt=n())        #<-n():그룹에속하는 멤버의 갯수


mpg
library(ggplot2)
mpg
View(mpg)

mpg %>% 
  group_by(manufacturer,drv) %>% 
  summarise(mc=mean(cty)) %>% 
  head(10)

#mpg에서 데이터를 회사별로 그룹화
mpg %>% head(4)
mpg %>% group_by(manufacturer) %>%
  filter(class=="suv")
#tot=cty와 hwy의 평균값
mpg %>% group_by(manufacturer) %>%
  filter(class=="suv") %>% 
  mutate(tot=(cty+hwy)/2) %>% 
  summarise(mt=mean(tot)) %>% 
  arrange(desc(mt)) %>% 
  head(5)

test1<-data.frame(id=c(1,2,3,4,5),
                  midterm=c(60,80,70,90,55))
test2<-data.frame(id=c(1,2,3,4,5),
                  final=c(70,80,70,80,60))
test1
test2
total<-left_join(test1,test2,by='id')
total
exam

name<-data.frame(class=c(1,2,3,4,5),
                 teacher=c('kim','lee','park','choi','cho'))
exam_new=left_join(exam,name,by='class')
exam_new

test1<-data.frame(id=c(1,2,3,4,5),
                  midterm=c(60,80,70,90,55))
test2<-data.frame(id=c(6,7,8,9,10),
                  final=c(70,80,70,80,60))
ta<-bind_rows(test1,test2)
ta

exam %>% filter(english>=80)
exam %>% filter(class==1 & math>=50)
exam %>% filter(class %in% c(1,3,5))#<-class가 1,3,5인 경우만뽑기
exam %>% 
  select(id,math)
#test 컬럼 추가:eng>=60 pass or fail
exam %>%
  mutate(test=ifelse(exam$english>=60,'pass','fail')) %>% 
  arrange(test)

test1
test2
test1<-data.frame(id=c(1,2,3,4,5),
                  midterm=c(60,80,70,90,55))
test2<-data.frame(id=c(1,2,3,4,5),
                  final=c(70,80,70,80,60))
test2
left_join(test1,test2,by='id')

df<-data.frame(sex=c("M","F",NA,"M","F"),
           score=c(5,4,3,5,NA))
df
table(is.na(df))
table(is.na(df$sex))
mean(df$score)
sum(df$score)
df %>% filter(is.na(score))
#score가 NA인 데이터만 출력
df %>% filter(!is.na(score)) #<-NA가 아닌것들만
#score 결측치 제거
df_nomiss <- df %>% filter(!is.na(score))
mean(df$score)
mean(df_nomiss$score)
df_nomiss<-df %>% filter(!is.na(score)&!is.na(sex))
#score,sex컬럼에서 na가 아닌 데이터만 추출
df_nomiss

df
df_nomiss2<-na.omit(df)
df_nomiss2
mean(df$score,na.rm = T) #<-na.rm:na를 제거(remove)조건
sum(df$score,na.rm=T)

exam<-read.csv("csv_exam.csv")
exam

exam[c(3,8,15),'math']<-NA
exam[,'math']
exam %>% summarise(mm=mean(math))

exam %>% summarise(mm=mean(math,na.rm=T),
                   sm=sum(math,na.rm=T),
                   mem=median(math,na.rm=T))
#-대체하기-
#math열 값이 na이면 55대입, 아니면 math값 그대로

exam$math<- ifelse(is.na(exam$math),55,exam$math)
exam$math %>% head(10)
table(is.na(exam$math))
mean(exam$math)  
  
df<-data.frame(sex=c(1,2,1,3,2,1),
               score=c(5,4,3,4,2,6))
table(df$sex)
table(df$score)

df$sex<-ifelse(df$sex==3,NA,df$sex)
df$score<-ifelse(df$score>5,NA,df$score)

df %>% 
  filter(!is.na(sex) & !is.na(score)) %>% 
  group_by(sex) %>% 
  summarise(ms=mean(score))

boxplot(mpg$hwy)
boxplot(mpg$hwy)$stats
mean(mpg$hwy)
median(mpg$hwy)

mpg$hwy<-ifelse(mpg$hwy<12 | mpg$hwy>37,NA,mpg$hwy)
table(is.na(mpg$hwy))

#drv를 기준으로 그룹화
#mean_hwy<-hwy의 평균, 결측값은 제외
mpg %>% group_by(drv) %>% 
  summarise(mean_hwy=mean(hwy,na.rm = T))

table(is.na(df$score))

ggplot(data=mpg,aes(x=displ,y=hwy))
ggplot(data=mpg,
       aes(x=displ,y=hwy))+
  geom_point()+
  xlim(3,6)+
  ylim(10,30)

df_mpg<-mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy=mean(hwy))
df_mpg

ggplot(data=df_mpg, aes(x=drv,y=mean_hwy))+
  geom_col()

economics
ggplot(data=economics,aes(x=date,y=unemploy))+
  geom_line()

install.packages("foreign")
library(foreign) #<-spss 파일을 불러올때 필요한거
library(dplyr) #<-데이터 전처리 용도
library(ggplot2) #<-시각화 용도
library(readxl) #<- 엑셀파일

raw_welfare<-read.spss(file = "Koweps_hpc10_2015_beta1.sav",to.data.frame = T)
welfare<-raw_welfare

str(welfare)

View(welfare)
dim(welfare)
str(welfare)
View(summary(welfare))

welfare<-rename(welfare,
       sex=h10_g3,             #성별
       birth=h10_g4,
       marriage=h10_g10,
       religion=h10_g11,
       code_job=h10_eco9,
       income=p1002_8aq1,
       code_region=h10_reg7)   #지역코드
class(welfare$sex)
table(welfare$sex)
View(welfare)
#이상치 결측값 처리
#(R에서 전처리 필수 과정임)
welfare$sex=ifelse(welfare$sex==9,
                   NA,welfare$sex)
welfare
table(is.na(welfare$sex))

#Q) welfare$sex 값이 1이면 'male',2이면 'female'
welfare$sex<-ifelse(1,'male',ifelse(2,'female'))
welfare$sex %>% head(6)
table(welfare$sex)
class(welfare$income)
welfare$income
summary(welfare$income)
class(welfare$income)
qplot(welfare$income)+xlim(0,1000)

summary(welfare$income)
#이상치 결측값 처리하기
welfare$income<-ifelse(
  welfare$income %in% c(0,9999),
  NA,welfare$income)
table(is.na(welfare$income))

sex_income<-welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(sex) %>% 
  summarise(mi=mean(income))

ggplot(data=sex_income,
       aes(x=sex, y=mi))+
  geom_col()

summary(welfare$birth)
table(is.na(welfare$birth))

#9999
welfare$birth<-ifelse(welfare$birth==9999,
                      NA,welfare$birth)
table(is.na(welfare$birth))
welfare$age<-2015-welfare$birth+1
summary(welfare$age)
qplot(welfare$age)

age_income<-welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age) %>% 
  summarise(mi=mean(income))

head(age_income,8)
ggplot(data=age_income,
       aes(x=age, y=mi))+
  geom_line()

#welfare에 ageg 컬럼을 추가:나이가 30세 미만,young
#                        ,59세이하 middle,60이상 old
welfare<-welfare %>% 
  mutate(ageg=ifelse(age<30,'young',
                     ifelse(age<=59,'middle','old')))
welfare$ageg %>% head()
table(welfare$ageg)
qplot(welfare$ageg)

#연령대별(초년,중년,중년) 월 수입 평균
#시각화

ageg_income<-welfare %>% 
  filter(!is.na(income)) %>%  #<- NA가 아닌 경우 뽑기
  group_by(ageg) %>%          #<- ageg로 group화
  summarise(mi=mean(income))  #<- income의 평균
ageg_income
ggplot(data=ageg_income,
       aes(x=ageg, y=mi))+
  geom_col()

ggplot(data=ageg_income,
       aes(x=ageg, y=mi))+
  geom_col()+
  scale_x_discrete(limits=c('young','middle','old'))

#성별 월급 차이는 연령대별로 다를까?
sex_income<-welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg,sex) %>% 
  summarise(mi=mean(income))
sex_income

ggplot(data=sex_income,aes(x=ageg, y=mi,fill=sex))+
  geom_col()+
  scale_x_discrete(limits=c("young","middle","old"))

ggplot(data=sex_income,aes(x=ageg, y=mi,fill=sex))+
  geom_col(position = "dodge")+
  scale_x_discrete(limits=c("young","middle","old"))

#성별,연령별(20살,21살...) 월급에 대한 평균
sex_age<-welfare %>% 
    filter(!is.na(income)) %>% 
  group_by(age,sex) %>% 
  summarise(mi=mean(income))
sex_age %>% head(7)

ggplot(sex_age,aes(x=age, y=mi,col=sex))+
  geom_line()

#직업 코드별 인원수 확인하기
table(welfare$code_job)

list_job<-read_excel('Koweps_Codebook.xlsx',sheet=2,col_names=T)
list_job
welfare<-left_join(welfare,list_job,
          id="code_job")
welfare$job
welfare$code_job

#welfare에서 code_job이 na가 아닌 
#데이터에 대해 code_job,job 열을 추출
welfare %>% 
  filter(!is.na(code_job)) %>% 
  select(code_job,job) %>% 
  head(15)
#직업별로 월급의 평균
job_income<-welfare %>% 
  filter(!is.na(job) & !is.na(income)) %>% 
  group_by(job) %>% 
  summarise(mi=mean(income))
head(job_income)  
#상위 10개의 직업 추출하기
job_income %>% arrange(mi) #<-오름차순 정렬
top10<-job_income %>% arrange(desc(mi)) %>% 
  head(10)    #<-내림차순 정렬, 상위100개
ggplot(data=top10,aes(x=job, y=mi))+
  geom_col()+
  coord_flip()

ggplot(data=top10,aes(x=reorder(job,-mi), y=mi))+
  geom_col()+
  coord_flip() 
  
top10<-job_income %>% arrange((mi)) %>% 
  head(10)

sex_income<-welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg,sex) %>% 
  summarise(mi=mean(income))
sex_income  

job_male<-welfare %>% 
  filter(!is.na(job)) %>% 
  filter(sex==1)
job_male$job %>% head(10)

job_female<-welfare %>% 
  filter(!is.na(job)) %>% 
  filter(sex==2)
job_female$job %>% head(10)
