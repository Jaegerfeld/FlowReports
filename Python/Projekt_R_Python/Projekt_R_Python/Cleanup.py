import Export
import numpy as np
import pandas as pd



def cleanRAWTable(table):
    df = table.copy()

    #remove all undone issues
    df["Closed Date"].replace("", np.nan, inplace=True)
    df.dropna(subset=("Closed Date"), inplace=True)
    #df.loc[(df['Status'] != "Won't Do")]
    df3 = df[(df.Resolution == 'Done ')]
    #df4 = df[(df.Res == "Won't Do")]
    df2 = df[df['Done']== 'Done']

    
    
    pd.set_option('display.max_rows', None)
    pd.set_option('display.max_columns', None)
    pd.set_option('display.width', None)
    pd.set_option('display.max_colwidth', 15)
    print(df3)
   



    Export.exportCSV(table,"table")
    Export.exportCSV(df,"df2")

    
    return df
