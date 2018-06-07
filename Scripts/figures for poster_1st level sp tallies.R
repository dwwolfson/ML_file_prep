# Create figure for ML poster for Wild Pig Conference
library(tidyverse)
library(forcats)

#import
df<-read_csv("Data/final_labels_with_tallies/labels.csv")

df$num_images<-as.numeric(df$num_images)
df$ID<-as.factor(df$ID)
total<-sum(df$num_images)
#################################################################
#First order species classification

#Drop lynx (Lynx canadensis from first level)
df1<-df[df$ID_category!="x",]

#Capitalize labels
df1$ID_category<-sapply(df1$ID_category, str_to_title)

#Drop rows that don't have first-level label
df1<-df1[!is.na(df1$ID_category),]

total<-sum(df1$num_images)

# Some recoding

#Change 'Birds' to 'Bird'
df1$ID_category<-recode(df1$ID_category, "Birds"="Bird")
df1$ID_category<-recode(df1$ID_category, "Skunk"="Striped Skunk")
df1$ID_category<-recode(df1$ID_category, "Galliformes"="Turkey")
df1$ID_category<-recode(df1$ID_category, "Red Deer"="Elk")
df1$ID_category<-recode(df1$ID_category, "Unidentfied Deer"="Deer sp.")

df1$prop.sp<-df1$num_images/total*100

df1$ID_category<-as.factor(df1$ID_category)
# df1$ID_category2<-factor(df1$ID_category, levels=unique(df1$ID_category[order(df1$num_images)])) 
#not the way becuase labels are pooled with counts

df1<-df1%>%group_by(ID_category)%>%mutate(pooled_count1=sum(num_images))
df1<-df1%>%group_by(ID_category)%>%mutate(prop.sp=round(pooled_count1/total*100,2))

# sp.percents<-sort(unique(df1$prop.sp), decreasing = T)

gg1<-ggplot(df1, aes(x=fct_reorder(ID_category, pooled_count1), y=num_images/1000000))+ #Is this right? 
  geom_bar(stat="identity", fill="blue")+
  coord_flip()+ylab("Number of Images (in millions)")+
  ggtitle("First Order Classification")+
  theme(axis.text=element_text(size=18, face="bold"),
        axis.title = element_text(size=22, face="bold"),
        plot.title=element_text(size=22, face="bold", hjust=0.5),
        axis.title.y=element_blank())
# ** I want to use pooledcount1 for the y variable, but that makes the plot weird(I think because it
#  counts multiple rows that have already been summed.)


# I don't think I need the proportions tacked on here, it clutters up the figure 
#  and it's kinda complicate because ggplot wants to display multiple values since 
# the groups have multiple entries.

# This is how I did it before (when there wasn't the grouping issue)
#   geom_text(aes(label=paste(round(prop,2), "%", sep=""), hjust=-.2))
# This will paste multiple values on the plot because it wants to do one thing for each row...
############################################################################################
#2nd order classification

#Capitalize
df1$higher_classification<-sapply(df1$higher_classification, str_to_title)

#Assign a label to a row that still has an NA
df1[is.na(df1$higher_classification),]$higher_classification<-"Birds"

#Change a grouping label
df1$higher_classification<-recode(df1$higher_classification, "Potential Prey"="Rabbits")
df1$higher_classification<-recode(df1$higher_classification, "Prey"="Rodents")

#Sum higher grouped level
df1<-df1%>%group_by(higher_classification)%>%mutate(pooled_count2=sum(num_images))

#Find proportion
df1<-df1%>%group_by(higher_classification)%>%mutate(prop2=round(pooled_count2/total*100,2))

gg2<-ggplot(df1, aes(x=fct_reorder(higher_classification, pooled_count2), y=num_images/1000000))+
  geom_bar(stat="identity", fill="blue")+
  coord_flip()+ylab("Number of Images (in millions)")+
  ggtitle("Second Order Classification")+
  theme(axis.text=element_text(size=18, face="bold"),
        axis.title = element_text(size=22, face="bold"),
        plot.title=element_text(size=22, face="bold", hjust=0.5),
        axis.title.y=element_blank())


unique(df1$ID_category)
unique(df1$higher_classification)

