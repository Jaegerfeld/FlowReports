import Export
import numpy as np
import pandas as pd



def cleanRAWTable(table):
    df = table.copy()
    df.applymap(lambda x: x.strip() if isinstance(x, str) else x)
    Export.exportCSV(df,"trim")
    #remove all undone issues
    df["Closed Date"].replace("", np.nan, inplace=True)
    df.dropna(subset=("Closed Date"), inplace=True)
    #df.loc[(df['Status'] != "Won't Do")]
    df = df[(df.Resolution == 'Done ') | (df.Resolution == 'Done ') | (df.Resolution == 'Done ') ]


    
    
    pd.set_option('display.max_rows', None)
    pd.set_option('display.max_columns', None)
    pd.set_option('display.width', None)
    pd.set_option('display.max_colwidth', 15)
<<<<<<< Updated upstream
    print(df)
=======
    #print(df3)
>>>>>>> Stashed changes
   



    Export.exportCSV(table,"table")
    Export.exportCSV(df,"df2")

    
    return df
