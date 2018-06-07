#Convert Peter SREL photo files to unique file names

#Two Projects to deal with: 1) PigVacuum and 2) ContactStudy_GridPhotos

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

#############################################################################################################
# Project 2    ContactStudy_GridPhotos
# 111 folders, 17,394 photos

# Root:       F:/ContactStudy_GridPhotos

# Level 2:    F:/ContactStudy_GridPhotos/ACAM201       # 42 folders

# Level 3:   F:/ContactStudy_GridPhotos/ACAM201/100RECNX  # 

# Level 4:  Images
#############################################################################################################

# Project 1  PigVacuum

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

# ACAM03
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM03/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM03_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM03/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM03_101RECNX_", olds))
###########################

# ACAM04
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM04/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM04_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM04/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM04_101RECNX_", olds))

#102RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM04/102RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM04_102RECNX_", olds))
###########################

# ACAM05
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM05/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM05_100RECNX_", olds))
###########################

# ACAM06
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM06/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM06_100RECNX_", olds))
###########################

# ACAM07
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM07/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM07_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM07/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM07_101RECNX_", olds))
###########################

# ACAM08
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM08/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM08_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM08/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM08_101RECNX_", olds))
###########################

# ACAM09
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM09/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM09_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM09/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM09_101RECNX_", olds))
###########################

# ACAM10
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM10/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM10_100RECNX_", olds))
###########################

# ACAM11
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM11/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM11_100RECNX_", olds))
###########################

# ACAM12
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM12/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM12_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM12/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM12_101RECNX_", olds))
###########################

# ACAM13
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM13/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM13_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM13/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM13_101RECNX_", olds))
###########################

# ACAM14
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM14/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM14_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM14/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM14_101RECNX_", olds))
###########################

# ACAM15
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM15/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM15_100RECNX_", olds))
###########################

# ACAM16
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM16/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM16_100RECNX_", olds))
###########################

# ACAM17
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM17/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM17_100RECNX_", olds))
###########################

# ACAM18
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM18/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM18_100RECNX_", olds))
###########################

# ACAM19
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM19/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM19_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM19/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM19_101RECNX_", olds))
###########################

# ACAM20
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM20/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM20_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM20/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM20_101RECNX_", olds))
###########################

# ACAM21
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM21/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM21_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM21/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM21_101RECNX_", olds))
###########################

# ACAM22
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM22/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM22_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM22/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM22_101RECNX_", olds))
###########################

# ACAM23
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM23/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM23_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM23/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM23_101RECNX_", olds))
###########################

# ACAM24
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM24/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM24_100RECNX_", olds))
###########################

# ACAM25
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM25/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM25_100RECNX_", olds))
###########################

# ACAM26
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM26/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM26_100RECNX_", olds))
###########################

# ACAM27
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM27/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM27_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM27/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM27_101RECNX_", olds))
###########################

# ACAM28
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM28/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM28_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM28/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM28_101RECNX_", olds))
###########################

# ACAM29
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM29/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM29_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM29/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM29_101RECNX_", olds))
###########################

# ACAM30
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM30/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM30_100RECNX_", olds))
###########################

# ACAM31
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM31/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM31_100RECNX_", olds))
###########################

# ACAM32
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM32/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM32_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM32/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM32_101RECNX_", olds))
###########################

# ACAM33
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM33/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM33_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM33/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM33_101RECNX_", olds))
###########################

# ACAM34
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM34/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM34_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM34/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM34_101RECNX_", olds))
###########################

# ACAM35
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM35/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM35_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM35/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM35_101RECNX_", olds))
###########################

# ACAM36
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM36/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM36_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM36/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM36_101RECNX_", olds))
###########################

# ACAM37
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM37/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM37_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM37/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM37_101RECNX_", olds))
###########################

# LandfillBaitStations1/ACAM38 is empty

# ACAM39
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM39/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM39_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM39/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM39_101RECNX_", olds))
###########################

# ACAM40
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM40/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM40_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM40/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM40_101RECNX_", olds))
###########################

