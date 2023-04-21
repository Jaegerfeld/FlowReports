import matplotlib.pyplot as plt
import numpy as np
from scipy import stats
import pandas as pd
import seaborn as sns
from datetime import datetime


def scatterplot_test(table):

    plt.figure(figsize=[10,15],)
    
    table = table.convert_dtypes()
    #print(table.iloc[0][10]) # Example 11.10.2022 09:49

    #table['Closed Date Datetime'] = datetime.strptime(table['Closed Date'].values, '%d.%m.%Y %H:%M')
    
    #print(table['Closed Date Datetime'])
    datetime_list = []
    for i in table['Closed Date']:
        datetime_list.append(datetime.strptime(i, '%d.%m.%Y %H:%M'))

    table['Closed Date Datetime'] = datetime_list

    

    timestamp_list = []
    for i in table['Closed Date Datetime']:
        timestamp_list.append(datetime.timestamp(i))

    table['Closed Date Timestamp'] = timestamp_list

    print(table.info())

   

    x = list(table['Closed Date Timestamp']) #Dtype is a string Question is how to change string to float?
    y = list(table['CycleDays']) #Dtype is a flote

    slope, intercept, r, p, std_err = stats.linregress(x,y)

    def myfunc(x):
        return slope * x + intercept

    mymodel = list(map(myfunc,x))

    plt.scatter(x,y)
    plt.plot(x,mymodel)
    plt.show()

    #sns.scatterplot(data= table, x='Closed Date Timestamp' ,y='CycleDays')
   
    #sns.regplot(data= table, x='Closed Date Timestamp' ,y='CycleDays')

    #plt.show()


