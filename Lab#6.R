#Farees Patel
#Lab 6

install.packages('ggplot2')
library('ggplot2')

#1
mycars<-mtcars #loading the dataset into a new variable

x <- ggplot(mycars, aes(x=mpg)) #plotting histogram for mpg
x<- x+geom_histogram(bins =5, colour='black', fill='white') # defining the shape and structure of the histogram
x # displaying the plot

#2
p<- ggplot(mycars, aes(factor(cyl),mpg)) # defining the group by varible and the variable to be plotted
p+geom_boxplot() #Adding the the boxplot function
p #displaying the box plot

#3
z<-ggplot(mycars,aes(x=wt, y=mpg, group=am)) #defining the group by varible and the variable to be plotted
z<- z+geom_line() #Adding the the line function
z #displaying the multiline chart

z<- z+ geom_point() #adding each point to the chart
z #displaying the multiline chart with each point


#4
q<-ggplot(mycars, aes(x=row.names(mycars), y=wt)) #defining the plot
q<- q+ geom_bar(stat = "identity") #plotting the bar chart plot
q<- q+ theme(axis.text.x=element_text(angle=90,hjust=1)) # defining the theme of the plot
q # displaying the plot

#5
a<- ggplot(mycars, aes(x=mpg, y=wt)) #defining the plot
a<- a+ geom_point(aes(size=qsec,color=qsec)) #plotting the scatter chart plot
a # displaying the plot

#6
g<- ggplot(mycars, aes(x=wt,y=cyl)) #defining the plot
g<-g+ geom_tile(aes(color=mpg)) #defining the heatmap
g<- g+ theme(axis.text.x=element_text(angle=90,hjust=1)) # defining the theme of the plot
g # displaying the plot

#End of Lab-6