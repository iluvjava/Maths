[[Random Variables]], [[PDFs, PMFs]]

---
### **Intro**

A lot of the time we let the random variables interact in many different ways, and upon doing so, we need to understand some good mechanism that help us them out. Here is a list of transformation and how we are going to handle them. 
1. Transform on a single random variable where the transformation is fully invertible. 
2. Transformation on a multivariable function where the multivariable function is perfectly invertible for all probability space of the random variable. 
3. Lesbegue integral for the general cases. 
4. Special cases such as when we have the sum of 2 random variable. And in the case of i.i.d random variable, we just use the generating functions for the distributions. 

**Theorem: 1D random variable transformations**

> Let $g(X)$ be the transformed random variable where $X$ has a PDF of $f_X(x)$, well defined. Assuming that the function $g$ is strictly monotone, so that it will have a single value pre-image for any single interval input, the PDF of $g(X)$ is given as: 
> $$f_{G(x)}(x) = f(g^{-1}(x))|g'(x)^{-1}|. $$
