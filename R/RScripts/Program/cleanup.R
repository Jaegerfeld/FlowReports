
# Data Table um unn?tigen Content bereinigen, e.g. ?berschriften, Trenner, Gliederungspunkte
#?berschriften aus Structure entfernen (Status Gruppen etc.), haben NIE Status, issues haben IMMER einen Status
Features_DT <- Features_DT[!(is.na(Features_DT$Status)),]

# werfe alle nicht fertigen raus => nur noch mit closed date
Features_DT <- Features_DT[!(is.na(Features_DT$`Closed Date`)),]



#Features_DT <- Features_DT[grep("Done", Features_DT$Resolution),]
# remove alles mit Resolution ungleich EMPTY oder Done => Duplicate, abbrecher etc rauswerfen
Features_DT = filter(Features_DT,Features_DT$Resolution != "Duplicate" & Features_DT$Resolution != "Declined" & Features_DT$Resolution != "Won't Do" & Features_DT$Resolution != "Not Required" |is.na(Features_DT$Resolution))



#Quickfix um bei Wurzel Issues sich selbst als Parent einzutragen -> ben?tigen wir beim Gruppieren f?r visualisierungen
# Wird ben?tigt, wenn z.B. US in Features mit verarbeitet werden. Annahme: 1 Feature - n US ; 1 US - 1 Feature
Features_DT$Group <- ifelse(is.na(Features_DT$Group), Features_DT$Key, Features_DT$Group)



# Fehlende Daten erg?nzen: Annahme : wir betrachten FERTIGE Feature. d.h. implizit wurden alle wesentlichen Status passiert, wenn auch ?bersprungen
# Completed Date fehlt? DONE Date verwenden
# InProgress Date fehlt? Created verwenden

Features_DT$`First Date` <- ifelse(is.na(Features_DT$`First Date`),
                                        format(Features_DT$`Created Date`, "%Y-%m-%d %H:%M"),
                                               format(Features_DT$`First Date`, "%Y-%m-%d %H:%M"))

#tomorrow <- Sys.Date() +1
#Features_DT$`Closed Date` <- ifelse(is.na(Features_DT$`Closed Date`),
                                            #format(tomorrow, "%Y-%m-%d %H:%M:%S "),
                                               #format(Features_DT$`Closed Date`, "%Y-%m-%d %H:%M:%S "))

# Groupierung wichtig f?r Featuretapete
Features_DT$Group <- ifelse(is.na(Features_DT$Group),
                                        Features_DT$Key, Features_DT$Group)

#Features_DT <- Features_DT %>% filter( Features_DT$`Created Date` >= startDate)
