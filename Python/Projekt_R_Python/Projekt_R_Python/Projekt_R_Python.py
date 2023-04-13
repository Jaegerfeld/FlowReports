import Import_CSV
import Calculate_CT
import Boxplot
import Export


teamname = "Program"


# Load DATA from csv
IssuesDT = Import_CSV.importIssueTimes(teamname)
CfdDT = Import_CSV.importCfd(teamname)


# get CT
CalcDT = Calculate_CT.calculate_CT(IssuesDT)

Boxplot.boxplot_test(CalcDT)

Boxplot.boxplot_test2()

Export.exportCSV(CalcDT, "calcdt")



    



