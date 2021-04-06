How do we measure the performance metric of things. 


---
### **Intro**

Let's consider a joint distribution, and it's like: 

$$
\mathbb{P}\left(X = x \cap Y = y\right)
$$

So, the model's job is to find the best fit condition curve to fit the given data. 

Predict the value of:

$$
\mathbb{P}\left(Y|X = x\right)
$$


### **Performance Metric of Statistical Learning**

We want to look for function $\eta$ such that it **minimizes** the quantity of: 

$$
\mathbb{E}_{XY}\left[
        (Y - \eta(X))^2
    \right]
$$

Notice the subscript, we are using the joint probability distribution. 

Notice that, this is the variance of the random variable, namely, the variance between the predicted value and the actual value of random variable $Y$

We are taking the expectation of all population of $X, Y$, this formulation is very ideal. 

And, we make different hypothesis on the function $\eta$, and then that is what we did in part: 

