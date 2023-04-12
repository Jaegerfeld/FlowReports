
def calculate_CT(df):

    df['CycleDays'] = df.loc[:,['In Analysis','Backlog',"In Implementation", "Blocker"]].sum(axis=1)

    print(df)

    from pathlib import Path  
    filepath = Path('folder/subfolder/out.csv')  
    filepath.parent.mkdir(parents=True, exist_ok=True)  
    df.to_csv(filepath)  