[Subdifferentials Subgradient Computations](Subdifferentials%20Subgradient%20Computations.md), 

---
### **Intro**

We introduce the need to reconsider the rule of affine composition in normal derivative and motivate the need to establish new rules for subgradient computations rule on convex function with affine composition. 

**Claim:**

> there exists instance where let $f:X\mapsto \mathbb{\bar{R}}$, we have the affine composition rule $A^T\partial [f](Ax) \subsetneq \partial [f\circ A](x)$. 

**Demonsrations**: 


Let's be in $\mathbb R^2$, consider $A$ to be the projection matrix to the y-axis, let $f(x) := \delta\{\mathbb{\bar{B}}_1((-1, 0))\}(x)$, an indicator function for a closed disk with radious one around the point $(-1, 0)$, for simplicity denotes $C := \mathbb{\bar B}_1((-1, 0))$ then we show that: 

$$
\begin{aligned}
    A^T\partial [\delta_C](A \mathbf 0) \subsetneq \partial [\delta_C\circ A](\mathbf 0), \text{where: } A = \begin{bmatrix}
        0 & 0 \\ 0 & 1
    \end{bmatrix}
\end{aligned}
$$

Firstly recall that $\partial \delta_C(x) = N_C(x)$, then in this case we have $\partial [\delta_C](\mathbf 0) = \mathbb R_+ \times \{0\}$. Applying $A^T(\mathbb R_+ \times \{0\}) = (0, 0)$, the singleton that is the origin. On a much general context, we consider: 

$$
\begin{aligned}
    (\delta_C\circ A)(x)&:= 
    \begin{cases}
        0 & Ax\in C
        \\
        \infty & \text{else}
    \end{cases}
    \\
    &= 
    \begin{cases}
        0 & x\in A^{-1}C
        \\
        \infty & \text{else}
    \end{cases}
    \\
    &= \delta\{A^{-1}C\}(x), 
\end{aligned}
$$

and in our case, we have the preimage of $A^{-1}$ for all the point in the unit ball around $(0, 1)$ where $A$ is the projection onto the y-axis. Choose $x=\mathbf 0$, then the preimage of $A^{-1}(0, 0)$ will be $\mathbb R\times \{\mathbf 0\}$. As we can see that $(0, 0)\subseteq \mathbb R\times \{\mathbf 0\}$. And that facilitate the need to classify conditions when the $=$ holds, and it turns out that it hapens when $\text{ri.dom} f \cap \text{rng}(a)\neq \emptyset$ and that is. 

**References:**

Exercise from Heinz's class 563. 


---
### **A Proof for the Converse Case**

#UNFINISHED

**References:** 

