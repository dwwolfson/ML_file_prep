# To get the Idaho images

# 1) Subset to get all the filenames for images that aren't 'flag'
# 2) Figure out how many images should be pulled from 'flag' images ->10%
# 3) Randomly sample from all flag images (just get the index)
# 4) Use that vector of numbers to draw randomly sampled images from 'flag' filenames
# 5) This is all the images to copy

# 6) Loop through the entire folder structure and copy any files that match

library(tidyverse)

#Import output csv
df<-read_csv('output/df.csv')
table(df$species)

#everything that isn't 'flag'
dat<-df[df$species!='flag',]

#kick out 'unknown' ID
dat<-dat[dat$species!='unknown',]

#Take 10% of flag
nflag=1104024
nflag*0.1
# 110,000 is close enough

flagdb<-df[df$species=='flag',]
flag_files<-flagdb$filename
flag_index<-sample(flag_files, 110000, replace=F)

#Vector of all files to copy
to_copy<-c(dat$filename, flag_index)

#Build up the dataframe to export from the images we're going to use
flags<-data.frame(filename=flag_index, species="empty")
idaho_db<-rbind(dat[,c('filename', 'species')],flags )
setwd('C:/Users/apdwwolfson/Documents/Projects/Photo_Database/Machine_Learning/ML_file_prep/output')
write.csv(idaho_db, 'idaho_db.csv')
#############
# Go though all images recursively and only copy the files that match my list

#set root as wd
setwd("E:/Idaho_images")
root_path<-"E:/Idaho_images"
dest<-"E:/ID_to_resize"
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
    print(paste(level1_dirs[i], level2_dirs[j], sep='_')) #tells me when each camera site is done
    
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
        level5_files<-list.files(pattern='(.\\.jpg|\\.JPG)$') #only grab images 
        matches<-to_copy[which(to_copy%in%level5_files)]    #pulls out filenames for files we want
        file.copy(from = matches, to=dest)
      }
    }
  }
} 


#test out matching
abc<-c("a", 'b', 'c') #bigger list
bc<-c('b','c') #to find
which(abc%in%bc)  #gives location in vector
abc[which(abc%in%bc)] #gives actual values

