[[Vector Space]]

---
### **Into**

[Hilbert space](https://mathworld.wolfram.com/HilbertSpace.html) is first of all, a [[Banach Space]]. However, unlike Banach space the norm of the Hilbert Space must be defined via the inner product of that space. The completeness is inherited from the Banach Space definition. 

**Hilbert Norm Definition**

> $$
> \Vert f\Vert := \sqrt{\langle f, f\rangle}
> $$


---
### **Examples**

**Finite Dimensional Hilbert Spaces**

The ones I work with on a daily basis: 

>$$
>\mathbb R^n \quad \mathbb C^n
>$$


**Infinite Dimensional Hilbert Spaces**

There are a lot of examples of infinite dimensional hilbert space, the one we will define here will be the famous one that I worked with a lot. One of the famous one is the the L2 hilbert space, where we consider function $\mathbb R \mapsto \mathbb R$ who is integrable over some domain $[a, b]$, finite or infinite, and the inner product between element is defined as: 

> $$
> \langle f,g \rangle = \int_{a}^{b} f(x)g(x)dx
> $$
