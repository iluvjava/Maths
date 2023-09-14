- [[../../MATH 601 Functional Analysis, Measure Theory/Functional Spaces/Banach Contraction in Metric Space]], [[../Background/Characterizing Functions for Optimizations]]. 
- [[../Non-Smooth Calculus/Subgradient Intro]]
- [[../Strong Convexity, Equivalences and Implications]]
---
### **Intro**

A fixed point iterations can be applied to solve equations in fixed point form. It finds the root for equation of the form $x = Tx$ where $T$ is a contractive mapping. Recall that a function $g$ is strongly convex when $g(x) - (1/2)\Vert x\Vert$ is a convex function. The fixed point iterations tries to root find the equation $\mathbf 0 = \nabla f(x)$, which is equivalent to solving the equation $x = x - \beta \nabla f(x)$. Here we are in euclidean space, which is a special type of metric space. 

**Theorem | Strong Convexity make Proximal Point Contractive**
> The proximal point method considers a form of fixed point iterations: 
> $$
>   \forall n \in \N: x_{n + 1} = (\partial f + I)^{-1}x_n, 
> $$
> The sequence always converge when the function $f$ is strongly convex with constant $\beta$ and it will converge to the global minimum. 

**Proof**

Let $u, v$ be in Euclidean space $\mathbb E$ then there exists $x, y$ such that $u \in \partial f(x) + x, v\in \partial f(x) + y$ (<mark style="background:#CACFD9A6;">By unknown facts</mark>, Max Monotone Operators related), Let $T$ be the resolvent to $\partial f$ then $Tu = x, Tv = y$. Then: 
$$
\begin{aligned}
    (1 - \beta)\Vert x - y\Vert &= \Vert x - y\Vert - \beta\Vert x - y\Vert
    \\
    & \le 
    \langle x - y, x - y\rangle + 
    \langle \partial f(x) - \partial f(y), x - y\rangle \quad \text{Strong Monotone}
    \\
    &= 
    \langle \partial f(x) + x - \partial f(y) - y, x - y\rangle
    \\
    \implies 
    (1 + \beta)\Vert Tu - Tv\Vert^2 &\le 
    \langle u - v, Tu - Tv\rangle \le \Vert u - v\Vert\Vert Tu - Tv\Vert
    \\
    (1 + \beta)\Vert Tu - Tv\Vert &\le 
    \Vert u - v\Vert
    \\
    \Vert Tu - Tv\Vert &\le \frac{1}{1 + \beta} 
    \Vert u - v\Vert, 
\end{aligned}
$$

And by the fact that $\beta > 0$ for any strongly convex functions, the above fixed point iterations on the resolvent of subgradient is a contraction and it will converge to a unique minimum by Banach Contraction Theorems in metric space. 


**References**: 

Prof Wang's Math 328 class, lecture 5. 