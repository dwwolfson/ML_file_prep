# Recombine csv for Idaho photos
library(tidyverse)
# Two main jobs:
# 1) go through and load all the csvs into one big file
# 2) work through the mess of the csvs and get a species label

#pull off column names for template to fill in loop
df <- read_csv("E:/ID_test/site_A/AM1/Trip 1/100RECNX/TimelapseData.csv")
my_names<-colnames(df)



alldat<-data.frame(matrix(NA, nrow=1, ncol=59))
colnames(alldat)<-c(my_names, 'filename')

  #Task 1 should be a relatively simple looping exercise

# I know it's slow and memory inefficient to grow objects during a loop, but I won't know the size of each csv to 
# import or the final size, and I don't want to use matrices instead of dataframes because I want to be able to 
# have different class columns.

# A better way might be to store every csv as a dataframe in a list during the loop and then deal with it 
# afterwards outside of the loop, maybe with do.call, but I want to see if this will work.


  #set root as wd
  setwd("E:/Idaho_images")
root_path<-"E:/Idaho_images"
level1_dirs<-list.files()

#first level
for (i in 1:length(level1_dirs)){
  tmp_path1<-paste(root_path, level1_dirs[i], sep='/')
  setwd(tmp_path1)
  level2_dirs<-list.files(pattern='AM') #so that it won't get hung up on those two folders with csv's
  level2_head<-level1_dirs[i] 
  print(level1_dirs[i]) #tells me when it's half done
  
  #second level
  for(j in 1:length(level2_dirs)){
    tmp_path2<-paste(tmp_path1, level2_dirs[j], sep='/')
    setwd(tmp_path2)
    level3_dirs<-list.files(pattern='Trip*')  #only grab folders named (trip 1, trip 2, etc), and not the backup folder
    level3_head<-paste(level2_head, level2_dirs[j], sep="_")
    print(paste(level1_dirs[i], level2_dirs[j], sep='_'))
    
    #third level  
    for(k in 1:length(level3_dirs)){
      tmp_path3<-paste(tmp_path2, level3_dirs[k], sep='/')
      setwd(tmp_path3)
      level4_head<-paste(level3_head, level3_dirs[k], sep='_')
      level4_dirs<-list.files(pattern='RECNX')
      
      #fourth level
      for(m in 1:length(level4_dirs)){
        tmp_path4<-paste(tmp_path3, level4_dirs[m], sep='/')
        level5_head<-paste(level4_head, level4_dirs[m], sep='_')
        setwd(tmp_path4)
        level5_files<-list.files(pattern='(.\\.jpg|\\.JPG)$') #only grab images 
        tmpdf<-read_csv('TimelapseData.csv')
        if(ncol(tmpdf)==57){
          tmpdf[,58]<-NA
          colnames(tmpdf)[58]<-'X58'
        }
        tmpdf[,59]<-level5_files
        colnames(tmpdf)[59]<-'filename'
        alldat<-rbind(alldat, tmpdf)
      }
    }
  }
} 

#broke at 'Beaverhead/AM188/Trip 1/100RECNX/ because there was one less column than the rest of the csvs, but it just 
# wasn't adding the extra row name 'counter' column, not sure why
# I fixed this issue by adding another column to the tibble if it needs it.


#This isn't exactly what I want because I didn't grab the filename and insert it in while I was at it
# but I'll write it out as an intermediate output to save
setwd('C:/Users/apdwwolfson/Documents/Projects/Photo_Database/Machine_Learning/ML_file_prep')
alldat<-alldat[-1,]
write_csv(alldat, 'output/alldat.csv')

#Trim some columns to save space
names(alldat)
df<-alldat[,c('filename', 'Date', 'Time', 'ImageQuality', 'MarkForDeletion', 
              'elkpresent', 'deerpresent', 'prongpresent', 'humanpresent', 'otherpresent',
              "ElkSpike", "ElkAntlerless",   "ElkCalf","MDbuck","MDantlerless","MDfawn",         
              "WTDbuck","WTDantlerless","WTDfawn","MooseBull","MooseAntlerless", "MooseCalf","PronghornBuck" , 
              "PronghornFawn","BlackBearAdult","BlackBearCub","LionAdult", "LionKitten","WolfAdult","WolfPup" ,       
              "other" , "otherwhat","PHdoe","CattleCow","CattleCalf","ElkRaghorn","ElkMatBull","ElkUnkn",
              "MooseUnkn", "PHunkn","MDunkn", "WTDunkn")]
