# Evaluating Initial Model Run for Accuracy
library(tidyverse)
library(ggrepel)
library(scales)
library(forcats)

# read data
l1 <- read.csv('Data/initial_model_runs/accuracyAssessments_L1.csv')
l2 <- read.csv('Data/initial_model_runs/accuracyAssessments_L2.csv')
l1

l2$Class.name<-recode(l2$Class.name, "Potential Prey"="Rabbits")
l2$Class.name<-recode(l2$Class.name, "Prey"="Rodents")

# make plots
plot(l1$Number.of.total.examples, l1$Accuracy)
corL1 <- cor(l1$Number.of.training.examples, l1$Accuracy, method='spearman')
plot(l2$Number.of.training.examples, l2$Accuracy)
corL2 <- cor(l2$Number.of.training.examples, l2$Accuracy, method='spearman')

# plot for level 2
plot(log10(l1$Number.of.training.examples), l1$Accuracy, xlab='Number of training photos',
     ylab='Accuracy', axes=FALSE, main='Level 1 accuracy', pch=16)
axis(2, las=2)
axis(1, at=seq(3.5, 6, by=.5), labels=floor(10^seq(3.5, 6, by=.5)))
text(5.5, 0.75, paste0('Spearman correlation = ', round(corL1,3)))

# plots for level 2
plot(log10(l2$Number.of.training.examples), l2$Accuracy, xlab='Number of training photos',
     ylab='Accuracy', axes=FALSE, main='Level 2 accuracy', pch=16)
axis(2, las=2)
axis(1, at=seq(3.5, 6, by=.5), labels=floor(10^seq(3.5, 6, by=.5)))
text(5.5, 0.88, paste0('Spearman correlation = ', round(corL2,3)))

##################################################################################
l2$log_n<-log10(l2$Number.of.training.examples)

ggplot(l1, aes(log10(Number.of.training.examples), Accuracy))+geom_point()
ggplot(l2, aes(log_n, Accuracy))+
    geom_point()+geom_smooth(method='lm', formula=y~x)

ggplot(l2, aes(Accuracy))+geom_histogram(aes(fill=..Number.of.test.examples..))+
  scale_fill_gradient2()






ggplot(l2,aes(x=Number.of.training.examples, y=Accuracy, label=Class.name,color=Class.name))+
  geom_point(size=3)+
  geom_smooth(method='lm', col='black', alpha=0.25, se=F)+
  geom_label_repel(box.padding = 0.4, size=6, fontface="bold")+
  labs(x="Number of Training Images (log scale)", color="Categories")+
  ggtitle("Accuracies of Second Order Classification by Number of Training Images")+
  scale_y_continuous(breaks = pretty(l2$Accuracy, n=5))+
  theme(axis.ticks.x = element_blank())+
  scale_x_log10(breaks=c(3000,10000,30000,100000, 300000, 1000000), 
                labels=comma)+
  theme(axis.text=element_text(size=20),
        axis.title = element_text(size=20, face="bold"),
        plot.title=element_text(size=22, face="bold", hjust=0.5),
        legend.position="none")+
  annotate("label", x=1000000, y=0.88, label="Spearman correlation = 0.73",size=6, fontface="bold")
  
  




