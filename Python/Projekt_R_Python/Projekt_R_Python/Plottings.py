


def getTitle(table):

    daysStddev = round(table['CycleDays'].std(),2)
    daysMedian = round(table['CycleDays'].median(),2)
    daysAvg = round(table['CycleDays'].mean(),2)
    daysQ1 = round(table['CycleDays'].quantile(.25),2)
    daysQ3 = round(table['CycleDays'].quantile(.75),2)
    daysMax = round(table['CycleDays'].max(),2)
    daysMin = round(table['CycleDays'].min(),2)
    # deprecated daysMad = 0.000 #round(table['CycleDays'].mad(),2)
    itemsCount = len(table)


    plotTitle = "Cycle Time\n [ Min: " + str(daysMin) + " ] [ Q1: " + str(daysQ1)+ " ] [ Mean: " + str(daysAvg) + " ] [ Median: " + str(daysMedian) + " ] [ Q3: " + str(daysQ3) + " ] [ Max: " + str(daysMax)+  " ] \n [Items: " + str(itemsCount) + " ] [ StdDev: " + str(daysStddev) + " ]"
   #[ MAD: " + str(daysMad) +" ]"

    return plotTitle

