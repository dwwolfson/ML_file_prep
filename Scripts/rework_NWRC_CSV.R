# NWRC csv reorganization to match file renaming

getwd()
#Import unaltered csv's
ch<-read.csv("~/Projects/Photo Database/Machine Learning/ML_R_file_manipulation/Data/original_csvs/Challenge_Bait_Photo_Results.csv")
sw<-read.csv("~/Projects/Photo Database/Machine Learning/ML_R_file_manipulation/Data/original_csvs/Swine_Trials_Photo_Results.csv")
wa<-read.csv("~/Projects/Photo Database/Machine Learning/ML_R_file_manipulation/Data/original_csvs/WA_Bears_Database_Results.csv")

unique(sw$Species)
unique(ch$Species)
unique(wa$Species)

#Tasks
# 1) Change filenames to reflect the altered filenames in pooled directory
# 2) Possibly throw out some of the files from the Challenge Diet project??
# 3) Recode species to match CPW/CEAH latin species names

# Here are the resized NWRC files
setwd("F:/pooled_images_resized")
nwrc.files<-list.files()
head(nwrc.files)

nrow(ch)+nrow(sw)+nrow(wa)
ch_num<-grep("Challenge", nwrc.files)
sw_num<-grep("Kerr", nwrc.files)
wa_num<-grep("WA", nwrc.files)
length(ch_num)+length(sw_num)+length(wa_num) # this matches the number of files in the pooled folder
# the trouble is that this number 406,229, is 11,645 more than the number of records in the three csv's 
# whic is 394,584

# The Swine Strength Project has 158,779 photos (including another 40 folders)
# However, the swine strength csv only has 146,810 records

# **** So Swine Strength is missing over 10,000 records  ****


#  I'll want the combined master to just have the column name "ImageName" with the exact filename that the jpg has, 
# as well as the species column, (which should be standardized as much as possible)



# First the Swine Strength project
d2_m1<-grep("middle1_d2", sw$FilePath) #there should be 6,519 items in the day 2 middle 1 folder, something is wrong
d2_m2<-grep("middle2_d2", sw$FilePath) #there should be 4,098 items in day2/middle2_d2

##########################################################################################################
# I'll combine csv's first

# I don't think that the ImageID column for the Swine Strenght project contributes anything useful, so I'll get rid of it.  
sw<-sw[,-4]

# There is a count for the other two so I'll make a blank count column for swine strength and a blank filepath for washington
sw$Count<-NA
colnames(ch)[4]<-"Count"
wa<-cbind(rep(NA, nrow(wa)), wa)
colnames(wa)[1]<-"FilePath"
colnames(wa)[4]<-"Count"
df<-rbind(ch, sw, wa)     #where are those 12,000 records?

#add column for study type
df$study<-c(rep("Challenge_Bait", nrow(ch)), rep("Swine_Strength", nrow(sw)), rep("Washington", nrow(wa)))
df$FileName<-as.character(df$FileName)

#prefixs to the filenames for the challenge bait and swine strength studies
#grep to get to each special index 

#This might be faster if I can use sub or gsub, instead of grep, but I'd need a different command 
# each time unless I had a list of prefixes and ran everything in a loop.....
############################################################################
# Day 2

#day 2 middle 1
d2m1<-grep("middle1_d2", df1$FilePath)
vec<-df[d2m1,2]
df[d2m1, 2]<-paste0("day2_middle1_d2_",vec)

#day 2 middle 2
d2m2<-grep("middle2_d2", df$FilePath)
vec<-df[d2m2, 2]
df[d2m2, 2]<-paste0("day2_middle2_d2_",vec)

#day 2 middle 3
d2m3<-grep("middle3_d2", df$FilePath)
vec<-df[d2m3, 2]
df[d2m3, 2]<-paste0("day2_middle3_d2_",vec)

#day 2 north 1
d2n1<-grep("north1_d2", df$FilePath)
vec<-df[d2n1, 2]
df[d2n1, 2]<-paste0("day2_north1_d2_", vec)

#day 2 north 2
d2n2<-grep("north2_d2", df$FilePath)
vec<-df[d2n2, 2]
df[d2n2, 2]<-paste0("day2_north2_d2_", vec)

#day 2 north 3
d2n3<-grep("north3_d2", df$FilePath)
vec<-df[d2n3, 2]
df[d2n3, 2]<-paste0("day2_north3_d2_", vec)

#day 2 south 1
d2s1<-grep("south1_d2", df$FilePath)
vec<-df[d2s1, 2]
df[d2s1, 2]<-paste0("day2_south1_d2_", vec)

