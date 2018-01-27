#Farees Patel

#Lab-5 (Storage Wars)

#1 and #2
install.packages("sqldf") #installing and activating package
library("sqldf")

#3
AQ_dataset<-airquality #Loading the dataframe into a new dataframe
head(AQ_dataset,5) #Displaying the first 5 instances of the dataframe

#4
Avg_Ozone<- sqldf('select AVG(AQ_dataset.Ozone) from AQ_dataset') #Calculating the average level of ozone using SQL command
Avg_Ozone #Displaying the average level of ozone

#5
Ozonedf<- sqldf("select * from AQ_dataset where AQ_dataset.Ozone > (select AVG(AQ_dataset.Ozone) from AQ_dataset) ") #loading values of Ozone higher than the average ozone level

#6
NewAQ<-Ozonedf #Loading the updated dataset into a new dataframe "NewAQ"
str(NewAQ) #displaying the structure of the new dataframe
head(NewAQ,5) #Displaying the first 5 instances of the dataframe

#7 (Bonus)
new_dataset<-airquality #loading the airquality dataset into a new variable
new_dataset$constant<-' ' #Creating a new attribute having a constant 'space' as a string
tapply(new_dataset$Ozone, new_dataset$constant,mean, na.rm=T) #calculating average of all the Ozone instances using tapply function and neglecting the 'NA'

# Selecting all the values from Ozone where the values are greater than the average
new_dataset<-airquality #overwriting the dataset with the original airquality dataset
new_dataset<-new_dataset[complete.cases(new_dataset$Ozone),] #Removing the NA in the Ozone coloumn of the dataset
new_dataset$constant<-' ' #Creating a new attribute having a constant 'space' as a string

Ozone_function<- function (v) #creating a function to sort values greater than the average value of Ozone
{
  wq<-subset(new_dataset,FALSE) #creating a new empty dataframe having same structure as of airquality
  j=1 # defining a variable that will be an index for storing Ozone values in the sorted dataframe
  for (i in 1:length(v)) #specifying the scope of the search
  if(v[i] > 42.12) #checking if the value is greater than the average Ozone
    {
    wq[j,]<- new_dataset[i,] #Storing the value in the ds dataframe
    j=j+1 #increasing the index value by 1
  }
wq<-wq[,-7] #remove the last coloumn named constant 
row.names(wq)<- NULL #sequencing the rows appropriately
return(wq)
}

wq<-tapply(new_dataset$Ozone, new_dataset$constant,Ozone_function) #Using tapply function to sort the data
Oz<- wq[[1]] #loading list 1 in a new variable
print(Oz) #printing the dataset having Ozone values greater than the average Ozone

#Storing the new result into a new variable
NewAQ2<- Oz
str(NewAQ2) #displaying the structure of the new dataframe
head(NewAQ2,5) #Displaying the first 5 instances of the dataframe

#End of Lab-5

