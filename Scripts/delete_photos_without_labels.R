# delete NWRC photos that don't have label info

#names from csv
csv.names<-df[,2]
# I did this the lazy way since I just worked up the csv,
# the other way would just be to point to the file, import and look

setwd("F:/pooled_images_resized")
file.names<-list.files()

length(unique(csv.names))
length(unique(file.names))

length(setdiff(csv.names, file.names))
length(setdiff(file.names, csv.names))

no.labs<-setdiff(file.names, csv.names) #these are the photo files that aren't in the csv

#delete the files 
file.remove(no.labs)