# ACAM41
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM41/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM41_100RECNX_", olds))

#103RECNX   *unorthodox naming format, 103 instead of 101*
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM41/103RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM41_103RECNX_", olds))
###########################

# ACAM42
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM42/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM42_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations1/ACAM42/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations1_ACAM42_101RECNX_", olds))
###########################
#############################################################################################
#############################################################################################


#############################################################################################
#############################################################################################
# LandfillBaitStations2

# ACAM01
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM01")
olds<-list.files()  #for some reason it is also adding a "Thumbs.db" file to the end of the list.
file.rename(olds, paste0("LandfillBaitStations2_ACAM01_", olds))
###########################

# ACAM02
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM02")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM02_", olds))
###########################

# ACAM03
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM03")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM03_", olds))
###########################

# ACAM04

setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM04")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM04_", olds))
###########################

# ACAM05
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM05")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM05_", olds))
###########################

# ACAM06
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM06")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM06_", olds))
###########################

# ACAM07
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM07")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM07_", olds))
###########################

# ACAM08
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM08")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM08_", olds))
###########################

# ACAM09
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM09")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM09_", olds))
###########################

# ACAM10
#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM10/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM10_101RECNX_", olds))
###########################

# ACAM11
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM11")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM11_", olds))
###########################

# ACAM12
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM12")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM12_", olds))
###########################

# ACAM13
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM13")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM13_", olds))
###########################

# ACAM14
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM14")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM14_", olds))
###########################

# ACAM15
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM15")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM15_", olds))
###########################

# ACAM16
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM16")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM16_", olds))
###########################

# ACAM17
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM17")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM17_", olds))
###########################

# ACAM18
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM18")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM18_", olds))
###########################

# ACAM19
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM19")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM19_", olds))
###########################

# ACAM20
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM20")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM20_", olds))
###########################

# ACAM21
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM21")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM21_", olds))
###########################

# ACAM22
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM22")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM22_", olds))
###########################

# ACAM23
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM23")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM23_", olds))
###########################

# ACAM24
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM24")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM24_", olds))
###########################

# ACAM25
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM25")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM25_", olds))
###########################

# ACAM26
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM26")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM26_", olds))
###########################

# ACAM27
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM27")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM27_", olds))
###########################

# ACAM28
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM28")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM28_", olds))
###########################

# ACAM29
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM29")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM29_", olds))
###########################

# ACAM30
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM30")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM30_", olds))
###########################

# ACAM31
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM31")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM31_", olds))
###########################

# ACAM32
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM32")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM32_", olds))
###########################

# ACAM33
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM33")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM33_", olds))
###########################

# ACAM34
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM34")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM34_", olds))
###########################

# ACAM35
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM35")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM35_", olds))
###########################

# ACAM36
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM36/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM36_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM36/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM36_101RECNX_", olds))
###########################

# ACAM37
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM37")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM37_", olds))
###########################

# ACAM38
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM38")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM38_", olds))
###########################

# ACAM39
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM39")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM39_", olds))
###########################

# ACAM40
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM40")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM40_", olds))
###########################

# ACAM41
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM41")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM41_", olds))
###########################

# ACAM42
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/LandfillBaitStations2/ACAM42")
olds<-list.files() 
file.rename(olds, paste0("LandfillBaitStations2_ACAM42_", olds))
###########################

#############################################################################################
#############################################################################################
#############################################################################################
#############################################################################################
# MixedBaitStations1

# ACAM101
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM101/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM101_100RECNX_", olds))
###########################

# ACAM102
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM102/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM102_100RECNX_", olds))
###########################

# ACAM103
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM103/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM103_100RECNX_", olds))
###########################

# ACAM104
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM104/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM104_100RECNX_", olds))
###########################

# ACAM105
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM105/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM105_100RECNX_", olds))
###########################

# ACAM106
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM106/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM106_100RECNX_", olds))
###########################

# ACAM107
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM107/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM107_100RECNX_", olds))
###########################

# ACAM108
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM108/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM108_100RECNX_", olds))
###########################

