```python
""" 
train.csv
test.csv 로 예측해보고 
목표:등수올리기
-조건문 개선
-Name => Age 결측값 처리
Mrs = Mrs 그룹 중앙값
Miss => Miss 그룹 중앙값
Mr => Mr 그룹 중앙값
...
나머지는 모두 동일하게 전체 그룹 평균/중앙값으로 
-FamilySize column 추가(Sibsp+Parch로 만들기), binning(pd.cut사용해서 대가족,중가족,소가족)도 하기

"""
```


```python
import pandas as pd
import numpy as np
```


```python
train=pd.read_csv("train.csv")
test=pd.read_csv("test.csv")
```


```python
train["Name"][0]
```




    'Braund, Mr. Owen Harris'




```python

```




    Harper, Mr. Henry Sleeper                    1
    Perkin, Mr. John Henry                       1
    Albimona, Mr. Nassef Cassem                  1
    Hendekovic, Mr. Ignjac                       1
    Lewy, Mr. Ervin G                            1
                                                ..
    Johansson, Mr. Gustaf Joel                   1
    McCoy, Mr. Bernard                           1
    Zabour, Miss. Hileni                         1
    Sivic, Mr. Husein                            1
    Silvey, Mrs. William Baird (Alice Munger)    1
    Name: Name, Length: 891, dtype: int64




```python
import re
p=re.compile('[\w+]+[,]+[\s]+[Mr]+[.]+[\s]+[\w+]')
list(train['Name'])[1]
Mr=[]
for i in range(0,len(train['Name'])):
    if p.match(train['Name'][i]):
        Mr.append(train['Name'][i])
    else:
        pass
```


```python
train["Age"]
```




    0      22.0
    1      38.0
    2      26.0
    3      35.0
    4      35.0
           ... 
    886    27.0
    887    19.0
    888     NaN
    889    26.0
    890    32.0
    Name: Age, Length: 891, dtype: float64




```python
Mr_age=[]
for i in range(0,len(Mr)):
    while Mr[i] in train['Name']:
        Mr_age.append(train["Age"][i])
Mr_age
```




    []




