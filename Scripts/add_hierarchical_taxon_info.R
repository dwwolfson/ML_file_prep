# Manual ID for ML model with pig photos

# Data to include: 1) Count, 2) Marked Status (Marked/Unmarked/Unknown), 3) Age

#Not sure how to deal with multiple categories for a single image.

# Add in all the extra hierarchical taxonomic info

library(here)
library(tidyverse)
library(data.table)
here()

#Import pooled csv
df<-read_csv("Data/pooled_csv/comprehensive.csv")

#Import species reference table
sp_table<-read_csv("Data/species_tallies_with_other_levels.csv")

#Can't do a simple join on one column because the species info varies across columns (eg: only family, order, class)
#But for all the joins based on species I can grep to the species column
# For the others I can grep to the specific columns

head(df)
head(sp_table)

df<-left_join(df, sp_table[2:6], by="species")
#this worked for all the images that are ID'ed to the species level

#For something like an image ID'ed to class/genus etc, there is no join
#example
# df1<-df[df$species=="Squamata",]
#For these I need to manipulate by hand...
#############################################################################################
# Some flawed ways

# A function to make it easier to swap out values for a subset of data in a dataframe
# mutate_cond <- function(.data, condition, ..., envir = parent.frame()) {
#   condition <- eval(substitute(condition), .data, envir)
#   condition[is.na(condition)] = FALSE
#   .data[condition, ] <- .data[condition, ] %>% mutate(...)
#   .data
# }
# 
# test<-test%>%
#   mutate_cond(species=='Squamata', genus=NA, family=NA, order='Squamata', class='Reptilia')
# #can't change species to NA while you're at it

# new_obj<-test[test$species=="Squamata",]%<>%mutate(species=NA, genus=NA, family=NA, order='Squamata', class='Reptilia')
#only saves the rows you're working on;  needs libary(magittr)
##############################################################################################
#data.table option
df<-data.table(df)

# Family Accipitridae
df<-df[species=='Accipitridae',
       ':='(species=NA,
            genus=NA, 
            family='Accipitridae', 
            order='Accipitriformes', 
            class='Aves')]

# Class Aves
df<-df[species=='Aves',
       ':='(species=NA,
            genus=NA, 
            family=NA, 
            order=NA, 
            class='Aves')]

# Genus Corvus
df<-df[species=='Corvus',
       ':='(species=NA,
            genus='Corvus', 
            family='Corvidae', 
            order='Passeriformes', 
            class='Aves')]

# Genus Geomys
df<-df[species=='Geomys',
       ':='(species=NA,
            genus='Geomys', 
            family='Geomyidae', 
            order='Rodentia', 
            class='Mammalia')]

# Genus Mus
df<-df[species=='Mus',
       ':='(species=NA,
            genus='Mus', 
            family='Muridae', 
            order='Rodentia', 
            class='Mammalia')]

# Genus Neotoma
df<-df[species=='Neotoma',
       ':='(species=NA,
            genus='Neotoma', 
            family='Cricetidae', 
            order='Rodentia', 
            class='Mammalia')]

# Genus Odocoileus
df<-df[species=='Odocoileus',
       ':='(species=NA,
            genus='Odocoileus', 
            family='Cervidae', 
            order='Artiodactyla', 
            class='Mammalia')]

# Genus Peromyscus
df<-df[species=='Peromyscus',
       ':='(species=NA,
            genus='Peromyscus', 
            family='Cricetidae', 
            order='Rodentia', 
            class='Mammalia')]

# Order Squamata
df<-df[species=='Squamata',
           ':='(species=NA,
                genus=NA, 
                family=NA, 
                order='Squamata', 
                class='Reptilia')]

# Genus Sylvilagus
df<-df[species=='Sylvilagus',
       ':='(species=NA,
            genus='Sylvilagus', 
            family='Leporidae', 
            order='Lagomorpha', 
            class='Mammalia')]

# Genus Tamias
df<-df[species=='Tamias',
       ':='(species=NA,
            genus='Tamias', 
            family='Sciuridae', 
            order='Rodentia', 
            class='Mammalia')]

#rearrange columns to look nicer
df<-df[,c(1,2,3,7,8,9,10,4,5,6)]

#export dataframe
write.csv(df, "Output/image_labels.csv")


