
def calculate_CT(df):

    df['CycleDays'] = round(((df.loc[:,['In Analysis','Backlog',"In Implementation", "Blocker"]].sum(axis=1))/1440),2)
    return df

    #print(df)

    from pathlib import Path  
    filepath = Path('folder/subfolder/out.csv')  
    filepath.parent.mkdir(parents=True, exist_ok=True)  
    df.to_csv(filepath)  