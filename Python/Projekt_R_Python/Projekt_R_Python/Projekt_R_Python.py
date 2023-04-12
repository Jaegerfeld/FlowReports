import Import_CSV
import Calculate_CT
import Boxplot


teamname = "Program"


# Load DATA from csv
IssuesDT = Import_CSV.importIssueTimes(teamname)
CfdDT = Import_CSV.importCfd(teamname)


# get CT
CalcDT = Calculate_CT.calculate_CT(IssuesDT)

#Boxplot.boxplot_test()

Boxplot.boxplot_test2()




    



