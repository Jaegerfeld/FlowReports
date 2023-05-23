
def calculate_CT(table):


    df = table.copy()
   # df['CycleDays'] = round(((df.loc[:,['In Analysis','Backlog',"In Implementation", "Blocker"]].sum(axis=1))/1440),2)
    df['CycleDays'] = round(((df.loc[:,['In Specification','Open',"In Progress","In Review", "Pending"]].sum(axis=1))/1440),2)
    
    return df


    print(df)

   