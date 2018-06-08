# Recombine csv for Idaho photos

# Two main jobs:
# 1) go through and load all the csvs into one big file
# 2) work through the mess of the csvs and get a species label

alldat<-
  #Task 1 should be a relatively simple looping exercise
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
  
  #second level
  for(j in 1:length(level2_dirs)){
    tmp_path2<-paste(tmp_path1, level2_dirs[j], sep='/')
    setwd(tmp_path2)
    level3_dirs<-list.files(pattern='Trip*')  #only grab folders named (trip 1, trip 2, etc), and not the backup folder
    level3_head<-paste(level2_head, level2_dirs[j], sep="_")
    
    #third level  
    for(k in 1:length(level3_dirs)){
      tmp_path3<-paste(tmp_path2, level3_dirs[k], sep='/')
      setwd(tmp_path3)
      level4_head<-paste(level3_head, level3_dirs[k], sep='_')
      level4_dirs<-list.files(pattern='RECNX')
      
      #fourth level
      for(m in 1:length(level4_dirs)){
        tmp_path4<-paste(tmp_path3, level4_dirs[m], sep='/')
        setwd(tmp_path4)
        tmpdf<-read_csv('TimelapseData.csv')
      }
    }
  }
} 









# Task 2
#after reading the csv, I should probably only keep the info I need and dump the rest
df <- read.csv("E:/ID_test/site_A/AM1/Trip 1/100RECNX/TimelapseData.csv", stringsAsFactors=FALSE)

# I can't use the 5 'species present columns because there 


df$sp<-ifelse(df$elkpresent='true', 'elk',
              ifelse(df$prongpresent='true', 'pronghorn',
                     ifelse(df$h)))









########################################################
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
# normal ifelse still wins