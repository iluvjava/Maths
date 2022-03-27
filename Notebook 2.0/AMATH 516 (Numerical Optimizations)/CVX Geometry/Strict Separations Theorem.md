[[Convex Sets Properties]]

---
### **Intro**

**The strict Separations Theorem**: 

> For a nonempty, closed and convex set $Q\subseteq \mathbb R^n$, a point $y\notin Q$, there exists a nonzero vector $a\in \mathbb R^n$ and a number $b\in \mathbb R$ such that: 
>
> $$
> \langle a, x\rangle\le b < \langle a, y\rangle
> $$ 
> The point $a$ lies in the lowe half space and the point $y$ lines in the upper half space of the separation line with perpendicular vector $a$.(WLOG assuming a is positive).

---
### **Proof**

Because the set $Q$ is convex, then for any $y$, the projection is a singleton hence unique. In that case, we make use of the obtuse angle thoerem and the projection point to construct the inequality: 

$$
\begin{aligned}
    \langle 
        x - \underset{Q}{\text{proj}}(y), 
        \underbrace{y - \underset{Q}{\text{proj}}(y)}_{:= a}
    \rangle &\le 0
    \\
    \langle x - \underset{Q}{\text{proj}}(y), a \rangle 
    &\le 0
    \\
    \langle x, a\rangle
    &\le \langle 
        \underset{Q}{\text{proj}}(y), a
    \rangle
    \\
    \langle x, a\rangle
    &
    \le \langle 
        y - a, a
    \rangle
    \\
    &= \langle y, a\rangle - \Vert a\Vert_2^2
    \\
    & \le \langle y, a\rangle
\end{aligned}
$$

Therefore, if we define $a = y - \text{proj}_Q(y)$ and $b = \langle a, y\rangle - \Vert a\Vert_2^2$, then: 

$$
\langle x, a\rangle \le b \le \langle y, a\rangle
$$

The proof is completed. 


---
### **Supporting Halfspaces**

Taking the theorem to its logical extreme, we can let $y$ approaching the convex nonempty $Q$: 
> then A half space $Q$, is said to support the set $Q$ at a point $x \in \text{cl}(Q)$ if the inclusions, $x \in \text{bd}(H)$ and $Q\subseteq H$ hold. mathematically stated as: 
> The convex set $Q$ admits supporting halfspace at a point $x\in \text{cl}(Q)$ if and only if $x$ lies on the boundary of $Q$. 




