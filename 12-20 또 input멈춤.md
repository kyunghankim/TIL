```python
money=True

if money:
    print("사먹는다")
else:
    print("...")
```

    사먹는다
    


```python
money=5000
card=True     #or: 1개이상 참->참 and: 모두참->참
if money>=10000 and card: # <-money=5000이니 앞조건거짓
    print("택시를 탄다") # not조건식
else:
    print("버스를 탄다")
```

    버스를 탄다
    


```python
# x in 리스트 : 리스트 내부에 x가 있느냐?
# x in 튜플   
# x in 문자열
1 in [1,2,3]
1 not in [1,2,3]
poc=['money','cp','coin']
if 'coin' in poc:
    print("동전이 있다")
else :
    print("동전이 없다")
```

    동전이 있다
    


```python
x=1
y=2
if x==1 and y==2:
    print("참")
else:
    print("거짓")
```

    참
    


```python
if x==1:
    if y==2:
        print("참")
    else:
        print("거짓")
else:
    print("거짓")
```

    참
    


```python
a=1
b=3
if a==1:
    if b==2:
        print("a=1,b=2")
    else:
        print("a=1이지만b=2가 아님")
else:
    print("a,b둘다 각각 1,3이아님")
```

    a=1이지만b=2가 아님
    


```python
x=10
if x>0 and x<20:
    print("20보다 작은 양수")
if 0<x<20:
    print("20보다 작은 양수")  #and로 묶어줘도 되지만 
                               #바로 써도 됨
```

    20보다 작은 양수
    20보다 작은 양수
    


```python
poc=['cp','paper']
card=True
if 'money' in poc:
    print("택시탄다")
else:                 #money는 없지만 card는 있다면
    if card:
        print("택시탄다")
    else:
        print("걸어간다") #money도 없고 card도 없을때
                          #에만 걸어가는 것임
```

    택시탄다
    


```python
poc=['cp','paper']
card=True
if 'money' in poc:
    print("택시탄다")
elif card:          # <-else if 그렇지 않고 만약에
    print("택시탄다")
else:      #if 및 elif 조건 모두 만족하지 않는 경우!!
    print("걸어간다")                          
```

    택시탄다
    


```python
if 'money' in poc:
    pass
else:
    print("카드 사용")
if 'money' in poc: pass
else: print("카드사용")  #이렇게 써도 되는데 너무 난잡
```

    카드 사용
    카드사용
    


```python
score=80
if score >=60:
    msg="success"
else:
    msg="failure"
print(msg)

#한 줄로 표현
msg="success" if score>=60 else "failure"
                           #<-score가 60이상이면 msg
print(msg)                 #는 success! 라는의미
                          #한줄로도 가능하긴 함
#스파크(빅데이터분석하는언어)에서 쓰는 스칼라가 있음
```

    success
    success
    


```python
## for 변수 in range(범위):
##    반복코드
for i in range(5,1,-1):  #range만큼 반복하는 것
    print("hi")     #컴퓨터구조상 숫자가 작아지면서
                    #반복하는 것이 미세하게 더 빨리됨
                   #삼성의경우 그렇게 한다고 함
                  #secure코딩에서는 중요함
            
```

    hi
    hi
    hi
    hi
    


```python
cnt=int(input("반복 횟수 입력?"))
for i in range(cnt):
    print("hello",i)        #error: str형태임
```

    반복 횟수 입력?4
    hello 0
    hello 1
    hello 2
    hello 3
    


```python
a=[1,2,3]
a3=("파이썬")
for i in a3:   #for 변수 in 리스트:
    print(i)   #변수 자리에 list,tuple,문자열 다됨
    print(i,end="")
    
```

    파
    파이
    이썬
    썬


```python
#while 조건식:     while:조건식을 만족하는 동안 반복
#    수행문장1
#    수행문장2
#    ...
i=0
while i<5:               #i가 10보다 작다는 조건을 
    print("hi",i)         #만족하는동안반복
    i+=1                  # In[*]<-*이 실행중...의미
```

    hi 0
    hi 1
    hi 2
    hi 3
    hi 4
    


```python
prompt="""
1.add
2.del
3.list
4.quit

enter number:      """
print(prompt)
```

    
    1.add
    2.del
    3.list
    4.quit
    
    enter number:      
    


