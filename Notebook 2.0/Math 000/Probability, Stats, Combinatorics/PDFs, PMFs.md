PDFs: probability Density function 
PMFs: Probability Mass function
rvs: Random Variables

---
### **Intro**

PDFs are used to model continuous rvs. 

PMFs are used to model discrete rvs. 

Both models the probability of observing some values for random variable. 

This is the definitions: 

Assume that $X$ is discrete with PMF $p_X(x)$: 

$$
\mathbb{P}\left(X = a\right) = p_X(x)
$$

And assume that $X$ is continuous with PDF $f_X(x)$ then: 

$$
\mathbb{P}\left(l < X < u\right) = 
\int_{x = l}^{x = u} f_X(x) dx
$$

However, here are the restrictions for PDFs, PMFs: 

$$
\forall x_i \quad p_x(x) > 0 \wedge \forall x_i \sum_{x\in\Omega_X}^{}\left(x\right) = 1
$$

The PMF must all be positive (Because probability) and their sum is always 1 (Because Probability). 

The same thing can be said for PDFs, just replace the sum with the integral and we get the same thing. 
