Project Name: Sales Analysis for Staten Island

Created By  : Thangam Sankar, Preeti Swaminathan, Ekaterina Pirogova

Created Date: 2/24/2017

The purpose of this project is to process sales file for Staten Island. It does the following:

1. Clean up of sales file to keep only actual sales. In this process, remove impossible sale data, such as those with sale price <= $5. Those would mostly be outliers.
2. Visualization of sales price to gross sruare footage of buildings and ratio of price to gross square footage

The project is organized into the following directories:
- Data directory    : contains files to load in and clean up data. Subdirectory of                       analysis directory
- Analysis directory: contains files for exploratory data analysis and codebook                         for data cleaning
- Paper directory   : contains files with explanations on the data patterns 

Following is the sessionInfo when the project was created:

```r
sessionInfo()
```

```
## R version 3.3.2 (2016-10-31)
## Platform: x86_64-w64-mingw32/x64 (64-bit)
## Running under: Windows 7 x64 (build 7601) Service Pack 1
## 
## locale:
## [1] LC_COLLATE=Russian_Russia.1251  LC_CTYPE=Russian_Russia.1251   
## [3] LC_MONETARY=Russian_Russia.1251 LC_NUMERIC=C                   
## [5] LC_TIME=Russian_Russia.1251    
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## loaded via a namespace (and not attached):
##  [1] backports_1.0.5 magrittr_1.5    rprojroot_1.2   tools_3.3.2    
##  [5] htmltools_0.3.5 yaml_2.1.14     Rcpp_0.12.9     stringi_1.1.2  
##  [9] rmarkdown_1.3   knitr_1.15.1    stringr_1.2.0   digest_0.6.12  
## [13] evaluate_0.10
```
