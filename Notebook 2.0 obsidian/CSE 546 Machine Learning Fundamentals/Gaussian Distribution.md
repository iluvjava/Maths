- [PDFs, PMFs](../STATS%20501%20Statistics%20for%20Mathematicians/PDFs,%20PMFs.md)
- [Covariance](../STATS%20501%20Statistics%20for%20Mathematicians/Covariance.md)

---
### **Intro**

The Probability density function of a Normal distribution is given by: 

$$
\mathcal{N}(x; \mu, \sigma=\beta^{-1}) = 
\sqrt{\frac{\beta}{2\pi}}
\exp 
\left(
    -\frac{1}{2}\beta (x - \mu)^2
\right). 
$$

The input $\sigma$ is variance, not the standard deviation. 
In $\mathbb{R}^{n}$, we have Gaussian Distribution (Multi-dimensional version of the normal distribution): 

$$
\begin{aligned}
    \mathcal{N}(x; \mu, \Sigma) &=
    \sqrt{
        \frac{1}{(2\pi)^n \text{det}(\Sigma)}
    }
    \exp \left(
        -\frac{1}{2}(x - \mu)^T \Sigma^{-1} (x - \mu)
    \right)
    \\
    &=  
    \sqrt{\frac{1}{|2\pi \Sigma|}}
    \exp\left(
        \frac{-1}{2}\Vert x- \mu\Vert_{\Sigma^{-1}}^2
    \right)
\end{aligned}
$$

Where, the matrix $\Sigma$ is the covariance matrix. 

**Note**

The matrix $\Sigma$ is Symmetric Positive Definite, so it's invertible with non-zero determinant. 
Usually, the distribution is transformed into a different coordinate so that we only need to deal with a diagonal matrix $\Sigma$, using the Eigen decomposition of the matrix $\Sigma$. 


**Remarks**

Reducing the distribution's covariance matrix to diagonal decomposes the multivariate distribution into a cross product of independent normal distributions in a different space. 

