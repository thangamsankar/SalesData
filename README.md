---
output: 
  html_document: 
    highlight: pygments
    theme: readable
---
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
```{r}
sessionInfo()
```