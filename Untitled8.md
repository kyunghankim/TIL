```python
#A사무실에는 특정일자의 출퇴근 시간이 기록된 거대한 로그파일이 있다고 한다.
파일의 형식은 다음과 같다. (한 라인에서 앞부분은 출근시간(HH:MM:SS), 뒷부분은 퇴근시간이다)
09:12:23 11:14:35
10:34:01 13:23:40
10:34:31 11:20:10
특정시간을 입력(예:11:05:20)으로 주었을 때 그 시간에 총 몇 명이 사무실에 있었는지 알려주는 함수를 작성하시오.

```


```python
#1. #A사무실에는 특정일자의 출퇴근 시간이 기록된 거대한 로그파일이 있다고 한다.
a="9".zfill(2)
b="1".zfill(2)
#acheckin=int()
acheckin=int(a+'1223')
acheckout=111435
bcheckin=int('1034'+b)
bcheckout=132340
ccheckin=103431
ccheckout=112010
checkpoint=int(input())

def checkperson(checkpoint):
    count=0
    if acheckin<=checkpoint<=acheckout:
        count+=1
        if bcheckin<=checkpoint<=bcheckout:
            count+=1
            if ccheckin<=checkpoint<=ccheckout:
                count+=1
    print(count)
checkperson(checkpoint)
```


```python
#2.
def Dashinsert():
    num=list(str(input()))
    numcheck=[]
    for i in range(0,len(num)-1):
        if int(num[i]) %2==0 and int(num[i+1]) %2==0:
            numcheck.append(num[i])
            numcheck.append('*')
        elif int(num[i]) %2==1 and int(num[i+1]) %2==1:
            numcheck.append(num[i])
            numcheck.append('-')
        else:
            numcheck.append(num[i])
    numcheck.append(num[-1])
    for i in range(len(numcheck)):
        print(numcheck[int(i)])
Dashinsert()

```

    65987987
    6
    5
    -
    9
    8
    7
    -
    9
    8
    7
    


```python

```


```python

```


```python

```


```python

def Dashinsert():
    num=list(str(input()))
    numcheck=[]
    for i in range(0,len(num)):
        if int(num[i]) %2==0 and int(num[i+1]) %2==0:
            numcheck.append(num[i])
            numcheck.append('*')
        elif int(num[i]) %2==1 and int(num[i+1]) %2==1:
            numcheck.append(num[i])
            numcheck.append('-')
        else:
            numcheck.append(num[i])
        print(numcheck)
Dashinsert()
```


```python
#2
num=list(str(input()))

def Dashinsert(num):
    for i in range(0,len(num)):
        if int(num[i]) %2==0 and int(num[i+1]) %2==0:
            num.insert(i+1,'*')
            if  int(num[i]) %2==1 and int(num[i+1]) %2==1:
                num.insert(i+1,'-')
        print(Dashinsert(num))
Dashinsert(num)
```

    11264
    


    ---------------------------------------------------------------------------

    RecursionError                            Traceback (most recent call last)

    <ipython-input-43-d811f087208e> in <module>
          8                 num.insert(i+1,'-')
          9         print(Dashinsert(num))
    ---> 10 Dashinsert(num)
    

    <ipython-input-43-d811f087208e> in Dashinsert(num)
          7             if  int(num[i]) %2==1 and  int(num[i+1]) %2==1:
          8                 num.insert(i+1,'-')
    ----> 9         print(Dashinsert(num))
         10 Dashinsert(num)
    

    ... last 1 frames repeated, from the frame below ...
    

    <ipython-input-43-d811f087208e> in Dashinsert(num)
          7             if  int(num[i]) %2==1 and  int(num[i+1]) %2==1:
          8                 num.insert(i+1,'-')
    ----> 9         print(Dashinsert(num))
         10 Dashinsert(num)
    

    RecursionError: maximum recursion depth exceeded in comparison



```python
"2".zfill(2)
```




    '02'




```python

```
