import pandas as pd 
import os

def importIssueTimes(teamname):
    firstpart = os.getcwd()
    path  = firstpart + '/CSV/'  + teamname + "_IssueTimes.csv"
    df = pd.read_csv(path) 
   # print(df)
    return df
   


def importCfd(teamname):
    firstpart = os.getcwd()
    path  = firstpart + '/CSV/'  + teamname +  "_CFD.csv"
    df = pd.read_csv(path) 
    return df




     