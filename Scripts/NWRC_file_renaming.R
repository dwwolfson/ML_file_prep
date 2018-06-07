#Convert NWRC photos to all unique file names

#Directories to change the names: 1) Swine Strength and Challenge Bait

########################################################################################################################
# Swine Strength
#Example path:
#E:/Swine_Strength_copy/Trial_Photos_Cleaned/day2/middle1_d2/Kerr-Middle1_00001.jpg

# Root:       E:/Swine_Strength_copy
# Level 2:    E:/Swine_Strength_copy/Trial_Photos_Cleaned                     #one folder
# Level 3:    E:/Swine_Strength_copy/Trial_Photos_Cleaned/day2                #four folders  (day2, day3, day4, day5)
# Level 4:    E:/Swine_Strength_copy/Trial_Photos_Cleaned/day2/middle1_d2     #variable numbers of folders depending on the day
##############################################################################################################################

##############################################################################################################################
# Challenge Bait
#Example path:
# E:/Challenge_Bait_copy/24a1/IMG_0001.jpg

# Root:     E:/Challenge_Bait_copy           #one folder
# Level 2:  E:/Challenge_Bait_copy/24a1      # there are 40 directories at this level

############################################################################################################
############################################################################################################
# I first copied the entire NWRC project folders that had replicated filenames 
#(Swine Strength and Challenge Bait) as a precaution

# So I think for all of these processes, I can rename each file within it's own sub-directory (because
# renaming is probably much quicker than writing/copying/etc).  Therefore I can change the names of 
# all files in the copied Swine Strength and Challenge Bait folders, and then set it up to copy all of those
# renamed files overnight in case it takes a long time.

# Workflow
# 1) get the path of each sub-directory, write to an object (dir="file path here")
# 2) set the working directory to that path, so I can edit those files  (setwd())  * you could enter dir as arg, but not necessary*
# 3) write a character vector of all the files in that directory to have their names edited (ex: olds=list.files(dir))
# 4) write out new names by pasting prefix of higher directories to each file name (ex: news=paste0("day2/middle1_d2", olds))

# The slow part of this is that I need to do it for every single sub-directory, which is a little laborious.
# However, it should go quickly, and the alternative of assigning recursively and keeping everything straight seems like a pain.

# I'll need to also alter the csv's for these projects, but that should be pretty easy to do.
################################################################################################################
# Test the method...
# Swine Strength Project
# Day 2

#Middle1_d2
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day2/middle1_d2")
olds<-list.files()
news<-paste0("day2/middle1_d2/", olds)
file.rename(olds,news)
file.rename(list.files("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day2/middle1_d2", full.names=T),
            paste0("day2/middle1_d2/", olds))
#Writing to change names on the external hard drive itself didn't work.  I get full permissions to edit the drive,
# but it still wasn't working.


setwd("H:/Swine_Strength_copy/Trial_Photos_Cleaned/day2/middle1_d2")
olds<-list.files()
file.rename(olds,paste0("day2_middle1_d2_", olds))  
#  *** YOu can't have a backslash in the paste0 string or it messes it up!!!

# So writing to the external hard drive is fine, I just couldn't have a backslash in the paste0 string.
# I'll rewrite everything to the external drive instead of H so I don't have to recopy it all over.
##########################################################################################################
##########################################################################################################
# Swine Strength Project

# Day 2

#Middle1_d2
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day2/middle1_d2")
olds<-list.files()
file.rename(olds,paste0("day2_middle1_d2_", olds))


#Middle2_d2
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day2/middle2_d2")
olds<-list.files()
file.rename(olds,paste0("day2_middle2_d2_", olds))


#Middle3_d2
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day2/middle3_d2")
olds<-list.files()
file.rename(olds,paste0("day2_middle3_d2_", olds))

#North1
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day2/north1_d2")
olds<-list.files()
file.rename(olds,paste0("day2_north1_d2_", olds))

#North2
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day2/north2_d2")
olds<-list.files()
file.rename(olds,paste0("day2_north2_d2_", olds))

#North3
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day2/north3_d2")
olds<-list.files()
file.rename(olds,paste0("day2_north3_d2_", olds))

