library(data.table)
library(ggplot2)
library(gganimate)
library(lubridate)

fread("/home/pawan/pawan-temp/US_Imports_of_Crude_Oil_Weekly.csv")->t
colnames(t)<-c("Weeks","Value")
as.numeric(t$Value)->t$Value
as.Date(t$Weeks,format="%m/%d/%Y")->t$Weeks

ggplot(t,aes(x=Weeks,y=Value))->p
p+geom_line()+geom_point()->p
p+theme_linedraw()->p
p+transition_reveal(Weeks)->p
p

anim_save("us-weekly-crude-oil-import.gif")
