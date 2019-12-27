# 12-23 The Fourth Industrial Revolution

## 0. 나용천 강사님

* 석사를 데이터베이스/박사를 머신러닝
* 

## 1. 등장

* 2016 세계경제포럼(WEF): 삶의 방식을 근본적으로 바꿀 **기술혁명**. Klaus Schwab회장이 처음 언급함.

책: Klaus Schwab: 4차산업혁명 책

* 2차산업혁명: 전기, 3차산업혁명: 정보화, 4차산업혁명: 인간의 지능 대체
* 미래창조부과학 블로그 참조

***특이점**: Ray Kuzweil(발명가) "미래에 기술변화의 속도가 빨리지고 그 영향이 매우 깊어 인간의 생활이 되돌릴 수 없도록 변화되는 시기"

책: 2006. 특이점이 온다(The Singularity is Near), Ray Kuzweil

-인간진화의 패턴: 2045년 인공지능 우주로 확대

@ Tipping Point

2023 빅데이터에 의한 의사결정 일반화

2025 인공지능이 화이트칼라 일 대체

2026 인공지능이 스스로 의사결정

* 구성요소: Connectivity + intelligence

=> 제일 잘 하는 나라 -**독일**

ICT를 자동차 기계 산업에 접목

=>CPS(Cyber Physical System): 모든 기계에 센서를 달음

=> 중국은 수만명 써야하는데 독일로 가서 수명이서 공장 돌림

목표: 제조업의 서비스화(제일 앞서나가는건 독일이)

**-중국**

*2015 중국 제조 2025

**-일본(세계 로봇 1위)**

*7개의 세부정책: 빅데이터, 인재육성, 혁신기술 개발 가속화, 금융기능강화, 산업구조취업구조 원활화, 4차 산업혁명의 중소기업 및 지역경제, 4차 산업혁명에 대비한 경제사화 시스템의 고도화

**-사물인터넷IoT**

=> 과거엔 내가 주체였지만, 이제는 나도 하나의 일부분일뿐

마이클포터 "IoT의 4단계: 모니터링, 제어, 최적화, 자율화"

* 글로벌 기업의 전략

1) 구글: DeepMind 인수(알파고제작), 구글 어시스턴스 & 텐서 플로우

2) IBM: Watson 을 이용한 다양한 비즈니스 분야에 적용

3) MS : Cortana를 이용한 플랫폼과의 대화

4) Apple: Siri 생태계 확대에 주력

5) Facebook: AI 채팅 플랫폼 '챗봇' & 오픈소스 HW 'Big Sur' 공개

*Amazon Go: Just Walk out Technology

---------------------------------------------------------------------------------------------------------

## 빅데이터의 개념

논문참조: IEEE, ACM -> 전세계 상위 15%안에 들어가는 논문들

전세계 1위 데이터베이스 Oracle, DB2(관계형데이터)가 뺏김

File 시스템으로 데이터를 관리하다 나온게 데이터베이스(DB)

=>더 커지니까 DB로도 안됨 그래서 L-DB(Large)가 나옴

=> 그다음 VL-DB(Very): 컴퓨터 DB에 대해 논문 쓰기 어려운 학회임

**빅데이터의 정의(저작권있음)**

Gartner,Inc. 사의 2001년 정의 3V: Volume, Velocity, Variety

2012년 기존 정의 개정

**-IBM** 정의: 4V -> Veracity(진실성)추가

**-Brian Hopkins** 정의 4V -> Variability(가변성) 추가

**-우리나라**: Value추가

**Various Concept**: 데이터핸들링 관점: hadoop, kasandra, mongo DB 등

=> 기업이 미래를 알고 싶어서 빅데이터를 연구함

사례) Frances라는 허리케인이 왔을 때 소비가 어떻게 바뀌는지 시뮬레이션 돌려봄

=> 평상시 대비 7배 증가 품목= 딸기타르트

=> 린다틸던 " 우리도 몰랐는데 월마트에서 딸기 타르트가 7배가 오르고 있었다"

*대부분 비즈니스 모델은 예측 + 분류를 원함(의사결정 용의)

사례)

 통신사: 고객이탈문제 

=> 남는다 / 떠난다 

=> 현업에서 못 쓰는 전략을 받아옴 

비즈니스에서 1) 예측과 분류문제, 2) 각 개개인에 대해서 확률 추정을 해줘야함

=> 숫자가 나오니까 비교가 되서 정렬가능

* Data-Driven Decision Making: DDD척도

-DDD1 : 데이터 안에서 찾아야하는 결정사항

-DDD2 : 대규모로 반복되어 데이터 분석에 기반한 의사결정의 정확도가 약간만 향상되어도 큰 이득을 주는 결정사항

*이름, 성적 = feature vector , 합격여부 = Target Value

=> Target Value를 결정해야 시작할 수 있음, 과거 데이터가 수집되어 있나 확인해야함

-회사에서 객관성을 담보하는 가장 좋은 수단이 '수학'

=> 수식이 왜 나왔는가 이해할 수 있어야함

* 기업의 현재 상태

-데이터 자산이 유의미한 것인가?

-적절한 인재를 확보했나

-

*분류와 계층확률 추정

*회귀분석: 가치추정

=> Target value에 숫자로 나옴

-----------------------------------------------------------------------------------------------------

*Data Mining Algorithms