# ACAM109
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM109/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM109_100RECNX_", olds))
###########################

# ACAM110
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM110/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM110_100RECNX_", olds))
###########################

# ACAM111
#100RECNX   --folder exists, but it's empty--

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM111/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM111_101RECNX_", olds))
###########################

# ACAM112
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM112/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM112_100RECNX_", olds))
###########################

# ACAM113
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM113/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM113_100RECNX_", olds))
###########################

# ACAM114
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM114/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM114_100RECNX_", olds))
###########################

# ACAM115
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM115/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM115_100RECNX_", olds))
###########################

# ACAM116
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM116/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM116_100RECNX_", olds))
###########################

# ACAM117
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM117/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM117_100RECNX_", olds))
###########################

# ACAM118
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM118/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM118_100RECNX_", olds))
###########################

# ACAM119
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM119/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM119_100RECNX_", olds))
###########################

# ACAM120
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM120/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM120_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM120/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM120_101RECNX_", olds))
###########################

# ACAM121
#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM121/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM121_101RECNX_", olds))
###########################

# ACAM122
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM122/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM122_100RECNX_", olds))
###########################

# ACAM123
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM123/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM123_100RECNX_", olds))
###########################

# ACAM124
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM124/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM124_100RECNX_", olds))
###########################

# ACAM125
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM125/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM125_100RECNX_", olds))
###########################

# ACAM126
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM126/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM126_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM126/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM126_101RECNX_", olds))
###########################

# ACAM127
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM127/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM127_100RECNX_", olds))
###########################

# ACAM128
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM128/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM128_100RECNX_", olds))
###########################

# ACAM129
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM129/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM129_100RECNX_", olds))
###########################

# ACAM130
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM130/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM130_100RECNX_", olds))
###########################

# ACAM131
#100RECNX - blank folder -

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM131/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM131_101RECNX_", olds))
###########################

# ACAM132
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM132/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM132_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM132/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM132_101RECNX_", olds))
###########################

# ACAM133
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM133/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM133_100RECNX_", olds))
###########################

# ACAM134
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM134/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM134_100RECNX_", olds))
###########################

# ACAM135
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM135/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM135_100RECNX_", olds))
###########################

# ACAM136
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM136/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM136_100RECNX_", olds))
###########################

# ACAM137
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM137/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM137_100RECNX_", olds))
###########################

# ACAM138
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM138/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM138_100RECNX_", olds))
###########################

# ACAM139
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM139/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM139_100RECNX_", olds))

#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM139/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM139_101RECNX_", olds))
###########################

# ACAM140
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM140/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM140_100RECNX_", olds))
###########################

# ACAM141
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM141/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM141_100RECNX_", olds))
###########################

# ACAM142
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM142/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM142_100RECNX_", olds))
###########################

# ACAM143
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM143/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM143_100RECNX_", olds))
###########################

# ACAM144
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM144/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM144_100RECNX_", olds))
###########################

# ACAM145
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM145/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM145_100RECNX_", olds))
###########################

# ACAM146
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM146/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM146_100RECNX_", olds))
###########################

# ACAM147
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM147/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM147_100RECNX_", olds))
###########################

# ACAM148
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM148/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM148_100RECNX_", olds))
###########################

# ACAM149
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM149/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM149_100RECNX_", olds))
###########################

# ACAM150
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM150/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM150_100RECNX_", olds))
###########################

# ACAM151
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM151/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM151_100RECNX_", olds))
###########################

# ACAM152
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM152/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM152_100RECNX_", olds))
###########################

# ACAM153
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM153/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM153_100RECNX_", olds))
###########################

# ACAM154
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM154/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM154_100RECNX_", olds))
###########################

# ACAM155
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations1/ACAM155/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations1_ACAM155_100RECNX_", olds))
###########################
#######################################################################################
#######################################################################################
#############################################################################################
# MixedBaitStations2

# ACAM101
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM101")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM101_", olds))
###########################

# ACAM102
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM102")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM102_", olds))
###########################

