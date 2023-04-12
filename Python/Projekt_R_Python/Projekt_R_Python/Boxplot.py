
# import pandas as pd 
# df = pd.read_csv(r'C:\Users\khn\OneDrive - P3 group GmbH\Python\Projekt_R_To_Python\CSV\CSV - Kopie\Accounts_IssueTimes.csv') 
# print(df)



# BOXPLOTT NR.1

import matplotlib.pyplot as plt

def boxplot_test():

    x=[0,1,2,3,5,8,13,21,34,55,89,144,233]
    #y=[0,5,10,20,40,80,160,320]

    plt.boxplot(x)
    plt.title('Test_Boxplot Nr.1')
    plt.show(
        )



