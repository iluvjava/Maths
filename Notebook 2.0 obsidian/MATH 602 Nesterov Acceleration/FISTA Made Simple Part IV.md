- [FISTA Made Simple Part III](FISTA%20Made%20Simple%20Part%20III.md)

---
### **Intro**

This file continues the discussion. 
But, this time, we focus on linear convergence rate that doesn't need strong convexity. 
We will introduce strong convexity relative to a semi-norm and, the proximal gradient inequality, and Jesen's inequality. 


#### **Assumption 1 | Smooth and semi strongly convex**
> The following assumption is about $(f, A_1, A_2)$
> Let $f: \R^n \rightarrow \overline \R$, and there exists $L \ge \sigma \ge 0$ and, two matrices $A_1, A_2$ such that for all $x, y \in \R^n$ it has 
> $$
> \begin{aligned}
>     (\forall x \in \R^m)(\forall y \in \R^m)\quad
>     \frac{1}{2}\Vert A_1x - A_1y\Vert^2 \le 
>     D_f(x, y) \le \frac{1}{2}\Vert A_2x - A_2y\Vert^2. 
> \end{aligned}
> $$

#### **Assumption 2 | Smooth and semi strongly convex plus convex**
> The following assumption is about $(f, g, F, L, \sigma, A_1, A_2)$. 
> Let $F = f + g$ where $f$ satisfies Assumption 1 and, $g: \R^n\rightarrow \overline \R$ is a closed convex and proper function. 

#### **Assumption 3 | strongly convex with affine composite**
> The following assumption is about $$

We promise that under these assumption we can extend the linear convergence rate of Nesterov's accelerated gradient algorithm to beyond the strongly convex case. 
The following will characterize a specific class of function that satisfies Assumption 2.

#### **Theorem | affine composite of S-CNVX functions**
> Let $A\in \R^{n \times m}$ and $b \in \R^n$.
> Suppose that $g:\R^n \rightarrow \overline \R$ is a $\mu \ge 0$ strongly convex and $L_g$ smooth. 
> Then the function $f = g(Ax + b)$ is Smooth and semi strongly convex with $A_1 = \sqrt{\mu}A$, and $A_2 = \sqrt{L_g}A$, here $I$ is the identity function. 

**Proof**

The proof is direct. 
Let $x, y \in \R$ be arbitrary. 
For $A_1$ it has: 
$$
\begin{aligned}
    & f(x) - f(y) - \langle \nabla f(y), x - y\rangle
    \\
    &=
    g(Ax) - g(Ay) - \langle A^T \nabla g(y), x - y\rangle
    \\
    &= g(Ax) - g(Ay) - \langle \nabla g(y), Ax - Ay\rangle
    \\
    &\ge \frac{\mu}{2}\Vert Ax - Ay\Vert^2.
\end{aligned}
$$

Next, for the upper bound from the smoothness, it's also direct because 

$$
\begin{aligned}
    & f(x) - f(y) - \langle \nabla f(y), x - y\rangle
    \\
    &= g(Ax) - g(Ay) - \left\langle A^T\nabla g(x), x - y\right\rangle
    \\
    &\le \frac{L_g}{2} \Vert Ax - Ay\Vert^2. 
\end{aligned}
$$


$\blacksquare$

The following theorem shows that, smooth and semi strongly convex function has similar behaviors. 
#### **Theorem | simple, S-CNVX like bounds on smooth and semi strongly convex**
> 

**Remarks**

#### **Theorem | proximal gradient inequality**


#### **Theorem | Jesen's inequality**