#South1
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day2/south1_d2")
olds<-list.files()
file.rename(olds,paste0("day2_south1_d2_", olds))

#South2
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day2/south2_d2")
olds<-list.files()
file.rename(olds,paste0("day2_south2_d2_", olds))

#South3
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day2/south3_d2")
olds<-list.files()
file.rename(olds,paste0("day2_south3_d2_", olds))
########################################################################################################
#Day 3

#Middle1
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day3/middle1_d3")
olds<-list.files()
file.rename(olds,paste0("day3_middle1_d3_", olds))

#Middle2
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day3/middle2_d3")
olds<-list.files()
file.rename(olds,paste0("day3_middle2_d3_", olds))

#Middle3
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day3/middle3_d3")
olds<-list.files()
file.rename(olds,paste0("day3_middle3_d3_", olds))

#North1
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day3/north1_d3")
olds<-list.files()
file.rename(olds,paste0("day3_north1_d3_", olds))

#North2
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day3/north2_d3")
olds<-list.files()
file.rename(olds,paste0("day3_north2_d3_", olds))

#North3
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day3/north3_d3")
olds<-list.files()
file.rename(olds,paste0("day3_north3_d3_", olds))

#South1
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day3/south1_d3")
olds<-list.files()
file.rename(olds,paste0("day3_south1_d3_", olds))

#South2
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day3/south2_d3")
olds<-list.files()
file.rename(olds,paste0("day3_south2_d3_", olds))

#South3
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day3/south3_d3")
olds<-list.files()
file.rename(olds,paste0("day3_south3_d3_", olds))
##########################################################################################
# Day 4

#Middle1
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day4/middle1_d4")
olds<-list.files()
file.rename(olds,paste0("day4_middle1_d4_", olds))

#Middle2
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day4/middle2_d4")
olds<-list.files()
file.rename(olds,paste0("day4_middle2_d4_", olds))

#Middle3
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day4/middle3_d4")
olds<-list.files()
file.rename(olds,paste0("day4_middle3_d4_", olds))

#North1
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day4/north1_d4")
olds<-list.files()
file.rename(olds,paste0("day4_north1_d4_", olds))

#North2
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day4/north2_d4")
olds<-list.files()
file.rename(olds,paste0("day4_north2_d4_", olds))

#North3
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day4/north3_d4")
olds<-list.files()
file.rename(olds,paste0("day4_north3_d4_", olds))

#South1
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day4/south1_d4")
olds<-list.files()
file.rename(olds,paste0("day4_south1_d4_", olds))

#South2
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day4/south2_d4")
olds<-list.files()
file.rename(olds,paste0("day4_south2_d4_", olds))

#South3
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day4/south3_d4")
olds<-list.files()
file.rename(olds,paste0("day4_south3_d4_", olds))
########################################################################################################
# Day 5

#Middle1
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day5/middle1_d5")
olds<-list.files()
file.rename(olds,paste0("day5_middle1_d5_", olds))

#Middle2
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day5/middle2_d5")
olds<-list.files()
file.rename(olds,paste0("day5_middle2_d5_", olds))

#Middle3
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day5/middle3_d5")
olds<-list.files()
file.rename(olds,paste0("day5_middle3_d5_", olds))

#North1
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day5/north1_d5")
olds<-list.files()
file.rename(olds,paste0("day5_north1_d5_", olds))

#North2
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day5/north2_d5")
olds<-list.files()
file.rename(olds,paste0("day5_north2_d5_", olds))

#North3
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day5/north3_d5")
olds<-list.files()
file.rename(olds,paste0("day5_north3_d5_", olds))

#South1
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day5/south1_d5")
olds<-list.files()
file.rename(olds,paste0("day5_south1_d5_", olds))

#South2
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day5/south2_d5")
olds<-list.files()
file.rename(olds,paste0("day5_south2_d5_", olds))

#South3
setwd("E:/Swine_Strength_copy/Trial_Photos_Cleaned/day5/south3_d5")
olds<-list.files()
file.rename(olds,paste0("day5_south3_d5_", olds))
###########################################################################################################
#End of Swine Strength Project renaming
###########################################################################################################
# Challenge Bait Project

#24a1
setwd("E:/Challenge_Bait_copy/24a1")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_24a1_",olds))

