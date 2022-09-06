[[Subgradient and Subdifferential Definition]]
[[Characterizing Functions for Optimizations]]
[[Convex Sets]]

---
### **Intro**

**Theorem Statement**: 

> Let $f:\mathbb E \mapsto \mathbb{\bar{R}}$ be proper and assume that $\text{dom}(f)$ is convex. Suppose that for any $x\in \text{dom}(f)$, the set $\partial [f]_x$ is nonempty, then $f$ is convex. 


**Remarks**

The converse is true in a limited way: 

* Take note that, convexity doesn't imply that subgradient exists through the whole domain of the function. The converse part of the statement is extremely interesting and it will discussed in details in many convex analysis textbooks. See [[Convex Function is Locally Lipschitz]] for more. 
* Take note, this is not about the generalized subgradient for functions as the second definition, this is about the subgradient that is a convex closure of epigraph. For example, $\hat\partial f[f]$ is defined for smooth function and it's equivalent to $\nabla f$, and in that sense the above statement can't be about the regular subgradient because it would mean that non-convex but smooth function is convex. 


---
### **Proof**

Choose any $x, y\in \text{dom}(f)$, define $z_\alpha:= \alpha x + (1 - \alpha)y\in \text{dom}(f) \;\forall x \in [0, 1]$. The line segment will remains inside of the domain of the function, this is true by the fact that $\text{dom}(f)$ is a convex set. Using the fact that the subgradient is defined everywhere in the domain of the function, choose any $g\in \partial [f](z_\alpha)$, then we get: 

$$
\begin{aligned}
    & f(x)\ge f(z_\alpha) + \langle g, x - z_\alpha\rangle
    \\
    & f(y) \ge f(z_\alpha) + \langle g, y - z_\alpha\rangle
\end{aligned}
$$

Consider: 

$$
\begin{aligned}
    & \begin{cases}
        z_\alpha = \alpha x + (1 - \alpha)y
        \\
        z_\alpha = y + \alpha(x - y) \implies y - z_\alpha = \alpha(y - x)
    \end{cases}
    \\
    z_\alpha &= \alpha x + (1 - \alpha)y
    \\
    & = x + (\alpha - 1)x + (1 - \alpha)y
    \\
    &= x + (1 - \alpha)(y - x)
    \\
    \implies 
    x - z_\alpha &= (1 - \alpha)(x - y)
\end{aligned}
$$

Giving us the ability to simplify the subdifferential conditions to: 

$$
\begin{aligned}
    f(x) &\ge f(z_\alpha) + (1 - \alpha)\langle g, y - x\rangle
    \\
    f(y) &\ge f(z_\alpha) - \alpha \langle g, x - y\rangle
    \\
    \alpha f(x) + (1 - \alpha)f(x) &\ge f(z_\alpha)
    \\
    \alpha f(x) + (1 - \alpha)f(x) &\ge f(\alpha x + (1 - \alpha)y)
\end{aligned}
$$

Which is the secant line inequality for a convex function $f$. 


**Remarks**

The converse is not true, simply consider the function $-\sqrt{x}$ defined on $\mathbb R_+$, which has vertical asymptote at $x = 0$ regardless of the fact that it's convex. 
