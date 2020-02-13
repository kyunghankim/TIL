연습문제1.
n=2
n=3 일때 n gram 유사도 출력
"오늘 강남에서 맛있는 스파게티를 먹었다."
"강남에서 먹었던 오늘의 스파게티는 맛있었다."
연습문제2. 레벤슈타인거리

연습문제3.감성사전기반 감성분석
bing- positive/negative
nrc-10개
=>임의의 영문장입력=>감정분석결과

text1<-"오늘 강남에서 맛있는 스파게티를 먹었다."
text2<-"강남에서 먹었던 오늘의 스파게티는 맛있었다."
class(text1)
text1_splited<-strsplit(text1,"")
text2_splited<-strsplit(text2,"")
text1_refined<-unlist(text1_splited)
text2_refined<-unlist(text2_splited)
ngram(text1_refined)
length(text1_splited[[1]])
testgram<-c(rep(0,21))
print(testgram)
class(testgram)
gram_2<-function(x){
  for(i in 1:length(x[[1]]))
      replace(testgram,i,paste(x[[1]][i],x[[1]][i+1]))
}
gram_2(text1_splited)
testgram
replace(testgram[1],'test')

paste(text1_splited[[1]][2],text1_splited[[1]][3])


text1_splited[[1]][i]

library('ngram')
install.packages("ngram")
library(ngram)
ng<-ngram(text1,n = 2)
get.phrasetable(ng)
ng2<-ngram(text2,n=2)
get.phrasetable(ng2)

<-get.phrasetable(ng)$ngrams



diff_ngram<-function(x,y,n){
  
}





