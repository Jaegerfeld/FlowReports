import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import Export
import Plottings




def get_scatterPlot_summary(table):
    

    plt.figure(figsize=[40,25])

    table['Closed Date'] = pd.to_datetime(table['Closed Date'], format = '%d.%m.%Y %H:%M')

    y = table['CycleDays']    
    x = table['Closed Date']

    perc50 = round(table['CycleDays'].quantile(.50),2)
    perc85 = round(table['CycleDays'].quantile(.85),2)
    perc95 = round(table['CycleDays'].quantile(.95),2)

    #create relplot


    #sns.set(rc={'figure.figsize':(40,25)})
    plotTitle = Plottings.getTitle(table)


    sns.relplot(x=x, y=y, height=4.5, aspect=25.5/8.27)
    #add vertical line to scatterplot
    plt.axhline(y=perc50, color='r', linestyle='--')
    plt.axhline(y=perc85, color='g', linestyle='--',linewidth=0.5)
    plt.axhline(y=perc95, color='b', linestyle='--')
    export_path = Export.getExportPath() + 'scatter.pdf'
    
    plt.savefig(export_path)


def function2(table):
    
    table['Closed Date'] = pd.to_datetime(table['Closed Date'], format = '%d.%m.%Y %H:%M')

    y = table['CycleDays']    
    x = table['Closed Date']
    
    
    # plot
    sns.set_style('ticks')
    fig, ax = plt.subplots()
    # the size of A4 paper
    sns.relplot(x=x, y=y, height=4.5, aspect=25.5/8.27)
    #sns.violinplot(data=d, inner="points", ax=ax)    
    sns.despine()

    fig.savefig('example.png')