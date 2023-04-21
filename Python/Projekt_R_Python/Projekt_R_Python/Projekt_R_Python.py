import Import_CSV
import Cleanup
import Calculate_CT
import Boxplot
import Export
import pandas as pd
import Scatterplot


teamname = "Program"


# Load DATA from csv
IssuesDT = Import_CSV.importIssueTimes(teamname)
CfdDT = Import_CSV.importCfd(teamname)

#Clean RAW DATA
CleandDT = Cleanup.cleanRAWTable(IssuesDT)


# get CT
CalcDT = Calculate_CT.calculate_CT(CleandDT)

#Boxplot.boxplot_test(CalcDT)

#Boxplot.boxplot_test2()

#Export.exportCSV(CalcDT, "calcdt")

Scatterplot.scatterplot_test(CalcDT)



    



