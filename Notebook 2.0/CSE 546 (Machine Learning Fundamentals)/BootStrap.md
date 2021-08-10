This is a statistical method for estimating variance on some predictor given the model we have. 


---
### **Intro**

How accurate is hour estimator? 

How do I get statistics from the model parameters I trained? 

What could be the error for a particular sample x? 

**Bootstrap: 1979 by Bradley Elfon**


---
### **Non-Parametric Bootstrap**

Let the samples we have to be the ground truth distribution, this is the assumption we made. 

Data set denoted as $\mathcal{D}_n$. 

We assume that the samples we collected are "i.d.d". 

Then we sample from the sample $\mathcal{D}_n$, $b$ times, with replacement for each of the sample. 

Then we produce multiple estimator from each of the boostrap sample, $\mathcal{D}_n^{(b)}$. 

Then let that boostrap estimator to be $\hat{f}^{(b)}(x)$, and this will be the the set of estimator we get that can be used to produce more predictors of this kind. 

**Pros and cons**

* Pros
  * Easy to use and applies to everything. 

* Cons
  * Potentially computationally intensive. 
  * The reliability is dependent on the convergence rate of the Empirical CDF to the ground truth CDF, and most cases, this is unknown. 


### **Deep Learning Variance Estimate**

[Drop Out as a Bayesian Approximation](https://arxiv.org/abs/1506.02142)

* But dropout itself is also a way of doing regularization, and in that sensem we have a paper for discussing it too. See [Improving Neural Network by preventng co-adaptation of features detectors](https://arxiv.org/abs/1207.0580) for more. 
