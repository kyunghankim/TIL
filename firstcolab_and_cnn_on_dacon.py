# -*- coding: utf-8 -*-
"""firstColab and CNN on dacon.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1oBG_LDfarzV3m-SQ6Itml_RXtZBSpdiD
"""

# Commented out IPython magic to ensure Python compatibility.
import pandas as pd
import numpy as np
import os
# %tensorflow_version 1.x
import zipfile
from tqdm import tqdm #<- 작업상황 보기 위해 tqdm import

"""#test1 파일불러오기 test"""

os.chdir('drive/My Drive/Data storage/')

# train data 압축 해제
train_path = './train'
if not os.path.exists(train_path):
  train_zip = zipfile.ZipFile('./train')
  train_zip.extractall(train_path) #<- 압축해제
  train_zip.close() #닫기

# test data 압축 해제
test_path = './test'
if not os.path.exists(test_path):
  test_zip = zipfile.ZipFile('./test')
  test_zip.extractall(test_path) #<- 압축해제
  test_zip.close() #닫기

# train data 분리
if not os.path.exists('./train_images.npy') or not os.path.exists('./train_data.npy'):
  train_images = []
  train_data = []
  train_labels = []
  for fname in tqdm(os.listdir(train_path)):
    data = np.load(train_path + '/' + fname)

    image = data[:, :, :9]
    train_images.append(image.reshape(40, 40, 9).astype('float32'))

    d = data[:,:,9:-1]
    train_data.append(d.reshape(40,40,-1).astype('float32'))

    label = data[:,:,-1]
    label = np.where(label<0,0,label)
    train_labels.append(label.reshape(40,40,1).astype('float32'))
  np.save('./train_images',train_images)
  np.save('./train_data',train_data)
  np.save('./train_labels',train_labels)

"다운받아서 불러오기 함"



os.chdir('drive/My Drive/Data storage/')

"""#test2 데이터 불러오기 경로 바꿔서"""

# 저장된 train 데이터 읽어오기
train_images = np.load('./train_images.npy')
train_data = np.load('./train_data.npy')
train_labels = np.load('./train_labels.npy')

print("train 이미지 shape:\n",train_images.shape,"\n","train 데이터 shape:\n",train_data.shape)

# 저장된 test 데이터 읽어오기
test_images = np.load('./test_images.npy')
test_data = np.load('./test_data.npy')

print("test 이미지 shape:\n",test_images.shape,"\n","train 데이터 shape:\n",test_data.shape)

"""#test3 Tensorflow로 기본/변형 시도"""

import tensorflow as tf

x = tf.placeholder(tf.float32, [None, 40, 40, 9])
y = tf.placeholder(tf.float32, [None, 40, 40, 1])

keep_prop = tf.placeholder(tf.float32)

#layer1
w1 = tf.Variable(tf.random_normal([3,3,9,32],stddev = 0.01))
layer1 = tf.nn.relu(tf.nn.conv2d(x,w1,[1,1,1,1],'SAME'))
layer1 = tf.nn.dropout(tf.nn.max_pool(layer1,[1, 2, 2, 1],[1, 2, 2, 1], 'SAME'),keep_prob=keep_prop)

#layer2
w2 = tf.Variable(tf.random_normal([3,3,32,64],stddev=0.01))
layer2 = tf.nn.relu(tf.nn.conv2d(layer1, w2,[1,1,1,1],'SAME'))
layer2 = tf.nn.dropout(tf.nn.max_pool(layer2,[1,2,2,1],[1,2,2,1],'SAME'),keep_prob=keep_prop)

#layer3
w3 = tf.Variable(tf.random_normal([3,3,64,128], stddev=0.01))
layer3 = tf.nn.relu(tf.nn.conv2d(layer2, w3,[1,1,1,1],'SAME'))
layer3 = tf.nn.dropout(tf.nn.max_pool(layer3,[1,2,2,1],[1,2,2,1],'SAME'),keep_prob=keep_prop)
layer3_flat = tf.reshape(layer3,[-1, 2 * 2 * 128])

#Fully Connected Neural network
w4 = tf.get_variable('w4',[2 * 2 * 128, 10],initializer = tf.contrib.layers.xavier_initializer())
b4 = tf.Variable(tf.random_normal([10]))
hf = tf.matmul(layer3_flat,w4) + b4

#cost opt accuracy
cost = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits_v2(labels = y, logits = hf))

opt = tf.train.AdamOptimizer(0.01).minimize(cost)
accuracy = tf.reduce_mean(tf.cast(tf.equal(tf.argmax(hf,1), tf.argmax(y,1)),dtype = tf.float32))

with tf.Session() as sess:
  sess.run(tf.global_variables_initializer())
  for epoch in range(20):
    avgCost = 0
    for i in range(1000):
      _, costValue, hfValue = sess.run([opt, cost, hf], {x : train_images, y : train_labels, keep_prop : 0.7})
      avgCost += costValue / totalBatch
    print('epoch: {:04d}, cost : {:5f}'.format(epoch+1,avgCost))















"""# score계산하는거"""

from sklearn.metrics import f1_score

def mae(y_true, y_pred) :
    
    y_true, y_pred = np.array(y_true), np.array(y_pred)
    
    y_true = y_true.reshape(1, -1)[0]
    
    y_pred = y_pred.reshape(1, -1)[0]
    
    over_threshold = y_true >= 0.1
    
    return np.mean(np.abs(y_true[over_threshold] - y_pred[over_threshold]))

def fscore(y_true, y_pred):
    
    y_true, y_pred = np.array(y_true), np.array(y_pred)
    
    y_true = y_true.reshape(1, -1)[0]
    
    y_pred = y_pred.reshape(1, -1)[0]
    
    remove_NAs = y_true >= 0
    
    y_true = np.where(y_true[remove_NAs] >= 0.1, 1, 0)
    
    y_pred = np.where(y_pred[remove_NAs] >= 0.1, 1, 0)
    
    return(f1_score(y_true, y_pred))

def maeOverFscore(y_true, y_pred):
    return mae(y_true, y_pred) / (fscore(y_true, y_pred) + 1e-07)

def fscore_keras(y_true, y_pred):
    score = tf.py_function(func=fscore, inp=[y_true, y_pred], Tout=tf.float32, name='fscore_keras')
    return score

def maeOverFscore_keras(y_true, y_pred):
    score = tf.py_function(func=maeOverFscore, inp=[y_true, y_pred], Tout=tf.float32,  name='custom_mse') 
    return score