```python
number=0
while number !=4:    #문법적으론 문제x, 논리상 error
    print(prompt)    #number가 없는데 4가 아닌 동안에 라고 써서 틀린말임
    number=int(input())   #input을 먼저 실행하는데 대입값이 있어야함 그래서 In[*]
```

    
    1.add
    2.del
    3.list
    4.quit
    
    enter number:      
    4
    


```python
#모듈: 함수들의 묶음(.py or .ipynb)
#패키지(폴더): 모듈 또는 서브 패키지(하위폴더) ex)Anaconda3의 Lib에 random.py파일
```


```python
#난수(random number):컴퓨터 임의의 수
import random #random 모듈(random.py)을 가져와라! 라는 의미
random.random() #0<= 난수<1
#<모듈이름>.<함수이름> => random.<tab>을 누르면 함수들이 나옴
random.randint(2,10)
```




    8




```python
# 위 셀은 실행 할 때마다 숫자가 바뀜 
```


```python
random.sample(range(46),6)
```




    [9, 42, 29, 34, 19, 37]




```python

i=0
while i!=6:   
    print(random.sample(range(46),6)
    i+=1            #(오후)동일한 수가 발생하지 않도록 로또생성기 코드 수정
```


      File "<ipython-input-47-4031d0b68d72>", line 4
        i+=1            #(오후)동일한 수가 발생하지 않도록 로또생성기 코드 수정
        ^
    SyntaxError: invalid syntax
    



```python
#choice함수는 choice(시퀀스형) 와 같은 형식으로
#무작위로 추출
print(random.choice([1,2,3,4,5,6]))
print(random.choice("hello"))
```

    1
    e
    


```python
#break, continue문은 반복문에서 제어하는 역할
#break: 반복문 종료
#continue: 특정 반복 문장을 건너뛸때 사용
i=0
while True:     #무한반복
    print(i)
    i+=1
    if i==10:
        break   #while문을 종료!
```

    0
    1
    2
    3
    4
    5
    6
    7
    8
    9
    


```python
for i in range(100):
    print(i)
    if i==9:
        breaK
```

    0
    1
    2
    3
    4
    5
    6
    7
    8
    9
    


    ---------------------------------------------------------------------------

    NameError                                 Traceback (most recent call last)

    <ipython-input-22-9ce2a77035e2> in <module>
          2     print(i)
          3     if i==9:
    ----> 4         breaK
    

    NameError: name 'breaK' is not defined



```python
for i in range(100):
    if i %2==0:       #i가 짝수 라면
        continue      #0대입하면 %2==0이라 위로 올라감, 1을 다시 대입=>print(1)이 됨
                      #반복문의 시작위치로 이동, 따라서 continue아래를 실행x
    print(i)
```

    1
    3
    5
    7
    9
    11
    13
    15
    17
    19
    21
    23
    25
    27
    29
    31
    33
    35
    37
    39
    41
    43
    45
    47
    49
    51
    53
    55
    57
    59
    61
    63
    65
    67
    69
    71
    73
    75
    77
    79
    81
    83
    85
    87
    89
    91
    93
    95
    97
    99
    


```python
##퀴즈: 1~100 사이의 수에 대해 짝수만 출력(while문)
```


```python
#i=0
#while i!=6:
#    print(random.randint(1,45))
#    i+=1 
```


```python
i=0
while i in range(101):
    if i%2==0:
        print(i)
    i+=1
```

    0
    2
    4
    6
    8
    10
    12
    14
    16
    18
    20
    22
    24
    26
    28
    30
    32
    34
    36
    38
    40
    42
    44
    46
    48
    50
    52
    54
    56
    58
    60
    62
    64
    66
    68
    70
    72
    74
    76
    78
    80
    82
    84
    86
    88
    90
    92
    94
    96
    98
    100
    


```python
### 이렇게 할 수도 있음 
i=0
while i<100:
    i+=1
    if i%2==1:
        continue
    print(i)
```

    2
    4
    6
    8
    10
    12
    14
    16
    18
    20
    22
    24
    26
    28
    30
    32
    34
    36
    38
    40
    42
    44
    46
    48
    50
    52
    54
    56
    58
    60
    62
    64
    66
    68
    70
    72
    74
    76
    78
    80
    82
    84
    86
    88
    90
    92
    94
    96
    98
    100
    


