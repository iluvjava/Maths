[[Vector Space]]

---
### **Intro**

An Inner product space is a vector space the is together with an inner product defined with it. However, if the vector space is a complete space, then this makes no difference with [[Hilbert Space]]. 

**Inner Product might Differ**: 

> However, there are also subtleties that come with the idea of inner product. See [[Inner Product Axiomatically Defined]] for a detailed covered. Depending on the scalar field of the vector field, the choice of inner product might differ. Both semi-inner product and product space are fine for the theory I believe. 


**Definition-1 | Inner Product Space**

> Let $X$ be an inner product space then it first has to equip with $\Vert \cdot\Vert$, and inner product mapping $\langle \cdot, \cdot\rangle$ such that $\Vert x\Vert = \sqrt{\langle x, x\rangle}$. 

**References**: 
Kryzig's Textbook, see section 4.1 for more information. 

---
### **The Parallelogram Equality**

There is one exciting new features that got added into Inner Product space compare to just a normed space. The geometry now contains some elements of triangles and some type of orthogonality between elements from the underlying vector space. For more context see [wikipedia](https://en.wikipedia.org/wiki/Parallelogram_law) for this law, it's somewhat well-known. 


**Def-2 | The Paralleloragram Equality**
> For all $x, y \in X$, we have the equality that: $\Vert x + y\Vert^2 + \Vert x - y\Vert^2= 2(\Vert x\Vert^2 + \Vert y\Vert^2)$, and this condition is also equivalent to the inequality: 
> $\Vert x + y\Vert^2 + \Vert x - y\Vert^2 \le 2 (\Vert x\Vert^2 + \Vert y\Vert^2)$. 

**Justifications**: 

Consider the substitution: $a = \frac{x + y}{2}$, $b = \frac{x - y}{2}$, which is a bijective mapping between all $(x, y)\in X\times X$ and $(a, b)\in X\times X$, the substitution will reverse the inequality. We skip the details here. 

We may also invoke the definition of an inner product to derive the equality: 

$$
\begin{aligned}
    \Vert x + y\Vert^2  &= \langle x + y, x+ y\rangle
    \\
    &= \langle x, x + y\rangle + \langle y, x + y\rangle
    \\
    &= \langle x + y, x\rangle + \langle x +y, y\rangle
    \\
    &= \langle x, x\rangle + \langle y, x\rangle + \langle x, y\rangle + \langle y, y\rangle
    \\
    &= \Vert x\Vert^2 + 2 \langle x, y\rangle + \Vert y\Vert^2, 
\end{aligned}
$$

and followed by a similar token, it's the case that $\Vert y - x\Vert^2 = \Vert x\Vert^2 + \Vert y\Vert^2 - 2 \langle x, y\rangle$, hence, adding them together yields the Parallarogram Equality stated at the start. 


---
### **Orthogonality, Cauchy Swartchz, and Continuity of Inner Product**
We defines some basics concepts. 
**Def-3|Orthogonality**
> 2 vector are orthognal to each other in the inner product space, denoted by $x \perp y$ if and only if $\langle x, y\rangle= 0$. 



