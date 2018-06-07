# SREL csv reorganization to match file renaming
library(dplyr)
library(stringr)

# Overview of raw images and raw csv files.
getwd()

#Import raw csv's
cs<-read.csv("~/Projects/Photo Database/Machine Learning/ML_R_file_manipulation/Data/srel_raw_csvs/SREL_ContactStudy_PhotoID_Classified.csv",
             na.strings = "", stringsAsFactors = F)
vac<-read.csv("~/Projects/Photo Database/Machine Learning/ML_R_file_manipulation/Data/srel_raw_csvs/SREL_VacuumPhotoID_Classified.csv",
              na.strings = c("", " "), stringsAsFactors = F)

head(cs)
head(vac)
unique(cs$SpeciesID)
table(cs$SpeciesID)
table(vac$Species)

#Tasks
# 1) Change filenames to reflect the altered filenames in pooled directory
# 2) Do some recoding...make sure blanks and zeros are proper NA's

# Here are the resized files
setwd("F:/Pooled_Images")
srel.files<-list.files()
head(srel.files)

# So there are 127,152 images, and 137,382 rows in the csv, so I might have extra label info.  
# I deleted the images that were in the folders marked "extra" because Peter confirmed that they were not ID'ed.

#####################################################################################################################
# Combine csv's
names(cs)
names(vac)

apply(is.na(cs), 2, sum)
apply(is.na(vac), 2, sum)

#Recode NA's and 0's in species column as 'None'
cs$SpeciesID[is.na(cs$SpeciesID)]="None"
vac$Species[is.na(vac$Species)]="None"
cs$SpeciesID[cs$SpeciesID==0]="None"

colnames(cs)[4]<-"Species"
colnames(vac)[7]<-"FilePath"
cs$study<-"Contact_Study"
vac$study<-"Vacuum_Study"

df<-rbind(cs[,c("Image.Name", "Species", "study", "FilePath")], vac[,c("Image.Name", "Species", "study", "FilePath")])


vac.dirs<-list.dirs(path="F:/PigVacuum", full.names = T, recursive = T)

#Eliminate "extra" folders because I deleted those
vac.dirs<-vac.dirs[!grepl("Extra", vac.dirs)]

#Need to remove all the folders that are not directly containing images
# This isn't so simple because there wasn't a regular pattern of which folders had RECNX subdirectories and which didn't

#  I'll cut out some of the parent directories that don't contain any images
nchar("F:/PigVacuum/CameraBaitStationPics/MixedBaitStations2")
nchar("F:/PigVacuum/CameraBaitStationPics/LandfillBaitStations1")
vac.dirs<-vac.dirs[nchar(vac.dirs)>56]  #everything that has images has to be longer than this

#  I'll cut out "F:/PigVacuum/CameraBaitStationPics/" from all the directories, so I can match with grep

# Function to chop strings at a certain backslash
get_string <- function(vec, n) {
  if(n == 'last'){
    positions <- lapply(gregexpr(pattern ='/',vec), function(x) x[length(x)] + 1)
  }else{
    positions <- lapply(gregexpr(pattern ='/',vec), function(x) x[n] + 1)
  }
  substring(vec, positions)
}

# Remove everything after the 3rd backslash (everything before is non-unique)
vac.dirs<-as.vector(sapply(vac.dirs, function(x) {get_string(x, 3)}))

#Now I just have to cut out all the parent folders to RECNX folders that contained images, but
# I can't only retain RECNX folders because many directories didn't have them.... :(

# I'll do it in a loop for all the folders that have 100RECNX as the first sub-directory
for(i in 1:length(vac.dirs)){
  if(grepl("100RECNX", vac.dirs[i])==T){
    vac.dirs<-vac.dirs[-(i-1)]
  }
}
    
# This works on the vast majority of cases where the first (or only) subdirectory is 100RECNX.
# There are a few cases where it skips 100 and starts with 101.  I'll pick those out by hand becuase that seems fastest.

# Here are those cases:

# LandfillBaitStations2/ACAM10/101RECNX
# MixedBaitStations1/ACAM121/101RECNX
grep("LandfillBaitStations2/ACAM10", vac.dirs)
vac.dirs<-vac.dirs[-80] #remove empty parent dir

 
grep("MixedBaitStations1/ACAM121", vac.dirs)
vac.dirs<-vac.dirs[-136] #remove empty parent dir           

