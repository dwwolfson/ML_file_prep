install.packages("magick")
library(magick)


#Set File Origen Path
file.path<-"N:/Wildlife-Livestock-Health-Team/NationalFeralSwineProgram/Projects/Automated Camera Trap Classification/Photos for Manual ID/Florida/FL-41_Tyler(intern)/"

#Set Working Dir
setwd(file.path)

#Set File Out Path
out.file.path <- paste0(file.path,"Adjusted/")
dir.create(file.path(file.path, "/Adjusted"), showWarnings = FALSE)

#Make list of files
tmp <- list.files(file.path,"*.jpg", full.names = TRUE)
tmp1 <- list.files(file.path,"*.JPG", full.names = TRUE)
in.file.names <- c(tmp,tmp1)

#Make list of names
tmp <- list.files(file.path,"*.jpg", full.names = FALSE)
tmp1 <- list.files(file.path,"*.JPG", full.names = FALSE)
out.names <- c(tmp,tmp1)

#Loop over files in Directory
for(i in 1:length(in.file.names)){

  #Read in Image  
  in.jpg <- image_read(in.file.names[i])

  # Brightness, Saturation, Hue
  out.jpg <- image_modulate(in.jpg, brightness = 250)

  #Write Image
  image_write(out.jpg, path=paste0(out.file.path,out.names[i]), format="jpg")
}#END Loop

