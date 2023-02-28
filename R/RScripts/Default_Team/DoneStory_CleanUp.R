DoneStorys_DT <- DoneIssues_DT

DoneStorys_DT <- DoneStorys_DT[grep("^Story$", DoneStorys_DT$Issuetype),]
# remove alles mit Resolution ungleich EMPTY oder Done => Duplicate, abbrecher etc rauswerfen
DoneStorys_DT = filter(DoneStorys_DT,DoneStorys_DT$Resolution != "Duplicate" & DoneStorys_DT$Resolution != "Declined" & DoneStorys_DT$Resolution != "Won't Do" & DoneStorys_DT$Resolution != "Not Required" |is.na(DoneStorys_DT$Resolution))
