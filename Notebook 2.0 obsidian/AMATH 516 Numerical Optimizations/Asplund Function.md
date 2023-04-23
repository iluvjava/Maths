[[Duality/Convex Conjugation Introduction]]


---
### **Intro**

The Asplund function is an example of a difference between 2 convex functions resulting in a function that is still convex. 

**Definition: Asplund Function**
> Define $S\subset X$ to be non-empty. Asplund function is defined as: 
> $$
> \begin{aligned}
>     f(x) := \frac{1}{2}\Vert x\Vert^2 - \frac{1}{2}d^2_S(x), 
> \end{aligned}
> $$

**Observations**: 

$S \subseteq X$ is never stated to be a convex subset. If you take the derivative of $f$, you will end up with $\Pi_{S}(x)$, the projection function onto the set $S$. 


**References**: Provided exclusively by Heinz's course notes as Example 4.10


---
#### **Claim-1 | Asplund Function is a Convex Function**

We show the it is convex by showing that it's the convex conjugate of another function: $1/2\Vert \cdot\Vert^2 + \delta_C$. Let $C\subseteq X$ be some set in the Euclidean space. 

$$
\begin{aligned}
    \;&\sup_{x\in X}\left\lbrace
        \langle x, y\rangle - \frac{1}{2}\Vert x\Vert^2 - \delta_C(x)
    \right\rbrace
    \\
    =&
    \sup_{x\in C}\left\lbrace
       \langle x, y\rangle - \frac{1}{2}\Vert x\Vert^2
    \right\rbrace
    \\
    =&
    \sup_{x\in C}
    \left\lbrace
       \langle x, y\rangle - \frac{1}{2}\Vert x\Vert^2
        - \frac{1}{2}\Vert y\Vert^2
    \right\rbrace + \frac{1}{2}\Vert y\Vert^2
    \\
    =& 
    \sup_{x\in C}
    \left\lbrace
       -\left(
            - \langle x, y\rangle + \frac{1}{2}\Vert x\Vert^2
            + \frac{1}{2}\Vert y\Vert^2
       \right)
    \right\rbrace + \frac{1}{2}\Vert y\Vert^2
    \\
    =& 
    -\inf_{x\in C}
    \left\lbrace
        \frac{1}{2}\Vert x - y \Vert^2
    \right\rbrace + 
    \frac{1}{2}\Vert y\Vert^2
    \\
    =& 
    \frac{1}{2}\Vert y\Vert^2 - d_C^2(y). 
\end{aligned}
$$

From the fact that the convex conjugate of any function is a convex function. The asplund function is also a convex function. 


