# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import pandas as pd

url='https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%ED%99%98%EC%9C%A8%EC%A1%B0%ED%9A%8C'

tables=pd.read_html(url)



tables
Out[4]: 
[    일   월   화   수   목   금   토
 0 NaN NaN NaN NaN NaN NaN NaN,           통화명    매매기준율        전일대비     등락률
 0      미국 USD  1168.50  전일대비상승1.50  +0.13%
 1  일본 JPY 100  1067.42  전일대비상승2.44  +0.23%
 2    유럽연합 EUR  1301.12  전일대비하락0.55  -0.04%
 3      중국 CNY   167.04  전일대비상승0.16  +0.10%
 4      영국 GBP  1531.44  전일대비하락8.77  -0.57%
 5      호주 AUD   800.95  전일대비상승1.67  +0.21%
 6     캐나다 CAD   888.49  전일대비상승2.62  +0.30%
 7    뉴질랜드 NZD   767.53  전일대비상승0.46  +0.06%]

table[1]
Traceback (most recent call last):

  File "<ipython-input-5-e5c8209b45fb>", line 1, in <module>
    table[1]

NameError: name 'table' is not defined


tables[1]
Out[6]: 
          통화명    매매기준율        전일대비     등락률
0      미국 USD  1168.50  전일대비상승1.50  +0.13%
1  일본 JPY 100  1067.42  전일대비상승2.44  +0.23%
2    유럽연합 EUR  1301.12  전일대비하락0.55  -0.04%
3      중국 CNY   167.04  전일대비상승0.16  +0.10%
4      영국 GBP  1531.44  전일대비하락8.77  -0.57%
5      호주 AUD   800.95  전일대비상승1.67  +0.21%
6     캐나다 CAD   888.49  전일대비상승2.62  +0.30%
7    뉴질랜드 NZD   767.53  전일대비상승0.46  +0.06%

df=tables[1]

df.to_excel('exchange rate.xlsx')
