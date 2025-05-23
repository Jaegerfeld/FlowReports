
# Data Table um unnötigen Content bereinigen, e.g. Überschriften, Trenner, Gliederungspunkte
#?berschriften aus Structure entfernen (Status Gruppen etc.), haben NIE Status, issues haben IMMER einen Status
Features_DT <- Features_DT[!(is.na(Features_DT$Status)),]

# werfe alle nicht fertigen raus => nur noch mit closed date
Features_DT <- Features_DT[!(is.na(Features_DT$`Closed Date`)),]



#Features_DT <- Features_DT[grep("Done", Features_DT$Resolution),]
# remove alles mit Resolution ungleich EMPTY oder Done => Duplicate, Abbrecher etc rauswerfen
Features_DT = filter(Features_DT,Features_DT$Resolution != "Duplicate" 
                     & Features_DT$Resolution != "Declined" 
                     & Features_DT$Resolution != "Won't Do" 
                     & Features_DT$Resolution != "Not Required" 
                     & Features_DT$Resolution != "Won't Fix" 
                     & Features_DT$Resolution != "Known Error"
                     |is.na(Features_DT$Resolution))
Features_DT = filter(Features_DT,Features_DT$Status != "Canceled" & Features_DT$Status != "Funnel" & Features_DT$Status != "Implementation" & Features_DT$Status != "Backlog" & Features_DT$Status != "In Implementation" & Features_DT$Status != "Rejected")

#### Abgebrochene feature
FeaturesBroken_DT <- Features_ALL_DT
FeaturesBroken_DT <-  filter(FeaturesBroken_DT,FeaturesBroken_DT$Resolution == "Duplicate" 
                     | FeaturesBroken_DT$Resolution == "Declined" 
                     |FeaturesBroken_DT$Resolution == "Won't Do" 
                     |FeaturesBroken_DT$Resolution == "Not Required" 
                     |FeaturesBroken_DT$Resolution == "Won't Fix" 
                     |FeaturesBroken_DT$Resolution == "Known Error")


#Quickfix um bei Wurzel Issues sich selbst als Parent einzutragen 
# -> benötigen wir beim Gruppieren für visualisierungen (welche USer story eines Ft kam wan, reverses GANTT)
# Wird ben?tigt, wenn z.B. US in Features mit verarbeitet werden. Annahme: 1 Feature - n US ; 1 US - 1 Feature
Features_DT$Group <- ifelse(is.na(Features_DT$Group), Features_DT$Key, Features_DT$Group)



# Fehlende Daten ergänzen: Annahme : wir betrachten FERTIGE Feature. d.h. implizit wurden alle wesentlichen Status passiert, wenn auch übersprungen
# Completed Date fehlt? DONE Date verwenden
# InProgress Date fehlt? Created verwenden

Features_DT$`First Date` <- ifelse(is.na(Features_DT$`First Date`),
                                   format(Features_DT$`Created Date`, "%Y-%m-%d %H:%M:%S "),
                                   format(Features_DT$`First Date`, "%Y-%m-%d %H:%M:%S "))

Features_DT <- Features_DT %>% filter( Features_DT$`Closed Date` >= startDate)
Features_DT <- Features_DT %>% filter( Features_DT$`Closed Date` <= endDate)
FeaturesCFD_DT <- FeaturesCFD_DT %>% filter( FeaturesCFD_DT$Day >= startDate)
FeaturesCFD_DT <- FeaturesCFD_DT %>% filter( FeaturesCFD_DT$Day <= endDate)

FeaturesBroken_DT$`Closed Date` <- format(FeaturesBroken_DT$`Closed Date`, "%Y-%m-%d %H:%M:%S ")
FeaturesBroken_DT <- FeaturesBroken_DT %>% filter( FeaturesBroken_DT$`Closed Date` >= startDate)
FeaturesBroken_DT <- FeaturesBroken_DT %>% filter( FeaturesBroken_DT$`Closed Date` <= endDate)