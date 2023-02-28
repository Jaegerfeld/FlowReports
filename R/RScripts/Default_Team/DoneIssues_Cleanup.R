DoneIssues_DT <- ISSUES_DT

DoneIssues_DT <- DoneIssues_DT[!(is.na(DoneIssues_DT$`Closed Date`)),]
DoneIssues_DT <- DoneIssues_DT[-grep("Abgebrochen", DoneIssues_DT$Status),]

# Fehlende Daten erg?nzen: Annahme : wir betrachten FERTIGE Feature. d.h.implizit wurden alle wesentlichen Status passiert, wenn auch ?bersprungen
# Completed Date fehlt? DONE Date verwenden
# InProgress Date fehlt? Created verwenden

DoneIssues_DT$`First Date` <- ifelse(is.na(DoneIssues_DT$`First Date`),
                                     format(DoneIssues_DT$`Created Date`, "%Y-%m-%d %H:%M"),
                                     format(DoneIssues_DT$`First Date`, "%Y-%m-%d %H:%M"))

# Groupierung wichtig für Featuretapete
# -----------------> Auslagern in eigenes Script
DoneIssues_DT$Group <- ifelse(is.na(DoneIssues_DT$Group),
                              DoneIssues_DT$Key, DoneIssues_DT$Group)


