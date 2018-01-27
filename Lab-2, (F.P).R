# Name: Farees Patel
#Lab-2 (Dataframes)

mycars<-mtcars #Loading one dataset into a new dataframe

#1
HighestHP<- max(mycars$hp) #Store the highest HP value into a variable

#2
index<- which.max(mycars$hp) #Store the index of the highest HP value into a variable
Car_highestHP<- rownames(mycars)[index] #Reporting the car having the highest HP


#3
HighestMpg<- max(mycars$mpg) #Store the highest MPG value into a variable

#4
index2<- which.max(mycars$mpg) #Store the index of the highest MPG value into a variable
Car_highestMpg<- rownames(mycars)[index2] #Reporting the car having the highest MPG

#5
mycars<- mycars[order(mycars$mpg),] # Sort the whole dataframe based on increasing order of the mpg attribute

#6
#For best combination of 'mpg' and 'hp'. (Mpg must be high but hp should be low).therefore ratio of mpg to hp should be high.

mycars$best_performance <- mycars$mpg/mycars$hp # defining the best combination ratio and loading into a variable

mycars<-mycars[order(mycars$best_performance, decreasing = TRUE),] # sort mycars dataframe according to the best combination ratio

Car_best_performance<- rownames(mycars)[1] #Store the car name having the best combination of mpg and hp

#End of Lab-2