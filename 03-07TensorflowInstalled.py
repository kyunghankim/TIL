#!/usr/bin/env python
# coding: utf-8

# In[1]:


import os
import tensorflow as tf
import pandas as pd
import keras
import numpy as np
#from keras.layers import Embedding
from keras.models import Sequential
from keras.layers import Dense
from keras.layers import LSTM
from sklearn.preprocessing import MinMaxScaler
import matplotlib.pyplot as plt
import math
from sklearn.metrics import mean_squared_error
samsung=pd.read_excel('samsung.xlsx',header = 0)  # 파일 읽기(yahoo데이터)
samsung.columns=['date','open','high','low','close','volume','adj.close'] #열 이름
ss_close=samsung['close']  #종가만 뽑기
type(ss_close)
ss_nparr=ss_close.values[::1] #종가를 np array로


# In[14]:


samsung


# In[17]:


samsung.columns=['date','open','high','low','close','volume','adj.close'] #열 이름


# In[20]:


samsung


# In[21]:


ss_close=samsung['close']  #종가만 뽑기
type(ss_close)


# In[6]:


ss_nparr=ss_close.values[::1] #종가를 np array로
ss_nparr=ss_nparr.astype('float32')
print(ss_nparr)


# In[3]:


look_back=1
def create_dataset(dataset,look_back=1):
    dataX, dataY=[], []
    for i in range(len(dataset)-look_back-1):
        a = dataset[i:(i + look_back)]
        dataX.append(a)
        dataY.append(dataset[i+look_back])
    return np.array(dataX),np.array(dataY)    #데이터셋으로 바꾸기


# In[46]:


new_ssarr=ss_nparr.reshape(-1,1)
new_ssarr  # fit을 위한 reshape
plt.grid(True)
plt.plot(new_ssarr)


# In[9]:


scaler=MinMaxScaler(feature_range=(0,1))
ss_trsf=scaler.fit_transform(new_ssarr)


# In[10]:


train_size=int(len(ss_trsf)*0.9)
test_size=len(ss_trsf) - train_size   #train size, test size (90%사용)


# In[44]:


train, test=ss_trsf[0:train_size], ss_trsf[train_size:len(ss_trsf),:]
print([train,test])   #데이터의 train size, test size만큼 뽑아서 test,train만듬


# In[19]:


trainX , trainY= create_dataset(train, look_back)
testX, testY= create_dataset(test, look_back)
print(trainX)
print("#"*30)
print(trainY)


# In[21]:


trainX=np.reshape(trainX,(trainX.shape[0],1,trainX.shape[1]))
testX=np.reshape(testX,(testX.shape[0],1,testX.shape[1]))
#[sample,feature]에서 [samples,time steps,features]로 바꿈


# In[24]:


# LSTM만들기
model=Sequential()
model.add(LSTM(4,input_shape=(1,look_back)))
model.add(Dense(1))
model.compile(loss='mean_squared_error',optimizer='adam')
model.fit(trainX,trainY,epochs=100,batch_size=1, verbose=2)


# In[27]:


# 예측하기
testPredict=model.predict(testX)
testPredict=scaler.inverse_transform(testPredict)
testY=scaler.inverse_transform(testY)
testScore=math.sqrt(mean_squared_error(testY,testPredict))
print('Train Score: %.2f RMSE' % testScore)


# In[28]:


# 다음날 주가 예측하기
lastX = new_ssarr[-1]
lastX = np.reshape(lastX, (1, 1, 1))
lastY = model.predict(lastX)
lastY = scaler.inverse_transform(lastY)
# 데이터 입력 마지막 다음날 종가 예측
print('마지막날 종가 예측: %d' % lastY)  


# In[35]:


# 시각화~
plt.grid(True)
plt.plot(testY) #파란선
plt.plot(testPredict)
plt.show()


# In[43]:


#예측의 차이값
plt.title("Differece")
plt.grid(True)
#plt.figure(figsize=(100,50))
plt.plot(testPredict-testY)


# In[ ]:





# In[ ]:




