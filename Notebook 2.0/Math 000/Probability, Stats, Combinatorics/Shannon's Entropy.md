We need this for machine learning. 
[[Expectation of Random Variables]]

---
### **Intro**

The Shannon's Entropy is a measure on the amount of bits needed to represents the information from a given probability distribution of a random variable. 

Given a discrete random variable $X$, taking $n$ possible outcomes with nonzero possibility, the entropy is measured by: 

$$
H(X) = \sum_{i = 1}^{n}
    \mathbb{P}\left(X = i\right)\log\left(
        \frac{1}{\mathbb{P}\left(X = i\right)}
    \right)
$$

By analogy the continuous case will be: 

$$
H(X) = \int_{-\infty}^{\infty} 
    f(x)\log\left(
        \frac{1}{f(x)}
    \right)
dx
$$

**FAQ:**

> What is this a measure of? 

The measures the expected value of "surprises". 

> Why is there a log? 

Shannon's idea is that, for a set of $N$ elements, one would need another set of symbols of $\log_2(N)$ to represents all the element, without loss, without compression. 



**Observations**

Take notice that: 

$$
H(X) = \mathbb{E}_{x\sim p}\left[
    \log \left(
    \frac{1}{p(x)}
\right)\right]
$$

An the natural log of $\frac{1}{p(x)}$ is the element of "surprise".

If all outcomes are equally likely to happen, the entropy is maximizes. 





---
### **Legit Interpretations**

What is "Surprise"? 

**Claim**: 

> Information is the reciprical of the probability. 

Consider outcomes with 2 cases: $1, 0$, with probability of $\frac{1}{4}, \frac{3}{4}$. 

Each event can be measured by the common factor, in this case it's $\frac{1}{4}$. 

If $1$ is true, then by knowing $\frac{1}{4}$, we obtained that $\frac{3}{4}$ didn't happen, a total of 1. The ratio between everything we know and the outcome that happened is $(\frac{1}{4} + \frac{3}{4})\div \frac{1}{4}$, which is $4$. 

**Claim**: 

> The entropy measures how flat the distribution is. Consider sorting all the outcomes of the discrete variable by its frequencies, and then then use that as the ordering for all the oucome. 

To test the claim, let's consider this probability density function: 

$$
f(x) := (p + 1)x^p \quad \forall x\in [0,1], p > 0
$$

This is a probability function that gets pointier and pointier as the value for $p$ gets larger. 

In this regard, a measure of entropy on this distribution yields: 

$$
\begin{aligned}
    \int_{0}^{1} 
        f(x)\ln\left(
            \frac{1}{f(x)}
        \right)
    dx
    &= 
    \int_{0}^{1} 
    -(p + 1)x^p \ln ((p + 1)x^p)
    dx
    \\
    &= - (p + 1)
    \int_{0}^{1} 
        x^p(\ln(p + 1) + p\ln(x))
    dx
    \\
    &= 
    -\ln(p + 1)(p + 1)\left[
            \frac{x^{p + 1}}{p + 1}
        \right|_{0}^1
    - 
    (p + 1)p\int_{0}^{1} 
        x^p \ln(x)
    dx
    \\
    &= 
    -\ln(p + 1) - (p + 1)p
    \int_{0}^{1} 
        \ln(x)
    d\left(
        \frac{x^{p + 1}}{p + 1}
    \right)
    \\
    &= 
    \ln \left(
        \frac{1}{p + 1}
    \right) - 
    (p + 1)p \left(
        \left[
            \frac{\ln(x)x^{p + 1}}{p + 1}    
        \right|_{0}^1
        -
        \int_{0}^{1} 
            \frac{x^{p + 1}}{p + 1}
        d\ln (x)
    \right)
    \\
    \underset{\text{Skipping maths}}{\implies}
    &= 
    \ln\left(
        \frac{1}{p + 1}
    \right) + 1
\end{aligned}
$$

Observe the fact that, the minima is obtained when $p = 0$, and the entropy is just going to negative infinity as $p \rightarrow \infty$

Basically, the more equal each outcome it is, the bigger the entropy, the existence of outcome with very small posibility will bump up the entropy, tremendously. 


---
### **Decision Tree and Information Gain**

One of the major applications for the entropy measure is the information gain when branching a [[Decision Tree]] learning model. 

> When braching, we choose a splitting criteria such that the information gain is maximized. The information gain over a spliting criterion is measured as the entropy of the parant node minus the average entropy on the children nodes. 

$$
\text{IG}(k) = H(X) - \frac{H(X|X > k) + H(X| X< k)}{2}
$$

And this is how information gain is relavent to shannon's entropy. 

