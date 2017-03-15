# 4. GDP value for all the countries and color plots by income group
ggplot(Merge_GDP_EDU_Sort, aes(y=GDP_Amount, x = Income.Group)) + scale_y_log10()+ geom_point(pch = 21, size = 6, fill = I("chocolate4"))
# 5. Provide summary statistics of GDP by income groups  

brk <- quantile(Merge_GDP_EDU_Sort$Ranking, seq(0, 1, 0.2))
Merge_GDP_EDU_Quantile <- cut(Merge_GDP_EDU_Sort$Ranking, breaks = brk)
GDP_EDU_table <- table(Merge_GDP_EDU_Sort$Income.Group, Merge_GDP_EDU_Quantile)
colnames(GDP_EDU_table) <- c("Quantile1", "Quantile2", "Quantile3", "Quantile4", "Quantile5")

