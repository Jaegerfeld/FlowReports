
# import pandas as pd 
# df = pd.read_csv(r'C:\Users\khn\OneDrive - P3 group GmbH\Python\Projekt_R_To_Python\CSV\CSV - Kopie\Accounts_IssueTimes.csv') 
# print(df)



# BOXPLOTT NR.1

from re import L
from turtle import color
import numpy as np
import matplotlib.pyplot as plt
#import matplotlib.axes as ax
import Export
import Plottings




def get_boxplot_summary(table):
    

    
    x = table['CycleDays']
    
    #y=table['Created Date']
    plotTitle = Plottings.getTitle(table)
    plt.figure(figsize=[18,9])
    plt.boxplot(x, vert = False, patch_artist = True, 
                boxprops = dict(facecolor = 'orange'),
                medianprops = dict(color = 'black'),
                flierprops = dict(markerfacecolor="r", markersize=3))

    ax = plt.gca()
    ax.set_yticks([])

    plt.title(plotTitle)
    plt.grid(True)
    #ax = plt.axes()
    #ax.xaxis.grid(True)
    export_path = Export.getExportPath() + 'boxplot.pdf'
    plt.savefig(export_path)
    #plt.show()

    return plt



def get_boxplot_Stages(table):


    x = table['CycleDays']
    
    #y=table['Created Date']
    plotTitle = "STAGES"
    plt.figure(figsize=[18,9])
    plt.boxplot(x, vert = False, patch_artist = True, 
                boxprops = dict(facecolor = 'orange'),
                medianprops = dict(color = 'black'),
                flierprops = dict(markerfacecolor="r", markersize=3))
    plt.title(plotTitle)

    ax = plt.gca()
    ax.set_yticks([])





