# Combine the May 2018 manual ID csvs and the NWRC datasets
setwd("N:/Wildlife-Livestock-Health-Team/NationalFeralSwineProgram/Projects/Automated Camera Trap Classification/Photos for Manual ID/Tejon_May2018/! PUT CSV IN HERE WHEN FINISHED")
files<-list.files()

res<-lapply(files, read.csv, header=T)
df<-do.call(rbind,res)


write.csv(df, "combined_df.csv")

inc<-files[2]
inc<-read_csv(inc)
files_to_delete<-inc[635:947,'filename']
files_to_delete<-as.character(files_to_delete)
to_delete<-file("to_delete.txt")
writeLines(files_to_delete, to_delete)
close(to_delete)
###########################################################


setwd("C:/Users/apdwwolfson/Documents/Projects/Photo Database/Machine Learning/ML_R_file_manipulation/Output/nwrc_processed_csvs")
#add nwrc to it
nwrc<-read.csv("all_nwrc.csv")
names(nwrc)
names(df)

nwrc<-nwrc[,-1]
df<-df[,-1]
colnames(df)[2]<-'count'
colnames(df)[1]<-'FileName'
to_add<-colnames(df)[3:16]
to_add<-to_add[1:13]
nwrc1<-nwrc
nwrc[,to_add]<-NA

to_add1<-colnames(nwrc)[3:8]
df[, to_add1]<-NA
df$study<-"Tejon"
df$ImageDate<-NA

col_order<-names(nwrc)
df<-df[,col_order]

#combine
alldat<-rbind(df, nwrc)

setwd("C:/Users/apdwwolfson/Documents/Projects/Photo Database/Machine Learning/ML_R_file_manipulation/Output")
#write out
write.csv(alldat, "Manual_ID_and_NWRC.csv")