#day 2 south 2
d2s2<-grep("south2_d2", df$FilePath)
vec<-df[d2s2, 2]
df[d2s2, 2]<-paste0("day2_south2_d2_", vec)

#day 2 south 3
d2s3<-grep("south3_d2", df$FilePath)
vec<-df[d2s3, 2]
df[d2s3, 2]<-paste0("day2_south3_d2_", vec)
#########################################################
# Day 3

#day 3 middle 1
d3m1<-grep("middle1_d3", df$FilePath)
vec<-df[d3m1,2]
df[d3m1, 2]<-paste0("day3_middle1_d3_",vec)

#day 3 middle 2
d3m2<-grep("middle2_d3", df$FilePath)
vec<-df[d3m2, 2]
df[d3m2, 2]<-paste0("day3_middle2_d3_",vec)

#day 3 middle 3
d3m3<-grep("middle3_d3", df$FilePath)
vec<-df[d3m3, 2]
df[d3m3, 2]<-paste0("day3_middle3_d3_",vec)

#day 3 north 1
d3n1<-grep("north1_d3", df$FilePath)
vec<-df[d3n1, 2]
df[d3n1, 2]<-paste0("day3_north1_d3_", vec)

#day 3 north 2
d3n2<-grep("north2_d3", df$FilePath)
vec<-df[d3n2, 2]
df[d3n2, 2]<-paste0("day3_north2_d3_", vec)

#day 3 north 3
d3n3<-grep("north3_d3", df$FilePath)
vec<-df[d3n3, 2]
df[d3n3, 2]<-paste0("day3_north3_d3_", vec)

#day 3 south 1
d3s1<-grep("south1_d3", df$FilePath)
vec<-df[d3s1, 2]
df[d3s1, 2]<-paste0("day3_south1_d3_", vec)

#day 3 south 2
d3s2<-grep("south2_d3", df$FilePath)
vec<-df[d3s2, 2]
df[d3s2, 2]<-paste0("day3_south2_d3_", vec)

#day 3 south 3
d3s3<-grep("south3_d3", df$FilePath)
vec<-df[d3s3, 2]
df[d3s3, 2]<-paste0("day3_south3_d3_", vec)
##############################################################
# Day 4
#day 4 middle 1
d4m1<-grep("middle1_d4", df$FilePath)
vec<-df[d4m1,2]
df[d4m1, 2]<-paste0("day4_middle1_d4_",vec)

#day 4 middle 2
d4m2<-grep("middle2_d4", df$FilePath)
vec<-df[d4m2, 2]
df[d4m2, 2]<-paste0("day4_middle2_d4_",vec)

#day 4 middle 3
d4m3<-grep("middle3_d4", df$FilePath)
vec<-df[d4m3, 2]
df[d4m3, 2]<-paste0("day4_middle3_d4_",vec)

#day 4 north 1
d4n1<-grep("north1_d4", df$FilePath)
vec<-df[d4n1, 2]
df[d4n1, 2]<-paste0("day4_north1_d4_", vec)

#day 4 north 2
d4n2<-grep("north2_d4", df$FilePath)
vec<-df[d4n2, 2]
df[d4n2, 2]<-paste0("day4_north2_d4_", vec)

#day 4 north 3
d4n3<-grep("north3_d4", df$FilePath)
vec<-df[d4n3, 2]
df[d4n3, 2]<-paste0("day4_north3_d4_", vec)

#day 4 south 1
d4s1<-grep("south1_d4", df$FilePath)
vec<-df[d4s1, 2]
df[d4s1, 2]<-paste0("day4_south1_d4_", vec)

#day 4 south 2
d4s2<-grep("south2_d4", df$FilePath)
vec<-df[d4s2, 2]
df[d4s2, 2]<-paste0("day4_south2_d4_", vec)

#day 4 south 3
d4s3<-grep("south3_d4", df$FilePath)
vec<-df[d4s3, 2]
df[d4s3, 2]<-paste0("day4_south3_d4_", vec)
######################################################
# Day 5
#day 5 middle 1
d5m1<-grep("middle1_d5", df$FilePath)
vec<-df[d5m1,2]
df[d5m1, 2]<-paste0("day5_middle1_d5_",vec)

#day 5 middle 2
d5m2<-grep("middle2_d5", df$FilePath)
vec<-df[d5m2, 2]
df[d5m2, 2]<-paste0("day5_middle2_d5_",vec)

#day 5 middle 3
d5m3<-grep("middle3_d5", df$FilePath)
vec<-df[d5m3, 2]
df[d5m3, 2]<-paste0("day5_middle3_d5_",vec)

#day 5 north 1
d5n1<-grep("north1_d5", df$FilePath)
vec<-df[d5n1, 2]
df[d5n1, 2]<-paste0("day5_north1_d5_", vec)

