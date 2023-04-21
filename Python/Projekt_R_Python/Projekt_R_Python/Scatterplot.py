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

    test_string = datetime.strptime('11.10.2022 09:49', '%d.%m.%Y %H:%M')
    
    print(test_string)
    print(type(test_string))

    test_timestamp = datetime.timestamp(test_string)
    print(test_timestamp)

    x = table['Closed Date'] #Dtype is a string Question is how to change string to float?
    y = table['CycleDays'] #Dtype is a flote
   
    #sns.regplot(x = x, y = y, data = table[['Closed Date', 'CycleDays']])

    #plt.show()


