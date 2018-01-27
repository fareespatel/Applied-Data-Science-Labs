#Lab-9
#Farees Patel
#IST687 - HW: Association Rules Mining

load(termDocMatrix) #Load the dataset
dataset<- t(termDocMatrix) #Transpose the dataset

str(dataset)

install.packages('arules') #installing arules package
library(arules) #Loading the arules package

summary(dataset) # display the summary of the dataset

ruleset<- apriori(dataset, parameter=list(support=0.05, confidence= 0.4)) # Use algorithm to analyze the transaction dataset and generate rules

summary(ruleset) # provides an overview of the content in the ruleset

q<-inspect(ruleset) # displaying the rules in the ruleset along with values of support, confidence and lift

q<- q[order(-q$lift), ] #sort in descending order based on the lift values to find the best rule
q
install.packages('arulesViz') #installing arulesViz package
library(arulesViz) #loading the package

plot(ruleset) # Plotting the scatterplot of the ruleset depending upon support, confidence and lift values.

#Results interpretation: Just to get a better result interpretation I have sorted the ruleset to find the best rules. I think the 'series' and 'time' have a particular combination that goes together. And because of the high value of lift (19.25), this seems to be the best rule in the ruleset with support of 5% and confidence of 100%.

#As far as the large sets of documents like emails are concerned, I think the association rule mining technique is very useful and can be of prime importance to figure out various spams in the emails by mining data and finding out various relationships between emails from different sources to filter for spams based on the high lift value.

#End of Lab-9