import pandas as pd 

def importIssueTimes():

    df = pd.read_csv(r'H:\Repositorys\Github\FlowReports\Python\Export\CSV\Program_IssueTimes.csv') 
    return df
    print(df)
