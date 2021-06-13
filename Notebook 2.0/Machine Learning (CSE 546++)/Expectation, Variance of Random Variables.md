Here, we learn how to deal with the expectation of random variables. 


---

### **Intro**

The discrete and the continuous case is analogous to each other, here we will only talk about the discrete case. (Replace Sums with Integrals)

Suppose that random variable $X$ has a PMF: $f_X(x)$, then the expected value will be defined as: 

$$
\mathbb{E}\left[X\right] = 
 \sum_{x\in \Omega_X}^{}
    xf_X(x)
$$

---
### **Properties of the Operator**

Nested Function:

$$
\mathbb{E}\left[g(X)\right]
=
\sum_{x\in\Omega_x}^{}
    g(x)\mathbb{P}\left(g(X) = g(x)\right)
=
\sum_{x = \Omega_x}^{}
    g(x)f_X(x)
$$

And certainly, this is almost always true: 

$$
\mathbb{E}\left[X^2\right] \ne \mathbb{E}\left[X\right]^2
$$

It's A Linear Operator: 

$$
\mathbb{E}\left[aX + b\right]
=
a \mathbb{E}\left[X\right] + b
$$

It's still Linear wrt multiple **Independent Random Variables**:

$$
\mathbb{E}\left[\sum_{i = 1}^{n}X_i\right]
=
\sum_{i = 1}^{n}\mathbb{E}\left[X_i\right]
$$

If the random variables $X, Y$ are independent, then: 

$$
\mathbb{E}\left[XY\right] = \mathbb{E}\left[X\right]\mathbb{E}\left[Y\right]
$$

Which also means that the covariance of the 2 variable is going to be zero: 

$$
\text{Cov}(X, Y) = 0
$$

In fact, the covariance is zero if and only if the 2 random variable is independent. 


---
### **Expectation and Variance**

The variance of a random variable can be measure by some fancy magics with the Expectation value of the random variable: 

$$
\mathbb{E}\left[X^2\right] + \mathbb{E}\left[X\right]^2
$$

And hence, it's not hard to see that: 

$$
\text{Var}\left[X\right] = \mathbb{E}\left[(X - \mathbb{E}\left[X\right])^2\right]
=
\mathbb{E}\left[X^2\right] + \mathbb{E}\left[X\right]^2
$$

And hence it's not hard to see the property that: 

$$
\text{Var}\left[aX + b\right] = a^2 \text{Var}\left[X\right]
$$


### **Covariance**

$$
\text{Cov}(X, Y) = \mathbb{E}\left[(X - 
    \mathbb{E}\left[X\right])(
    Y - \mathbb{E}\left[Y\right])
\right]
$$

