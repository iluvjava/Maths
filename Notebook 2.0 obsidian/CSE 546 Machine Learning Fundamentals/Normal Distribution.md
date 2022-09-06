This thing is used so much it deserves its page. 

---
### **Intro**

$$
\mathcal{N}(x; \mu, \sigma=\beta^{-1}) = 
\sqrt{\frac{\beta}{2\pi}}
\exp \left(
-\frac{1}{2}\beta (x - \mu)^2
\right)
$$

The input is variance, not standard deviation. 

For $\mathbb{R}^{n}$, we have: 

$$
\mathcal{N}(x; \mu, \Sigma) =
\sqrt{
    \frac{1}{(2\pi)^n \text{det}(\Sigma)}
}
\exp \left(
    -\frac{1}{2}(x - \mu) \Sigma^{-1} (x - \mu)
\right)
$$

Where, the matrix $\Sigma$ is the covariance matrix for the distribution. The matrix $\Sigma$ is Symmetric Positive Definite, so it's invertible and has determinant. 

Usually, the distribution is transformed so that we only need to deal with a diagonal matrix $\Sigma$. Consider Eigen Decomposition. 

