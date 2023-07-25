[[Functional Spaces/Vector Space]]


---
### **Intro**

An inner product is a function defined over 2 elements from a vector space and returns an element in a field that is defined together with that vector space. 

> There are 2 types of inner product, Sesquilinear-inner-product. The later is stricter than the former. 

Sesquilinear-Inner Product is very similar to inner product defined over the vector space of complex vectors and the with complex field. It's very different for the inner product defined over the real space due to the presence of conjugacy and the linearity only applies to one of the arguments of the mapping. 


---
### **Sesquilinear-Inner Product**

> A Sesquilinear-inner-product is a vector space defined over the field of complex. Let the vector space be $V$ and $[f, g]$ be defined as the inner product for any 2 elements from the vector space then the following will have to be true: 

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
    & |[f, g]| \le [f, f]^{1/2} [g, g]^{1/2} \quad \text{Cauchy }
\end{aligned}
$$

**Warning**: In general: $[f, g] \neq [g, f]$. This is because of the 4th property defined above. 

For more on this one, see [Complex Inner Product](../../AMATH%20584%20Numerical%20Linear%20Algebra/Matrix%20Theory/Complex%20Inner%20Product.md) to get some concrete ideas for it. In general, we need to remember the following 3 laws when dealing with Sesquilinear-Inner product. 

1. $\langle x, y\rangle = \overline{\langle y, x\rangle}$, swapping elements means conjugating the output of the inner product. 
2. $\langle x, \alpha y\rangle = \langle \bar \alpha x, y\rangle$, conjuating the operator when moving it from left to write in the inner product operator. 
3. $\langle x + z, y\rangle = \langle z, y\rangle + \langle x, y\rangle$, inner product is only linear in the first argument, when using linearity, one must commute the element before applying it to the first argument of the linear product! 




---
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




