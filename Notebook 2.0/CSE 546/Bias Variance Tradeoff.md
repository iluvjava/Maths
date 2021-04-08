This is going to be a variable important concept that governs the realm of over-fitting and under-fitting. 
[[Performance Metric]], 

And, this is a very fundamental concept in statistical learning, here is a good resource that talks about it: 

[link](http://scott.fortmann-roe.com/docs/BiasVariance.html) to Understanding the Bias and Variance Trade off. 

We will use some knowledge from [[Expectation of Random Variables]] to manipulate the math a bit. 

And the proof is here: [Wiki Link](https://www.wikiwand.com/en/Bias%E2%80%93variance_tradeoff)

---
### **Intro**

When a trained model tries to predict something, there are 2 type of errors that arises. 

1. Error due the variance.
2. Error due to bias. 
   
Errors of these 2 types are connected in some ways. 

**Errors Due to Biases**

Assume that, a lot of models are trained using different samples draw from the populations. (Ideally, infinitely many such models are trained.)

Then, the difference between the expected value of all the models and the actual ground truth expectation of the data. 


**Errors Due to Variance**

The variability of the prediction made by all different kind of models we trained. 

**Mathematical Definition**

Assume an underlying generative model of the form: 

$$
Y = f(X) + \epsilon
$$

Where $\epsilon$ is some kind of noise with some kind of distribution that has a variance of $\sigma_\epsilon$ and a mean of $0$. 

And let the model $\hat{f}(x)$ be our estimate of the model using observation. 

$$
\text{Err}(x) = \mathbb{E}\left[(Y - \hat{f}(x))^2\right]
$$

---
### **Proof**

We are going to use some algebra tricks for this one and it's like: 

$$
\mathbb{E}\left[
        (Y + f(x) - f(x) - \hat{f}(x))^2
    \right]
$$

Which we then use the quadratic equation to get the expression that: 

$$
\mathbb{E}\left[
        (Y - f(x))^2 + 2(Y - f(x))(f(x) - \hat{f}(x)) + (f(x) - \hat{f}(x))^2
    \right]
$$

We assume that the random variable $\hat{f}(x)$ is independent of the noise $\epsilon$, then we can say that the cross term looks like: 

$$
\mathbb{E}\left[
        2(Y - f(x))(f(x) - \hat{f}(x))
    \right]
=
2
\mathbb{E}\left[ 
    \underbrace{
        (Y - f(x))}_{\epsilon }
    \right]
\mathbb{E}\left[
        (f(x) - \hat{f}(x))
    \right] = 0
$$

This part is by the independence. and the fact that the expected value of $\epsilon$ is zero, we know that the expected value of the cross term in fact zero. 



