# BayesianCredibleIntervals

This is a code example comparing a bayesian credible interval with a frequentist confidence interval when varying the sample size and the true proportions. The bayesian credible interval is given by a Binomail Beta conjugate prior. One can alter the prior by changing the inital value of the beta distirbution with hyperparamters a and b. The data is sampled with a binomial model after using the Beta prior. After the Binomail Beta conjugate prior is made, the bayesian credible interval is constructed and compared with a standard confidence interval.

When the sample size is small, the beta prior performs very poorly for the Bayesian credible interval. Therefore in some cases the frequentist cofidence interval will perform better. This is because the Bayesian method learns from the data and you need a higher sample size in order to learn well from the data. I implemented the mixture of priors in this situation in order to sample for the Bayes interval. 

When the p0 and p1 are closer together, the Bayesian credible interval has better coverage, but still not as good as the frequentest interval. If you go to the extremes of the p0 and p1, then the Bayesian has worse coverage for a small sample size. This shows that you need a larger sample and less extreme p values in order for the Bayesian interval to do better.
