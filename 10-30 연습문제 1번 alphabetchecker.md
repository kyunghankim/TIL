```python
import numpy as np
import pandas as pd
import seaborn as sns
```


```python
names.pivot_table('births',index='year',columns='sex',aggfunc=np.sum)
total_births=pd.pivot_table(data=names, values='births',index='year',columns='sex',aggfunc=np.sum )
```


    ---------------------------------------------------------------------------

    NameError                                 Traceback (most recent call last)

    <ipython-input-4-6ea0caa1a066> in <module>
    ----> 1 names.pivot_table('births',index='year',columns='sex',aggfunc=np.sum)
          2 total_births=pd.pivot_table(data=names, values='births',index='year',columns='sex',aggfunc=np.sum )
    

    NameError: name 'names' is not defined



```python
pieces=[]
for year in range(1880,2011):
    path='names/names/yob%d.txt' % year
    df=pd.read_csv(path,names=['name','sex','births'])
    df['year']=year
    pieces.append(df)
    
pd.concat(pieces)     #     <-모든 pieces의 데이터들을 합침
pd.concat(pieces).shape
```




    (1690784, 4)




```python
names=pd.concat(pieces,ignore_index=True)
```


```python
df_1900=names[names['year']==1900]
df_1950=names[names['year']==1950]
df_2000=names[names['year']==2000]
```


```python
girls_2000=df_2000[df_2000['sex']=='F']
boys_2000=df_2000[df_2000['sex']=='M']
girls_1950=df_1950[df_1950['sex']=='F']
boys_1950=df_1950[df_1950['sex']=='M']
girls_1900=df_1900[df_1900['sex']=='F']
boys_1900=df_1900[df_1900['sex']=='M']
```


```python
boys_1900_l=list(boys_1900['name'])
girls_1900_l=list(girls_1900['name'])
boys_1950_l=list(boys_1950['name'])
girls_1950_l=list(boys_1950['name'])
boys_2000_l=list(boys_2000['name'])
girls_2000_l=list(boys_2000['name'])
```


```python
alphabet=['a','b','c','d','e','f','g','h','i','j',
          'k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
alphabet_count=[]
for i in range(len(alphabet)):
    alphabet_count.append(0)
alphabet_count
alphabet_dict=dict(zip(alphabet,alphabet_count)) 
def alphabetchecker(data):
    for i in range(len(data)):
        data_lower=data[i].lower()
        for letter in data_lower:
            alphabet_dict[letter] +=1
    print(alphabet_dict)
```


```python
alphabetchecker(girls_2000_l)
alphabetchecker(boys_2000_l)
alphabetchecker(girls_1950_l)
alphabetchecker(boys_1950_l)
alphabetchecker(girls_1900_l)
alphabetchecker(boys_1900_l)
```

    {'a': 20532, 'b': 2164, 'c': 3564, 'd': 6084, 'e': 15206, 'f': 874, 'g': 1524, 'h': 5082, 'i': 11036, 'j': 3352, 'k': 3902, 'l': 7702, 'm': 4878, 'n': 14230, 'o': 9328, 'p': 832, 'q': 742, 'r': 11198, 's': 6836, 't': 5936, 'u': 3884, 'v': 2360, 'w': 1038, 'x': 348, 'y': 4426, 'z': 1230}
    {'a': 30798, 'b': 3246, 'c': 5346, 'd': 9126, 'e': 22809, 'f': 1311, 'g': 2286, 'h': 7623, 'i': 16554, 'j': 5028, 'k': 5853, 'l': 11553, 'm': 7317, 'n': 21345, 'o': 13992, 'p': 1248, 'q': 1113, 'r': 16797, 's': 10254, 't': 8904, 'u': 5826, 'v': 3540, 'w': 1557, 'x': 522, 'y': 6639, 'z': 1845}
    {'a': 33099, 'b': 3719, 'c': 6136, 'd': 10254, 'e': 25830, 'f': 1592, 'g': 2689, 'h': 8256, 'i': 18269, 'j': 5256, 'k': 6164, 'l': 13731, 'm': 8059, 'n': 23514, 'o': 15866, 'p': 1471, 'q': 1144, 'r': 19214, 's': 11271, 't': 9867, 'u': 6383, 'v': 3890, 'w': 1848, 'x': 555, 'y': 7355, 'z': 1938}
    {'a': 35400, 'b': 4192, 'c': 6926, 'd': 11382, 'e': 28851, 'f': 1873, 'g': 3092, 'h': 8889, 'i': 19984, 'j': 5484, 'k': 6475, 'l': 15909, 'm': 8801, 'n': 25683, 'o': 17740, 'p': 1694, 'q': 1175, 'r': 21631, 's': 12288, 't': 10830, 'u': 6940, 'v': 4240, 'w': 2139, 'x': 588, 'y': 8071, 'z': 2031}
    {'a': 37347, 'b': 4378, 'c': 7264, 'd': 11813, 'e': 30915, 'f': 1973, 'g': 3265, 'h': 9192, 'i': 21234, 'j': 5578, 'k': 6520, 'l': 17217, 'm': 9199, 'n': 26652, 'o': 18323, 'p': 1795, 'q': 1182, 'r': 22508, 's': 12713, 't': 11461, 'u': 7175, 'v': 4475, 'w': 2182, 'x': 605, 'y': 8304, 'z': 2118}
    {'a': 38109, 'b': 4563, 'c': 7507, 'd': 12138, 'e': 32015, 'f': 2079, 'g': 3415, 'h': 9457, 'i': 21817, 'j': 5656, 'k': 6581, 'l': 17984, 'm': 9466, 'n': 27302, 'o': 18943, 'p': 1882, 'q': 1187, 'r': 23267, 's': 13131, 't': 11819, 'u': 7404, 'v': 4594, 'w': 2319, 'x': 618, 'y': 8541, 'z': 2153}
    


```python
*2번 연습문제:
    잠금번호 1 2 3/ 4 5 6 / 7 8 9 
    이웃한것만 지나갈 수 있고 한번 지나온 번호는 다시 지나갈 수 없음
    가능한 번호인지 아닌지 체크하는 함수
```


```python
pw_board=np.array([[1,2,3],
          [4,5,6],
          [7,8,9]])
pw_count=np.array([[0,0,0],
                  [0,0,0],
                  [0,0,0]])
```


```python
def passwordchecker(pw,cnt):
    
```


```python

```


```python

```


```python

```