```python
Mr
```




    ['Braund, Mr. Owen Harris',
     'Allen, Mr. William Henry',
     'Moran, Mr. James',
     'McCarthy, Mr. Timothy J',
     'Saundercock, Mr. William Henry',
     'Andersson, Mr. Anders Johan',
     'Williams, Mr. Charles Eugene',
     'Fynney, Mr. Joseph J',
     'Beesley, Mr. Lawrence',
     'Sloper, Mr. William Thompson',
     'Emir, Mr. Farred Chehab',
     'Fortune, Mr. Charles Alexander',
     'Todoroff, Mr. Lalio',
     'Wheadon, Mr. Edward H',
     'Meyer, Mr. Edgar Joseph',
     'Holverson, Mr. Alexander Oskar',
     'Mamee, Mr. Hanna',
     'Cann, Mr. Ernest Charles',
     'Kraeff, Mr. Theodor',
     'Rogers, Mr. William John',
     'Lennon, Mr. Denis',
     'Samaan, Mr. Youssef',
     'Nosworthy, Mr. Richard Cater',
     'Ostby, Mr. Engelhart Cornelius',
     'Woolner, Mr. Hugh',
     'Novel, Mr. Mansouer',
     'Sirayanian, Mr. Orsen',
     'Harris, Mr. Henry Birkhardt',
     'Stewart, Mr. Albert A',
     'Crease, Mr. Ernest James',
     'Kink, Mr. Vincenz',
     'Jenkin, Mr. Stephen Curnow',
     'Hood, Mr. Ambrose Jr',
     'Chronopoulos, Mr. Apostolos',
     'Bing, Mr. Lee',
     'Moen, Mr. Sigurd Hansen',
     'Staneff, Mr. Ivan',
     'Moutal, Mr. Rahamin Haim',
     'Waelens, Mr. Achille',
     'Sheerlinck, Mr. Jan Baptist',
     'Carrau, Mr. Francisco M',
     'Ford, Mr. William Neal',
     'Slocovski, Mr. Selman Francis',
     'Celotti, Mr. Francesco',
     'Christmann, Mr. Emil',
     'Andreasson, Mr. Paul Edvin',
     'Chaffee, Mr. Herbert Fuller',
     'Dean, Mr. Bertram Frank',
     'Coxon, Mr. Daniel',
     'Shorney, Mr. Charles Joseph',
     'Goldschmidt, Mr. George B',
     'Greenfield, Mr. William Bertram',
     'Kantor, Mr. Sinai',
     'Petroff, Mr. Pastcho ("Pentcho")',
     'White, Mr. Richard Frasar',
     'Johansson, Mr. Gustaf Joel',
     'Gustafsson, Mr. Anders Vilhelm',
     'Mionoff, Mr. Stoytcho',
     'Moss, Mr. Albert Johan',
     'Rekic, Mr. Tido',
     'Porter, Mr. Walter Chamberlain',
     'Barton, Mr. David John',
     'Pekoniemi, Mr. Edvard',
     'Connors, Mr. Patrick',
     'Turpin, Mr. William John Robert',
     'Baxter, Mr. Quigg Edmond',
     'Hickman, Mr. Stanley George',
     'Moore, Mr. Leonard Charles',
     'Nasser, Mr. Nicholas',
     'White, Mr. Percival Wayland',
     'McMahon, Mr. Martin',
     'Madsen, Mr. Fridtjof Arne',
     'Ekstrom, Mr. Johan',
     'Drazenoic, Mr. Jozef',
     'Coelho, Mr. Domingos Fernandeo',
     'Sobey, Mr. Samuel James Hayden',
     'Richard, Mr. Emile',
     'Futrelle, Mr. Jacques Heath',
     'Osen, Mr. Olaf Elon',
     'Giglio, Mr. Victor',
     'Burke, Mr. Jeremiah',
     'Andrew, Mr. Edgardo Samuel',
     'Nicholls, Mr. Joseph Charles',
     'Andersson, Mr. August Edvard ("Wennerstrom")',
     'Navratil, Mr. Michel ("Louis M Hoffman")',
     'Meo, Mr. Alfonzo',
     'Olsen, Mr. Ole Martin',
     'Williams, Mr. Charles Duane',
     'Corn, Mr. Harry',
     'Smiljanic, Mr. Mile',
     'Cribb, Mr. John Hatfield',
     'Bengtsson, Mr. John Viktor',
     'Calic, Mr. Jovo',
     'Baumann, Mr. John D',
     'Ling, Mr. Lee',
     'Sivola, Mr. Antti Wilhelm',
     'Smith, Mr. James Clinch',
     'Klasen, Mr. Klas Albin',
     'Hale, Mr. Reginald',
     'Leonard, Mr. Lionel',
     'Pernot, Mr. Rene',
     'Rood, Mr. Hugh Roscoe',
     'Romaine, Mr. Charles Hallace ("Mr C Rolmane")',
     'Bourke, Mr. John',
     'Turcin, Mr. Stjepan',
     'Carbines, Mr. William',
     'Mernagh, Mr. Robert',
     'Olsen, Mr. Karl Siegwart Andreas',
     'Sage, Mr. Frederick',
     'Johanson, Mr. Jakob Alfred',
     'Youseff, Mr. Gerious',
     'Cohen, Mr. Gurshon "Gus"',
     'Backstrom, Mr. Karl Alfred',
     'Albimona, Mr. Nassef Cassem',
     'Blank, Mr. Henry',
     'Ali, Mr. Ahmed',
     'Perkin, Mr. John Henry',
     'Givard, Mr. Hans Kristensen',
     'Kiernan, Mr. Philip',
     'Jacobsohn, Mr. Sidney Samuel',
     'Harris, Mr. Walter',
     'Sunderland, Mr. Victor Francis',
     'Bracken, Mr. James H',
     'Green, Mr. George Henry',
     'Nenkoff, Mr. Christo',
     'Hoyt, Mr. Frederick Maxfield',
     'Berglund, Mr. Karl Ivar Sven',
     'Mellors, Mr. William John',
     'Lovell, Mr. John Hall ("Henry")',
     'Fahlstrom, Mr. Arne Jonas',
     'Larsson, Mr. Bengt Edvin',
     'Sjostedt, Mr. Ernst Adolf',
     'Leyson, Mr. Robert William Norman',
     'Hold, Mr. Stephen',
     'Pengelly, Mr. Frederick William',
     'Hunt, Mr. George Henry',
     'Coleridge, Mr. Reginald Charles',
     'Maenpaa, Mr. Matti Alexanteri',
     'Attalah, Mr. Sleiman',
     'Beckwith, Mr. Richard Leonard',
     'Reed, Mr. James George',
     'Stead, Mr. William Thomas',
     'Lobb, Mr. William Arthur',
     'Smith, Mr. Thomas',
     'Taussig, Mr. Emil',
     'Harrison, Mr. William',
     'Reeves, Mr. David',
     'Panula, Mr. Ernesti Arvid',
     'Persson, Mr. Ernst Ulrik',
     'Cairns, Mr. Alexander',
     'Tornquist, Mr. William Henry',
     'Natsch, Mr. Charles H',
     'Parkes, Mr. Francis "Frank"',
     'Duane, Mr. Frank',
     'Olsson, Mr. Nils Johan Goransson',
     'Dorking, Mr. Edward Arthur',
     'Smith, Mr. Richard William',
     'Stankovic, Mr. Ivan',
     'Naidenoff, Mr. Penko',
     'Hosono, Mr. Masabumi',
     'Levy, Mr. Rene Jacques',
     'Mineff, Mr. Ivan',
     'Lewy, Mr. Ervin G',
     'Hanna, Mr. Mansour',
     'Saalfeld, Mr. Adolphe',
     'McCoy, Mr. Bernard',
     'Johnson, Mr. William Cahoone Jr',
     'Williams, Mr. Howard Hugh "Harry"',
     'Abelson, Mr. Samuel',
     'Hendekovic, Mr. Ignjac',
     'Hart, Mr. Benjamin',
     'Dennis, Mr. Samuel',
     'Danoff, Mr. Yoto',
     'Sage, Mr. George John Jr',
     'Nysveen, Mr. Johan Hansen',
     'Partner, Mr. Austen',
     'Graham, Mr. George Edward',
     'Denkoff, Mr. Mitto',
     'Pears, Mr. Thomas Clinton',
     'Dahl, Mr. Karl Edwart',
     'Blackwell, Mr. Stephen Weart',
     'Collander, Mr. Erik Gustaf',
     'Sedgwick, Mr. Charles Frederick Waddington',
     'Fox, Mr. Stanley Hubert',
     'Dimic, Mr. Jovan',
     'Odahl, Mr. Nils Martin',
     'Elias, Mr. Tannous',
     'Yousif, Mr. Wazli',
     'Skoog, Mr. Wilhelm',
     'Asim, Mr. Adola',
     'Adahl, Mr. Mauritz Nils Martin',
     'Harder, Mr. George Achilles',
     'Wiklund, Mr. Jakob Alfred',
     'Beavan, Mr. William Thomas',
     'Ringhini, Mr. Sante',
     'Widener, Mr. Harry Elkins',
     'Betros, Mr. Tannous',
     'Gustafsson, Mr. Karl Gideon',
     'Tikkanen, Mr. Juho',
     'Plotcharsky, Mr. Vasil',
     'Davies, Mr. Charles Henry',
     'Sadlier, Mr. Matthew',
     'Carter, Mr. William Ernest',
     'Jansson, Mr. Carl Olof',
     'Gustafsson, Mr. Johan Birger',
     'Johansson, Mr. Erik',
     'McKane, Mr. Peter David',
     'Niskanen, Mr. Juha',
     'Adams, Mr. John',
     'Hakkarainen, Mr. Pekka Pietari',
     'Gale, Mr. Shadrach',
     'Widegren, Mr. Carl/Charles Peter',
     'Birkeland, Mr. Hans Martin Monsen',
     'Sdycoff, Mr. Todor',
     'Hart, Mr. Henry',
     'Cunningham, Mr. Alfred Fleming',
     'Sundman, Mr. Johan Julian',
     'Matthews, Mr. William John',
     'Gheorgheff, Mr. Stanio',
     'Charters, Mr. David',
     'Zimmerman, Mr. Leo',
     'Rosblom, Mr. Viktor Richard',
     'Wiseman, Mr. Phillippe',
     'Flynn, Mr. James',
     'Pickard, Mr. Berk (Berk Trembisky)',
     'Kallio, Mr. Nikolai Erland',
     'Silvey, Mr. William Baird',
     'Fortune, Mr. Mark',
     'Kvillner, Mr. Johan Henrik Johannesson',
     'Hampe, Mr. Leon',
     'Petterson, Mr. Johan Emil',
     'Seward, Mr. Frederic Kimber',
     'West, Mr. Edwy Arthur',
     'Hagland, Mr. Ingvald Olai Olsen',
     'Foreman, Mr. Benjamin Laventall',
     'Goldenberg, Mr. Samuel L',
     'Peduzzi, Mr. Joseph',
     'Jalsevac, Mr. Ivan',
     'Millet, Mr. Francis Davis',
     'Anderson, Mr. Harry',
     'Morley, Mr. William',
     'Gee, Mr. Arthur H',
     'Milling, Mr. Jacob Christian',
     'Maisner, Mr. Simon',
     'Goncalves, Mr. Manuel Estanslas',
     'Campbell, Mr. William',
     'Smart, Mr. John Montgomery',
     'Scanlan, Mr. James',
     'Keefe, Mr. Arthur',
     'Cacic, Mr. Luka',
     'Clifford, Mr. George Quincy',
     'Renouf, Mr. Peter Henry',
     'Braund, Mr. Lewis Richard',
     'Karlsson, Mr. Nils August',
     'Frost, Mr. Anthony Wood "Archie"',
     'Rouse, Mr. Richard Henry',
     'Bishop, Mr. Dickinson H',
     'Kent, Mr. Edward Austin',
     'Somerton, Mr. Francis William',
     'Hagland, Mr. Konrad Mathias Reiersen',
     'Windelov, Mr. Einar',
     'Molson, Mr. Harry Markland',
     'Artagaveytia, Mr. Ramon',
     'Stanley, Mr. Edward Roland',
     'Yousseff, Mr. Gerious',
     'Shellard, Mr. Frederick William',
     'Svensson, Mr. Olof',
     'Calic, Mr. Petar',
     'Bradley, Mr. George ("George Arthur Brayton")',
     'Olsen, Mr. Henry Margido',
     'Lang, Mr. Fang',
     'Daly, Mr. Eugene Patrick',
     'Webber, Mr. James',
     'McGough, Mr. James Robert',
     'Coleff, Mr. Satio',
     'Walker, Mr. William Anderson',
     'Ryan, Mr. Patrick',
     'Pavlovic, Mr. Stefo',
     'Vovk, Mr. Janko',
     'Lahoud, Mr. Sarkis',
     'Kassem, Mr. Fared',
     'Farrell, Mr. James',
     'Farthing, Mr. John',
     'Salonen, Mr. Johan Werner',
     'Hocking, Mr. Richard George',
     'Toufik, Mr. Nakli',
     'Elias, Mr. Joseph Jr',
     'Risien, Mr. Samuel Beard',
     'Beane, Mr. Edward',
     'Douglas, Mr. Walter Donald',
     'Nicholson, Mr. Arthur Ernest',
     'Goldsmith, Mr. Frank John',
     'Thayer, Mr. John Borland Jr',
     'Sharp, Mr. Percival James R',
     'Leeni, Mr. Fahim ("Philip Zenni")',
     'Wright, Mr. George',
     'Robbins, Mr. Victor',
     'Morrow, Mr. Thomas Rowan',
     'Sivic, Mr. Husein',
     'Norman, Mr. Robert Douglas',
     'Simmons, Mr. John',
     'Davies, Mr. Alfred J',
     'Stoytcheff, Mr. Ilia',
     'Doharr, Mr. Tannous',
     'Jonsson, Mr. Carl',
     'Harris, Mr. George',
     'Flynn, Mr. John Irwin ("Irving")',
     'Rush, Mr. Alfred George John',
     'Patchett, Mr. George',
     'Jussila, Mr. Eiriik',
     'Downton, Mr. William James',
     'Ross, Mr. John Hugo',
     'Paulner, Mr. Uscher',
     'Jarvis, Mr. John Denzil',
     'Gilinski, Mr. Eliezer',
     'Murdlin, Mr. Joseph',
     'Rintamaki, Mr. Matti',
     'Elsbury, Mr. William James',
     'Chapman, Mr. John Henry',
     'Johnson, Mr. Alfred',
     'Boulos, Mr. Hanna',
     'Slabenoff, Mr. Petco',
     'Harrington, Mr. Charles H',
     'Torber, Mr. Ernst William',
     'Homer, Mr. Harry ("Mr E Haven")',
     'Lindell, Mr. Edvard Bengtsson',
     'Karaic, Mr. Milan',
     'Daniel, Mr. Robert Williams',
     'Jardin, Mr. Jose Neto',
     'Horgan, Mr. John',
     'Brocklebank, Mr. William Alfred',
     'Danbom, Mr. Ernst Gilbert',
     'Gavey, Mr. Lawrence',
     'Yasbeck, Mr. Antoni',
     'Kimball, Mr. Edwin Nelson Jr',
     'Nakid, Mr. Sahid',
     'Hansen, Mr. Henry Damsgaard',
     'Bowen, Mr. David John "Dai"',
     'Sutton, Mr. Frederick',
     'Bostandyeff, Mr. Guentcho',
     'Barkworth, Mr. Algernon Henry Wilson',
     'Lundahl, Mr. Johan Svensson',
     'Parr, Mr. William Henry Marsh',
     'Leinonen, Mr. Antti Gustaf',
     'Collyer, Mr. Harvey',
     'Thorneycroft, Mr. Percival',
     'Jensen, Mr. Hans Peder',
     'Foo, Mr. Choong',
     'Harper, Mr. Henry Sleeper',
     'Cor, Mr. Liudevit',
     'Willey, Mr. Edward',
     'Mitkoff, Mr. Mito',
     'Kalvik, Mr. Johannes Halvorsen',
     'Hickman, Mr. Leonard Mark',
     'Radeff, Mr. Alexander',
     'Eitemiller, Mr. George Floyd',
     'Newell, Mr. Arthur Webster',
     'Badt, Mr. Mohamed',
     'Colley, Mr. Edward Pomeroy',
     'Coleff, Mr. Peju',
     'Lindqvist, Mr. Eino William',
     'Hickman, Mr. Lewis',
     'Butler, Mr. Reginald Fenton',
     'Rommetvedt, Mr. Knud Paust',
     'Cook, Mr. Jacob',
     'Davidson, Mr. Thornton',
     'Mitchell, Mr. Henry Michael',
     'Wilhelms, Mr. Charles',
     'Watson, Mr. Ennis Hastings',
     'Edvardsson, Mr. Gustaf Hjalmar',
     'Sawyer, Mr. Frederick Charles',
     'Cardeza, Mr. Thomas Drake Martinez',
     'Hassab, Mr. Hammad',
     'Olsvigen, Mr. Thor Anderson',
     'Goodwin, Mr. Charles Edward',
     'Brown, Mr. Thomas William Solomon',
     'Laroche, Mr. Joseph Philippe Lemercier',
     'Panula, Mr. Jaako Arnold',
     'Dakic, Mr. Branko',
     'Fischer, Mr. Eberhard Thelander',
     'Dick, Mr. Albert Adrian',
     'Lam, Mr. Ali',
     'Saad, Mr. Khalil',
     'Chapman, Mr. Charles Henry',
     'Kelly, Mr. James',
     'Thayer, Mr. John Borland',
     'Humblen, Mr. Adolf Mathias Nicolai Olsen',
     'Silverthorne, Mr. Spencer Victor',
     'Gallagher, Mr. Martin',
     'Hansen, Mr. Henrik Juul',
     'Morley, Mr. Henry Samuel ("Mr Henry Marshall")',
     'Calderhead, Mr. Edward Pennington',
     'Klaber, Mr. Herman',
     'Taylor, Mr. Elmer Zebley',
     'Larsson, Mr. August Viktor',
     'Greenberg, Mr. Samuel',
     'Soholt, Mr. Peter Andreas Lauritz Andersen',
     'McEvoy, Mr. Michael',
     'Johnson, Mr. Malkolm Joackim',
     'Jensen, Mr. Svend Lauritz',
     'Gillespie, Mr. William Henry',
     'Hodges, Mr. Henry Price',
     'Chambers, Mr. Norman Campbell',
     'Oreskovic, Mr. Luka',
     'Bryhl, Mr. Kurt Arnold Gottfrid',
     'Hassan, Mr. Houssein G N',
     'Knight, Mr. Robert J',
     'Berriman, Mr. William John',
     'Troupiansky, Mr. Moses Aaron',
     'Williams, Mr. Leslie',
     'Lesurer, Mr. Gustave J',
     'Ivanoff, Mr. Kanio',
     'Nankoff, Mr. Minko',
     'Hawksford, Mr. Walter James',
     'Cavendish, Mr. Tyrell William',
     'McNamee, Mr. Neal',
     'Stranden, Mr. Juho',
     'Abbott, Mr. Rossmore Edward',
     'Marvin, Mr. Daniel Warner',
     'Connaghton, Mr. Michael',
     'Jonkoff, Mr. Lalio',
     'Carlsson, Mr. August Sigfrid',
     'Bailey, Mr. Percy Andrew',
     'Theobald, Mr. Thomas Leonard',
     'Garfirth, Mr. John',
     'Nirva, Mr. Iisakki Antino Aijo',
     'Barah, Mr. Hanna Assi',
     'Eklund, Mr. Hans Linus',
     'Moran, Mr. Daniel J',
     'Gronnestad, Mr. Daniel Danielsen',
     'Lievens, Mr. Rene Aime',
     'Jensen, Mr. Niels Peder',
     'Elias, Mr. Dibo',
     'Myhrman, Mr. Pehr Fabian Oliver Malkolm',
     'Tobin, Mr. Roger',
     'Kilgannon, Mr. Thomas J',
     'Long, Mr. Milton Clyde',
     'Johnston, Mr. Andrew G',
     'Ali, Mr. William',
     'Harmer, Mr. Abraham (David Lishin)',
     'Guggenheim, Mr. Benjamin',
     'Keane, Mr. Andrew "Andy"',
     'Gaskell, Mr. Alfred',
     'Hoyt, Mr. William Fisher',
     'Dantcheff, Mr. Ristiu',
     'Otter, Mr. Richard',
     'Ponesell, Mr. Martin',
     'Hedman, Mr. Oskar Arvid',
     'Johansson, Mr. Karl Johan',
     'Andrews, Mr. Thomas Jr',
     'Meyer, Mr. August',
     'Alexander, Mr. William',
     'Lester, Mr. James',
     'Slemen, Mr. Richard James',
     'Tomlin, Mr. Ernest Portage',
     'Fry, Mr. Richard',
     'Mallet, Mr. Albert',
     'Holm, Mr. John Fredrik Alexander',
     'Lulic, Mr. Nikola',
     'Flynn, Mr. John',
     'Lam, Mr. Len',
     'McCormack, Mr. Thomas Joseph',
     'Saad, Mr. Amin',
     'Augustsson, Mr. Albert',
     'Allum, Mr. Owen George',
     'Pasic, Mr. Jakob',
     'Sirota, Mr. Maurice',
     'Chip, Mr. Chang',
     'Marechal, Mr. Pierre',
     'Alhomaki, Mr. Ilmari Rudolf',
     'Mudd, Mr. Thomas Charles',
     'Lemberopolous, Mr. Peter L',
     'Culumovic, Mr. Jeso',
     'Abbing, Mr. Anthony',
     'Sage, Mr. Douglas Bullen',
     'Markoff, Mr. Marin',
     'Svensson, Mr. Johan',
     'Daly, Mr. Peter Denis ',
     'Razi, Mr. Raihed',
     'Hansen, Mr. Claus Peter',
     'Giles, Mr. Frederick Edward',
     'Gill, Mr. John William',
     'Roebling, Mr. Washington Augustus II',
     'Balkic, Mr. Cerin',
     'Carlsson, Mr. Frans Olof',
     'Gustafsson, Mr. Alfred Ossian',
     'Petroff, Mr. Nedelio',
     'Laleff, Mr. Kristo',
     'Markun, Mr. Johann',
     'Banfield, Mr. Frederick James',
     'Sutehall, Mr. Henry Jr',
     'Behr, Mr. Karl Howell',
     'Dooley, Mr. Patrick']