```python
### 커피에 돈넣고 돈 있는 동안 뽑기

coffee=10   #10잔 커피, 1잔=200원 
money=5000   #5천원

while money:               #돈이 0원이 될 때 까지 커피를 뽑으려고 함
    print("커피가 나옵니다")
    coffee=coffee-1
    money=money-200
    print("남은 커피는 %d잔 입니다" % coffee)  # %자리에 coffee 변수가 들어감
    print("잔액 %d원 입니다" % money)          # %자리에 money 변수가 들어감
    if coffee==0:
        print("커피가 떨어졌습니다.판매중지")
        break
```

    커피가 나옵니다
    남은 커피는 9잔 입니다
    잔액 4800원 입니다
    커피가 나옵니다
    남은 커피는 8잔 입니다
    잔액 4600원 입니다
    커피가 나옵니다
    남은 커피는 7잔 입니다
    잔액 4400원 입니다
    커피가 나옵니다
    남은 커피는 6잔 입니다
    잔액 4200원 입니다
    커피가 나옵니다
    남은 커피는 5잔 입니다
    잔액 4000원 입니다
    커피가 나옵니다
    남은 커피는 4잔 입니다
    잔액 3800원 입니다
    커피가 나옵니다
    남은 커피는 3잔 입니다
    잔액 3600원 입니다
    커피가 나옵니다
    남은 커피는 2잔 입니다
    잔액 3400원 입니다
    커피가 나옵니다
    남은 커피는 1잔 입니다
    잔액 3200원 입니다
    커피가 나옵니다
    남은 커피는 0잔 입니다
    잔액 3000원 입니다
    커피가 떨어졌습니다.판매중지
    


```python
coffee=10   #10잔 커피, 1잔=200원 
money=1100   #천원
### 잔액이 200원 미만이면 판매가 안되도록....(오후)만들기

while money:               #돈이 0원이 될 때 까지 커피를 뽑으려고 함
    print("커피가 나옵니다")
    coffee=coffee-1
    money=money-200
    print("남은 커피는 %d잔 입니다" % coffee)  # %자리에 coffee 변수가 들어감
    print("잔액 %d원 입니다" % money)          # %자리에 money 변수가 들어감
    if coffee==0:
        print("커피가 떨어졌습니다.판매중지")
        break
```

    커피가 나옵니다
    남은 커피는 9잔 입니다
    잔액 900원 입니다
    커피가 나옵니다
    남은 커피는 8잔 입니다
    잔액 700원 입니다
    커피가 나옵니다
    남은 커피는 7잔 입니다
    잔액 500원 입니다
    커피가 나옵니다
    남은 커피는 6잔 입니다
    잔액 300원 입니다
    커피가 나옵니다
    남은 커피는 5잔 입니다
    잔액 100원 입니다
    커피가 나옵니다
    남은 커피는 4잔 입니다
    잔액 -100원 입니다
    커피가 나옵니다
    남은 커피는 3잔 입니다
    잔액 -300원 입니다
    커피가 나옵니다
    남은 커피는 2잔 입니다
    잔액 -500원 입니다
    커피가 나옵니다
    남은 커피는 1잔 입니다
    잔액 -700원 입니다
    커피가 나옵니다
    남은 커피는 0잔 입니다
    잔액 -900원 입니다
    커피가 떨어졌습니다.판매중지
    


```python
### 잔액이 200원 미만이면 판매가 안되도록....(오후)만들기
coffee=10   #10잔 커피, 1잔=200원 
money=1100   #천원
while money:               #돈이 0원이 될 때 까지 커피를 뽑으려고 함
    print("커피가 나옵니다")
    coffee=coffee-1
    money=money-200
    print("남은 커피는 %d잔 입니다" % coffee)  # %자리에 coffee 변수가 들어감
    print("잔액 %d원 입니다" % money)          # %자리에 money 변수가 들어감
    if money<200:
        print("커피가 떨어졌습니다.판매중지")  #money가 200원보다 적게 있으면 break
        break
```

    커피가 나옵니다
    남은 커피는 9잔 입니다
    잔액 900원 입니다
    커피가 나옵니다
    남은 커피는 8잔 입니다
    잔액 700원 입니다
    커피가 나옵니다
    남은 커피는 7잔 입니다
    잔액 500원 입니다
    커피가 나옵니다
    남은 커피는 6잔 입니다
    잔액 300원 입니다
    커피가 나옵니다
    남은 커피는 5잔 입니다
    잔액 100원 입니다
    커피가 떨어졌습니다.판매중지
    


