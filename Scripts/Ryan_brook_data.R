setwd("N:/Wildlife-Livestock-Health-Team/NationalFeralSwineProgram/Projects/Automated Camera Trap Classification/Brook_Images")
list.files(pattern='IMG')

table(brook$Animal)

#pig
file.rename(list.files(), paste('Wild pig', seq(1:725), sep='_'))

#moose
length(list.files(pattern='IMG'))
file.rename(list.files(pattern='IMG'), paste('Moose', seq(1:351), sep='_'))

#coyote
length(list.files(pattern='IMG'))
file.rename(list.files(pattern='IMG'), paste('Canidae', seq(1:286), sep='_'))

#mule deer
length(list.files(pattern='IMG'))
file.rename(list.files(pattern='IMG'), paste('Mule deer', seq(1:375), sep='_'))

#raccoon
length(list.files(pattern='IMG')) #148
file.rename(list.files(pattern='IMG'), paste('Raccoon', seq(1:length(list.files(pattern='IMG'))), sep='_'))

#cow
length(list.files(pattern='IMG')) #2497
file.rename(list.files(pattern='IMG'), paste('Cattle', seq(1:length(list.files(pattern='IMG'))), sep='_'))

#elk
length(list.files(pattern='IMG')) #597
file.rename(list.files(pattern='IMG'), paste('Elk', seq(1:length(list.files(pattern='IMG'))), sep='_'))

#red fox
length(list.files(pattern='IMG')) #219
file.rename(list.files(pattern='IMG'), paste('Fox', seq(1:length(list.files(pattern='IMG'))), sep='_'))

#skunk
length(list.files(pattern='IMG')) #130
file.rename(list.files(pattern='IMG'), paste('Skunk', seq(1:length(list.files(pattern='IMG'))), sep='_'))

#squirrel
length(list.files(pattern='IMG')) #204
file.rename(list.files(pattern='IMG'), paste('Squirrel', seq(1:length(list.files(pattern='IMG'))), sep='_'))

#white-tailed deer
length(list.files(pattern='IMG')) #377
file.rename(list.files(pattern='IMG'), paste('White-tailed deer', seq(1:length(list.files(pattern='IMG'))), sep='_'))

#Add .jpg suffix
file.rename(list.files(), paste(list.files(),'jpg', sep='.'))

br.df<-list.files()
br.df<-as.data.frame(br.df)
colnames(br.df)<-'filename'
br.df$filename<-as.character(br.df$filename)
br.df[1,1]
strsplit("Canidae_1", '_')[[1]][1]
br.df$species<-sapply(br.df$filename, function(x)
  strsplit(x, '_')[[1]][1])

#Add number code as well
br.df$sp_label<-ifelse(br.df$species=='Canidae', 3,
                       ifelse(br.df$species=='Cattle', 1,
                              ifelse(br.df$species=='Elk', 4,
                                     ifelse(br.df$species=='Fox', 23,
                                            ifelse(br.df$species=='Moose', 0,
                                                   ifelse(br.df$species=='Mule deer', 17,
                                                          ifelse(br.df$species=='Raccoon', 19,
                                                                 ifelse(br.df$species=='Skunk', 14,
                                                                        ifelse(br.df$species=='Squirrel', 21,
                                                                               ifelse(br.df$species=='White-tailed deer', 18,
                                                                                      ifelse(br.df$species=='Wild pig',22,'flag')))))))))))

write.csv(br.df, "Brook_images.csv")
table(br.df$species)
