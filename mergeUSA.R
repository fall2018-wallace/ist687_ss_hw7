
library("ggmap")
library("ggplot2")
#Step A: Load and Merge datasets
#1)	Read in the census dataset and the USArrests and merge them 
arrests <- USArrests

arrests

df1<-df

arrests$Statename <- rownames(arrests)

arrests

merge_df <- merge(arrests,df,by="Statename")

merge_df

#2)	Add the area of each state, and the center of each state,
#   to the merged dataframe, using the ‘state.center’, ‘state.center’ 
#   and ‘state.name’ vectors
name<-state.name
area<- state.area
center<-state.center
area
center
merge_df1<-data.frame(merge_df$Statename,name, area, center)
merge_df1

#Step B: Generate a color coded map
#3)	Create a color coded map, based on the area of the state 
usa <- map_data("merge_df1")
ggplot() + geom_polygon(data =merge_df1 , aes(x=long, y = lat, group = group)) + 
  coord_fixed(1.3)

