# CSV re-organization for NWRC count datasets

library(tidyverse)

getwd()
########################################################################################
# Bullis 4 treatments project

#Import raw csv
b4t<-read_csv("Data/second_round_count_data/Bullis_4_Treatments_Count_Results.csv")

#Find photos with multiple spp
mults<-b4t[b4t$`Total Pigs`>0&b4t$Deer>0|
             b4t$`Total Pigs`>0&b4t$Turkeys>0|
             b4t$Deer>0&b4t$Turkeys>0,]

# mult_with_pigs<-mults[mults$`Total Pigs`>0,] just for curiousity

#Save their filenames to delete from drive
to_delete<-mults$FileName

#Cut them out of the dataset
df<-b4t%>%
  filter((`Total Pigs`>0&Deer<1&Turkeys<1)|(`Total Pigs`<1&Deer>0&Turkeys<1)|(`Total Pigs`<1&Deer<1&Turkeys>0))
  
#add species column
df$species<-ifelse(df$`Total Pigs`>0, "wild_pig",
                   ifelse(df$Turkeys>0, "turkey",
                          ifelse(df$Deer>0, "deer", "flag")))
table(df$species)
df$count<-rowSums(df[,c('Turkeys', 'Deer', 'Total Pigs')])
df$study<-'NWRC_bullis_4_treatments'
# I did the stuff below, but hashed it out so it doesn't screw anything up by running again

#Delete Files with multiple species
# setwd("F:/NWRC_2nd_round_counts/Bullis_4_Treatments_Count_Data/Bullis_4_Treatments_Images")
# file.remove(to_delete)

# write.csv(df, "Output/nwrc_processed_csvs/four_treatment.csv")
############################################################################################################
# Bullis Metal vs Plastic Count
rm(list=ls())
#import raw csv
df<-read_csv("Data/second_round_count_data/Bullis_Metal_vs_Plastic_Count_Results.csv")

#Find photos with multiple spp
mults<-df[df$`Total Pigs`>0&df$Deer>0|
             df$`Total Pigs`>0&df$Turkeys>0|
             df$Deer>0&df$Turkeys>0,]
# mult_with_pigs<-mults[mults$`Total Pigs`>0,] just for curiousity

#Save their filenames to delete from drive
to_delete<-mults$FileName

#Cut them out of the dataset
df<-df%>%
  filter((`Total Pigs`>0&Deer<1&Turkeys<1)|(`Total Pigs`<1&Deer>0&Turkeys<1)|(`Total Pigs`<1&Deer<1&Turkeys>0))

#add species column
df$species<-ifelse(df$`Total Pigs`>0, "wild_pig",
                   ifelse(df$Turkeys>0, "turkey",
                          ifelse(df$Deer>0, "deer", "flag")))
table(df$species)
df$count<-rowSums(df[,c('Turkeys', 'Deer', 'Total Pigs')])
df$study<-"NWRC_bullis_metal_vs_plastic"
# I did the stuff below, but hashed it out so it doesn't screw anything up by running again

#Delete Files with multiple species
# setwd("F:/NWRC_2nd_round_counts/Bullis_Metal_vs_Plastic_Count_Data/Bullis_Metal_vs_Plastic_Count_Images")
# file.remove(to_delete)
# 
# write.csv(df, "Output/nwrc_processed_csvs/metal_vs_plastic.csv")


