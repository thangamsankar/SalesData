#1. Merge
Merge_GDP_EDU <- merge(x=GDP_data, y=EDU_data, by.x="CountryCode", by.y="CountryCode")
# Check for duplicates
Duplicates <- Merge_GDP_EDU[duplicated(Merge_GDP_EDU, incomparables=FALSE, fromLast=FALSE),]
nrow(Duplicates)
dim(Merge_GDP_EDU)
# 2. Sort data
Merge_GDP_EDU_Sort <- arrange(Merge_GDP_EDU, desc(Ranking))
# Since there are multiple countries with same Ranking, assign rank to resolve ties
Merge_GDP_EDU_Sort <- transform(Merge_GDP_EDU, rank = rank(-as.numeric(as.character(Merge_GDP_EDU$Ranking)))) 
# 3. Average GDP rankings
Avg_Rank_OECD <- mean(as.numeric(as.character(Merge_GDP_EDU_Sort$Ranking[Merge_GDP_EDU_Sort$Income.Group == "High income: OECD"])))
Avg_Rank_nonOECD <- mean(as.numeric(as.character(Merge_GDP_EDU_Sort$Ranking[Merge_GDP_EDU_Sort$Income.Group == "High income: nonOECD"]))) 