```python
p_Mrs=re.compile('[\w+]+[,]+[\s]+[Mr]+[s]+[.]+[\s]+[\w+]')
Mrs=[]
for i in range(0,len(train['Name'])):
    if p_Mrs.match(train['Name'][i]):
        Mrs.append(train['Name'][i])
    else:
        pass
```


```python
Mrs
```




    ['Cumings, Mrs. John Bradley (Florence Briggs Thayer)',
     'Futrelle, Mrs. Jacques Heath (Lily May Peel)',
     'Johnson, Mrs. Oscar W (Elisabeth Vilhelmina Berg)',
     'Nasser, Mrs. Nicholas (Adele Achem)',
     'Masselmani, Mrs. Fatima',
     'Asplund, Mrs. Carl Oscar (Selma Augusta Emilia Johansson)',
     'Spencer, Mrs. William Augustus (Marie Eugenie)',
     'Ahlin, Mrs. Johan (Johanna Persdotter Larsson)',
     'Turpin, Mrs. William John Robert (Dorothy Ann Wonnacott)',
     'Harper, Mrs. Henry Sleeper (Myna Haxtun)',
     'Faunthorpe, Mrs. Lizzie (Elizabeth Anne Wilkinson)',
     'Backstrom, Mrs. Karl Alfred (Maria Mathilda Gustafsson)',
     'Doling, Mrs. John T (Ada Julia Bone)',
     'Robins, Mrs. Alexander A (Grace Charity Laury)',
     'Weisz, Mrs. Leopold (Mathilde Francoise Pede)',
     'Boulos, Mrs. Joseph (Sultana)',
     'Hakkarainen, Mrs. Pekka Pietari (Elin Matilda Dolck)',
     'Pears, Mrs. Thomas (Edith Wearne)',
     'Watt, Mrs. James (Elizabeth "Bessie" Inglis Milne)',
     'Skoog, Mrs. William (Anna Bernhardina Karlsson)',
     'Brown, Mrs. James Joseph (Margaret Tobin)',
     'Harris, Mrs. Henry Birkhardt (Irene Wallach)',
     'Hamalainen, Mrs. William (Anna)',
     'Strom, Mrs. Wilhelm (Elna Matilda Persson)',
     'Rosblom, Mrs. Viktor (Helena Wilhelmina)',
     'Touma, Mrs. Darwis (Hanne Youssef Razi)',
     'Thorne, Mrs. Gertrude Maybelle',
     'Graham, Mrs. William Thompson (Edith Junkins)',
     'Abbott, Mrs. Stanton (Rosa Hunt)',
     'Bishop, Mrs. Dickinson H (Helen Walton)',
     'Baxter, Mrs. James (Helene DeLaudeniere Chaput)',
     'Lahtinen, Mrs. William (Anna Sylfven)',
     'Kantor, Mrs. Sinai (Miriam Sternin)',
     'Spedden, Mrs. Frederic Oakley (Margaretta Corning Stone)',
     'Caldwell, Mrs. Albert Francis (Sylvia Mae Harbaugh)',
     'Goldsmith, Mrs. Frank John (Emily Alice Brown)',
     'Frauenthal, Mrs. Henry William (Clara Heinsheimer)',
     'Davison, Mrs. Thomas Henry (Mary E Finck)',
     'Warren, Mrs. Frank Manley (Anna Sophia Atkinson)',
     'Meyer, Mrs. Edgar Joseph (Leila Saks)',
     'Holverson, Mrs. Alexander Oskar (Mary Aline Towner)',
     'Sandstrom, Mrs. Hjalmar (Agnes Charlotta Bengtsson)',
     'Trout, Mrs. William H (Jessie L)',
     'Meek, Mrs. Thomas (Annie Louise Rowley)',
     'Drew, Mrs. James Vivian (Lulu Thorne Christian)',
     'Danbom, Mrs. Ernst Gilbert (Anna Sigrid Maria Brogren)',
     'Clarke, Mrs. Charles V (Ada Maria Winfield)',
     'Thorneycroft, Mrs. Percival (Florence Kate White)',
     'Louch, Mrs. Charles Alexander (Alice Adelaide Slow)',
     'Richards, Mrs. Sidney (Emily Hocking)',
     'Hart, Mrs. Benjamin (Esther Ada Bloomfield)',
     'Reynaldo, Ms. Encarnacion',
     'Kenyon, Mrs. Frederick R (Marion)',
     'West, Mrs. Edwy Arthur (Ada Mary Worth)',
     'Jerwan, Mrs. Amin S (Marie Marthe Thuillard)',
     'Hoyt, Mrs. Frederick Maxfield (Jane Anne Forby)',
     'Allison, Mrs. Hudson J C (Bessie Waldo Daniels)',
     'Quick, Mrs. Frederick Charles (Jane Richards)',
     'Rothschild, Mrs. Martin (Elizabeth L. Barrett)',
     'Angle, Mrs. William A (Florence "Mary" Agnes Hughes)',
     'Hippach, Mrs. Louis Albert (Ida Sophia Fischer)',
     'Peter, Mrs. Catherine (Catherine Rizk)',
     'Beane, Mrs. Edward (Ethel Clarke)',
     'Taussig, Mrs. Emil (Tillie Mandelbaum)',
     'Palsson, Mrs. Nils (Alma Cornelia Berglund)',
     'Appleton, Mrs. Edward Dale (Charlotte Lamson)',
     'Silvey, Mrs. William Baird (Alice Munger)',
     'Caram, Mrs. Joseph (Maria Elias)',
     'Thayer, Mrs. John Borland (Marian Longstreth Morris)',
     'Stephenson, Mrs. Walter Bertram (Martha Eustis)',
     'Jacobsohn, Mrs. Sidney Samuel (Amy Frances Christy)',
     'Laroche, Mrs. Joseph (Juliette Marie Louise Lafargue)',
     'Andersson, Mrs. Anders Johan (Alfrida Konstantia Brogren)',
     'Lobb, Mrs. William Arthur (Cordelia K Stanlick)',
     'Panula, Mrs. Juha (Maria Emilia Ojala)',
     'Bourke, Mrs. John (Catherine)',
     'Taylor, Mrs. Elmer Zebley (Juliet Cummins Wright)',
     'Brown, Mrs. Thomas William Solomon (Elizabeth Catherine Ford)',
     'Goodwin, Mrs. Frederick (Augusta Tyler)',
     'Astor, Mrs. John Jacob (Madeleine Talmadge Force)',
     'Kelly, Mrs. Florence "Fannie"',
     'Renouf, Mrs. Peter Henry (Lillian Jefferys)',
     'Ford, Mrs. Edward (Margaret Ann Watson)',
     'Herman, Mrs. Samuel (Jane Laver)',
     'Carter, Mrs. William Ernest (Lucile Polk)',
     'Hogeboom, Mrs. John C (Anna Andrews)',
     'Hocking, Mrs. Elizabeth (Eliza Needs)',
     'Robert, Mrs. Edward Scott (Elisabeth Walton McMillan)',
     'Dick, Mrs. Albert Adrian (Vera Gillespie)',
     'Osman, Mrs. Mara',
     'Collyer, Mrs. Harvey (Charlotte Annie Tate)',
     'Chambers, Mrs. Norman Campbell (Bertha Griggs)',
     'Hays, Mrs. Charles Melville (Clara Jennings Gregg)',
     'Stone, Mrs. George Nelson (Martha Evelyn)',
     'Yasbeck, Mrs. Antoni (Selini Alexander)',
     'Goldenberg, Mrs. Samuel L (Edwiga Grabowska)',
     'Carter, Mrs. Ernest Courtenay (Lilian Hughes)',
     'Aks, Mrs. Sam (Leah Rosen)',
     'Wick, Mrs. George Dennick (Mary Hitchcock)',
     'Baclini, Mrs. Solomon (Latifa Qurban)',
     'Swift, Mrs. Frederick Joel (Margaret Welles Barron)',
     'Beckwith, Mrs. Richard Leonard (Sallie Monypeny)',
     'Abelson, Mrs. Samuel (Hannah Wizosky)',
     'Potter, Mrs. Thomas Jr (Lily Alexenia Wilson)',
     'Shelley, Mrs. William (Imanita Parrish Hall)',
     'Rice, Mrs. William (Margaret Norton)']