# Now, these are the folders that I want to paste to the image filenames when remaking the csv

#have separate strings with underscores instead of backslashes for pasting names
new.dirs<-str_replace_all(vac.dirs, fixed("/"), "_")
new.dirs1<-paste0(new.dirs, "_")

# I'll just get rid of the backslashes from the filenames in the csv first
df$new.path<-str_replace_all(df$FilePath, fixed("\\"), "_")

# This will fix the image names for the entire Vacuum Study
for(i in 1:length(new.dirs)){
  tmp<-grep(new.dirs[i], df$new.path)
  vec<-df[tmp,1]
  df[tmp,1]<-paste0(new.dirs1[i], vec)
}
##########################################################################################################
# unfortunately I deleted the images in the folder for the ContactStudy (they are in the pooled folder though),
# so I can't repeat the above steps for the other project.  I'll do it the old-fashioned way by hand

# Project 2 ContactStudy_GridPhotos

#ACAM201
#100
tmp<-grep("ACAM201_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM201_100RECNX_",vec)
#############################################

#ACAM202
#100
tmp<-grep("ACAM202_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM202_100RECNX_",vec)
############################################

#ACAM203
#100
tmp<-grep("ACAM203_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM203_100RECNX_",vec)

#101
tmp<-grep("ACAM203_101RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM203_101RECNX_",vec)
#############################################

#ACAM204
#100
tmp<-grep("ACAM204_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM204_100RECNX_",vec)

#101
tmp<-grep("ACAM204_101RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM204_101RECNX_",vec)
#############################################

#ACAM205
#100
tmp<-grep("ACAM205_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM205_100RECNX_",vec)
############################################

#ACAM206
#100
tmp<-grep("ACAM206_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM206_100RECNX_",vec)
############################################

#ACAM207
#100
tmp<-grep("ACAM207_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM207_100RECNX_",vec)

#101
tmp<-grep("ACAM207_101RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM207_101RECNX_",vec)

#101
tmp<-grep("ACAM207_102RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM207_102RECNX_",vec)
#############################################

#ACAM208
#102   ***skipped 100 and 101****
tmp<-grep("ACAM208_102RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM208_102RECNX_",vec)
############################################

#ACAM209
#101  **skipped 100**
tmp<-grep("ACAM209_101RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM209_101RECNX_",vec)
############################################

#ACAM210
#100
tmp<-grep("ACAM210_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM210_100RECNX_",vec)

#101
tmp<-grep("ACAM210_101RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM210_101RECNX_",vec)
#############################################

#ACAM211
#101  **skipped 100**
tmp<-grep("ACAM211_101RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM211_101RECNX_",vec)

#102
tmp<-grep("ACAM211_102RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM211_102RECNX_",vec)
#############################################

#ACAM212
#100
tmp<-grep("ACAM212_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM212_100RECNX_",vec)
############################################

#ACAM213
#100
tmp<-grep("ACAM213_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM213_100RECNX_",vec)

#101
tmp<-grep("ACAM213_101RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM213_101RECNX_",vec)
#############################################

#ACAM214
#100
tmp<-grep("ACAM214_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM214_100RECNX_",vec)
############################################

#ACAM215
#100
tmp<-grep("ACAM215_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM215_100RECNX_",vec)

#101
tmp<-grep("ACAM215_101RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM215_101RECNX_",vec)
#############################################

#ACAM216
#101
tmp<-grep("ACAM216_101RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM216_101RECNX_",vec)

#102
tmp<-grep("ACAM216_102RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM216_102RECNX_",vec)

#103
tmp<-grep("ACAM216_103RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM216_103RECNX_",vec)
#############################################

#ACAM217
#100
tmp<-grep("ACAM217_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM217_100RECNX_",vec)
############################################

#ACAM218
#102  *skipped 100 and 101**
tmp<-grep("ACAM218_102RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM218_102RECNX_",vec)
############################################

#ACAM219
#100
tmp<-grep("ACAM219_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM219_100RECNX_",vec)

#101
tmp<-grep("ACAM219_101RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM219_101RECNX_",vec)
#############################################

#ACAM220
#100
tmp<-grep("ACAM220_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM220_100RECNX_",vec)

