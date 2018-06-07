#Convert Peter SREL photo files to unique file names

#Two Projects to deal with: 1) PigVacuum and 2) ContactStudy_GridPhotos


#############################################################################################################
# Project 2    ContactStudy_GridPhotos
# 111 folders, 17,394 photos

# Root:       F:/ContactStudy_GridPhotos

# Level 2:    F:/ContactStudy_GridPhotos/ACAM201       # 41 folders

# Level 3:   F:/ContactStudy_GridPhotos/ACAM201/100RECNX  # 

# Level 4:  Images
#############################################################################################################

#Project 2 ContactSudy_GridPhotos

# ACAM201
#100RECNX
setwd("F:/Contact_Copy/ACAM201/100RECNX")
olds<-list.files()  #for some reason it is also adding a "Thumbs.db" file to the end of the list.
file.rename(olds, paste0("ACAM201_100RECNX_", olds))
###########################

# ACAM202
#100RECNX
setwd("F:/Contact_Copy/ACAM202/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM202_100RECNX_", olds))
###########################

# ACAM203
#100RECNX
setwd("F:/Contact_Copy/ACAM203/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM203_100RECNX_", olds))

#101RECNX
setwd("F:/Contact_Copy/ACAM203/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM203_101RECNX_", olds))
###########################

# ACAM204
#100RECNX
setwd("F:/Contact_Copy/ACAM204/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM204_100RECNX_", olds))

#101RECNX
setwd("F:/Contact_Copy/ACAM204/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM204_101RECNX_", olds))
###########################

# ACAM205
#100RECNX
setwd("F:/Contact_Copy/ACAM205/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM205_100RECNX_", olds))
###########################

# ACAM206
#100RECNX
setwd("F:/Contact_Copy/ACAM206/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM206_100RECNX_", olds))
###########################

# ACAM207
#100RECNX
setwd("F:/Contact_Copy/ACAM207/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM207_100RECNX_", olds))

#101RECNX
setwd("F:/Contact_Copy/ACAM207/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM207_101RECNX_", olds))

#102RECNX
setwd("F:/Contact_Copy/ACAM207/102RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM207_102RECNX_", olds))
###########################

# ACAM208
#102RECNX
setwd("F:/Contact_Copy/ACAM208/102RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM208_102RECNX_", olds))
###########################

# ACAM209
#101RECNX
setwd("F:/Contact_Copy/ACAM209/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM209_101RECNX_", olds))
###########################

# ACAM210
#100RECNX
setwd("F:/Contact_Copy/ACAM210/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM210_100RECNX_", olds))

#101RECNX
setwd("F:/Contact_Copy/ACAM210/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM210_101RECNX_", olds))
###########################

# ACAM211
#101RECNX
setwd("F:/Contact_Copy/ACAM211/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM211_101RECNX_", olds))

#102RECNX
setwd("F:/Contact_Copy/ACAM211/102RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM211_102RECNX_", olds))
###########################

# ACAM212
#100RECNX
setwd("F:/Contact_Copy/ACAM212/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM212_100RECNX_", olds))
###########################

# ACAM213
#100RECNX
setwd("F:/Contact_Copy/ACAM213/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM213_100RECNX_", olds))

#101RECNX
setwd("F:/Contact_Copy/ACAM213/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM213_101RECNX_", olds))
###########################

# ACAM214
#100RECNX
setwd("F:/Contact_Copy/ACAM214/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM214_100RECNX_", olds))
###########################

# ACAM215
#100RECNX
setwd("F:/Contact_Copy/ACAM215/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM215_100RECNX_", olds))

#101RECNX
setwd("F:/Contact_Copy/ACAM215/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM215_101RECNX_", olds))
###########################

# ACAM216
#101RECNX
setwd("F:/Contact_Copy/ACAM216/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM216_101RECNX_", olds))

#102RECNX
setwd("F:/Contact_Copy/ACAM216/102RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM216_102RECNX_", olds))

#103RECNX
setwd("F:/Contact_Copy/ACAM216/103RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM216_103RECNX_", olds))
###########################

# ACAM217
#100RECNX
setwd("F:/Contact_Copy/ACAM217/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM217_100RECNX_", olds))
###########################

# ACAM218
#102RECNX
setwd("F:/Contact_Copy/ACAM218/102RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM218_102RECNX_", olds))
###########################

# ACAM219
#100RECNX
setwd("F:/Contact_Copy/ACAM219/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM219_100RECNX_", olds))

#101RECNX
setwd("F:/Contact_Copy/ACAM219/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM219_101RECNX_", olds))
###########################

# ACAM220
#100RECNX
setwd("F:/Contact_Copy/ACAM220/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM220_100RECNX_", olds))