#day 5 north 2
d5n2<-grep("north2_d5", df$FilePath)
vec<-df[d5n2, 2]
df[d5n2, 2]<-paste0("day5_north2_d5_", vec)

#day 5 north 3
d5n3<-grep("north3_d5", df$FilePath)
vec<-df[d5n3, 2]
df[d5n3, 2]<-paste0("day5_north3_d5_", vec)

#day 5 south 1
d5s1<-grep("south1_d5", df$FilePath)
vec<-df[d5s1, 2]
df[d5s1, 2]<-paste0("day5_south1_d5_", vec)

#day 5 south 2
d5s2<-grep("south2_d5", df$FilePath)
vec<-df[d5s2, 2]
df[d5s2, 2]<-paste0("day5_south2_d5_", vec)

#day 5 south 3
d5s3<-grep("south3_d5", df$FilePath)
vec<-df[d5s3, 2]
df[d5s3, 2]<-paste0("day5_south3_d5_", vec)
##################################################

# End of Swine Strength Project renaming

#########################################################
#########################################################
# Challenge Bait Project (40 subdirectories)

#24a1
i24a1<-grep("24a1", df$FilePath)
vec<-df[i24a1, 2]
df[i24a1, 2]<-paste0("Challenge_Bait_24a1_", vec)

#24a2
i24a2<-grep("24a2", df$FilePath)
vec<-df[i24a2, 2]
df[i24a2, 2]<-paste0("Challenge_Bait_24a2_", vec)

#24a3
i24a3<-grep("24a3", df$FilePath)
vec<-df[i24a3, 2]
df[i24a3, 2]<-paste0("Challenge_Bait_24a3_", vec)

#24a4
i24a4<-grep("24a4", df$FilePath)
vec<-df[i24a4, 2]
df[i24a4, 2]<-paste0("Challenge_Bait_24a4_", vec)

#24a5
i24a5<-grep("24a5", df$FilePath)
vec<-df[i24a5, 2]
df[i24a5, 2]<-paste0("Challenge_Bait_24a5_", vec)
#####################################################
#24b1
i24b1<-grep("24b1", df$FilePath)
vec<-df[i24b1, 2]
df[i24b1, 2]<-paste0("Challenge_Bait_24b1_", vec)

#24b2
i24b2<-grep("24b2", df$FilePath)
vec<-df[i24b2, 2]
df[i24b2, 2]<-paste0("Challenge_Bait_24b2_", vec)

#24b3
i24b3<-grep("24b3", df$FilePath)
vec<-df[i24b3, 2]
df[i24b3, 2]<-paste0("Challenge_Bait_24b3_", vec)

#24b4
i24b4<-grep("24b4", df$FilePath)
vec<-df[i24b4, 2]
df[i24b4, 2]<-paste0("Challenge_Bait_24b4_", vec)

#24b5
i24b5<-grep("24b5", df$FilePath)
vec<-df[i24b5, 2]
df[i24b5, 2]<-paste0("Challenge_Bait_24b5_", vec)
#######################################################
#25a1
i25a1<-grep("25a1", df$FilePath)
vec<-df[i25a1, 2]
df[i25a1, 2]<-paste0("Challenge_Bait_25a1_", vec)

#25a2
i25a2<-grep("25a2", df$FilePath)
vec<-df[i25a2, 2]
df[i25a2, 2]<-paste0("Challenge_Bait_25a2_", vec)

#25a3
i25a3<-grep("25a3", df$FilePath)
vec<-df[i25a3, 2]
df[i25a3, 2]<-paste0("Challenge_Bait_25a3_", vec)

#25a4
i25a4<-grep("25a4", df$FilePath)
vec<-df[i25a4, 2]
df[i25a4, 2]<-paste0("Challenge_Bait_25a4_", vec)

#25a5
i25a5<-grep("25a5", df$FilePath)
vec<-df[i25a5, 2]
df[i25a5, 2]<-paste0("Challenge_Bait_25a5_", vec)
######################################################
#25b1
i25b1<-grep("25b1", df$FilePath)
vec<-df[i25b1, 2]
df[i25b1, 2]<-paste0("Challenge_Bait_25b1_", vec)

#25b2
i25b2<-grep("25b2", df$FilePath)
vec<-df[i25b2, 2]
df[i25b2, 2]<-paste0("Challenge_Bait_25b2_", vec)

#25b3
i25b3<-grep("25b3", df$FilePath)
vec<-df[i25b3, 2]
df[i25b3, 2]<-paste0("Challenge_Bait_25b3_", vec)

