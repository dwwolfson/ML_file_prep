install.packages("magick")
library(magick)

#Set Root Directory Location
setwd("N:/Wildlife-Livestock-Health-Team/NationalFeralSwineProgram/Projects/Automated Camera Trap Classification/Photos for Manual ID/Tejon_May2018")
rootpath<-"N:/Wildlife-Livestock-Health-Team/NationalFeralSwineProgram/Projects/Automated Camera Trap Classification/Photos for Manual ID/Tejon_May2018"
#Sub-directories
folders<-list.files()

#Outer Loop

for(j in 1:length(folders)){
#Set File Origen Path
file.path<-folders[j]

#Set Working Dir
setwd(paste(rootpath,file.path, sep='/'))
tmppath<-paste(rootpath,file.path, sep='/')
#Set File Out Path
out.file.path <- paste0(tmppath,"/Adjusted/")
dir.create(file.path(tmppath, "/Adjusted"), showWarnings = FALSE)

#Make list of files
tmp <- list.files(tmppath,"*.jpg", full.names = TRUE)
tmp1 <- list.files(tmppath,"*.JPG", full.names = TRUE)
in.file.names <- c(tmp,tmp1)

#Make list of names
tmp <- list.files(tmppath,"*.jpg", full.names = FALSE)
tmp1 <- list.files(tmppath,"*.JPG", full.names = FALSE)
out.names <- c(tmp,tmp1)

#Loop over files in Directory
for(i in 1:length(in.file.names)){

  #Read in Image  
  in.jpg <- image_read(in.file.names[i])

  # Brightness, Saturation, Hue
  out.jpg <- image_modulate(in.jpg, brightness = 250)

  #Write Image
  image_write(out.jpg, path=paste0(out.file.path,out.names[i]), format="jpg")
}#END inner Loop
}#end outer loop
