
library(ggmap)
library(ggplot2)
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
Statename<-state.name
area<- state.area
center<-state.center
Statename
area
center
merge_df1<-data.frame(Statename, area, center)
merge_df1

new_merge_df<-merge(merge_df,merge_df1,by='Statename')
new_merge_df

#Step B: Generate a color coded map
#3)	Create a color coded map, based on the area of the state 
usa <- map_data("state")
mapArea<-ggplot(new_merge_df, aes(map_id=Statename))+geom_map(map = usa,aes(fill=new_merge_df$area))+expand_limits(x=usa$long,y=usa$lat)+coord_map()

#C
#4)	Repeat step B, but color code the map based on the murder rate of each state.
mapMurder<-ggplot(new_merge_df, aes(map_id=Statename))+geom_map(map = usa,aes(fill=new_merge_df$Murder))+expand_limits(x=usa$long,y=usa$lat)+coord_map()

#5)	 Show the population as a circle per state (the larger the population, the larger the circle), using the location defined by the center of each state
mappop<-mapMurder +geom_point(x=new_merge_df$x,y=new_merge_df$y,aes(size=new_merge_df$POPESTIMATE2017))



#D
#6)	Repeat step C, but only show the states in the north east
#Hint: get the lat and lon of new york city
#Hint: set the xlim and ylim to NYC +/- 10

latlon<-geocode(source = "dsk","nyc,new york,ny")
#lon -74.00597
#lat 40.71427
latlon
mapzoom<-mappop
mapzoom+geom_point(x=new_merge_df$x,y=new_merge_df$y)+coord_fixed(xlim = c(latlon$lon+10,latlon$lon-10),ylim = c(latlon$lat-10,latlon$lat+10))