#101RECNX
setwd("F:/Contact_Copy/ACAM220/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM220_101RECNX_", olds))

#102RECNX
setwd("F:/Contact_Copy/ACAM220/102RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM220_102RECNX_", olds))
###########################

# ACAM221
#102RECNX
setwd("F:/Contact_Copy/ACAM221/102RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM221_102RECNX_", olds))
###########################

# ACAM222
#100RECNX
setwd("F:/Contact_Copy/ACAM222/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM222_100RECNX_", olds))

#101RECNX
setwd("F:/Contact_Copy/ACAM222/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM222_101RECNX_", olds))
###########################

# ACAM223
#100RECNX
setwd("F:/Contact_Copy/ACAM223/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM223_100RECNX_", olds))
###########################

# ACAM224
#100RECNX
setwd("F:/Contact_Copy/ACAM224/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM224_100RECNX_", olds))

#101RECNX
setwd("F:/Contact_Copy/ACAM224/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM224_101RECNX_", olds))
###########################

# ACAM225
#100RECNX
setwd("F:/Contact_Copy/ACAM225/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM225_100RECNX_", olds))

#101RECNX
setwd("F:/Contact_Copy/ACAM225/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM225_101RECNX_", olds))

#102RECNX
setwd("F:/Contact_Copy/ACAM225/102RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM225_102RECNX_", olds))
###########################

# ACAM226
#101RECNX  - folder present but empty -

#102RECNX
setwd("F:/Contact_Copy/ACAM226/102RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM226_102RECNX_", olds))
###########################

# ACAM227
#100RECNX
setwd("F:/Contact_Copy/ACAM227/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM227_100RECNX_", olds))
###########################

# ACAM228
#101RECNX
setwd("F:/Contact_Copy/ACAM228/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM228_101RECNX_", olds))
###########################

# ACAM229
#100RECNX
setwd("F:/Contact_Copy/ACAM229/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM229_100RECNX_", olds))
###########################

# ACAM230
#100RECNX
setwd("F:/Contact_Copy/ACAM230/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM230_100RECNX_", olds))

#101RECNX
setwd("F:/Contact_Copy/ACAM230/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM230_101RECNX_", olds))
###########################

# ACAM231
#100RECNX
setwd("F:/Contact_Copy/ACAM231/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM231_100RECNX_", olds))
###########################

# ACAM232
#100RECNX
setwd("F:/Contact_Copy/ACAM232/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM232_100RECNX_", olds))

#104RECNX
setwd("F:/Contact_Copy/ACAM232/104RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM232_104RECNX_", olds))
###########################

# ACAM233
#100RECNX
setwd("F:/Contact_Copy/ACAM233/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM233_100RECNX_", olds))

#101RECNX
setwd("F:/Contact_Copy/ACAM233/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM233_101RECNX_", olds))
###########################

# ACAM234
#100RECNX
setwd("F:/Contact_Copy/ACAM234/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM234_100RECNX_", olds))

#101RECNX
setwd("F:/Contact_Copy/ACAM234/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM234_101RECNX_", olds))

#102RECNX
setwd("F:/Contact_Copy/ACAM234/102RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM234_102RECNX_", olds))
###########################

# ACAM235
#101RECNX
setwd("F:/Contact_Copy/ACAM235/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM235_101RECNX_", olds))

#102RECNX
setwd("F:/Contact_Copy/ACAM235/102RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM235_102RECNX_", olds))
###########################

# ACAM236
#100RECNX
setwd("F:/Contact_Copy/ACAM236/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM236_100RECNX_", olds))

#101RECNX
setwd("F:/Contact_Copy/ACAM236/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM236_101RECNX_", olds))
###########################

# ACAM237
#100RECNX
setwd("F:/Contact_Copy/ACAM237/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM237_100RECNX_", olds))
###########################

# ACAM238
#100RECNX
setwd("F:/Contact_Copy/ACAM238/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM238_100RECNX_", olds))
###########################

# ACAM240
#100RECNX
setwd("F:/Contact_Copy/ACAM240/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM240_100RECNX_", olds))

#101RECNX
setwd("F:/Contact_Copy/ACAM240/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM240_101RECNX_", olds))
###########################

# ACAM241
#100RECNX
setwd("F:/Contact_Copy/ACAM241/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM241_100RECNX_", olds))

#101RECNX
setwd("F:/Contact_Copy/ACAM241/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM241_101RECNX_", olds))

#102RECNX
setwd("F:/Contact_Copy/ACAM241/102RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM241_102RECNX_", olds))
###########################

# ACAM242
#100RECNX
setwd("F:/Contact_Copy/ACAM242/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM242_100RECNX_", olds))

#101RECNX
setwd("F:/Contact_Copy/ACAM242/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("ACAM242_101RECNX_", olds))
###########################