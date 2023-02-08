[[Moreau Envelope of Moreau Envelope]], [[Moreau Envelope and Proximal Mapping]]


---
### **Intro**

We can take the proximal mapping on a Moreau Envelope. And this will help with generating more formulas for proximal mapping for different functions. With the knowledge that the gradient of the Moreau envelope consists of the proximal operator and the fact that nested envelope is still an envelope with a different parameters, we can derive the proximal operator on an Moreau envelope. To start, recall the following facts: 

- $\text{env}_{\text{env}_f^\mu} = \text{env}_f^{1 + \mu}$. 
- $\nabla \text{env}_f^{\mu} = \mu^{-1}(x - \text{prox}_{\mu f}(x))$. 

**Theorem: The Proximal Operators of Moreau Envelope**

> Suppose that $f$ is closed proper and convex, then the proximal operator applied on the function $\text{env}_{f}^\mu$ is given like: 
> 
> $$
> \begin{aligned}
>     \text{prox}_{\text{env}_f^\mu}(x) = (1 + \mu)^{-1}
>     \left(
>         \mu x + \text{prox}_{(1 + \mu)f}(x)
>     \right), 
> \end{aligned}
> $$

**References**

Theorem 6.63, in Amir Beck's textbook on First Order Methods for Optimizations.  

---
### **Proof**

The prove is direct by taking the gradient of the nested Moreau envelope and its equivalent, consider

$$
\begin{aligned}
    \nabla\text{env}_{\text{env}_f^\mu}(x)
    &= 
    \nabla \text{env}_f^{1 + \mu}(x)
    \\
    x - \text{prox}_{\text{env}_f^\mu}(x)
    &= 
    (1 + \mu)^{-1}(x - \text{prox}_{(1 + \mu)f}(x))
    \\
    x - (1 + \mu)^{-1} + (1 + \mu)^{-1}\text{prox}_{(1 + \mu)f}(x) 
    &= 
    \text{prox}_{\text{env}_f^\mu}(x)
    \\
    \text{prox}_{\text{env}_f^\mu}(x)
    &= 
    (1 + \mu)^{-1}\left(
        \mu x + \text{prox}_{(1 + \mu)f}(x)
    \right). 
\end{aligned}
$$

Such a formula will prove to be useful once in a while. 


---
### **Applications**

Reading the example 6.65 in Amir's Beck, First Order book. 
