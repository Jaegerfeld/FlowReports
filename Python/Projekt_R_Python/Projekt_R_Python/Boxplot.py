
# import pandas as pd 
# df = pd.read_csv(r'C:\Users\khn\OneDrive - P3 group GmbH\Python\Projekt_R_To_Python\CSV\CSV - Kopie\Accounts_IssueTimes.csv') 
# print(df)



# BOXPLOTT NR.1

import numpy as np
import matplotlib.pyplot as plt



def boxplot_test(table):
    

    #x=[0,1,2,3,5,8,13,21,34,55,89,144,233]
    x=table['CycleDays']
    #y=[0,5,10,20,40,80,160,320]

    #y=table['Created Date']

    plt.boxplot(x, vert = False)
    plt.title('Test_Boxplot Nr.1')



    plt.show()

def boxplot_test2():

    np.random.seed(100)

    data_a = np.random.randint(2,15, size=15)
    data_b = np.random.randint(5,18, size=20)
    data_c = np.random.randint(2,20, size=30)
    data_d = np.random.randint(1,30, size=40)

    data_2d=[data_a,data_b,data_c,data_d]

    plt.boxplot(data_2d)
    plt.title('Boxplot Nr.2')
    plt.show()