#24a2
setwd("E:/Challenge_Bait_copy/24a2")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_24a2_",olds))

#24a3
setwd("E:/Challenge_Bait_copy/24a3")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_24a3_",olds))

#24a4
setwd("E:/Challenge_Bait_copy/24a4")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_24a4_",olds))

#24a5
setwd("E:/Challenge_Bait_copy/24a5")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_24a5_",olds))
##################
#24b1
setwd("E:/Challenge_Bait_copy/24b1")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_24b1_",olds))

#24b2
setwd("E:/Challenge_Bait_copy/24b2")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_24b2_",olds))

#24b3
setwd("E:/Challenge_Bait_copy/24b3")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_24b3_",olds))

#24b4
setwd("E:/Challenge_Bait_copy/24b4")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_24b4_",olds))

#24b5
setwd("E:/Challenge_Bait_copy/24b5")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_24b5_",olds))
###############
#25a1
setwd("E:/Challenge_Bait_copy/25a1")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_25a1_",olds))

#25a2
setwd("E:/Challenge_Bait_copy/25a2")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_25a2_",olds))

#25a3
setwd("E:/Challenge_Bait_copy/25a3")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_25a3_",olds))

#25a4
setwd("E:/Challenge_Bait_copy/25a4")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_25a4_",olds))

#25a5
setwd("E:/Challenge_Bait_copy/25a5")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_25a5_",olds))
##################
#25b1
setwd("E:/Challenge_Bait_copy/25b1")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_25b1_",olds))

#25b2
setwd("E:/Challenge_Bait_copy/25b2")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_25b2_",olds))

#25b3
setwd("E:/Challenge_Bait_copy/25b3")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_25b3_",olds))

#25b4
setwd("E:/Challenge_Bait_copy/25b4")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_25b4_",olds))

#25b5
setwd("E:/Challenge_Bait_copy/25b5")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_25b5_",olds))
###################################################
#T1a1
setwd("E:/Challenge_Bait_copy/T1a1")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_T1a1_",olds))

#T1a2
setwd("E:/Challenge_Bait_copy/T1a2")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_T1a2_",olds))

#T1a3
setwd("E:/Challenge_Bait_copy/T1a3")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_T1a3_",olds))

#T1a4
setwd("E:/Challenge_Bait_copy/T1a4")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_T1a4_",olds))

#T1a5
setwd("E:/Challenge_Bait_copy/T1a5")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_T1a5_",olds))
####################
#T1b1
setwd("E:/Challenge_Bait_copy/T1b1")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_T1b1_",olds))

#T1b2
setwd("E:/Challenge_Bait_copy/T1b2")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_T1b2_",olds))

#T1b3
setwd("E:/Challenge_Bait_copy/T1b3")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_T1b3_",olds))

#T1b4
setwd("E:/Challenge_Bait_copy/T1b4")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_T1b4_",olds))

#T1b5
setwd("E:/Challenge_Bait_copy/T1b5")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_T1b5_",olds))
######################
#T2a1
setwd("E:/Challenge_Bait_copy/T2a1")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_T2a1_",olds))

#T2a2
setwd("E:/Challenge_Bait_copy/T2a2")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_T2a2_",olds))

#T2a3
setwd("E:/Challenge_Bait_copy/T2a3")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_T2a3_",olds))

#T2a4
setwd("E:/Challenge_Bait_copy/T2a4")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_T2a4_",olds))

#T2a5
setwd("E:/Challenge_Bait_copy/T2a5")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_T2a5_",olds))
###################
#T2b1
setwd("E:/Challenge_Bait_copy/T2b1")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_T2b1_",olds))

#T2b2
setwd("E:/Challenge_Bait_copy/T2b2")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_T2b2_",olds))

#T2b3
setwd("E:/Challenge_Bait_copy/T2b3")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_T2b3_",olds))

#T2b4
setwd("E:/Challenge_Bait_copy/T2b4")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_T2b4_",olds))

#T2b5
setwd("E:/Challenge_Bait_copy/T2b5")
olds<-list.files()
file.rename(olds, paste0("Challenge_Bait_T2b5_",olds))
#######################################################################################################
#######################################################################################################

