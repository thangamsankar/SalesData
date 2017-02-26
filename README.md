Project Name: Sales Analysis for Staten Island

Created By  : Thangam Sankar, Preeti Swaminathan, Ekaterina Pirogova

Created Date: 2/24/2017

The purpose of this project is to process sales file for Staten Island. It does the following:

1. Clean up of sales file to keep only actual sales. In this process, remove impossible sale data, such as those with sale price <= $5. Those would mostly be outliers.
2. Scatter plot of 1, 2 and 3 family homes priced less than 100000
3. 5 number summary of 1, 2 and 3 family homes priced less than 100000
4. Scatter plot of the sales data after outliers are removed.

The project is organized into the following directories:
- Data directory    : contains files to load in and clean up data
- Analysis directory: contains files for exploratory data analysis
- Paper directory   : contains files with explanations on the data patterns 

Following is the sessionInfo when the project was created:
R version 3.3.2 (2016-10-31)
Platform: i386-w64-mingw32/i386 (32-bit)
Running under: Windows 7 x64 (build 7601) Service Pack 1

locale:
[1] LC_COLLATE=English_United States.1252 
[2] LC_CTYPE=English_United States.1252   
[3] LC_MONETARY=English_United States.1252
[4] LC_NUMERIC=C                          
[5] LC_TIME=English_United States.1252    

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base 
