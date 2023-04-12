
def calculate_CT(df):
    result = df["Project"]

   #result2 = df["In Analysis"] + df["Backlog"]
    df['result'] = df.loc[:,['In Analysis','Backlog']].sum(axis=1)

    print(df)


    from pathlib import Path  
    filepath = Path('folder/subfolder/out.csv')  
    filepath.parent.mkdir(parents=True, exist_ok=True)  
    df.to_csv(filepath)  