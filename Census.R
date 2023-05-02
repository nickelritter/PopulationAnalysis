urlToRead <- "https://www2.census.gov/programs-surveys/popest/tables/2010-2011/state/totals/nst-est2011-01.csv"
testFrame <- read.csv(url(urlToRead))

#read the first few lines
head(testFrame)

str(testFrame)

#removing rows and columns: remove header rows using minus
testFrame <-testFrame[-1:-8,]
#head(testFrame)

summary(testFrame[,6:10])

#Keep the first five columns
testFrame <-testFrame[,1:5]

#remove blank/unecessary rows
testFrame <-testFrame[-52:-58,]
#head(testFrame)
tail(testFrame)

#copied long title into stateName
testFrame$StateName <-testFrame[,1]
head(testFrame)

#colnames() function
colnames(testFrame)

#drop the first column
testFrame <-testFrame[,-1]
head(testFrame)

#colnames() function
colnames(testFrame)
cnames <-colnames(testFrame)
cnames

cnames2 <-c("Census", "Base", "Census2010", "Census2011", "StateName")
colnames(testFrame) <-cnames2
head(testFrame)

#Cleaning up the elements
testFrame$StateName <-gsub("\\.", '',testFrame$StateName)
head(testFrame)

#as.numeric
# you cannot do this: testFrame$Census2 <-as.numeric(testFrame$Census)
# first, get rid of the commas
testFrame$Census <-as.numeric(gsub(",","",testFrame$Census))
testFrame$Base <-as.numeric(gsub(",","",testFrame$Base))
testFrame$Census2010 <-as.numeric(gsub(",","",testFrame$Census2010))
testFrame$Census2011 <-as.numeric(gsub(",","",testFrame$Census2011))

testFrame

#rownames
rownames(testFrame)<-NULL
testFrame

#move the last column to the first
library(dplyr)
new_testFrame <-testFrame %>% select(StateName, everything())
#new_testFrame

write.csv(new_testFrame, "testFrame.SH.csv")