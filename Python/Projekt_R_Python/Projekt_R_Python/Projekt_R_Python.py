import Import_CSV
import Cleanup
import Calculate_CT
import Boxplot
import Plottings
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

title = Plottings.getTitle(CalcDT)


Boxplot.get_boxplot_summary(CalcDT)

#Scatterplot.get_scatterplot_summary(CalcDT)

#Export.exportCSV(CalcDT, "calcdt")



    