* 동시발생 그룹화: 장바구니 분석(제일많이 팔린 물건들)

* 프로파일링 : 행위기술-> 제일 많이 쓰는 분야가 침입감지(정상적이지 않은 경로로 들어오면 hacking), 사기거래 감지(금융권 Fraud detective)

* 연결 예측: Link Prediction

* 데이터 축소: Data Reduction(=Feature Selection) <-수학적 베이스가 있으면 도전하기에 좋음, 모든데이터 전처리에 다 들어감. 

  예) 연산에 필요 없는 변수들을 지울 수 있을 때 어떤 걸 지울 지 정하는 과목

* 인과 모델링(Causal Modeling):바이오쪽이면 배워야함, 어떤 사건이나 행위가 다른 행위에 영향을 끼치는가?

**-Supervised Learning, Un-supervised learning**

교사학습 / 비교사학습 (데이터가 있냐 없냐?)

**-Abstract**

1.예측 모델링(Predictive Modeling):

*감독 세분화(Supervised Segmentation)

*속성 (Attribute)찾기

2.

**-모델model**

*실세계를 단순하게 표현한 것

*목적에 따라 관련 없는 정보는 생략 후 관련 정보만 유지(Feature-Selection)

**-예측모델**

*우리가 관심 있는 변수(타겟 값)을 예측하는 공식

*감독학습

**-설명모델**

*값의 추정이 아닌 어떤 현상이나 절차를 쉽게 설명

예) 

​         이름  나이  직장  통장  거주형태  상환여부

A씨

B씨

=> 같은 비즈니스에 있을 경우 수집하는 데이터는 거의 비슷할 경우(실제로도)

=> 경쟁사도 똑같이 R 돌리면 결과는 같음

=> 경쟁사한테 없는 경쟁력을 키우려면 수학공부 + 파이썬(언어로 접근)

**-모델유도(Model Induction)**

:데이터로부터 모델을 만드는 것, 귀납법, 범용규칙, 유도알고리즘,학습자

**-엔트로피**

어떤 집합에서 무질서 정도를 측정

#Equation: entropy=-p1*log(p1)-p2*log(p2) ....

​    -pi는 집합 안에ㅓ 속성 i의 확률(상대적 비율)

​    -pi=1 일 때 집합 안의 모든 항목이 i값을 가짐

​    -pi =0 일 때 집합 안에 i값을 가진원소가 하나도 없음

*물리학에선 Entropy가 1에 가까울 수록 stable 하다 라고 함

=> 대출 상환여부를 판단할 때 entropy사용 

=> 우리가 쓸 때는 반대로 0에 가까울 수록 구분이 잘 된다

예) 전체 10명의 대출 고객

정상상환 =7

미상환고객 = 3

=> p(정상상환)=0.7 , S = -0.7*log2(0.7)-0.3*log2(0.3)  = 0.88 #분류가 잘 되어져 있지 <u>않다</u>.

* 정보증가량(Information Gain):

  IG(parents,children)=entropy(parents)-[p(c1)*entropy(c1)+ p(c2)*entropy(c2)...]

  => IG이 클수록 c1,c2의 entropy가 낮아짐을 의미(분류가 잘 되고있다!)

* ci(직장)의 경우 대기업,중견기업 등으로 분류 후 확률 구한다음 entropy를 각각 구할 수 있음

​     =>p(ci) 전체에서 해당 ci가 차지하고 있는 비율

*Continuous data: 돈 시간 키 와 같은 데이터들, 구간화를 통해 쓸 수 있게 함

=> 데이터를 전처리 할 예정이지만 우리가 회사를 들어가면 우리가 데이터를 직접 만들어야함

, 그럴려면 알고리즘 공부를 꼭 해야함(못하면 다룰 수 없으니 안 맡김)

* 이쪽 분야에서는 값을 보정하는 의미로 weight를 쓰지 않고 `기울기`의 의미로 씀
* weight 따라 변수를 생각하기 때문에 매우 객관적일 수 있음

**-의사결정나무(Decision Tree)**

현재 보고있는 데이터 셋에서 target value를 봤을 때 target value가 모두 같은 값이 있으면 스탑임

=> 그런 상태가 아니면 조각을 냄 

=> IG이 큰 기준으로 조각을 냄(잘 분류하고 있으니까)

=>Decision Tree를 활용하여)

과거에 수집된 데이터로 고객이 왔을 때 Outlook을 보고 Windy를 보고 판단함

-**Decision Tree 의 장점**:

* 모델 생성 후 이것을 if else 룰로 만들 수 있음

=> 현업에서 어떻게 응용할 지도 생각해놔야함, 네트워크에서 이미지가 아닌 텍스트로 보낼 수 있음

Decision Tree는 한번도 세계1위를 하진 못 했지만 매년 논문이 끝난 적이 없음, 분석가 입장에서 구조를 볼 때 편함, 이거를 한번 이상을 돌려봐야함

**Think**

데이터분석의 개념이해가 필요한 이유:

-Tool Base의 한계

-Open source의 응용이 가능한가?

-조직에 맞는 개념이 적용될 수 있는가?

*학문적으로도 entropy외의 다른 수식으로도 분류문제 접근이 다를 수 있음

=> 여러 모델링을 다 돌려보고 그중에 좋은 entropy를 선택한 것과 매우 다름

*끝나고 세미나 같이 해보는 것도 좋음 
























