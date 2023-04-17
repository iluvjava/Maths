[[Non-Smooth Calculus/Subgradient Introduction]]


---
### **Intro**

Using the definition of the subgradient, we wish to show that the subgradient of a function, as a multi-valued mapping, is mapping to a set that is convex.

**Theorem**
> Assuming that the function $f$ is closed a convex, then $\partial f(x)$ is also closed and convex for all $x\in \mathbb E$, the Euclidean space. 


**Proof**

Assuming that $\partial f(x)\neq \emptyset$, Take $u_0, u_1\in \partial f(x)$ let $\lambda \in (0, 1)$, For any $y\in \mathbb E$, we have: 

$$
\begin{aligned}
    & f(x) + \langle y - x, u_0\rangle \le f(y) & (*)
    \\
    & f(x) + \langle y - x, u_1\rangle \le f(y) & (\star)
    \\
    \text{consider: } & (1 - \lambda)(*) + \lambda(\star) 
    \\
    \implies & 
    f(x) + \langle y - x, (1 - \lambda)u_0 + \lambda u_1\rangle \le f(y),  & 
\end{aligned}
$$

therefore, the point $(1 - \lambda)u_0 + \lambda u_1$ is still going to be part of the subgradient at $x$. Next we consider the fact that for any $u_i\rightarrow u$, the inequality is going to hold by the fact that the function is affine and the property of the limit. 


**Remarks**

This would mean that adding the 2 subgradient preserves the convexity of both subgradient. 