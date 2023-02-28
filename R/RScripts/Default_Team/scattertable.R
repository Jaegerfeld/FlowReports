scatterTable_DoneIssues <- calcDoneIssues_DT[, c('Closed Date', 'CycleDays', 'Key')]
scatterTable_DoneStorys <- calcDoneStorys_DT[, c('Closed Date', 'CycleDays', 'Key')]

scatterTable_DoneStorysDev <- calcDoneStorys_DT[, c('Closed Date', 'DevTime', 'Key')]
