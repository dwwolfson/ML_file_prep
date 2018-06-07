#




# three levels of hierarchy
#top: Bait project root
#next: 87 folders: B-01, B_02, etc
#next: 100RECNX, 101RECNX, etc
#next: images-> IMG_0001.JPG, IMG_0002.JPG, etc

######################################################
# Recursively rename all photos within folder hierarchy to have the path added to filename

#set top root folder as oringinal working directory
setwd("F:/NWRC_2nd_round_counts/Bait Preference Study/photos")
root_path<-"F:/NWRC_2nd_round_counts/Bait Preference Study/photos"
level1_head<-"photos"
level1_dirs<-list.files()

#first loop
for(i in 7:length(level1_dirs)){
  tmp_path1<-paste(root_path, level1_dirs[i], sep="/")
  setwd(tmp_path1)
  level2_head<-paste(level1_head,level1_dirs[i], sep="_")
  level2_dirs<-list.files()
  
  #second loop
  for(j in 1:length(level2_dirs)){
    tmp_path2<-paste(tmp_path1, level2_dirs[j], sep="/")
    setwd(tmp_path2)
    level3_files<-list.files(pattern="^(.*)+(\\.jpg|\\.JPG)$") #regex to exclude 'thumbs' file in each folder
    level3_head<-paste(level2_head, level2_dirs[j], sep="_")
    file.rename(level3_files, paste(level3_head,level3_files, sep="_"))
  }
}


#########################################################################
# Now recombine the csv
setwd("C:/Users/apdwwolfson/Documents/Projects/Photo Database/Machine Learning/ML_R_file_manipulation/Data/second_round_count_data")
df<-read_csv("Bait_Preference_Count_Results.csv")

#test it out
paste(strsplit("I:\\QA2439_Snow\\photos\\B_01\\100RECNX", "\\\\")[[1]][3],
      strsplit("I:\\QA2439_Snow\\photos\\B_01\\100RECNX", "\\\\")[[1]][4], 
      strsplit("I:\\QA2439_Snow\\photos\\B_01\\100RECNX", "\\\\")[[1]][5],sep="_")
 

df$new_filename<-paste(sapply(df$FilePath, function(x)
  paste(
    strsplit(x,"\\\\")[[1]][3],
    strsplit(x,"\\\\")[[1]][4],
    strsplit(x,"\\\\")[[1]][5], sep="_")), df$FileName, sep="_")


#Find photos with multiple spp
mults<-df[df$`Total Pigs`>0&df$Deer>0|
             df$`Total Pigs`>0&df$Turkeys>0|
             df$Deer>0&df$Turkeys>0,]  #no multiple species pictures

#add species column
df$species<-ifelse(df$`Total Pigs`>0, "wild_pig",
                   ifelse(df$Turkeys>0, "turkey",
                          ifelse(df$Deer>0, "deer", "empty")))
table(df$species)
df$count<-rowSums(df[,c('Turkeys', 'Deer', 'Total Pigs')])


#rearrange columns
df<-df[,c("new_filename", 'ImageDate','count','species','Turkeys', 'Deer','YOY Pigs', 'Adult Pigs', 'Total Pigs')]

#write out
setwd("C:/Users/apdwwolfson/Documents/Projects/Photo Database/Machine Learning/ML_R_file_manipulation")
# write.csv(df, 'Output/nwrc_processed_csvs/bait_preference.csv')

## It's mostly empty unfortunately...
# df<-Bait_Preference_Count_Results
# table(df$`Total Pigs`)
# emptys<-df[df$Turkeys<1&df$Deer<1&df$`Total Pigs`<1,]
# pigs<-df[df$`Total Pigs`>0,]

#Combine all three NWRC datasets with counts
rm(list=ls())
df1<-read_csv("Output/nwrc_processed_csvs/bait_preference.csv")
df2<-read_csv("Output/nwrc_processed_csvs/metal_vs_plastic.csv")
df3<-read_csv("Output/nwrc_processed_csvs/four_treatment.csv")

#These are just row numbers
df1<-df1[,-c(1:2)]
df2<-df2[,-1]
df3<-df3[,-1]

#rearrange
names(df1)
names(df2)
names(df3)
colnames(df1)[1]<-"FileName"

df1<-df1[,c("FileName","ImageDate","Deer","Turkeys","Adult Pigs","YOY Pigs","Total Pigs","species","count","study")]

df2<-df2[,c("FileName","ImageDate","Deer","Turkeys","Adult Pigs","YOY Pigs","Total Pigs","species","count","study")]

df<-rbind(df1, df2, df3)
write.csv(df, "Output/nwrc_processed_csvs/all_nwrc.csv")
