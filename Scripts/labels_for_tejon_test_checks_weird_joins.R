library(tidyverse)

#Import dataset and label info
tejon_checks <- read_csv("C:/Users/apdwwolfson/Desktop/tejon_checks.csv")
labels<- read_csv("C:/Users/apdwwolfson/Desktop/corrected_categories.csv")

#two different entries for empty/nothing
labels<-labels[!(labels$Species=="Nothing"&labels$num_images==242522),] #when I didnm't also have the num_images it set other stuff to NA
unique(tejon_checks$CommonName)
unique(labels$L1)
labels<-labels[!is.na(labels$L1),]

labels$L1<-recode(labels$L1, "Cow"="Cattle")
labels$L1<-recode(labels$L1, "Skunk"="Striped_Skunk")
labels$L1<-recode(labels$L1, "Truck"="Vehicle_Truck_ATV")
tejon_checks$CommonName<-recode(tejon_checks$CommonName, "Gray_Squirrel"="Squirrel")
tejon_checks$CommonName<-recode(tejon_checks$CommonName, "CA_Ground_Squirrel"="Squirrel")
tejon_checks$CommonName<-recode(tejon_checks$CommonName, "Camera_Research_Team"="Human")
tejon_checks$CommonName<-recode(tejon_checks$CommonName, "Gray_Fox"="Fox")
tejon_checks$CommonName<-recode(tejon_checks$CommonName, "Coyote"="Dog")
tejon_checks$CommonName<-recode(tejon_checks$CommonName, "Deer"="Unidentfied Deer")
tejon_checks$CommonName<-recode(tejon_checks$CommonName, "None"="Empty")

labels$L1<-recode(labels$L1, "Wild Pig"="Wild_pig")
labels$L1<-recode(labels$L1, "Mountain Lion"="Mountain_Lion")
labels$L1<-recode(labels$L1, "Black Bear"="Black_Bear")

labels<-labels[,c(1, 7:10)]
lab<-labels[,-1]

df<-left_join(tejon_checks, lab, by=c('CommonName'='L1'))

 df<-df[!duplicated(df$FileName),] #removes originals as well as duplicates
df<-distinct(df, FileName) #this gives the same number too though

holes<-which(!tejon_checks$X1%in%df$X1)
# holes<-filter(tejon_checks, !FileName%in%df_names)
# holes<-tejon_checks[!which(tejon_checks$FileName%in%df_names),]

hole.df<-tejon_checks[holes,]

#I'll just manually add those back in there?
holes.join<-left_join(hole.df, labels,by=c('CommonName'='L1'))
holes.join<-holes.join[!duplicated(holes.join$FileName),]

h1<-hole.df$X1
h2<-holes.join$X1
hole.df[!h1%in%h2,]

tejon_checks$FileName
table(tejon_checks$CommonName)
apply(is.na(df),2,sum)
table(df$CommonName)


write.csv(df, "C:/Users/apdwwolfson/Desktop/tejon_checks_with_level1_labels.csv")
write.csv(Level1_labels, "C:/Users/apdwwolfson/Desktop/level1_labels.csv")
