- [[../../AMATH 561 Probability Theory/Probability Basics/Random Variables as Measurable Functions]], 
- [[PDFs, PMFs]]

---
### **Intro**

A lot of the time we let the random variables interact in many different ways, and upon doing so, we need to understand some good mechanism that help us them out. Here is a list of transformation and how we are going to handle them. 
1. Transform on a single random variable where the transformation is fully invertible. 
2. Transformation on a multivariable function where the multivariable function is perfectly invertible for all probability space of the random variable. 
3. Lesbegue integral for the general cases. 
4. Special cases such as when we have the sum of 2 random variable. And in the case of i.i.d random variable, we just use the generating functions for the distributions. 

Good references: [here](https://en.wikipedia.org/wiki/Probability_density_function#Function_of_random_variables_and_change_of_variables_in_the_probability_density_function). 

**Theorem | 1D random variable transformations**

> Let $g(X)$ be the transformed random variable where $X$ has a PDF of $f_X(x)$, well defined. Assuming that the function $g$ is strictly monotone, so that it will have a single value pre-image for any single interval input, the PDF of $g(X)$ is given as: 
> $$f_{g(X)}(x) = f_X(g^{-1}(x))|(g^{-1}(x))'|. $$

**Proof**

From the definition of probability density function: 

$$
\begin{aligned}
    f_{g(X)}(x) &= \lim_{h\rightarrow 0}
    \frac{\mathbb P(g(X)\in [x - h, x + h])}{2h}, 
\end{aligned}
$$

here I invoke the finite difference definition for a differentiable function, in this case the existence of $f_{G(x)}(x)$ is assumed and by definition it's the measure of pre-image of $G(X)\in [x - h, x + h]$ as $h\rightarrow 0$. Let's take a careful look at the measure on the pre-image: 

$$
\begin{aligned}
    & P(X\in g^{-1}([x -h, x + h]))
    \\
    &=  
    F_X(\max \{g^{-1}([x - h, x + h])\}) - F_X(\min \{g^{-1}([x - h, x + h])\})
    \\
    &= |F_X(g^{-1}(x + h)) - F_X(g^{-1}(x - h))|, 
\end{aligned}
$$

take notice that here we use the fact that the function is strictly monotonic, therefore the pre-image for an interval is still an non-degenerate interval. And the measure of the interval is the maximum element subtract the minimum. Using the definition of the cumulative density function, we are able to express it in term of $F_X$. Finally, taking the limit of the above quantity yields: 

$$
\begin{aligned}
    f_{G(X)}(x) &= 
    \lim_{h\rightarrow 0}
    \frac{|
        F_X\circ g^{-1}(x + h) - F_X\circ g^{-1}(x - h)
    |}{2h}
    \\
    &= |F_X'\circ g^{-1}(x)(g(x)^{-1})'|
    \\
    &= f_X\circ g^{-1}(x)|(g(x)^{-1})'|, 
\end{aligned}
$$

and we make use of the fact that the derive of $F_X$ is always positive and chain rule. Given that $g$ is strictly monotonic, we know that the pre-image function is single-valued and differentiable as well. In general, when the function is not monotonic but continuous, we can break it into strictly monotone function over a partition of the domain of the function, and analyze the theorem section by section. However, if the function $g$ is not continuous, then things gets very interesting. 

---
### **Invertible in High Dimension**

For a high dimensional mapping $G(\vec{X})$, mapping from $\mathbb R^n$ back to itself, and its pre-image is single-valued, meaning that it can be differentiated with $J[G]$, being the Jacobi. Let $f(\vec{X})$ be an mapping from $\mathbb R^n$ to $\mathbb R$ be the  density function for random variable $\vec{X}$, then the transform random variable $G(\vec {X})$ will be given by: 

$$
\begin{aligned}
    g(\vec{x}) &= 
    J[G^{-1}]^T_{\vec X} g\circ G^{-1}(\vec X)
\end{aligned}
$$

---
### **The General Case 2D to 1D**

Suppose that we have 2 random variables $X, Y$ in $\mathbb R\times \mathbb R$, then the probability measure placed on the random variable $G(X, Y)$ is given as: 

$$
\begin{aligned}
    \mathbb P(g(X, Y) \le t) &= 
    \mathbb P(\{(x: g(x, y) \le t, y \in \mathbb R\}, \{y: g(x, y)\le t, x \in \mathbb R\})
    \\
    &= \iint_{g^{-1}((-\infty ,t ])}^{} 
    f_{X, Y}(x, y)
    dxdy, 
\end{aligned}
$$

which is a measure of the pre-image, weighted by the probability density function. The measure of the pre-image however, need to be discussed on a case by case basis for the function $g$ at hand. 

**Remark**

It's easy to generalize this idea to any mapping between any spaces. It's just that we need the density function and the Lesbegue integral. 

---
### **Linear Transform**

We consider the pdf of linear transform for some random variable. 

---
### **Inverse Log Transform**

We consider the negative log transform for a random variable. This distribution would represent the distribution of entropy for the random variable. Entropy of the random variable is the expected value of the transformed pdf. See [Shannon's Entropy](Shannon's%20Entropy.md) for more information. 



