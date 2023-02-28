ISSUES_DTold <- ISSUES_DT
#Data Table um unn?tigen Content bereinigen, e.g. ?berschriften, Trenner, Gliederungspunkte
#?berschriften aus Structure entfernen (Status Gruppen etc.), haben NIE Status, issues haben IMMER einen Status
ISSUES_DT <- ISSUES_DT[!(is.na(ISSUES_DT$Status)),]


# Eliminate Isuuetype "Test" and "Test Plan", cause thatis NO WORK (Jira is misuesed by the testsuite here)
ISSUES_DT <- ISSUES_DT[-grep("^Test|Test Plan|Pre-Condition$", ISSUES_DT$Issuetype),]


