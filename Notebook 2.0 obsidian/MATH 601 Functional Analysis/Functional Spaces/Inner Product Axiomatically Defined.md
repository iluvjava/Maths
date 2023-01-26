[[Vector Space]]


---
### **Intro**

An inner product is a function defined over 2 elements from a vector space and returns an element in a field that is defined together with that vector space. 

> There are 2 types of inner product, Semi-inner-product and just inner product. The later is stricter than the former. 

Semi-Inner Product is very similar to inner product defined over the vector space of complex vectors and the with complex field. 


---
### **Semi-Inner Product**

> A semi-inner-product is a vector space defined over the field of complex. Let the vector space be $V$ and $[f, g]$ be defined as the inner product for any 2 elements from the vector space then the following will have to be true: 

$$
\begin{aligned}
    & [f, f] \ge 0
    \\
    & [f+ g, h] = [f, h] + [g, h]  \quad \text{Linearity for First arg only}
    \\
    & [sf, g] = s [f, g] \;\forall s \in \mathbb{C}
    \\
    & [f, sg] = \bar{s}[f, g] \;\forall s \in \mathbb C
    \\
    & |[f, g]| \le [f, f]^{1/2} [g, g]^{1/2}
\end{aligned}
$$

**Warning**: In general: $[f, g] \neq [g, f]$. This is because of the 4th property defined above. 


### **Inner Product Definition**

> The definition abstracts the inner product defined over all the finite dimensional real vectors. Let $\langle x, y\rangle$  be the inner product be any 2 elements from the vector space and consider an extra element $z$, then let $\alpha$ be the element from the scalar field the comes with the vector field, then the following must be true: 

$$
\begin{aligned}
    & \langle x + z, y\rangle = \langle x, y\rangle + \langle z, y\rangle
    \\
    & \langle \alpha x, y\rangle = \alpha\langle x, y\rangle
    \\
    & \langle x, y\rangle = \langle y, x\rangle
    \\
    & \langle x, x\rangle \le \mathbf 0 \wedge \langle x, x\rangle = \mathbf 0 \iff x = \mathbf 0
\end{aligned}
$$




