```python
print("hello world")
안녕?

```


      File "<ipython-input-2-f8aee72ba5dd>", line 2
        안녕?
          ^
    SyntaxError: invalid syntax
    



```python
안녕
```


    ---------------------------------------------------------------------------

    NameError                                 Traceback (most recent call last)

    <ipython-input-3-d2999925c400> in <module>
    ----> 1 안녕
    

    NameError: name '안녕' is not defined



```python
"""
숫자 자료형: 정수, 실수, 복소수
수, 실수 위주로 학습

"""

```




    '\n숫자 자료형: 정수, 실수, 복소수\n수, 실수 위주로 학습\n\n'




```python
1+2 #더하기 연산 <- 주석문: 비실행문, 코드에 대한 부연설명
```




    3




```python
print(1+2) #파이참에서는 print함수를 써야 함.
```

    3
    


```python
1/2

```




    0.5




```python
cls
```

    
    


```python
1 / 2 # 정수 / 정수 => 실수(파이썬 3버전)
      # 2.7 버전일 경우 정수 / 정수 => 정수 로 결과가 나옴
```




    0.5




```python
5/2
```




    2.5




```python
5//2  #여러 문장을 한 셀에 적어넣을 경우 마지막으로 입력한 줄의 결과를 나타냄
      # // 연산자: 소수점 이하 버림
```




    2




```python
5.5 // 2
5%3  # 5를 3으로 나눈 나머지
4//2 # 정수 2가 나옴
4//2.0 # 2.0   <- 정수 나누기 실수일 경우 둘 중 하나라도 실수이면 결과도 실수로
```




    2.0




```python
4.1//2.0
```




    2.0




```python
4.1//2.5  # //일 경우 소수점 이하는 버린다
```




    1.0




```python
# 숫자 % 2 
x=53454545646545646768976845345331
y=654654654654654
x*y          # 메모리가 버티는 범위 내에서는 거의 잘 나옴, 에러가 없음(다른 프로그램에 비해 장점)
```




    34994267119960778806444448463456944033176320474




```python
2**10    # 2의 10승 
```




    1024




```python

#실수자료형 -> 정수형 
int(3.14)
```




    3




```python
int(-3.114)
```




    -3




```python
int(-2.9)
```




    -2




```python
#문자로된 숫자 -> 정수  / 문자로된 '문자'를 넣을 경우에는 안됨
int('9')
```




    9




```python
type(3.14)
```




    float




```python
type(5)
```




    int




```python
type('a')  #str
```




    str




```python
divmod(17,3)     #div:divide , mod:modulo => (몫,나머지)
```




    (5, 2)




```python
type(divmod(17,5)) # (5,2) 튜플형태로 몫,나머지 형태로 출력
```




    tuple




```python
# 자료(데이터), 자료형(자료 타입, 데이터 타입)
#=>현실로부터 얻은 자료가 있을 텐데 그 자료의 자료들은 문자, 숫자 형태의 
#  자료로 있음  => 자료 구조
x=divmod(17,5)
x[0] #튜플 자료에 대한 접근
x[1]
```




    2




```python
x[0] #튜플에서 0번 index에 있는 값(몫:3)을 출력, 파이썬은 0부터 시작임
```




    3




```python
x[3]  # index번호가 안 맞거나 범위를 벗어나는 경우 indexerror가 남
```


    ---------------------------------------------------------------------------

    IndexError                                Traceback (most recent call last)

    <ipython-input-36-dc2cd44e899d> in <module>
    ----> 1 x[3]
    

    IndexError: tuple index out of range



```python
a=3  #프로그래밍에선은 '='는 assing(할당)의 의미, 오른쪽에 있는 것을 a변수
     #에 3을 저장해라 라는 의미(a=데이터를 저장하는 변수)
a=2
```


```python
a,b=1,2  # 다른 프로그래밍과 차이점 -> 둘다 입력이 됨
```


```python
a
```




    1




```python
b
```




    2




