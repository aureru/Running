## load data.table
library(data.table)

##load data from source into data.frame
run_170929<-read.csv('activity_20170929.csv')
str(run_170929)

#or straighth into data.table
run_170924<-data.table(read.csv('activity_20170924.csv'))
str(run_170924)

## convert data.frame to data.table
run_170929<-data.table(run_170929)
str(run_170929)

## remove unwanted columns (keep only Slpit, Time, Distance)
names(run_170929)
run_170929<-run_170929[,3:= NULL]
run_170929<-run_170929[,4:15:= NULL]
names(run_170929)

run_170924<-run_170924[,3:= NULL]
run_170924<-run_170924[,4:15:= NULL]
names(run_170929)

## remove rows where Distance is not exactly 1 km
run_170929<-run_170929[Distance==1]
run_170924<-run_170924[Distance==1]

## rename columns
setnames(run_170924,"Time","T0924")
setnames(run_170929,"Time","T0929")

## match data size
run_170924<-run_170924[1:(min(nrow(run_170929),nrow(run_170924)))]
run_170929<-run_170929[1:(min(nrow(run_170929),nrow(run_170924)))]

## merge time columns in one db
compare_db<-data.table(cbind(run_170929[,1],run_170929[,2],run_170924[,2]))

plot(compare_db[,3])
