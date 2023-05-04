[[Vector Space]]

---
### **Intro**

An Inner product space is a vector space the is together with an inner product defined with it. However, if the vector space is a complete space, then this makes no difference with [[Hilbert Space]]. 

**Inner Product might Differ**: 

> However, there are also subtleties that come with the idea of inner product. See [[../Inner Product Axiomatically Defined]] for a detailed covered. Depending on the scalar field of the vector field, the choice of inner product might differ. Both semi-inner product and product space are fine for the theory I believe. 


**Definition-1 | Inner Product Space**

> Let $X$ be an inner product space then it first has to equip with $\Vert \cdot\Vert$, and inner product mapping $\langle \cdot, \cdot\rangle$ such that $\Vert x\Vert = \sqrt{\langle x, x\rangle}$. 


**Def-2 | Hilbert Space**
> Hilbert space, denoted using $\mathcal H$ is a complete inner product space. All Hilbert spaces are inner product space but there are inner product space that is not Hilbert. 

For example, the space $Y\subseteq l^2$, denoting all sequence that only have finitely many non-zero element is an incomplete inner product space, hence it's not a Hilbert space. 


**References**: 
Kryzig's Textbook, see section 4.1 for more information. 

---
### **The Parallelogram Equality**

There is one exciting new features that got added into Inner Product space compare to just a normed space. The geometry now contains some elements of triangles and some type of orthogonality between elements from the underlying vector space. For more context see [wikipedia](https://en.wikipedia.org/wiki/Parallelogram_law) for this law, it's somewhat well-known. 


**Def-3 | The Paralleloragram Equality**
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

**Examples**: 

We give, without demonstrations, some examples of inner produce spaces and their inner products. 
- $l^p$ has inner product $\sum_{i = 1}^{\infty}x_iy_i$. 
- $L^2[a, b]$ space has inner product: $\int f(x)g(x)dx =: \langle f, g\rangle$. 

---
### **Orthogonality, Cauchy Swartchz, and Continuity of Inner Product**
We defines some basics concepts. The concept of a inner product directly defines orthogonality. Next, we extend Cauchy Inequality to any inner product spaces, we show the cases for its equality, and then we use it to prove the the inner product mapping is indeed a continuous mapping. 

#### **Def-4 | Orthogonality** 
> 2 vector are orthognal to each other in the inner product space, denoted by $x \perp y$ if and only if $\langle x, y\rangle= 0$. 

#### **Thm-1 | Cauchy Inequality**
> Let $x, y \in \mathcal H$, then $|\langle x, y\rangle| \le \Vert x\Vert \Vert y\Vert$, equality holds if and only if $x, y$ are linear dependent. 

**Proof-1**: 

Choose any $x, y \in \mathcal H$ consider $g(t) = \Vert x - ty\Vert = \Vert x\Vert^2 + t^2\Vert y\Vert^2 - 2t \langle x, y\rangle$. We observe that this is a quadratic function wrt $t$, and it's a positive quadratic hence, having an apex as the point of minimum. For that to be true we have: 

$$
\begin{aligned}
    & g(t) \ge 0 \forall t \iff \Delta \le 0, 
    \\
    & \Delta = (-2\langle x, y\rangle)^2 - 4 \Vert x\Vert^2 \Vert y\Vert^2 
    \\
    & \Delta \le 0 \iff (-2\langle x, y\rangle)^2 - 4 \Vert x\Vert^2 \Vert y\Vert^2 \le 0
    \\
    \implies & 
    |\langle x, y\rangle| \le \Vert y\Vert\Vert x\Vert, 
\end{aligned}
$$

and notice that the equality holds if and only if $g(t) = 0$ for all $t \in \mathbb R$, so that $\Vert x - ty\Vert = 0$, so that $x = ty$, so that $x,y$ are linear dependent vectors. 

**Remarks**

There are other alterative proofs that only uses inner product and norms, and doesn't make the assumeptions that $t\in \mathbb R$, since $t\in \mathbb C$ is also valid for certain $\mathcal H$, certain Hilbert spaces. In those Hilbert spaces, we have semi-inner product instead. 

#### **Inner Product is Continuous**

> Inner product as a mapping $X\times X \mapsto \mathbb R$ is a continuous mapping, on both of its parameters, so as a result Let $x_n, y_n$ converges to $x, y$, then $\lim_{n\rightarrow \infty} \langle x_n, y_n\rangle = \langle x, y\rangle$. 

**Proof**

Directly consider the difference: 

$$
\begin{aligned}
    |\langle x_n, y_n\rangle - \langle x, y\rangle|  
    &= 
    | \langle x_n - x, y_n\rangle
    + \langle x, y_n\rangle - \langle x, y\rangle |
    \\
    &= 
    |\langle x_n - x, y_n \rangle + \langle x, y_n - y\rangle|
    \\
    &= 
    |\langle  x_n - x, y_n\rangle| + 
    |\langle x, y_n - y\rangle|
    \\
    &\le \Vert x_n - x\Vert\Vert y_n\Vert + \Vert x\Vert \Vert y_n - y\Vert. 
    \\
    [1] \implies &
    \le \Vert x_n - x\Vert M + \Vert x\Vert \Vert y_n - y\Vert
    \\
    \implies 
    \lim_{n\rightarrow \infty} |\langle x_n, y_n\rangle - \langle x, y\rangle| 
    & \le 0
\end{aligned}
$$

At \[1\], from the fact that $x_n, y_n$ converges, it has to be the case that $x_n, y_n$ are bounded sequence, let $\Vert y_n\Vert \le M$, forall $n\in \mathbb N$. Therefore, the mapping is a continuous mapping. 