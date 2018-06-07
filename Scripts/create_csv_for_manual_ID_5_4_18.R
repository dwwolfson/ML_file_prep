# Create csv files for each folder for manual pig ID

setwd("N:/Wildlife-Livestock-Health-Team/NationalFeralSwineProgram/Projects/Automated Camera Trap Classification/Photos for Manual ID/Tejon_May2018")
path<-"N:/Wildlife-Livestock-Health-Team/NationalFeralSwineProgram/Projects/Automated Camera Trap Classification/Photos for Manual ID/Tejon_May2018"
folders<-list.files()

columns<-c("filename",'Count', 'number_marked', 'number_unmarked', 
'number_unknown_mark', 'number_adult', 'number_subadult', 
'number_juvenile','number_unknown_age','number_male', 'number_female',
'number_unknown_sex', 'ID_Number', 'ID_Color','GPS')

for(i in 1:length(folders)){
  setwd(paste(path, folders[i], sep="/"))
  names<-list.files()
  df<-setNames(data.frame(matrix(ncol=length(columns), nrow=length(names))), columns)
  df$filename<-names
  write.csv(df, paste(folders[i], "csv",sep="."), na="")
  }


