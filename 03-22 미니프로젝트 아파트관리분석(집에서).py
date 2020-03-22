#!/usr/bin/env python
# coding: utf-8

# In[1]:



import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
get_ipython().run_line_magic('matplotlib', 'inline')


# In[2]:


month=['01','02','03','04','05','06','07','08','09','10','11','12']
year=['2015','2016','2017','2018','2019']
pathdate=[]
for i in year:
    for j in month:
        pathdate.append(i+j)


# In[3]:


pathdate # 201501~201912


# In[4]:


path0="C:/Users/ilike/관리비데이터/"
path2=" 가양도시개발공사8단지(임대).xls"

pathlist=[]
for i in range(len(pathdate)):
    pathlist.append(path0+pathdate[i]+path2)


# In[5]:


pathlist #C:/Users/ilike/관리비데이터/201501 가양도시개발공사8단지(임대).xls...


# In[6]:


AptManagement=pd.read_excel("C:/Users/ilike/관리비데이터/아파트 관리비 샘플.xls",header=1)


# In[7]:


datafile=[]
for i in range(len(pathlist)):
    datafile.append(pd.read_excel(pathlist[i],header=1))


# In[8]:


datafile[0].columns


# In[9]:


date_file=list(zip(pathdate,datafile))  # 날짜-데이터 합치기


# In[10]:


date_file[0]  # 201501의 데이터(=[(날짜),(데이터)])


# In[10]:


date_file[0][1]['분류']


# In[ ]:


pathdate # ['201501','201502', '201503' ...


# In[12]:


dateint=date_file[0][1]['우리단지총액'][1:].astype(int)
CommonMngmt=dateint[1]
GeneralMngmt=dateint[2]
Cleaningfee=dateint[34]
Securityfee=dateint[35]
Disinfectionfee=dateint[36]
liftfee=dateint[37]
HomeNetwork=dateint[38]
Repairfee=dateint[39]
Consignment=dateint[44]
Heatingcost=dateint[47]
Hotwater=dateint[50]
Gasfee=dateint[53]
Electricity=dateint[56]
Waterfee=dateint[69]


# In[13]:


Waterfee


# In[14]:


label=[CommonMngmt,GeneralMngmt,
       Cleaningfee,Securityfee,
       Disinfectionfee,liftfee,
       HomeNetwork,Repairfee,
      Consignment,Heatingcost,Hotwater,
      Gasfee,Electricity,Waterfee]
CommonMngmetCategory=[GeneralMngmt,Cleaningfee,
                     Securityfee,Disinfectionfee,
                     liftfee,HomeNetwork,Repairfee]


# In[15]:


date_file[0][1].isnull().sum()


# In[16]:


sumcheck_data=date_file[0][1]['유사단지군 평균'][date_file[0][1]['유사단지군 평균'].notnull()]


# In[17]:


sumcheck_data


# In[20]:


plt.title('ratio of CommonMngmt')
plt.xlabel('Category',fontsize=18)
plt.ylabel('Ammount',fontsize=18)
plt.xticks(fontsize=12,rotation=90)
plt.bar(CommonMngmetCategory_str,CommonMngmetCategory,
        alpha=0.8,width=0.5,
        align='edge')


# In[21]:


CommonMngmetCategory=[GeneralMngmt,Cleaningfee,
                     Securityfee,Disinfectionfee,
                     liftfee,HomeNetwork,Repairfee]
CommonMngmetCategory_str=['GeneralMngmt',
       'Cleaningfee','Securityfee',
       'Disinfectionfee','liftfee',
       'HomeNetwork','Repairfee']

plt.xlabel('CommonManagement ratio',fontsize=18)
plt.xticks(fontsize=12,rotation=90)
plt.pie(CommonMngmetCategory,
       labels=CommonMngmetCategory_str,
       autopct='%1.1f%%')


# In[22]:


def PieCommonMngmt(date):
    date=int(date)
    for i in range(len(date_file)):
        if int(date_file[i][0])==date:
            tempint=date_file[i][1]['우리단지총액'][1:].astype(int)
            CommonMngmt=tempint[1]
            GeneralMngmt=tempint[2]
            Cleaningfee=tempint[34]
            Securityfee=tempint[35]
            Disinfectionfee=tempint[36]
            liftfee=tempint[37]
            HomeNetwork=tempint[38]
            Repairfee=tempint[39]
            Consignment=tempint[44]
            title=str(date)+' '+'CommonManagement ratio'
            plt.title(title,fontsize=20)
            plt.xticks(fontsize=12,rotation=90)
            plt.pie(CommonMngmetCategory,
                    labels=CommonMngmetCategory_str,
                    autopct='%1.1f%%')
            plt.show()
        else:
            pass
