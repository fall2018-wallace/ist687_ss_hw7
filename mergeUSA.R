
library("ggmap")
library("ggplot2")
#A) Create a merged dataframe -- with the attributes from both dataset
arrests <- USArrests

arrests

df1<-df

arrests$Statename <- rownames(arrests)

arrests

merge_df <- merge(arrests,df,by="Statename")

merge_df

area<- state.area
center<-state.center
area
center
merge_df<-data.frame(merge_df$Statename, area, center)
merge_df

