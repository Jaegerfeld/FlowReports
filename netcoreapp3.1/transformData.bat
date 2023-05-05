echo on

echo csv Generierung aus .json


REM ============ FR ============================

Rem AP
IssueColl.exe "\DATA\Auswertung_AP.json" Export\csv\AP "\workflow\workflow_fg.txt"
copy Export\csv\AP_IssueTimes.csv H:\Repositorys\Github\FlowReports\Python\Projekt_R_Python\Projekt_R_Python\CSV\AP_IssueTimes.csv


Rem Team: 

IssueColl.exe "\DATA\Auswertung_AP.json" Export\csv\AP "\workflow\workflow_fg.txt"
copy Export\csv\AP_IssueTimes.csv H:\Repositorys\Github\FlowReports\Python\Projekt_R_Python\Projekt_R_Python\CSV\AP_IssueTimes.csv