PieCommonMngmt(201504)


# In[23]:


date_file


# In[25]:


for i in range(len(date_file)):
    


# In[68]:


test_df=pd.DataFrame([date_file[0][1]['우리단지총액'][4]],index=[date_file[0][0]])
test_df1=pd.DataFrame([date_file[1][1]['우리단지총액'][4]],index=[date_file[1][0]])
test_df2=pd.DataFrame([date_file[2][1]['우리단지총액'][4]],index=[date_file[2][0]])

test_df3=test_df.append(test_df1)
test_df3=test_df.append(test_df2)

test_df3.columns=["급여"]
test_df3


# In[71]:


test_df=pd.DataFrame([date_file[0][1]['우리단지총액'][2]],
                         index=[date_file[0][0]],columns=['일반관리비'])
test_df


# In[57]:


test_df=pd.DataFrame([date_file[0][1]['우리단지총액'][2]],
                         index=[date_file[0][0]]) # 201501 일반관리비만 DataFrame으로
test_df


# In[82]:


test_df=pd.DataFrame([date_file[0][1]['우리단지총액'][2]],
                         index=[date_file[0][0]],columns=['일반관리비']) # 201501 일반관리비만 DataFrame으로
for i in range(len(date_file)-1):
    append_temp=pd.DataFrame([date_file[i+1][1]['우리단지총액'][2]],
                           index=[date_file[i+1][0]],columns=['일반관리비'])
    test_df=test_df.append(append_temp)


# In[84]:


GeneralMngmt_df=test_df


# In[98]:


Category=date_file[0][1]['분류'][1:]
Category.head()


# In[181]:


General_df=pd.DataFrame([date_file[0][1]['우리단지총액'][2]],
                         index=[date_file[0][0]],columns=['General']) # 201501 일반관리비만 DataFrame으로
for i in range(len(date_file)-1):
    append_temp=pd.DataFrame([date_file[i+1][1]['우리단지총액'][2]],
                           index=[date_file[i+1][0]],columns=['General'])
    General_df=General_df.append(append_temp)
General_df.head(2)


# In[182]:


Cleaning_df=pd.DataFrame([date_file[0][1]['우리단지총액'][33]],
                         index=[date_file[0][0]],columns=['Cleaning']) # 201501 일반관리비만 DataFrame으로
for i in range(len(date_file)-1):
    append_temp=pd.DataFrame([date_file[i+1][1]['우리단지총액'][33]],
                           index=[date_file[i+1][0]],columns=['Cleaning'])
    Cleaning_df=Cleaning_df.append(append_temp)
Cleaning_df.head(2)


# In[161]:


Security_df=pd.DataFrame([date_file[0][1]['우리단지총액'][34]],
                         index=[date_file[0][0]],columns=['Security']) 
for i in range(len(date_file)-1):
    append_temp=pd.DataFrame([date_file[i+1][1]['우리단지총액'][34]],
                           index=[date_file[i+1][0]],columns=['Security'])
    Security_df=Security_df.append(append_temp)
Security_df.head(2)


# In[162]:


Disinfection_df=pd.DataFrame([date_file[0][1]['우리단지총액'][35]],
                         index=[date_file[0][0]],columns=['Disinfection']) 
for i in range(len(date_file)-1):
    append_temp=pd.DataFrame([date_file[i+1][1]['우리단지총액'][35]],
                           index=[date_file[i+1][0]],columns=['Disinfection'])
    Disinfection_df=Disinfection_df.append(append_temp)
Disinfection_df.head(2)


# In[164]:


lift_df=pd.DataFrame([date_file[0][1]['우리단지총액'][36]],
                         index=[date_file[0][0]],columns=['lift']) 
for i in range(len(date_file)-1):
    append_temp=pd.DataFrame([date_file[i+1][1]['우리단지총액'][36]],
                           index=[date_file[i+1][0]],columns=['lift'])
    lift_df=lift_df.append(append_temp)
lift_df.head(2)


# In[165]:


