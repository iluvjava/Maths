Covariance needs [[Expectation, Variance of Random Variables]]


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

Which is somewhat similar to variance, especially the second way of viewing it. 

The application of covariance are striaght forward. 

Covariance is a measurement of linear dependence between 2 random variable, it's testing some underlying generate process such as the $Y = aX + b$. Where one of the random variable is linear related to the other one. 

---
### **Useful Properties**

1. $X\perp Y\implies \text{Cov}\left(X,Y\right) = 0$, Where $X\perp Y$ means that these 2 random variables are independent. 
2. $\text{Cov}(X,X) = \text{Var}\left[X\right]$
3. $\text{Cov}\left(X,Y\right) = \text{Cov}\left(Y,X\right)$
4. $\text{Cov}\left(X + c,Y\right) = \text{Cov}\left(X,Y\right)$, shifting one of the variable won't change the covariance. 
5. $\text{Cov}\left(aX + bY, Z\right) = a\text{Cov}\left(X,Z\right) + b \text{Cov}\left(Y,Z\right)$
6. $\text{Var}\left[X + Y\right] = \text{Var}\left[X\right] + \text{Var}\left[Y\right] + 2 \text{Cov}\left(X,Y\right)$
7. $\text{Cov}\left(\sum_{i = 1}^{n}X_i,\sum_{i = 1}^{n}Y_i\right) = \sum_{i = 1}^{n}\sum_{i = 1}^{m}\text{Cov}\left(X_i,Y_j\right)$

Property 5, 6, 7 are interesting, let's look into it. 

**Property 5**

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

Use property 5 to prove this one, it's trivial, skipped. 