#101
tmp<-grep("ACAM220_101RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM220_101RECNX_",vec)

#102
tmp<-grep("ACAM220_102RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM220_102RECNX_",vec)
#############################################

#ACAM221
#102  **skipped 100 and 101**
tmp<-grep("ACAM221_102RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM221_102RECNX_",vec)
############################################

#ACAM222
#100
tmp<-grep("ACAM222_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM222_100RECNX_",vec)

#101
tmp<-grep("ACAM222_101RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM222_101RECNX_",vec)
#############################################

#ACAM223
#100
tmp<-grep("ACAM223_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM223_100RECNX_",vec)
############################################

#ACAM224
#100
tmp<-grep("ACAM224_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM224_100RECNX_",vec)

#101
tmp<-grep("ACAM224_101RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM224_101RECNX_",vec)
#############################################

#ACAM225
#100
tmp<-grep("ACAM225_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM225_100RECNX_",vec)

#101
tmp<-grep("ACAM225_101RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM225_101RECNX_",vec)

#102
tmp<-grep("ACAM225_102RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM225_102RECNX_",vec)
#############################################

#ACAM226
#102
tmp<-grep("ACAM226_102RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM226_102RECNX_",vec)
############################################

#ACAM227
#100
tmp<-grep("ACAM227_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM227_100RECNX_",vec)
############################################

#ACAM228
#101
tmp<-grep("ACAM228_101RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM228_101RECNX_",vec)
############################################

#ACAM229
#100
tmp<-grep("ACAM229_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM229_100RECNX_",vec)
############################################

#ACAM230
#100
tmp<-grep("ACAM230_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM230_100RECNX_",vec)

#101
tmp<-grep("ACAM230_101RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM230_101RECNX_",vec)
#############################################

#ACAM231
#100
tmp<-grep("ACAM231_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM231_100RECNX_",vec)
############################################

#ACAM232
#100  
tmp<-grep("ACAM232_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM232_100RECNX_",vec)

#104  *skipped 101-103*
tmp<-grep("ACAM232_104RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM232_104RECNX_",vec)
#############################################

#ACAM233
#100
tmp<-grep("ACAM233_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM233_100RECNX_",vec)

#101
tmp<-grep("ACAM233_101RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM233_101RECNX_",vec)
#############################################

#ACAM234
#100
tmp<-grep("ACAM234_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM234_100RECNX_",vec)

#101
tmp<-grep("ACAM234_101RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM234_101RECNX_",vec)

#102
tmp<-grep("ACAM234_102RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM234_102RECNX_",vec)
#############################################

#ACAM235
#101
tmp<-grep("ACAM235_101RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM235_101RECNX_",vec)

#102
tmp<-grep("ACAM235_102RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM235_102RECNX_",vec)
#############################################

#ACAM236
#100
tmp<-grep("ACAM236_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM236_100RECNX_",vec)

#101
tmp<-grep("ACAM236_101RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM236_101RECNX_",vec)
#############################################

#ACAM237
#100
tmp<-grep("ACAM237_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM237_100RECNX_",vec)
############################################

#ACAM238
#100
tmp<-grep("ACAM238_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM238_100RECNX_",vec)
############################################

#ACAM240
#100
tmp<-grep("ACAM240_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM240_100RECNX_",vec)

#101
tmp<-grep("ACAM240_101RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM240_101RECNX_",vec)
#############################################

#ACAM241
#100
tmp<-grep("ACAM241_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM241_100RECNX_",vec)

#101
tmp<-grep("ACAM241_101RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM241_101RECNX_",vec)

#102
tmp<-grep("ACAM241_102RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM241_102RECNX_",vec)
#############################################

#ACAM242
#100
tmp<-grep("ACAM242_100RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM242_100RECNX_",vec)

#101
tmp<-grep("ACAM242_101RECNX", df$new.path)
vec<-df[tmp, 1]
df[tmp,1]<-paste0("ACAM242_101RECNX_",vec)
#############################################
setwd("F:/")
write.csv(df, "Pooled.csv")

# A check.  Found one folder that just wasn't run.  Seems to be all good now.
# summary(nchar(df$Image.Name))
# bob<-df[nchar(df$Image.Name)<39,]
# summary(nchar(bob$Image.Name))
# b1<-bob[nchar(bob$Image.Name)<29,]
