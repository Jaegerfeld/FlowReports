echo on

echo csv Generierung aus .json


REM ============ FR ============================

Rem AP
IssueColl.exe "\DATA\Program1.json" Export\csv\Program1 "\workflow\workflow_fg.txt"
IssueColl.exe "\DATA\Program2.json" Export\csv\Program2 "\workflow\workflow_fg.txt"
IssueColl.exe "\DATA\Program3.json" Export\csv\Program3 "\workflow\workflow_fg.txt"
IssueColl.exe "\DATA\Program4.json" Export\csv\Program4 "\workflow\workflow_fg.txt"
IssueColl.exe "\DATA\Program5.json" Export\csv\Program5 "\workflow\workflow_fg.txt"

copy Export\CSV\*Program*_I*.csv Export\CSV\Program_Issuetimes.csv




copy Export\csv\Program_IssueTimes.csv H:\Repositorys\Github\FlowReports\Python\Projekt_R_Python\Projekt_R_Python\CSV\Program_IssueTimes.csv