#25b4
i25b4<-grep("25b4", df$FilePath)
vec<-df[i25b4, 2]
df[i25b4, 2]<-paste0("Challenge_Bait_25b4_", vec)

#25b5
i25b5<-grep("25b5", df$FilePath)
vec<-df[i25b5, 2]
df[i25b5, 2]<-paste0("Challenge_Bait_25b5_", vec)
####################################################
####################################################
#T1a1
iT1a1<-grep("T1a1", df$FilePath)
vec<-df[iT1a1, 2]
df[iT1a1, 2]<-paste0("Challenge_Bait_T1a1_", vec)

#T1a2
iT1a2<-grep("T1a2", df$FilePath)
vec<-df[iT1a2, 2]
df[iT1a2, 2]<-paste0("Challenge_Bait_T1a2_", vec)

#T1a3
iT1a3<-grep("T1a3", df$FilePath)
vec<-df[iT1a3, 2]
df[iT1a3, 2]<-paste0("Challenge_Bait_T1a3_", vec)

#T1a4
iT1a4<-grep("T1a4", df$FilePath)
vec<-df[iT1a4, 2]
df[iT1a4, 2]<-paste0("Challenge_Bait_T1a4_", vec)

#T1a5
iT1a5<-grep("T1a5", df$FilePath)
vec<-df[iT1a5, 2]
df[iT1a5, 2]<-paste0("Challenge_Bait_T1a5_", vec)
##################################
#T1b1
iT1b1<-grep("T1b1", df$FilePath)
vec<-df[iT1b1, 2]
df[iT1b1, 2]<-paste0("Challenge_Bait_T1b1_", vec)

#T1b2
iT1b2<-grep("T1b2", df$FilePath)
vec<-df[iT1b2, 2]
df[iT1b2, 2]<-paste0("Challenge_Bait_T1b2_", vec)

#T1b3
iT1b3<-grep("T1b3", df$FilePath)
vec<-df[iT1b3, 2]
df[iT1b3, 2]<-paste0("Challenge_Bait_T1b3_", vec)

#T1b4
iT1b4<-grep("T1b4", df$FilePath)
vec<-df[iT1b4, 2]
df[iT1b4, 2]<-paste0("Challenge_Bait_T1b4_", vec)

#T1b5
iT1b5<-grep("T1b5", df$FilePath)
vec<-df[iT1b5, 2]
df[iT1b5, 2]<-paste0("Challenge_Bait_T1b5_", vec)
####################################################
#T2a1
iT2a1<-grep("T2a1", df$FilePath)
vec<-df[iT2a1, 2]
df[iT2a1, 2]<-paste0("Challenge_Bait_T2a1_", vec)

#T2a2
iT2a2<-grep("T2a2", df$FilePath)
vec<-df[iT2a2, 2]
df[iT2a2, 2]<-paste0("Challenge_Bait_T2a2_", vec)

#T2a3
iT2a3<-grep("T2a3", df$FilePath)
vec<-df[iT2a3, 2]
df[iT2a3, 2]<-paste0("Challenge_Bait_T2a3_", vec)

#T2a4
iT2a4<-grep("T2a4", df$FilePath)
vec<-df[iT2a4, 2]
df[iT2a4, 2]<-paste0("Challenge_Bait_T2a4_", vec)

#T2a5
iT2a5<-grep("T2a5", df$FilePath)
vec<-df[iT2a5, 2]
df[iT2a5, 2]<-paste0("Challenge_Bait_T2a5_", vec)
########################################################
#T2b1
iT2b1<-grep("T2b1", df$FilePath)
vec<-df[iT2b1, 2]
df[iT2b1, 2]<-paste0("Challenge_Bait_T2b1_", vec)

#T2b2
iT2b2<-grep("T2b2", df$FilePath)
vec<-df[iT2b2, 2]
df[iT2b2, 2]<-paste0("Challenge_Bait_T2b2_", vec)

#T2b3
iT2b3<-grep("T2b3", df$FilePath)
vec<-df[iT2b3, 2]
df[iT2b3, 2]<-paste0("Challenge_Bait_T2b3_", vec)

#T2b4
iT2b4<-grep("T2b4", df$FilePath)
vec<-df[iT2b4, 2]
df[iT2b4, 2]<-paste0("Challenge_Bait_T2b4_", vec)

#T2b5
iT2b5<-grep("T2b5", df$FilePath)
vec<-df[iT2b5, 2]
df[iT2b5, 2]<-paste0("Challenge_Bait_T2b5_", vec)
########################################################
########################################################
setwd("~/Projects/Photo Database/Machine Learning/Materials from Collaborators/NWRC")
write.csv(df, "NWRC_all.csv")





