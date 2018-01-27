#FareesPatel
#Lab-8

install.packages('readxl') #Install package
library('readxl') #Include package

file<- read_excel('C:/Users/Farees Patel/Downloads/mlr01.xls') #Read the file
colnames(file) <- (c('NumOfFawns', 'AdultAntelopePop', 'AnnualPrecipation', 'WinterSeverity')) #Set coloumn names
str(file)

plot(file$AdultAntelopePop, file$NumOfFawns) #Plot a bivariate graph
plot(file$AnnualPrecipation, file$NumOfFawns) #Plot a bivariate graph
plot(file$WinterSeverity, file$NumOfFawns) #Plot a bivariate graph

model1<- lm(formulla= NumOfFawns ~  WinterSeverity, data=file) #Create a linear model 
summary(model1) # Display the summary of the linear model


model3<- lm(formula= NumOfFawns ~ (WinterSeverity + AdultAntelopePop), data=file) #Create a linear model
summary(model3) # Display the summary of the linear model

model4<- lm(formula= NumOfFawns ~(WinterSeverity + AnnualPrecipation) , data=file) #Create a linear model
summary(model4) # Display the summary of the linear model

model5<- lm(formula= NumOfFawns ~  (WinterSeverity + AnnualPrecipation +  AdultAntelopePop), data=file) #Create a linear model
summary(model5) # Display the summary of the linear model

library('stats')
test1= data.frame(WinterSeverity=1, AnnualPrecipation= ,AdultAntelopePop=0)
predict(model3, test1, type="response")

# The first and the last model works the best because both if the model have high R-squared value which gives the statistical measure of the linear model
#I think WinterSeverity is statistically significant in each model
# Creating a parsimonous model totally depends upon the R-squared value or the abline function which tells us the proximity of the other points from the line. I think WinterSeverity VS No Of Fawns gives a good model
#End of Lab-8`