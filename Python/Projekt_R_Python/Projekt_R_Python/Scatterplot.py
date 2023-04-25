import matplotlib.pyplot as plt
import numpy as np
from scipy import stats
import pandas as pd
import seaborn as sns
from datetime import datetime
import Plottings
import Export

def get_scatterplot_summary(table):

    plt.figure(figsize=[8,5],)

    plotTitle = Plottings.getTitle(table)
    
    table = table.convert_dtypes()
    
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
    plt.title(plotTitle)
    plt.plot(x,mymodel)
    export_path = Export.getExportPath() + 'scatterplot.pdf'
    plt.savefig(export_path)
    #plt.savefig('scatterplot.pdf')
    plt.show()

    return plt
    

