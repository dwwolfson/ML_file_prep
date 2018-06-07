#Prepare Idaho image dataset for ML model

# 4 levels of hierarchy
#top: study site (2 sites)
#second: camera number (not a regular sequence)
#third: trip number    (trip 1, trip 2, etc)
#fourth: photo check   (looks to always be: 100RECNX)
#fifth: images         (IMG_0001.JPG, IMG_0002.JPG, etc)

#######################################################
# Recursive Naming

#set root as wd
setwd("E:/Idaho_images")
root_path<-"E:/Idaho_images"
level1_dirs<-list.files()

#first level
for (i in 1:length(level1_dirs)){
  tmp_path1<-paste(root_path, level1_dirs[i], sep='/')
  setwd(tmp_path1)
  level2_dirs<-list.files()
  level2_head<-level1_dirs[i]
  
  #second level
  for(j in 1:length(level2_dirs)){
  tmp_path2<-paste(tmp_path1, level2_dirs[j], sep='/')
  setwd(tmp_path2)
  level3_dirs<-list.files(pattern='Trip*')  #only grab folders named (trip 1, trip 2, etc), and not the backup folder
  level3_head<-paste(level2_head, level2_dirs[j], sep="_")
    
     #third and fourth level  ***the third level will always be '100RECNX' so no extra loop needed
     for(k in 1:length(level3_dirs)){
     tmp_path3<-paste(tmp_path2, level3_dirs[k], '100RECNX', sep='/')
     level4_head<-paste(level3_head, level3_dirs[k], '100RECNX', sep='_')
     setwd(tmp_path3)
     level4_files<-list.files(pattern='(.\\.jpg|\\.JPG)$') #only grab images 
     file.rename(level4_files, paste(level4_head, level4_files, sep='_'))
     
    }
  }
}

