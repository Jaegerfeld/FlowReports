
def calculate_CT(df):

    df['CycleDays'] = round(((df.loc[:,['In Analysis','Backlog',"In Implementation", "Blocker"]].sum(axis=1))/1440),2)
    return df


    #print(df)

   