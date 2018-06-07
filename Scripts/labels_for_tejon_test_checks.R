library(tidyverse)

#Import dataset and label info
tejon_checks <- read_csv("C:/Users/apdwwolfson/Desktop/tejon_checks.csv")
Level1_labels <- read_csv("C:/Users/apdwwolfson/Desktop/Level1_labels.csv")
Level2_labels <- read_csv("C:/Users/apdwwolfson/Desktop/Level2_labels.csv")

colnames(Level1_labels)[1]<-'CommonName'
colnames(Level2_labels)[1]<-'CommonName'
Level1_labels$CommonName<-recode(Level1_labels$CommonName, "Cow"="Cattle")
Level1_labels$CommonName<-recode(Level1_labels$CommonName, "Skunk"="Striped_Skunk")
Level1_labels$CommonName<-recode(Level1_labels$CommonName, "Truck"="Vehicle_Truck_ATV")
tejon_checks$CommonName<-recode(tejon_checks$CommonName, "Gray_Squirrel"="Squirrel")
tejon_checks$CommonName<-recode(tejon_checks$CommonName, "CA_Ground_Squirrel"="Squirrel")
tejon_checks$CommonName<-recode(tejon_checks$CommonName, "Camera_Research_Team"="Human")
tejon_checks$CommonName<-recode(tejon_checks$CommonName, "Gray_Fox"="Fox")
tejon_checks$CommonName<-recode(tejon_checks$CommonName, "Coyote"="Dog")
tejon_checks$CommonName<-recode(tejon_checks$CommonName, "Deer"="Unidentfied Deer")

Level1_labels$CommonName<-recode(Level1_labels$CommonName, "Wild Pig"="Wild_pig")
Level1_labels$CommonName<-recode(Level1_labels$CommonName, "Mountain Lion"="Mountain_Lion")
Level1_labels$CommonName<-recode(Level1_labels$CommonName, "Black Bear"="Black_Bear")

df<-left_join(tejon_checks, Level1_labels)
colnames(df)[9]<-'Level_1_label'


table(df$Level_1_label)
apply(is.na(df),2,sum)






write.csv(df, "C:/Users/apdwwolfson/Desktop/tejon_checks_with_level1_labels.csv")
write.csv(Level1_labels, "C:/Users/apdwwolfson/Desktop/level1_labels.csv")
