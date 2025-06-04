- [A Brutal Introduction to Linear Programming](../AMATH%20514%20Combinatorics%20Optimizations/A%20Brutal%20Introduction%20to%20Linear%20Programming.md)
- [Dual Norm](Background/Dual%20Norm.md)

---
### **Intro**

Error bound theory is very deep and broad in the field of numerical optimizations. 
This file gives one example of an Error Bound in the early days of the field. 
The idea traces back to this publication: 
> Hoffman, A.J.: On approximate solutions of systems of linear inequalities. J. Res. Natl. Bur. Stand. 49, 263–265 (1952)

Hoffman found an inequality that bounds the distance to a polytope using its constraints' violation. 
Necoara et al. [^1] presented the inequality in their paper. 

**Notations are now in order.**
Denote $\Vert \cdot\Vert_{(\cdot)}, \Vert \cdot\Vert_{(\cdot)^\star}$ for the norm and dual norm in a Euclidean space. 
Take $P$ in a Euclidean space, denote $[\cdot]_{P} \equiv \argmin{z \in P}\Vert z - (\cdot)\Vert$ as the projection onto a set $P$. 
Similarly, denote $[\cdot]_+$ as the projection on the positive quadrant of any Euclidean space. 
And denote $[m]$ with $m \in \N$ to be the enumeration of $\{1, 2, \ldots, m\}$. 
The theorem the follows introduce the formulation of error bound presented by Necoara et al. 

#### **Theorem | Hoffman error bound**
> Let $A \in \R^{p\times n}, C \in \R^{m \times n}$. 
> Take arbitrary norm $\Vert \cdot\Vert_\alpha, \Vert \cdot\Vert_\beta$in $\R^{m + p}, \R^n$ respectively. 
> Given the nonempty polyhedron $\mathcal P = \{x \in \R^n: Ax = b, Cx \le d\}$. 
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
            & \text{ Rows of $C$ corresponding to positive/nonzero component of $v$}\\
            & \text{and rows of $A$ are linear independent.}
        \end{aligned}}
    \right\rbrace.
\end{aligned}
$$

Hoof man constant relates to the above parameter by $\theta(A, C) := \zeta_{\alpha, \beta}(A, C)^{-1}$. 

---
### **The Hoffman constants, Examples**

Things are normally easier for the Hoffman constant because polytopes can be equivalent to each other by a reformulation. 
Continuing from the previous section, consider the special case with $C = I, d = \mathbf 0$ so $\mathcal P = \{x \in \R^n: Ax = b, x \ge 0\}$ and consider Euclidean norm with $\alpha = \beta = 2$. 
Then it simplifies: 

$$
\begin{aligned}
    \zeta_{2, 2}(A, C) &:= 
    \min_{\mathbb I \in \mathcal J} \min_{u, v}\left\lbrace
        \left\Vert
            A^Tu + C^Tv
        \right\Vert: 
        \left\Vert
            \begin{matrix}u \\ v\end{matrix}
        \right\Vert = 1, 
        v_\mathbb I \ge \mathbf 0, v_{[m]\setminus \mathbb I} = \mathbf 0
    \right\rbrace
    \\
    &= \min_{\mathbb I \in \mathcal J} \frac{1}{\sigma_{\min}([A^T, I_{\mathbb I}^T])}. 
\end{aligned}
$$

When $m = 0$, the polytopes is the intersection of linear subspaces. 
Making $\mathcal J = \emptyset$ hence things simplify further: $\zeta_{2, 2}(A, 0) = \sigma_{\min}(A)$. 


[^1]: I. Necoara, Yu. Nesterov, and F. Glineur, “Linear convergence of first order methods for non-strongly convex optimization,” _Math. Program._, vol. 175, no. 1, pp. 69–107, May 2019, doi: [10.1007/s10107-018-1232-1](https://doi.org/10.1007/s10107-018-1232-1).