#save trimmed df
write_csv(df, 'output/df.csv') #saves ~100MB, 182 vs 295




# Task 2
#Assign species label
df$species<-ifelse(df$elkpresent=='true' & df$prongpresent=='false' & df$deerpresent=='false' & df$humanpresent=='false', 'elk',
        ifelse(df$prongpresent=='true' & df$elkpresent=='false' & df$deerpresent=='false' & df$humanpresent=='false', 'pronghorn',
          ifelse(df$humanpresent=='true' & df$elkpresent=='false' & df$prongpresent=='false' & df$deerpresent=='false', 'human',
            ifelse(df$MDantlerless>0 | df$MDbuck>0 | df$MDfawn>0 | df$MDunkn>0, 'mule deer',
              ifelse(df$WTDantlerless>0 |df$WTDbuck>0 | df$WTDfawn>0 | df$WTDunkn>0, 'white-tailed deer',
                ifelse(df$MooseAntlerless>0 | df$MooseBull>0 | df$MooseCalf>0 | df$MooseUnkn>0, 'moose',
                  ifelse(df$BlackBearAdult>0 | df$BlackBearCub>0, 'black bear',
                    ifelse(df$LionAdult>0 | df$LionKitten>0, 'mountain lion',
                      ifelse(df$WolfAdult>0 | df$WolfPup>0, 'wolf',
                        ifelse(df$other, df$otherwhat,     
                          ifelse(df$CattleCalf>0 | df$CattleCow>0, 'cattle', 'flag')))))))))))

#overwrite with new species column
write_csv(df, 'output/df.csv') 








########################################################
# I tested a few different options for assigning the species category
# to see what would be fastest.

library(microbenchmark)
library(tidyverse)
id <- c("a", "b", "c", "d")
in05 <- c(1, 0, 0, 1)
in06 <- c(0, 0, 0, 1)
in07 <- c(1, 1, 0, 1)
in08 <- c(0, 1, 1, 1)
in09 <- c(0, 0, 0, 1)
df <- data.frame(id, in05, in06, in07, in08, in09)

mbm<-microbenchmark(
  df$firstyear <- ifelse(df$in05==1,2005,
                         ifelse(df$in06==1,2006,
                                ifelse(df$in07==1, 2007,
                                       ifelse(df$in08==1, 2008,
                                              ifelse(df$in09==1, 2009,
                                                     0))))),
  df1<-df%>%mutate(., firstyear = with(., case_when(
    in05 == 1 ~ 2005,
    in06 == 1 ~ 2006,
    in07 == 1 ~ 2007,
    in08 == 1 ~ 2008,
    in09 == 1 ~ 2009,
    TRUE ~ 0
  )))
)

mbm
# min       lq      mean   median       uq        max neval
# 181.448  224.518  286.4997  260.258  326.055    595.659   100
# 3332.392 3747.520 6571.9483 4213.417 5034.327 147036.863   100
#ifelse faster

#try with if_else from dplyr as well; supposed to be faster than normal version
mbm1<-microbenchmark(
  df$firstyear <- ifelse(df$in05==1,2005,
                         ifelse(df$in06==1,2006,
                                ifelse(df$in07==1, 2007,
                                       ifelse(df$in08==1, 2008,
                                              ifelse(df$in09==1, 2009,
                                                     0))))),
  df1<-df%>%mutate(., firstyear = with(., case_when(
    in05 == 1 ~ 2005,
    in06 == 1 ~ 2006,
    in07 == 1 ~ 2007,
    in08 == 1 ~ 2008,
    in09 == 1 ~ 2009,
    TRUE ~ 0
  ))),
  df$fy<-if_else(df$in05==1,2005,
                 if_else(df$in06==1,2006,
                         if_else(df$in07==1, 2007,
                                 if_else(df$in08==1, 2008,
                                         if_else(df$in09==1, 2009,
                                                 0)))))
)

mbm1
# min        lq      mean    median        uq       max neval
# 176.682  195.0100  231.8604  219.0195  254.7595   447.569   100
# 3499.543 3650.1985 4109.3181 3743.1220 3961.4075 30069.233   100
# 609.222  642.7625  690.2282  673.0030  710.3925  1012.071   100

# normal ifelse still wins; beats if_else and case_when