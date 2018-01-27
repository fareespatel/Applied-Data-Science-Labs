#Xiao Song
#IST687 - SVM: Food Inspection

install.packages("kernlab")
library("kernlab")

#step 1
food_data <- read.csv("~/Downloads/Food_Service_Establishment__Last_Inspection.csv",stringsAsFactors = FALSE)
View(foodservice)


#Step 2

#adding a new column with flag values "yes" or "no" depending on the data from the violations column
foodservice$new <- ifelse(foodservice$VIOLATIONS=="No violations found.","yes","no")

dim(foodservice)

table(foodservice$new)
foodservice<- na.omit(foodservice)

#Step 3

#sampling out random values from food_data
randIndex	<- sample(1:nrow(foodservice))
head(randIndex)
nr<- nrow(foodservice)

summary(randIndex)
length(randIndex)

#dividing the data into 2 parts, and the cut-point value at 2/3rd of the dataset
cutPoint2_3	<- floor(2*nr/3)
cutPoint2_3

#creating train and test data using the cut-point
trainData	<- foodservice[randIndex[1:cutPoint2_3],] #first 2/3rd go into train data
testData	<- foodservice[randIndex[(cutPoint2_3+1):nr],] #and the remaining goes into test data

#Model 1

#created model with flag depending on TOTAL...NONCRITICAL.VIOLATIONS and NYS.HEALTH.OPERATION.ID
svmOutput1	<- ksvm(new~TOTAL...NONCRITICAL.VIOLATIONS+NYS.HEALTH.OPERATION.ID,data=trainData,kernel="rbfdot",kpar="automatic",C=5,cross=3,	prob.model=TRUE)
svmOutput1
hist(alpha(svmOutput1)[[1]]) #plotting the svm

svmPred1	<- predict(svmOutput1,	testData,	type="votes") #making the prediction model
compTable1	<- data.frame(testData[,27],svmPred1[1,])
table(compTable1)
#Conclusion - we come to know using the compTable that 'yes' means 0 and 'no' means 1
#49 values were no but were classified as yes and 3 values were yes but classified as no, so we have 152 error cases
#error rate => 152/8681=0.017 is the error rate
#accuracy rate => 98.30%


#Model 2

#created model with 'new' depending on TOTAL...NONCRITICAL.VIOLATIONS and TOTAL..CRIT...NOT.CORRECTED  and TOTAL...CRITICAL.VIOLATIONS
svmOutput	<- ksvm(new~TOTAL...NONCRITICAL.VIOLATIONS + TOTAL..CRIT...NOT.CORRECTED+ TOTAL...CRITICAL.VIOLATIONS,data=trainData,	kernel="rbfdot",kpar="automatic",C=5,cross=3,	prob.model=TRUE)
svmOutput
hist(alpha(svmOutput)[[1]]) #plotting the svm 

svmPred	<- predict(svmOutput,	testData,	type="votes") #making the prediction model
compTable	<- data.frame(testData[,27],svmPred[1,])
table(compTable)
#Conclusion - we come to know using the compTable that 'yes' means 0 and 'no' means 1
#7 values were no but were classified as yes and 3 values were yes but classified as no, so we have 10 error cases
#error rate => 10/8681=0.0011 is the error rate
#accuracy rate => 99.89%