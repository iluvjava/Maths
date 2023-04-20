[Sturm Liouville Theory](Sturm%20Liouville%20Theory.md) is needed for this, and the completeness theorem of the SL system from [Sturm Liouville Theory P2](Sturm%20Liouville%20Theory%20P2.md) is also needed for this. 

This is a method that is for solving non homogeneous PDEs, in a finite domain. 

This is Chapter 14 Materials.

---
### **Intro**

Here is an example of a non-homogeneous PDE: 

$$
\partial_t[u] + \alpha^2 \partial_x^2[u] = \sin(3\pi x)
$$

BC, IC: 

$$
u(0, t) = u(1, t) = 0 \quad u(x, 0) = \sin(\pi x)
$$

Under the domain: $x \in[0, 1]$. Take note, this even works when the non-homogeneous part is depending in time: 
$$
\partial_t[u] + \alpha^2 \partial_x^2[u] = f(t, x)
$$

**Procedures**: 

**1. Find the eigenfunctions for the solution for the Homogeneous version of the PDE.**

The soltuion for the system 

$$
\partial_t[u] + \alpha^2 \partial_x^2[u] = 0
$$

And skipping how to solve this, we have: 

$$
X_n(x) = \sin(n\pi x) \quad \tilde{\lambda}_n = n\pi \quad n \in \mathbb{N}
$$

Make note that, when we solve for the Eigen Functions $X_n(x)$, we were dealing with: 

$$
\frac{X''(x)}{X} =  - \tilde{\lambda}^2
$$

And this is a **Sturm Loiuville System**!  With $p(x) = r(x) = 1$ and $q(x) = 0$, and $\lambda = \tilde{\lambda}^2$. 

By the **Completeness Theorem**, the Eigen functions $X_n(x)$ is going to be complete in this case. 

Ok, as we all know it, the solution for the system can be expressed as: 
