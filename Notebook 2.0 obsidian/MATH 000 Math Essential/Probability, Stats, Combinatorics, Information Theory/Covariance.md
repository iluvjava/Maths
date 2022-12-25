Covariance needs [[Expectations of Random Variables without Sigma Algebra]]. 


---
### **Intro**

Let $X, Y$ be 2 random variables, then we define the covariance to be: 

$$
\text{Cov}(X, Y) = 
    \mathbb{E}\left[
        (X -\mathbb{E}\left[X\right])
        (Y -\mathbb{E}\left[Y\right])
        \right]
    = 
    \mathbb{E}\left[XY\right] - 
    \mathbb{E}\left[X\right]
    \mathbb{E}\left[Y\right]
$$

Which is somewhat similar to variance, especially the second way of viewing it. The application of covariance are straight forward. Covariance is a measurement of linear dependence between 2 random variable, it's testing some underlying generate process such as the $Y = aX + b$. Where one of the random variable is linear related to the other one. 

**Common Misconception**

If 2 random variable is independent, then their covariance will be zero, the converse is not true, and when they are dependent, their covariance can still be zero. 

---
### **Useful Properties**

1. $X\perp Y\implies \text{Cov}\left(X,Y\right) = 0$, Where $X\perp Y$ means that these 2 random variables are independent. 
2. $\text{Cov}(X,X) = \text{Var}\left[X\right]$
3. $\text{Cov}\left(X,Y\right) = \text{Cov}\left(Y,X\right)$
4. $\text{Cov}\left(X + c,Y\right) = \text{Cov}\left(X,Y\right)$, Shift invariance. It's the same if we shift any/both of the variable by some constant. 
5. $\text{Cov}\left(aX + bY, Z\right) = a\text{Cov}\left(X,Z\right) + b \text{Cov}\left(Y,Z\right)$. It's Collinear. 
6. $\text{Var}\left[X + Y\right] = \text{Var}\left[X\right] + \text{Var}\left[Y\right] + 2 \text{Cov}\left(X,Y\right)$, think of the quadratic formula for $(X + Y)^2$ to remember this. 
7. $\text{Cov}\left(\sum_{i = 1}^{n}X_i,\sum_{i = 1}^{m}Y_i\right) = \sum_{i = 1}^{n}\sum_{i = 1}^{m}\text{Cov}\left(X_i,Y_j\right)$, a general results from property 5. 

Property 5, 6, 7 are interesting, let's look into it. 

**Property 5: Collinearity**

$$
\begin{aligned}
    \text{Cov}\left(aX + bY,Z\right) 
    &= 
    \mathbb{E}\left[aXZ + bYZ\right] - \mathbb{E}\left[aX + bY\right]\mathbb{E}\left[Z\right]
    \\
    &= 
    a \mathbb{E}\left[X\right]\mathbb{E}\left[Z\right] +  b \mathbb{E}\left[Y\right]\mathbb{E}\left[Z\right] - 
    (
        a\mathbb{E}\left[X\right]
        + 
        b \mathbb{E}\left[Y\right]
    )\mathbb{E}\left[Z\right]
    \\
    &= 
    a \mathbb{E}\left[X\right]\mathbb{E}\left[Z\right] +  b \mathbb{E}\left[Y\right]\mathbb{E}\left[Z\right] - 
    a \mathbb{E}\left[X\right]\mathbb{E}\left[Z\right] - 
    b \mathbb{E}\left[Y\right]\mathbb{E}\left[Z\right]
    \\
    &= 
    a \text{Cov}\left(X,Z\right) + b \text{Cov}\left(Y,Z\right)
\end{aligned}
$$

**Property 6**

$$
\begin{aligned}
    \text{Var}\left[X+ Y \right] &= \mathbb{E}\left[
            (X + Y  - \mathbb{E}\left[
                    X + Y
                \right])^2
        \right]
    \\
    &= 
    \mathbb{E}\left[
            (X - \mathbb{E}\left[X\right] + Y - \mathbb{E}\left[Y\right])^2
        \right]
    \\
    &= 
    \mathbb{E}\left[
            (X - \mathbb{E}\left[X\right])^2 
            + 
            (Y - \mathbb{E}\left[Y\right])^2
            + 
            2(X - \mathbb{E}\left[X\right])(Y - \mathbb{E}\left[Y\right])
        \right]
    \\
    &= 
    \text{Var}\left[X\right] + \text{Var}\left[Y\right] + 2 \text{Cov}\left(X,Y\right)
\end{aligned}
$$


**Property 7**

Use property 5 to prove this one, it's trivial and left as an exercise for the readers. 

---
### **Examples and Stuff**

**Application: Pearson Correlation Coefficients**

> One of the important applications of the covariance is the Pearson's correlations, which is computed via: 

$$
\rho(X, Y) = 
\frac{\text{Cov}\left(X,Y\right)}
{\sqrt{\text{Var}\left[X\right]\text{Var}\left[Y\right]}}, 
$$

immediately observe that using property 2., the Pearson correlation coefficient of the variables with itself is the always 1. 

**Example 1:** 

> Given $Y = aX +b$, find $\text{Cov}\left(X,Y\right)$

$$
\begin{aligned}
    \text{Cov}\left(X,Y\right) &= \text{Cov}
        \left(X,aX + b\right)
    \\
    &=
    a\text{Cov}\left(X,X\right) + 
    \text{Cov}\left(X,b\right)
    \\
    &=
    a \text{Var}\left[X\right] + 0
\end{aligned}
$$

**Example: Variance of Sum**

> Given the sum of random variables, say $\sum_{i} X_i$, find the variance of the sum. First assume no independence, and then assume independence, give results for both type of assumptions. 

$$
\begin{aligned}
    \text{Var}\left[
            \sum_{i = 1}^{n}
            X_i
        \right]
    &= 
    \text{Cov}\left(
        \sum_{i = 1}^{n}X_i,
        \sum_{i = 1}^{n}X_i
        \right)
    \\
    &= 
    \sum_{i = 1}^{n}
    \sum_{j = 1}^{n}
    \text{Cov}\left(X_i,X_j\right)
    \\
    &= 
    \sum_{i = 1}^{n}
    \left(
        \sum_{j = 1, j\ne i}^{n}
            \left(
                \text{Cov}\left(X_i,X_j\right)
            \right)
        + 
        \text{Cov}\left(X_i,X_i\right)
    \right)
    \\
    &=
    \left(
        \sum_{i = 1}^{n}
        \sum_{j = i + 1}^{n}
            2\text{Cov}\left(X_i,X_j\right)
    \right)
    +
    \sum_{i = 1}^{n}
        \text{Var}\left[X_i\right], 
\end{aligned}
$$

notice that assuming independence of the random variables, then the sum of the variance is the variance of the sum. 




