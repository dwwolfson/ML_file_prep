#Pooling all csvs
#Summary Stats
#Figure out recoding for english/latin issues

#Restart R session

library(tidyverse)
#Step 1: Combine data

#system.time(ceah<-read.csv("Data/processed_csvs/CEAH.csv", header = F, na.strings = "")) 
#   user      system elapsed 
#   114.14    0.28  117.45       #WAY SLOWER!!! DON"T USE

system.time(ceah<-read_csv("Data/processed_csvs/CEAH.csv", col_names = F, na =c("", "NA")))
# user  system elapsed 
# 3.20    0.06    3.52
cpw<-read_csv("Data/processed_csvs/CPW.csv")
nwrc<-read_csv("Data/processed_csvs/NWRC.csv")
srel<-read_csv("Data/processed_csvs/SREL.csv")

head(ceah)
ceah<-ceah[,-3]  #this is a blank, worthless column
ceah<-ceah[,-6]  #this is the path, which we don't need
ceah<-ceah[,-2]  #this is a unique ID, which is unneccesary because the image filename is already unique
ceah$study<-"CEAH"

varnames<-c("filename", "species", "count", "marked", "study")
colnames(ceah)<-varnames
ceah$count<-NA

head(cpw)
cpw<-cpw[,-3]   #don't need event id
cpw<-cpw[,-2]    #don't need unique id
cpw$study<-"CPW"
colnames(cpw)<-varnames

head(nwrc)
nwrc<-nwrc[,-c(1,2)]  #don't need unique id or filepath
nwrc$marked<-NA       #add column of NA's
nwrc$study<-"NWRC"
nwrc<-cbind.data.frame(nwrc$FileName,nwrc$Species,nwrc$Count, nwrc$marked, nwrc$study)
colnames(nwrc)<-varnames

head(srel)
srel<-srel[,-c(1,4,5)] #don't need unique ID, sub-study name, or filepath
srel$count<-NA
srel$marked<-NA
srel$study<-"SREL"
srel<-cbind.data.frame(srel$Image.Name, srel$Species, srel$count, srel$marked, srel$study)
colnames(srel)<-varnames

df<-rbind(ceah, cpw, nwrc, srel)
######################################################################

#Step 2: Recode so all species labels are standardized

length(unique(df$species)) #94 labels before recoding
#Recoding labels from the NWRC dataset (which was all in english)
df$species<-recode(df$species, "bird"="Aves")
df$species<-recode(df$species, "Black Bear"="Ursus americanus")
df$species<-recode(df$species, "Chipmunk"="Tamias")
df$species<-recode(df$species, "Coyote"="Canis latrans")
df$species<-recode(df$species, "Crow"="Corvus")
df$species<-recode(df$species, "Feral Swine"="Sus scrofa")
df$species<-recode(df$species, "Fox Squirrels"="Sciurus")
df$species<-recode(df$species, "human"= "Homo sapien")
df$species<-recode(df$species, "Human"= "Homo sapien")
df$species<-recode(df$species, "Misc Bird"="Aves")
df$species<-recode(df$species, "Misc Rodent"="Rodentia")
df$species<-recode(df$species, "Mouse"="Mus")
df$species<-recode(df$species, "None"="Nothing")   #This will be the only non-Latin label
df$species<-recode(df$species, "Opossum"="Didelphis virginiana")
df$species<-recode(df$species, "raccoon"="Procyon lotor")
df$species<-recode(df$species, "rat"="Rattus rattus")
df$species<-recode(df$species, "snake"="Squamata")
df$species<-recode(df$species, "squirrel"="Sciurus")  #this is the first time I'm calling multiple things with the same label
df$species<-recode(df$species, "Swine milling"="Sus scrofa")
df$species<-recode(df$species, "Swine opening"="Sus scrofa")
df$species<-recode(df$species, "Swine stealing (access)"="Sus scrofa")
# df$species<-recode(df$species, "throw out"=????)                    #need to maybe delete these? it's a little late now though
df$species<-recode(df$species, "turkey"="Meleagris gallopavo")
# df$species<-recode(df$species, "unknown"=????)                       #same as above comment
#Probably a lot of these smaller categories should be lumped together (eg: multiple squirrel species)

#Recode CPW english category
df$species<-recode(df$species, "Bird"="Aves")

#Recode SREL
df$species<-recode(df$species,"Canis Latrans"="Canis latrans")
#'Bird' already recoded from CPW
#'None' already recode from NWRC
# df$species<-recode(df$species, "other"=????)        #this could be deleted, not useful

# A couple random typos
df$species<-recode(df$species, "Daypus novemcinctus"="Dasypus novemcinctus")
df$species<-recode(df$species, "Homo sapien"="Homo sapiens")
df$species<-recode(df$species, "Felis concolor"="Puma concolor")

length(unique(df$species)) #71 after recoding

#export df
write.csv(df, "Data/pooled_csv/comprehensive.csv")
#################################################################################
#Summary Visualization
                   
#Make df of tallies
tallies<-df%>%
  group_by(species)%>%
  summarise(num=n())
# write.csv(tallies, "Data/species_tallies.csv")


#add emptys
their.emptys<-tallies[tallies$species=="Nothing",2]
our.emptys=332944
all.emptys=their.emptys+our.emptys
tallies[tallies$species=="Nothing",2]=all.emptys

tallies$prop<-(tallies$num/nrow(df))*100
tallies$species<-factor(tallies$species, levels=tallies$species[order(tallies$num)])

ggplot(tallies, aes(species, num))+
  geom_bar(stat="identity", fill="blue")+
  coord_flip()+
  geom_text(aes(label=paste(paste0(round(prop, 2), "%"), num, sep=" | "), hjust=-0.2))+
  ylab("Photo Count")+xlab("Species ID")+
  ggtitle("Species Tallies (Total Images=3,873,235)")+
  theme(plot.title=element_text(hjust=0.5))+
  ylim(0,2100000)
  
###############################################################################################




