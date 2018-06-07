###############################################################################
#########         File-renaming               ################################
###############################################################################

#############################################################################################################
# Project 1   PigVacuum
# 368 folders, ~114,000 photos

# Root:     F:/PigVacuum                                                       #one folder

# Level 2:  F:/PigVacuum/CameraBaitStationPics                                 #one folder

# Level 3:  F:/PigVacuum/CameraBaitStationPics/LandfillBaitStations1           # 4 folders
#           F:/PigVacuum/CameraBaitStationPics/LandfillBaitStations2
#           F:/PigVacuum/CameraBaitStationPics/MixedbaitStations1
#           F:/PigVacuum/CameraBaitStationPics/MixedbaitStations2

# Level 4:  F:/PigVacuum/CameraBaitStationPics/LandfillBaitStations1/ACAM01    # 42 folders  # with RECNX layers
#           F:/PigVacuum/CameraBaitStationPics/LandfillBaitStations2/ACAM01    # same 42 folders # *mostly without* RECNX layers
#           F:/PigVacuum/CameraBaitStationPics/MixedBaitStations1/ACAM101      # 55 folders
#           F:/PigVacuum/CameraBaitStationPics/MixedBaitStations2/ACAM101      # same 55 folders

# Level 5: F:/PigVacuum/CameraBaitStationPics/LandfillBaitStations1/ACAM01/100RECNX    #sometime one, sometimes multiple

# Level 6: Images  pattern IMG_001-IMG_end
#############################################################################################################
# Project 1  PigVacuum

#I'll pull off the unique string of the file path and paste onto the non-unique image filename.

# LandfillBaitStations1
# ACAM01
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM01/100RECNX")
olds<-list.files()  #for some reason it is also adding a "Thumbs.db" file to the end of the list.
file.rename(olds, paste0("LandfillBaitStations1_ACAM01_100RECNX_", olds))
###########################

# ACAM02
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM02/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM02_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM02/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM02_101RECNX_", olds))
###########################

#etc, this is the general pattern...
################################################################################################################

###############################################################################
#########        Rebuilding the csv              ##############################
###############################################################################
library(dplyr)
library(stringr)

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