# ACAM103
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM103")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM103_", olds))
###########################

# ACAM104
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM104")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM104_", olds))
###########################

# ACAM105
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM105")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM105_", olds))
###########################

# ACAM106
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM106")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM106_", olds))
###########################

# ACAM107
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM107")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM107_", olds))
###########################

# ACAM108
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM108")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM108_", olds))
###########################

# ACAM109
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM109")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM109_", olds))
###########################

# ACAM110
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM110")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM110_", olds))
###########################

# ACAM111
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM111")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM111_", olds))
###########################

# ACAM112
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM112")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM112_", olds))
###########################

# ACAM113
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM113")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM113_", olds))
###########################

# ACAM114
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM114")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM114_", olds))
###########################

# ACAM115
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM115")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM115_", olds))
###########################

# ACAM116
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM116")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM116_", olds))
###########################

# ACAM117
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM117")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM117_", olds))
###########################

# ACAM118
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM118")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM118_", olds))
###########################

# ACAM119
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM119")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM119_", olds))
###########################

# ACAM120
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM120")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM120_", olds))
###########################

# ACAM121
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM121/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM121_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM121/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM121_101RECNX_", olds))

#102RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM121/102RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM121_102RECNX_", olds))

#103RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM121/103RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM121_103RECNX_", olds))
###########################

# ACAM122
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM122")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM122_", olds))
###########################

# ACAM123
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM123")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM123_", olds))
###########################

# ACAM124
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM124")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM124_", olds))
###########################

# ACAM125
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM125/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM125_100RECNX_", olds))

#101RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM125/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM125_101RECNX_", olds))
###########################

# ACAM126
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM126")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM126_", olds))
###########################

# ACAM127
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM127")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM127_", olds))
###########################

# ACAM128
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM128")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM128_", olds))
###########################

# ACAM129
#100RECNX
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM129/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM129_100RECNX_", olds))
###########################

# ACAM130
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM130")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM130_", olds))
###########################

# ACAM131
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM131")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM131_", olds))
###########################

# ACAM132
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM132")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM132_", olds))
###########################

# ACAM133
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM133")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM133_", olds))
###########################

# ACAM134
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM134")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM134_", olds))
###########################

# ACAM135
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM135/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM135_100RECNX_", olds))

#101RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM135/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM135_101RECNX_", olds))
###########################

# ACAM136
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM136/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM136_100RECNX_", olds))

#101RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM136/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM136_101RECNX_", olds))

#102RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM136/102RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM136_102RECNX_", olds))
###########################

# ACAM137
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM137")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM137_", olds))
###########################

# ACAM138
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM138")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM138_", olds))
###########################

# ACAM139
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM139")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM139_", olds))
###########################

# ACAM140
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM140")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM140_", olds))
###########################

# ACAM141
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM141/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM141_100RECNX_", olds))

#101RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM141/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM141_101RECNX_", olds))
###########################

# ACAM142
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM142")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM142_", olds))
###########################

# ACAM143
#100RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM143/100RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM143_100RECNX_", olds))

#101RECNX 
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM143/101RECNX")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM143_101RECNX_", olds))
###########################

# ACAM144
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM144")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM144_", olds))
###########################

# ACAM145
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM145")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM145_", olds))
###########################

# ACAM146
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM146")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM146_", olds))
###########################

# ACAM147
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM147")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM147_", olds))
###########################

# ACAM148
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM148")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM148_", olds))
###########################

# ACAM149
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM149")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM149_", olds))
###########################

# ACAM150
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM150")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM150_", olds))
###########################

# ACAM151
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM151")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM151_", olds))
###########################

# ACAM152
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM152")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM152_", olds))
###########################

# ACAM153
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM153")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM153_", olds))
###########################

# ACAM154
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM154")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM154_", olds))
###########################

# ACAM155
setwd("F:/PigVacuum_Copy/CameraBaitStationPics/MixedBaitStations2/ACAM155")
olds<-list.files() 
file.rename(olds, paste0("MixedBaitStations2_ACAM155_", olds))