```python
# for 변수 in sequence형:
a=[(1,2),(3,4)]
for (data1,data2) in a:                #<-튜플로 읽어야 함
    print(data1)
    print(data2)
```

    1
    2
    3
    4
    


```python
#구구단 2단 해보기
rn=range(1,10)
for i in rn:
    i=i*2
    print(i)
```

    2
    4
    6
    8
    10
    12
    14
    16
    18
    


```python
#답
i=2
for j in range(1,10):
    print(i*j, end=" ")
```

    2 4 6 8 10 12 14 16 18 


```python
#9단까지 다하기
for i in range(2,10):
    for j in range(1,10):
        print(i*j, end=" ")
    print()
```

    2 4 6 8 10 12 14 16 18 3 6 9 12 15 18 21 24 27 4 8 12 16 20 24 28 32 36 5 10 15 20 25 30 35 40 45 6 12 18 24 30 36 42 48 54 7 14 21 28 35 42 49 56 63 8 16 24 32 40 48 56 64 72 9 18 27 36 45 54 63 72 81 


```python
# 각 줄에 *이 한개씩 늘어나도록 프린트 되게 짜기
for i in range(4):                     #줄
    for j in range(4):                 #별의 개수
        if j<=i:                       #j가 i보다 클 때는 실행하지 않으니까 *개수 조절이 됨
            print("*", end=" ")
            break                      #break를 추가하게 되면 포함된 반복문1개만 break됨
    print()
```

    * 
    * 
    * 
    * 
    


```python
for i in range(9):                     #줄
    for j in range(9):                 #별의 개수
        if :                      
            print("*", end=" ")
        else:                          #i와 j가 서로 다를 경우 " "공백으로 채움
            print(" ", end=" ")        
    print()
```

    *       
      *     
        *   
          * 
    


```python
# 피라미드 모양으로 출력해보기
```


```python
#리스트 내포
#리스트 내부에 for 문을 포함하는 
x=[1,2,3]
#res=[]
#for n in x:
#    res.append(n*2)
#print(res)

res=[n*2 for n in x ]       #[표현식 for 변수 in 반복가능셋 if 조건문]
                            #x에서 데이터를 n으로 읽어들인 후,
                            #n에 2를 곱한 값으로 리스트에 저장 (append의 개념과 비슷)
print(res)
```

    [2, 4, 6]
    


```python
# 조건문으로 해보기
res=[n*2 for n in x if n%2==0]      #x에서 데이터를 n으로 읽어들인 후,
print(res)                          #만약에 n이 짝수이면 n에 2를 곱한 값으로 리스트에 저장
```

    [4]
    


```python
# for문 2개 넣기
res=[y*x for y in range(2,10) for x in range(1,10)] # range(2,10)에서 y를 먼저 읽고 다음 x를 읽음
print(res)

#목표출력: [2,4,6,...,81]
```

    [2, 4, 6, 8, 10, 12, 14, 16, 18, 3, 6, 9, 12, 15, 18, 21, 24, 27, 4, 8, 12, 16, 20, 24, 28, 32, 36, 5, 10, 15, 20, 25, 30, 35, 40, 45, 6, 12, 18, 24, 30, 36, 42, 48, 54, 7, 14, 21, 28, 35, 42, 49, 56, 63, 8, 16, 24, 32, 40, 48, 56, 64, 72, 9, 18, 27, 36, 45, 54, 63, 72, 81]
    


```python
TS=set(range(1,5000))
gen_set=set()
for i in TS:
    for j in str(i):
        i = i +int(j)
    gen_set.add(i)
s = TS-gen_set
set(s)
sum(s)
```




    1227365




```python

```


```python

```


```python

```
