- [A Brutal Introduction to Linear Programming](../AMATH%20514%20Combinatorics%20Optimizations/A%20Brutal%20Introduction%20to%20Linear%20Programming.md)
- [Dual Norm](Background/Dual%20Norm.md)

---
### **Intro**

Error bound theory is very deep and broad in the field of numerical optimizations. 
This file give one example of an Error Bound in the early days of the field. 
The idea traces back to this publication: 
> Hoffman, A.J.: On approximate solutions of systems of linear inequalities. J. Res. Natl. Bur. Stand. 49, 263–265 (1952)

Hoffman found a inequality that bounds the distance to a polytope using it's constraint violation. 
Necoara et al. [^1] presented the inequality in their paper. 

**Notations are now in order.**
Denote $\Vert \cdot\Vert_{(\cdot)}, \Vert \cdot\Vert_{(\cdot)^\star}$ for the norm and dual norm in an Euclidean space. 
Take $P$ in an Euclidean space, denote $[\cdot]_{P} \equiv \argmin{z \in P}\Vert z - (\cdot)\Vert$ as the projection onto a set $P$. 
Similarly, denote $[\cdot]_+$ as the projection on the positive quadrant of any Euclidean space. 
And denote $[m]$ with $m \in \N$ to be the enumeration of $\{1, 2, \ldots, m\}$. 
The theorem the follows introduce the formulation of error bound presented by Necoara et al. 

#### **Theorem | Hoffman error bound**
> Let $A \in \R^{p\times n}, C \in \R^{m \times n}$. 
> Take arbitrary norm $\Vert \cdot\Vert_\alpha, \Vert \cdot\Vert_\beta$in $\R^{m + p}, \R^n$ respectively. 
> Given the non empty polyhedron $\mathcal P = \{x \in \R^n: Ax = b, Cx \le d\}$. 
> Then there exists constant $\theta(A, C) > 0$ such that the inequality holds: 
> $$
> \begin{aligned}
>     (\forall x \in \R^n):\;\Vert x - \bar x\Vert_\beta \le \theta(A, C) 
>     \left\Vert
>         \begin{matrix}
>             Ax - b \\ [Cx - d]_+
>         \end{matrix}
>     \right\Vert_\alpha. 
> \end{aligned}
> $$

Looking for the constant $\theta(A, C)$ is a totally different business. 
This $\theta(A, C)$ is referred to as the Hoffman constant in the literature. 
Necoara et al. presented the Hoffman constant assuming that $A$ has full row rank. 

$$
\begin{aligned}
    r&:= \text{rank}[A^T, C^T], 
    \\
    \mathcal J &:= 
    \left\{
        I \in 2^{[m]}: |I| = r - p, \text{rank}[A^T \;C_I^T] = r
    \right\}, 
    \\
    \zeta_{\alpha, \beta}(A, C) &:= 
    \min_{I \in \mathcal J} \min_{u, v}\left\lbrace
        \left\Vert
            A^Tu + C^Tv
        \right\Vert_{\beta^\star}:
        \left\Vert
            \begin{matrix}u \\ v\end{matrix}
        \right\Vert_{\alpha^\star} = 1, 
        v_I \ge \mathbf 0, v_{[m]\setminus I} = \mathbf 0
    \right\rbrace. 
\end{aligned}
$$

And, equivalently: 
$$
\begin{aligned}
    \zeta_{\alpha, \beta}(A, C)^{-1} = \sup\left\lbrace
        \left\Vert
            \begin{matrix}
                u\\ v
            \end{matrix}
        \right\Vert_{\alpha^\star}: 
        {\small \begin{aligned}
            & \Vert A^T + C^Tv\Vert_{\beta^\star} = 1\\
            & \text{ Rows of $C$ corresponding to nonzero component of $v$}\\
            & \text{and rows of $A$ are linear independent.}
        \end{aligned}}
    \right\rbrace.
\end{aligned}
$$



---
### **The Hoffman constants, Examples**




[^1]: I. Necoara, Yu. Nesterov, and F. Glineur, “Linear convergence of first order methods for non-strongly convex optimization,” _Math. Program._, vol. 175, no. 1, pp. 69–107, May 2019, doi: [10.1007/s10107-018-1232-1](https://doi.org/10.1007/s10107-018-1232-1).


