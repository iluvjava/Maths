How do we measure the performance metric of things. 
[[Bias Variance Tradeoff]]

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

---
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

**Note**: Notice that, this one is carried out without the usage of a generative model and the type of noises that are involved.

**Note**: We are doing the square loss, it's am implicit assumption that the noise from the generative model has Gaussian distribution.

---
### **Best Model**

Under the least square loss, the best estimating function should be: 

$$
\eta(x) = \mathbb{E}_{Y|X}\left[ 
        Y | X = x
    \right]
$$

The average value of $Y$ given the observation $x$ is the thing the minimizes the variance on the predicted value. 

**Proof**

Consider taking the derivative wrt to the function $\eta(x)$ on the variance of the prediction: 

$$
\partial_{\eta(x)}
\mathbb{E}_{Y|X}\left[
        (Y - \eta (x))^2|X = x
    \right] = 0 
$$

using the properties of the Expectation of random variables, we have: 

$$
\mathbb{E}_{Y|X}\left[2(Y - \eta(x))| X = x\right] = 0
$$

$$
0  = -2 \mathbb{E}_{Y|X}\left[
        Y|X = x
    \right] + 2\eta(x)
$$

$$
\implies \eta(x) = \mathbb{E}_{Y|X}\left[
        Y|X = x
    \right]
$$

This is the optimal predictor using the square loss assumption. 

However, in reality, we can only make the data from the samples, some kind of concrete observations from the data, and hence the thing that we are actually looking for is: 

$$
\underset{f\in\mathcal{F}}{\text{argmin}}
\left\lbrace
    \sum_{i = 1}^{N}\left(y_i - f(x_i)\right)^2
\right\rbrace
$$