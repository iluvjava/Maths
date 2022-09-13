[[Subgradient and Subdifferential Definition]]


---
### **Intro**

> Let $f:\mathbb E \mapsto \mathbb{\bar R}$ be a convex lsc proper function, then the subgradient $\partial f$ is a multi-valued operator, and the inverse of the operator is $\partial f^\star$. 

**Proof**

By the fact that $f$ is convex proper we can use the Fenchel identity: 

$$
\begin{aligned}
    & x\in \partial f(z)
    \\
    \iff &
    z\in \partial f^\star(x), 
\end{aligned}
$$

which completes the proof.  
