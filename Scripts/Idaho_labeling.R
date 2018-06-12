# Remove whitespace from filenames and csv for Idaho images

library(tidyverse)
test_st<-'this has a lot of white space'
new_st<-str_replace_all(test_st, " ", "")


#rename all the file images
setwd("E:/Idaho_resized")
files<-list.files()
short<-str_replace_all(files, " ", "")
# file.rename(from=files, to=short)

#change all the names in the csv
df<-read_csv('csv/idaho_db.csv')
df<-df[,-1]
df$short<-str_replace_all(df$filename, " ", "")


df_nodups<-df[!duplicated(df$short),]
df_nodups<-na.omit(df_nodups)
#Now the numbers match
###############################################################
# Now I need to delete images that we don't have labels for in the pretrained model
df<-df_nodups

#these are all the labels to exclude
df<-df[df$species!='fox'&df$species!='lagomorph'&df$species!='pronghorn'&df$species!='lion kitten'&
         df$species!='other (name in comments)'&df$species!='wolf adult',]



#Now to recode the species labels into the class numbers
df$class<-ifelse(df$species=='coyote', 3,
                 ifelse(df$species=='elk', 4,
                        ifelse(df$species=='human', 11,
                               ifelse(df$species=='bobcat', 13,
                                      ifelse(df$species=='mule deer', 17,
                                             ifelse(df$species=='human (motorized)', 11,
                                                    ifelse(df$species=='human (camera personnel)',11,
                                                           ifelse(df$species=='lion adult', 20,
                                                                  ifelse(df$species=='human (hiker)', 11,
                                                                         ifelse(df$species=='white-tailed deer', 18,
                                                                                ifelse(df$species=='moose', 0,
                                                                                       ifelse(df$species=='turkey', 8,
                                                                                              ifelse(df$species=='black bear cub', 24,
                                                                                                     ifelse(df$species=='black bear adult', 24,
                                                                                                            ifelse(df$species=='human (gun hunter)', 11,
                                                                                                                   ifelse(df$species=='empty', 27, 'flag'))))))))))))))))
table(df$class) #no flags, that's good, it all assigned
setwd("C:/Users/apdwwolfson/Documents/Projects/Photo_Database/Machine_Learning/ML_file_prep/output/final_output")
write.csv(df, 'idaho.csv')