```python
a,b=1,2,3 #ValueError
```


    ---------------------------------------------------------------------------

    ValueError                                Traceback (most recent call last)

    <ipython-input-43-0834964d0ac0> in <module>
    ----> 1 a,b=1,2,3 #ValueError
    

    ValueError: too many values to unpack (expected 2)



```python
a,b,c=1,2 #ValueError
```


    ---------------------------------------------------------------------------

    ValueError                                Traceback (most recent call last)

    <ipython-input-44-dfc132c7dc8e> in <module>
    ----> 1 a,b,c=1,2
    

    ValueError: not enough values to unpack (expected 3, got 2)



```python
#참고사항
0b111 #2진수 -> 0b'<2진수 숫자>'
```




    7




```python
0o10 #8진수
```




    8




```python
0xF # 16진수
```




    15




```python
4.3-2.7   #실수를 표현할 때 약간의 오차
```




    1.5999999999999996




```python
4.3-2.7 >= 1.6
```




    False




```python
4.3-2.7 < 1.6  #컴퓨터 구조에 관련된 정밀도 문제임, 당장은 중요한 내용은X
             #오차에 대한 전처리가 필요함
```




    True




```python
3+4
```




    7




```python
3+4.12   #표현 범위가 넓은 쪽으로 계산(실수에 정수가 포함됨)
```




    7.12




```python
#데이터를 실수로 변환
int('9')
int('9.1') # <-실수문자이므로 int를 적용할 수 없음 <invalid literal>
```


    ---------------------------------------------------------------------------

    ValueError                                Traceback (most recent call last)

    <ipython-input-54-6dc4ba8fd4cf> in <module>
          1 #데이터를 실수로 변환
          2 int('9')
    ----> 3 int('9.1')
    

    ValueError: invalid literal for int() with base 10: '9.1'



```python
('9.1')  #실수문자이므로 float
float('9.1')  
```




    9.1




```python
3+float('9.1') 
```




    12.1




```python
float(1+3)
```




    4.0




```python
#셀에 여러줄을 전부 결과로 보고 싶을 때는 print
print(int('9'))
print(float(1+4))
```

    9
    5.0
    


```python
0.1+0.2      #정확한 값이 아니라 근사값이 나옴
```




    0.30000000000000004




```python
0.1+0.2 ==3
```




    False




```python
import math.sys  #math는 수학에 관련된 것들, sys은 시스템에 관련된것들 
x=0.1+0.2
x

```


    ---------------------------------------------------------------------------

    ModuleNotFoundError                       Traceback (most recent call last)

    <ipython-input-63-8783778f551c> in <module>
    ----> 1 import math.sys  #math는 수학에 관련된 것들, sys은 시스템에 관련된것들
          2 x=0.1+0.2
          3 x
    

    ModuleNotFoundError: No module named 'math.sys'; 'math' is not a package



```python
import math,sys
sys.floa_info.epsilon
```


    ---------------------------------------------------------------------------

    AttributeError                            Traceback (most recent call last)

    <ipython-input-64-cfe477a2d4e1> in <module>
          1 import math,sys
    ----> 2 sys.floa_info.epsilon
    

    AttributeError: module 'sys' has no attribute 'floa_info'



```python
import math.sys

```


    ---------------------------------------------------------------------------

    ModuleNotFoundError                       Traceback (most recent call last)

    <ipython-input-65-16a1c4dc9344> in <module>
    ----> 1 import math.sys
    

    ModuleNotFoundError: No module named 'math.sys'; 'math' is not a package



```python
import math.sys
x=0.1+0.2
x-0.3
```


    ---------------------------------------------------------------------------

    ModuleNotFoundError                       Traceback (most recent call last)

    <ipython-input-66-900fd5209aa0> in <module>
    ----> 1 import math.sys
          2 x=0.1+0.2
          3 x-0.3
    

    ModuleNotFoundError: No module named 'math.sys'; 'math' is not a package



