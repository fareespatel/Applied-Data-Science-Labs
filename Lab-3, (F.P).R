# Name: Farees Patel

#Lab 3: Distributions & Wrinting functions

#Task-1
#1
sample<-rnorm(1000,80) #creating a normal distribution of 1000 random numbers

#2
myfunction<-function(vec,min,max) #creating a functionto pass vector, min value, max value
{
  return(sum(vec >= min & vec <= max)) #return the total of numbers between min and max included
}

#3
myfunction(sample,79,81) #calling and passing values

#4
myfunction(rnorm(1000,80),79,81) #Check for varying results
myfunction(rnorm(1000,80),79,81) #Check for varying results
myfunction(rnorm(1000,80),79,81) #Check for varying results

#Task-2
#1
FSApops<-rpareto(51,2,1) #creating 51 random numbers with appropriate breakpoints and shape using rpareto function

#2
FSApops<-rpareto(51,69467,1) #creating 51 random numbers with appropriate breakpoints and shape using rpareto function

#3
hist(FSApops) #plot histogram of the above function

#4
mean(FSApops) # mean of the random numbers

sd(FSApops) #standard deviation of random numbers

#5
min(FSApops) #minimum value of random numbers

max(FSApops) #maximum value of the random numbers

#End of Lab-3