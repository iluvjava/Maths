See [[Performance Metric]] first. 

Relavent resources: 
- [link](http://scott.fortmann-roe.com/docs/BiasVariance.html) to Understanding the Bias and Variance Trade off. 
- We will use some knowledge from [[Expectations of Random Variables without Sigma Algebra]] to manipulate the math a bit. 
- And the proof is here: [Wiki Link](https://en.wikipedia.org/wiki/Bias%E2%80%93variance_tradeoff)

---
### **Intro**

When a trained model tries to predict something, there are 2 type of errors: 

1. Error due the variance of the distributions.
2. Error due to bias of the model. 

**Errors Due to Biases**

> Infinite number of the same models are trained using the distribution of the data from the populations using finite many data. Then, the difference between the expected value of the predicted value of a given input of all the models and the actual ground truth expectation of the data is the error due to biases of the model. 

**Errors Due to Variance**

> The variability of the prediction made by all different kind of models we trained using a finitely data. 

**Mathematical Definition**

Assume an underlying generative model of the form: $Y = f(X) + \epsilon$ where $\epsilon$ is some kind of noise with some kind of distribution that has a variance of $\sigma_\epsilon$ and a mean of $0$. Let the model $\hat{f}(x)$ be our estimate of the model using a set of observations, then the squared error of the predicted values can e decomposed into the sum of the 2 errors, mathematically given as: 

$$
\text{Err}(x) = \mathbb{E}\left[(Y - \hat{f}(x))^2\right]
=
\mathbb{E}\left[(Y - f(x))^2\right]
 + 
\mathbb{E}\left[(f(x) - \hat{f}(x))^2\right],
$$

And this is the components of the learning errors of a trained model. 

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

Hence, the bias and variance trade off theorem can be ultimately written like: 

$$
\text{Err}(x) = 
\underbrace{
\mathbb{E}\left[(Y - f(x))^2\right]}_{(1): \text{Irreducible Error}}
 + 
\underbrace{
\mathbb{E}\left[(f(x) - \hat{f}(x))^2\right]}_{\text{(2): Learning Error}}
$$

1. **Irreducible error**, and this is independent of the random variable $\hat{f}(x)$, which is the model we trained using some given samples. 
2. And the second term is the **Learning Error**. This can be reduce by make a lot of observations, and it's the error we will be working on. 

**Looking at the Learning Error more closely** 

$$
\text{Learning Error} = 
\mathbb{E}\left[ 
        \left(
            f(x) - \mathbb{E}\left[\hat{f}(x)\right] + 
            \mathbb{E}\left[\hat{f}(x)\right] - \hat{f}(x)
        \right)^2
    \right]
$$

Just expanding the inside we have the expression that: 

$$
\left(
    f(x) - \mathbb{E}\left[\hat{f}(x)\right]
\right)^2 + 
2\underbrace{
\left(
    f(x) - \mathbb{E}\left[\hat{f}(x)\right]
\right)}_{\epsilon}
\left(
    \mathbb{E}\left[\hat{f}(x)\right] - \hat{f}(x)
\right)
+ 
\left(
    \mathbb{E}\left[\hat{f}(x)\right] - \hat{f}(x)
\right)^2
$$

Using the assumption that the noise is independence of the variable model $\hat{f}(x)$ produced, the cross term in the middle has expectation of zero. 

Now we are left with 2 terms and this is like:

$$
\text{Learning Error}
=
\underbrace{
\mathbb{E}\left[
        \left(
        f(x) - \mathbb{E}\left[\hat{f}(x)\right]
        \right)^2
    \right]}_{(3):\text{Bias}^2}
+ 
\underbrace{
\mathbb{E}\left[
        \left(
            \mathbb{E}\left[\hat{f}(x)\right] - \hat{f}(x)
        \right)^2
    \right]}_{(4):\text{Variance}}
$$

And take note that, the learning errors consist of 2 pars too: 

3. This is the **Bias**, like, it's possible that our model could be off for some reasons, due to the limitation of our model. 
4. This is the **Variance**. This is he variance of the models we produce. Some of the learning errors created could just be the variance of the model. To overcome this. This is the term that govern the realm of over-fittings. 

THIS, is the variance and the bias that we are going to be focus on for training machine learning models. 

**Note**: 
The biased square is more commonly written as (After some simple math using the properties of expected values): 

$$
\text{Bias}^2 = 
\left(
    f(x) - \mathbb{E}\left[\hat{f}(x)\right]
\right)^2
$$

**Question**: 

Why the proof feels so weird? 

Because we are making something out of nothing, the induction of the terms: $f(x), \mathbb{E}\left[\hat{f}(x)\right]$ is just a matter of intuitive understanding of the matter instead of something that is based on theorem and axioms.

---
### **Model Complexity**

> The variance increases with the complexity of the model and the biases will increase as the models get too simple. 

![[bias-variance-tradeoff.png]]


---
### **Example Analysis: Linear Regression**

We are skipping this, but it's in the lecture notes [here](https://courses.cs.washington.edu/courses/cse446/21sp/schedule/lecture_6_live.pdf). 