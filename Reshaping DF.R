library(devtools)
library(data.table)
library(plyr)
library(dplyr)
library(janitor)
library(tidyverse)
library(readr)
library(lubridate)
library(modelr)
library(anchors)
library(reshape2)
library(tidyr)
library(splitstackshape)
library(reactable)
library(scales)
library(pixiedust)
library(kableExtra)
library(huxtable)
library(DT)
library(forcats)
library(git2rdata)

input_fn        = 'Budget Data Pre-Reshape.csv'
df1             = read.csv(input_fn, header = TRUE)
setorder(df1,"School")

colnames(df1) <- gsub("^X", "",  colnames(df1))

# df1 = subset(df1, select = -c(X))


dim_cols  = c("School")#,"First.Service.Date")

df2       = melt(df1, 
                 id.vars = dim_cols, 
                 variable.name = 'Fiscal Month', 
                 value.name = 'AGR Budget')

setorder(df2,"School","Fiscal Month")
str(df2)




levels(df2$`Fiscal Month`) <- gsub("\\.", "/",  df2$`Fiscal Month`)



# df2$`Fiscal Month` <- as.POSIXct(df2$`Fiscal Month`,format="%H:%M:%S")


df2$`Fiscal Month`<-as.Date(df2$`Fiscal Month`, "%b-%y")
str(df2)


write.csv(df2,"test.csv", row.names = FALSE)
