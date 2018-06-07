# Create csv files for each folder for manual pig ID

setwd("N:/Wildlife-Livestock-Health-Team/NationalFeralSwineProgram/Projects/Automated Camera Trap Classification/Photos for Manual ID/Florida")
path<-"N:/Wildlife-Livestock-Health-Team/NationalFeralSwineProgram/Projects/Automated Camera Trap Classification/Photos for Manual ID/Florida"
folders<-list.files()

for(i in 1:length(folders)){
  setwd(paste(path, folders[i], sep="/"))
  names<-list.files()
  df<-setNames(data.frame(matrix(ncol=10, nrow=length(names))), c("filename",'Count', 'number_marked', 'number_unmarked', 
                                                      'number_unknown_mark', 'number_adult', 'number_subadult', 
                                                      'number_juvenile', 'number_male', 'number_female'))
  
  df$filename<-names
  write.csv(df, paste(folders[i], "csv",sep="."), na="")
  }


