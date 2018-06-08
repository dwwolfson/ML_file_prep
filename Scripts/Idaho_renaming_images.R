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
        level5_files<-list.files(pattern='(.\\.jpg|\\.JPG)$') #only grab images 
        file.rename(level5_files, paste(level4_head, level5_files, sep='_'))
    }
     }
  }
}   #this takes a long time because there are 1.2 million images to find and rename
# took about 45 minutes

# There was an aborted run because I didn't have the pattern='RECNX'; and the following folders are now DOUBLE-labeled
# Beaverhead AM174-AM180  (I hope these are the only ones, fingers crossed)

# I think I need to fix this before I move on to the csv
setwd("E:/Idaho_images/Beaverhead")
root_path<-"E:/Idaho_images/Beaverhead"

level1_dirs<-c('AM174','AM177', 'AM178', 'AM179', 'AM180')

for(i in 1:length(level1_dirs)){
  tmp_path1<-paste(root_path, level1_dirs[i], sep='/')
  setwd(tmp_path1)
  level2_dirs<-list.files(pattern='Trip*')  #only grab folders named (trip 1, trip 2, etc), and not the backup folder
  level2_head<-paste(level1_dirs[i])
  
  for(j in length(level2_dirs)){
    tmp_path2<-paste(tmp_path1, level2_dirs[j], sep='/')
    setwd(tmp_path2)
   level3_head<-paste(level2_head, level2_dirs[j], sep='_')
   level3_dirs<-list.files(pattern='RECNX')
   
   for(k in length(level3_dirs)){
     tmp_path3<-paste(tmp_path2, level3_dirs[k], sep='/')
     setwd(tmp_path3)
     level4_files<-list.files(pattern='(.\\.jpg|\\.JPG)$')
     cut_names<-paste(sapply(level4_files, function(x)
       paste(
         strsplit(x,'_')[[1]][4],
         strsplit(x,'_')[[1]][5],
         strsplit(x,'_')[[1]][6],
         strsplit(x,'_')[[1]][7],
         strsplit(x,'_')[[1]][8],sep='_'
       )))
     file.rename(from=level4_files, to=cut_names)
   }
   }
}

#This didn't work. I'm just going to remove those cameras. It's only 60,000 images from 1.2 million.


paste(strsplit('Beaverhead_AM174_Trip 1_Beaverhead_AM174_Trip 1_IMG_0001.JPG', '_')[[1]][4],
      strsplit('Beaverhead_AM174_Trip 1_Beaverhead_AM174_Trip 1_IMG_0001.JPG', '_')[[1]][5],
      strsplit('Beaverhead_AM174_Trip 1_Beaverhead_AM174_Trip 1_IMG_0001.JPG', '_')[[1]][6],
      strsplit('Beaverhead_AM174_Trip 1_Beaverhead_AM174_Trip 1_IMG_0001.JPG', '_')[[1]][7],
      strsplit('Beaverhead_AM174_Trip 1_Beaverhead_AM174_Trip 1_IMG_0001.JPG', '_')[[1]][8], sep='_')




#####################################################################################
# Now to pull out all the csv's and add the correct filenames










