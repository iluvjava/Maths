This is linked to [Random variable Distribution function](../../AMATH%20561%20Probability%20Theory/Probability%20Basics/Random%20Variables%20as%20Measurable%20Functions.md). 

---
### **Intro**
1. PDFs are used to model continuous R.Vs. 
2. PMFs are used to model discrete R.Vs. 
3. Both models the probability of observing some values for random variable. 


---
### **PDF/PMF**

Assume that $X$ is discrete with PMF $p_X(x)$: 

$$
\mathbb{P}\left(X = a\right) = p_X(x)
$$

And assume that $X$ is continuous with PDF $f_X(x)$ then: 

$$
    \mathbb{P}\left(l < X < u\right) = 
    \int_{x = l}^{x = u} f_X(x) dx    
$$

However, it would implies that $\mathbb{P}(X = a) = 0$, **don't mess up the probability with probability density function please**. Here are the restrictions for PDFs, PMFs: 

$$
\forall x_i \quad p_x(x) > 0 \wedge \forall x_i \sum_{x\in\Omega_X}^{}\left(x\right) = 1
$$

The PMF must all be positive (Because probability) and their sum is always 1 (Because Probability). The same thing can be said for PDFs, just replace the sum with the integral and we get the same thing. 


---
### **CDF**

CDF, Cumulative frequency function models the probability, let $F(x)$ be th e cumulative frequency function for random variable $X$, and let $f(x)$ be the PDF for the random variable $X$, then it's definition is: 

$$
F(a) = \mathbb{P}\left(X \le a\right) = \int_{-\infty}^{a} f(x)dx
$$

And, the cdf function can be measured empirically(Via experiment) as: 

$$
F(a) = 
\mathbb{E}\left[
        \frac{1}{n}
        \sum_{i = 1}^{n}
            \mathbf{1}\{X \le a\}
    \right]
$$

It's the probability of the event where, random variable $X\le a$. The expected value is just taking in finitely many such observation and determine the probability. In this case, this is an unbiased estimator to the output of the CDF function. 

---
### **Joint Distributions Functions**

 A **joint distribution function** is a function with 2 variables is non-negative meaning that $f(x, y) > 0; \forall\; x \in \Omega_X, y \in \Omega_Y$ and satisfying 

$$
\iint_{(x, y)\in \Omega_X\times \Omega_Y} f(x, y) dxdy = 1, 
$$

often in the discrete case, the functions joint distribution function is written as: 

$$
p_{X, Y}(x, y)
$$

If, $X$ and $Y$ are independent, each having their own **independent probability** distribution, say: $p_X$, a univariate function and $p_Y$ also univariate, then their joint distribution is:$p_{X, Y} =p_X(x)p_Y(y)$. 


---
### **Probability Density Function Transformations**

Suppose that we were given 2 random variables $X, Y$ and a function $G$ that maps it to 2 other random variables then $(V, W) = G(X, Y)$. The question is, what is the distribution function for the random variable $(V, W)$? See [Probability Density Functions Transformations](../../STATS%20501%20Statistics%20for%20Mathematicians/Probability%20Density%20Functions%20Transformations.md) for more info. 



