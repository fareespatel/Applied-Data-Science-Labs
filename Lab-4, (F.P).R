# Farees Patel

# Lab-4 : Sampling and decisions

set.seed(2) # Used Generate same set of random numbers

sampleSize <- 30 # Setting sample size as 30

studentPop <- rnorm(20000,mean=20,sd=3) # Generating 20000 random numbers with mean 20 and deviation of 3 and storing it in studentPop

undergrads <- sample(studentPop,size=sampleSize,replace=TRUE) # generating sample of size 30 from studentPop and storing it in undergrads

grads <- rnorm(sampleSize,mean=25,sd=3) # Generating 30 random numbers with mean around 25 and deviation of 3 and storing it in grads

if (runif(1)>0.5) { testSample <- grads } else { testSample <- undergrads } # runif function used to generate random deviates 

mean(testSample) # contains a sample either from grads or undergrads

SampleMeans <- replicate(100,mean(sample(studentPop, size=30, replace=TRUE)),simplify=TRUE) # Generates mean valuesof 100 samples of size 30 

SampleMeans # Displaying SampleMeans

compare <- quantile(SampleMeans, probs=c(0.025,0.975)) # Generates sample quantiles less than 2.5% and more than 97.5%

compare # Displaying the quantile values 

#Comparing and getting to know whether the testSample value is an extreme or not

if ((compare[1] < testSample) && (testSample < compare[2]) ){print("Sample mean is not extreme")} else {print("Sample mean is extreme")}

#End of Lab-4