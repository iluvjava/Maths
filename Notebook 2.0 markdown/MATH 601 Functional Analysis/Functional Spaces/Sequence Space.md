* [Vector Space](Vector%20Space.md)
* [Metric Space Introduction](Metric%20Space%20Introduction.md)

---
### **Intro**

A sequence space refers to $(a_i)_{i\in \mathbb N}$, and it's a vector space. For notations, we usually use $\mathbb K$ to represent some field, in the case of $\mathbb R$ or $\mathbb C$, the real and the complex numbers, we denote sequence of numbers in that space as: $\mathbb R^{\mathbb N}, \mathbb C^{\mathbb N}$. More over it's a vector field. One can just intuitively treat a sequence of number as a vector that has countable many numbers in it. 

**Source**: 

For more see [wiki](https://en.wikipedia.org/wiki/Sequence_space). 

**General Hierarchy:** 

Metric, Norm, Inner Product. Inner Product Induces Norms and Norms Induces Metric. 

---
### **$\mathcal l^p$ Subspaces**

**Definition**: 

> For any $0< p < \infty$, $l^p$ denotes the subspace of $\mathbb K^{\mathbb N}$ where a sequence $(x_n)_{n\in \mathbb N}$ such that: 
> 
> $$
> \begin{aligned}
>    \sum_{n = 1}^{\infty}|x_n|^p < \infty
> \end{aligned}
> $$

**Equipped with Norm**

> The space is also equipped with the norm ONLY for $p> 0$, where $\Vert \cdot \Vert_p$ on $l^p$ denotes: 
> 
> $$
> \begin{aligned}
>    \Vert x\Vert_p = \left(\sum_{n = 1}^{\infty}|x_n|^p\right)^{1/p}
> \end{aligned}
> $$

Now, we have $l^p$ as a vector space, and then a Banach space. And of course, for some special choice of $p$, we have a Hilbert Space, still a Banach Space and a metric space only for $0< p < 1$

**Remarks**: 

The definition of the $l^p$ forms subspace because linear combinations of such sequences preserves their convergence properties under the given norm space. 