```python
p_Miss=re.compile('[\w+]+[,]+[\s]+[Miss]+[.]+[\s]+[\w+]')
Miss=[]
for i in range(0,len(train['Name'])):
    if p_Miss.match(train['Name'][i]):
        Miss.append(train['Name'][i])
    else:
        pass
Miss
```




    ['Heikkinen, Miss. Laina',
     'Sandstrom, Miss. Marguerite Rut',
     'Bonnell, Miss. Elizabeth',
     'Vestrom, Miss. Hulda Amanda Adolfina',
     'McGowan, Miss. Anna "Annie"',
     'Palsson, Miss. Torborg Danira',
     'Glynn, Miss. Mary Agatha',
     'Laroche, Miss. Simonne Marie Anne Andree',
     'Devaney, Miss. Margaret Delia',
     'Rugg, Miss. Emily',
     'West, Miss. Constance Mirium',
     'Icard, Miss. Amelie',
     'Andersson, Miss. Erna Alexandra',
     'Goodwin, Miss. Lillian Amy',
     'Dowdell, Miss. Elizabeth',
     'McDermott, Miss. Brigdet Delia',
     'Ilett, Miss. Bertha',
     'Fortune, Miss. Mabel Helen',
     'Petranec, Miss. Matilda',
     'Salkjelsvik, Miss. Anna Kristine',
     'Moran, Miss. Bertha',
     'Zabour, Miss. Hileni',
     'Jussila, Miss. Katriina',
     'Attalah, Miss. Malake',
     'Andersson, Miss. Ellis Anna Maria',
     'Webber, Miss. Susan',
     'Peter, Miss. Anna',
     'Newsom, Miss. Helen Monypeny',
     'Nysten, Miss. Anna Sofia',
     'Ford, Miss. Robina Maggie "Ruby"',
     'Gilnagh, Miss. Katherine "Katie"',
     'Johnson, Miss. Eleanor Ileen',
     'Isham, Miss. Ann Elizabeth',
     'Sage, Miss. Constance Gladys',
     'Lurette, Miss. Elise',
     'Madigan, Miss. Margaret "Maggie"',
     'Yrois, Miss. Henriette ("Mrs Harbeck")',
     'Strom, Miss. Telma Matilda',
     'Carr, Miss. Helen "Ellen"',
     'Cameron, Miss. Clear Annie',
     'Newell, Miss. Madeleine',
     'Honkanen, Miss. Eliina',
     'Bazzani, Miss. Albina',
     'Lefebre, Miss. Mathilde',
     'Asplund, Miss. Lillian Gertrud',
     'Harknett, Miss. Alice Phoebe',
     'Collyer, Miss. Marjorie "Lottie"',
     'Zabour, Miss. Thamine',
     'Murphy, Miss. Katherine "Kate"',
     'Lindahl, Miss. Agda Thorilda Viktoria',
     'Cherry, Miss. Gladys',
     'Ward, Miss. Anna',
     'Henry, Miss. Delia',
     'Bissette, Miss. Amelia',
     'Healy, Miss. Hanora "Nora"',
     'Andrews, Miss. Kornelia Theodosia',
     'Lindblom, Miss. Augusta Charlotta',
     'Connolly, Miss. Kate',
     'Barber, Miss. Ellen "Nellie"',
     'Haas, Miss. Aloisia',
     'Allison, Miss. Helen Loraine',
     'Kelly, Miss. Anna Katherine "Annie Kate"',
     'Keane, Miss. Nora A',
     'Fleming, Miss. Margaret',
     'Francatelli, Miss. Laura Mabel',
     'Hays, Miss. Margaret Bechstein',
     'Ryerson, Miss. Emily Borie',
     'Nilsson, Miss. Helmina Josefina',
     'Wick, Miss. Mary Natalie',
     'Slayter, Miss. Hilda Mary',
     'Young, Miss. Marie Grice',
     'Hippach, Miss. Jean Gertrude',
     'McCoy, Miss. Agnes',
     'Burns, Miss. Elizabeth Margaret',
     'Fortune, Miss. Alice Elizabeth',
     'Brown, Miss. Amelia "Mildred"',
     'Smith, Miss. Marion Elsie',
     'Bowerman, Miss. Elsie Edith',
     'Funk, Miss. Annie Clemmer',
     'McGovern, Miss. Mary',
     'Mockler, Miss. Helen Mary "Ellie"',
     'Jermyn, Miss. Annie',
     'Palsson, Miss. Stina Viola',
     'Landergren, Miss. Aurora Adelia',
     'Bidois, Miss. Rosalie',
     'Nakid, Miss. Maria ("Mary")',
     'Buss, Miss. Kate',
     'Lehmann, Miss. Bertha',
     'Newell, Miss. Marjorie',
     'Olsson, Miss. Elina',
     'Jussila, Miss. Mari Aina',
     'Oreskovic, Miss. Marija',
     'Lefebre, Miss. Ida',
     'Minahan, Miss. Daisy E',
     'Silven, Miss. Lyyli Karoliina',
     'Phillips, Miss. Kate Florence ("Mrs Kate Louise Phillips Marshall")',
     'Carter, Miss. Lucile Polk',
     'Ford, Miss. Doolina Margaret "Daisy"',
     'Reynaldo, Ms. Encarnacion',
     'Mellinger, Miss. Madeleine Violet',
     'Baclini, Miss. Marie Catherine',
     'Toomey, Miss. Ellen',
     'Baclini, Miss. Helene Barbara',
     'Strandberg, Miss. Ida Sofia',
     'Hirvonen, Miss. Hildur E',
     'Lefebre, Miss. Jeannie',
     'Eustis, Miss. Elizabeth Mussey',
     'Canavan, Miss. Mary',
     'Laitinen, Miss. Kristina Sofia',
     'Maioni, Miss. Roberta',
     'Perreault, Miss. Anne',
     'Ridsdale, Miss. Lucy',
     'Quick, Miss. Phyllis May',
     'Cacic, Miss. Marija',
     'Hart, Miss. Eva Miriam',
     'LeRoy, Miss. Bertha',
     'Frolicher, Miss. Hedwig Margaritha',
     'Crosby, Miss. Harriet R',
     'Andersson, Miss. Ingeborg Constanzia',
     'Andersson, Miss. Sigrid Elisabeth',
     'Ohman, Miss. Velin',
     'Kelly, Miss. Mary',
     'Garside, Miss. Ethel',
     'Christy, Miss. Julie Rachel',
     'Taussig, Miss. Ruth',
     'Bourke, Miss. Mary',
     'Leitch, Miss. Jessie Wills',
     'Shutes, Miss. Elizabeth W',
     'Murphy, Miss. Margaret Jane',
     'Herman, Miss. Alice',
     'Becker, Miss. Marion Louise',
     'Longley, Miss. Gretchen Fiske',
     'Skoog, Miss. Mabel',
     'Davis, Miss. Mary',
     'Skoog, Miss. Margit Elizabeth',
     'Baclini, Miss. Eugenie',
     'Stanley, Miss. Amy Zillah Elsie',
     'Doling, Miss. Elsie',
     'Hegarty, Miss. Hanora "Nora"',
     'Turja, Miss. Anna Sofia',
     'Peters, Miss. Katie',
     'Madill, Miss. Georgette Alexandra',
     'Karun, Miss. Manca',
     'Mullens, Miss. Katherine "Katie"',
     'Barbara, Miss. Saiide',
     'Cleaver, Miss. Alice',
     'Endres, Miss. Caroline Louise',
     'Troutt, Miss. Edwina Celia "Winnie"',
     'Harper, Miss. Annie Jessie "Nina"',
     'Mannion, Miss. Margareth',
     'Ilmakangas, Miss. Pieta Sofia',
     'Allen, Miss. Elisabeth Walton',
     'Ryerson, Miss. Susan Parker "Suzette"',
     'Sinkkonen, Miss. Anna',
     'Wells, Miss. Joan',
     'Mangan, Miss. Mary',
     'Emanuel, Miss. Virginia Ethel',
     'Ayoub, Miss. Banoura',
     'Sjoblom, Miss. Anna Sofia',
     'Sage, Miss. Stella Anna',
     'Pettersson, Miss. Ellen Natalia',
     'Andersson, Miss. Ebba Iris Alfrida',
     'Heininen, Miss. Wendla Maria',
     'Compton, Miss. Sara Rebecca',
     'Serepeca, Miss. Augusta',
     'Boulos, Miss. Nourelain',
     'Lines, Miss. Mary Conover',
     'Sage, Miss. Dorothy Edith "Dolly"',
     'Najib, Miss. Adele Kiamie "Jane"',
     'Dahlberg, Miss. Gerda Ulrika',
     'Graham, Miss. Margaret Edith',
     'Johnston, Miss. Catherine Helen "Carrie"']




```python

```