HomeNetwork_df=pd.DataFrame([date_file[0][1]['우리단지총액'][37]],
                         index=[date_file[0][0]],columns=['HomeNetwork']) 
for i in range(len(date_file)-1):
    append_temp=pd.DataFrame([date_file[i+1][1]['우리단지총액'][37]],
                           index=[date_file[i+1][0]],columns=['HomeNetwork'])
    HomeNetwork_df=HomeNetwork_df.append(append_temp)
HomeNetwork_df.head(2)


# In[166]:


Repaircost_df=pd.DataFrame([date_file[0][1]['우리단지총액'][38]],
                         index=[date_file[0][0]],columns=['Repaircost']) 
for i in range(len(date_file)-1):
    append_temp=pd.DataFrame([date_file[i+1][1]['우리단지총액'][38]],
                           index=[date_file[i+1][0]],columns=['Repaircost'])
    Repaircost_df=Repaircost_df.append(append_temp)
Repaircost_df.head(2)


# In[173]:


Consignment_df=pd.DataFrame([date_file[0][1]['우리단지총액'][43]],
                         index=[date_file[0][0]],columns=['Consignment']) 
for i in range(len(date_file)-1):
    append_temp=pd.DataFrame([date_file[i+1][1]['우리단지총액'][43]],
                           index=[date_file[i+1][0]],columns=['Consignment'])
    Consignment_df=Consignment_df.append(append_temp)
Consignment_df.head(2)


# In[175]:


HeatPublic_df=pd.DataFrame([date_file[0][1]['우리단지총액'][46]],
                         index=[date_file[0][0]],columns=['HeatPublic']) 
for i in range(len(date_file)-1):
    append_temp=pd.DataFrame([date_file[i+1][1]['우리단지총액'][46]],
                           index=[date_file[i+1][0]],columns=['HeatPublic'])
    HeatPublic_df=HeatPublic_df.append(append_temp)
HeatPublic_df.tail(7)


# In[177]:


Hotwater_df=pd.DataFrame([date_file[0][1]['우리단지총액'][46]],
                         index=[date_file[0][0]],columns=['Hotwater']) 
for i in range(len(date_file)-1):
    append_temp=pd.DataFrame([date_file[i+1][1]['우리단지총액'][46]],
                           index=[date_file[i+1][0]],columns=['Hotwater'])
    Hotwater_df=Hotwater_df.append(append_temp)
Hotwater_df.tail(7)


# In[178]:


Gasfee_df=pd.DataFrame([date_file[0][1]['우리단지총액'][46]],
                         index=[date_file[0][0]],columns=['Gasfee']) 
for i in range(len(date_file)-1):
    append_temp=pd.DataFrame([date_file[i+1][1]['우리단지총액'][46]],
                           index=[date_file[i+1][0]],columns=['Gasfee'])
    Gasfee_df=Gasfee_df.append(append_temp)
Gasfee_df.tail(7)


# In[179]:


Electricty_df=pd.DataFrame([date_file[0][1]['우리단지총액'][46]],
                         index=[date_file[0][0]],columns=['Electricty']) 
for i in range(len(date_file)-1):
    append_temp=pd.DataFrame([date_file[i+1][1]['우리단지총액'][46]],
                           index=[date_file[i+1][0]],columns=['Electricty'])
    Electricty_df=Electricty_df.append(append_temp)
Electricty_df.tail(7)


# In[180]:


Waterfee_df=pd.DataFrame([date_file[0][1]['우리단지총액'][46]],
                         index=[date_file[0][0]],columns=['Waterfee']) 
for i in range(len(date_file)-1):
    append_temp=pd.DataFrame([date_file[i+1][1]['우리단지총액'][46]],
                           index=[date_file[i+1][0]],columns=['Waterfee'])
    Waterfee_df=Waterfee_df.append(append_temp)
Waterfee_df.tail(7)


# In[183]:


df_list=[General_df,
Cleaning_df,
Security_df,
Disinfection_df,
lift_df,
HomeNetwork_df,
Repaircost_df,
Consignment_df,
HeatPublic_df,
Hotwater_df,
Gasfee_df,
Electricty_df,
Waterfee_df]


# In[198]:


Entire_df=df_list[0]
for i in range(len(df_list)-1):
    Entire_df=testdf.merge(df_list[i+1],left_index=True,right_index=True)


# In[201]:





# In[ ]:





# In[ ]:




