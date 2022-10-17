#p0 and p1 are population proportions for the lower bound and uppoer bound of the frequentist and bayesian interval
#p0 is set for the lower bound for the coverage and p1 is set for the upper bound of the coverage
p0 <- 0.01
p1 <- 0.99
Delta <- p0 - p1 #It is necessary to subtract p0 and p1 in order to have a metric to compare the two methods
n0 <- 20 #This is the sample size for the lower bound
n1 <- 26 #This is the sample size for the upper bound
a0 <- b0 <- 1/2 #These are the prio paramters for the beta that can be adjusted to change the prior beta distribution
a1 <- b1 <- 1/2

mc <- 5000 #Number of monte carlo iterations
cover <- coverb <- rep(0,mc)
for (iter in 1:mc){
  x0 <- rbinom(1,n0,p0) #sample n0 binomial draws with probability of success p0
  x1 <- rbinom(1,n1,p1) #sample n1 binomial draws with probability of success p1
  test <- prop.test(c(x0,x1),c(n0,n1)) #This takes the proportion of successes for x0 and x1 given the varying sample sizes
  u <- test$conf.int[2] #u is the upper bound of the confidence interval
  l <- test$conf.int[1] #l is the lower bound of the confidence interval
  theta0 <- rbeta(5000,x0+a0,n0-x0 + b0) #theta0 is the conjugate beta estimate for p0
  theta1 <- rbeta(5000,x1+a1,n1-x1 + b1) #theta1 is the conjugate beta estimate for p1
  delta.sample <- theta0 - theta1
  ubayes <- quantile(delta.sample,0.975)
  lbayes <- quantile(delta.sample,0.025)
  coverb[iter] <- Delta > lbayes & Delta < ubayes
  cover[iter] <- Delta > l & Delta < u	
}
mean(cover) #This is the final average of the frequentist interval
mean(coverb) #This is the final average of the bayesian interval