```python
import math.sys
x=0.1+0.2
math.fabs(x-0.3) <=sys.float_info.epsilon
```


    ---------------------------------------------------------------------------

    ModuleNotFoundError                       Traceback (most recent call last)

    <ipython-input-67-3ef832c33759> in <module>
    ----> 1 import math.sys
          2 x=0.1+0.2
          3 math.fabs(x-0.3) <=sys.float_info.epsilon
    

    ModuleNotFoundError: No module named 'math.sys'; 'math' is not a package



```python
import math,sys
x=0.1+0.2
math.fabs(x-0.3) <=sys.float_info.epsilon#시스템안에 이미 입력되어져있음
# sys.float_info.epsilon #2*10의 -16승    이거보다 작으면 걍 같다고 봄
```




    True




```python
math.isclose(0.1+0.2,0.3)
```




    True




```python
x='a'
x="a"
x
```




    'a'




```python
x="""
test"""    #enter도 n이라는 문자로 인식
x
```




    '\ntest'




```python
x='Python's favorite food is egg'   
```


      File "<ipython-input-74-4af85d523307>", line 1
        x='Python's favorite food is egg'
                  ^
    SyntaxError: invalid syntax
    



```python
x="python's favorite food is egg"#홑따옴표안에 또 쓰일수 있는 경우 곁따옴표!
x
```




    "python's favorite food is egg"




```python
say='"Python is very easy." he says' 
say
```




    '"Python is very easy." he says'




```python
say="\"python is very easy.\"he says." # \를 사용하여 곁따옴표를 그대로 출력
say
```




    '"python is very easy."he says.'




```python
x="you need python"
x
```




    'you need python'




```python
x="you\nneed\npython"
x                        #\n -> 줄 바꾼다는 의미
```




    'you\nneed\npython'




```python
print(x)   #print함수가 줄바꿈을 해서 출력해줌
```

    you
    need
    python
    


```python
x="Python"
y="is easy"
x+y
```




    'Pythonis easy'




```python
print(x*2)
```

    PythonPython
    


```python
print("-"*50)
```

    --------------------------------------------------
    


```python
x="My leg is too short"
len(x)   #(): 함수, len<-어떤 함수의 이름
#len함수 기능: 함수에 전달된 값의 길이를 구함

#함수: 내장함수(파이썬안에), 외장함수
#패키지(=폴더): 함수(=파일) 또는 패키지들의 묶음
#외장함수는 패키지에 저장되어 있으므로, 사용하기 위해서는
#사전에 가져와야 함(import <패키지이름>)

```




    19




```python
               #indexing, slicing 작업 
    #indexing: 특정 영역을 참조하는것, slicing: 특정 영역을 잘라냄
    
```


```python
#indexing : 번호가 0번부터 시작!
x="Python is easy, you need python"
x[0]
x[30] #30번 index에 해당하는 숫자
x[-18] #뒤에서 부터 18번째 숫자
```




    'y'




```python
x[5:] #n부터 마지막 문자 까지 => [시작위치:끝위치-1]
```




    'n is easy, you need python'




```python
x[0:30] #0부터 29까지 참조 , [시작위치:끝위치-1] 이기 때문에 이럼
```




    'Python is easy, you need pytho'




```python
#미션 easy단어 indexing!
x[10:13]
```




    'eas'




```python
x[10:14]
```




    'easy'




```python
x[:10]  #0~9번 index
```




    'Python is '




```python
a="Karea" #a->o: a에 저장된 문자열의 특정 문자에 대한 변경시 오류
```


```python
a[1]='o' #Error : Karea는 '문자'가 아니라 '문자열'이기 때문에 하나만 바꿀수X
```


    ---------------------------------------------------------------------------

    TypeError                                 Traceback (most recent call last)

    <ipython-input-104-382951935acf> in <module>
    ----> 1 a[1]='o'
    

    TypeError: 'str' object does not support item assignment



```python
a=a[0]+'o'+a[2:]  #이렇게 해야 a가 빠지고 o가 들어감
a
```




    'Korea'




```python

```
