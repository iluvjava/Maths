- [Gradient, Hessian Characterization of Convex Functions](../CVX%20Analysis/Gradient,%20Hessian%20Characterization%20of%20Convex%20Functions.md)
- [Subgradients Intro](../Non-Smooth%20Calculus/Subgradients%20Intro.md)
- [Convex Separations Theorems](../CVX%20Geometry/Strict%20Separations%20Theorem.md)

---
### **Intro**

A similar characterization of convexity through the subgradient of a function also exists. 
The proof is not direct and it needs some theories about the subgradient as a monotone operator, and the Epi convergence of Envelope function to the original function. 

Let $f:\R^n \rightarrow \overline \R$ be any function and it doesn't necessarily has to be convex. 
In this file we adopt the traditional Fenchel Convex Subgradient: 

$$
\begin{aligned}
    \partial f(x) := 
    \left\lbrace
        u \in \R^n : (\forall y \in \R^n)
            \; f(y) - f(x) - \langle u, y - x\rangle \ge 0
    \right\rbrace. 
\end{aligned}
$$

This is the theorem we wish to prove. 

#### **Theorem | Equivalences of convexity via subgradient**
> Let $f: \R^n \rightarrow \overline \R$ is convex then the following are equivalent: 
> 1. $f$ is a convex function. 
> 2. For all $x\in \R^n, y \in \text{dom}\; \partial f(y) \neq \emptyset$, for all $v \in \partial f(y)$ such that $f(x) - f(y) - \langle v, x- y\rangle \ge 0$. 
> 3. For all $x, y \in \text{dom}\; \partial f$, it has $\forall x' \in \partial f(x), y' \in \partial f(y)$ then $\langle x' - y', x - y\rangle \ge 0$ and it's maximally monotone. 

**Proof**

**Let's show (1) implies (2)**. 
$f$ is a convex function if and only if the set $E :=\text{epi}\;f\subseteq \R^n \times \R$ is a convex set. 
Consider the following generic half spaces in $\R^n \times \R$: 

$$
\begin{aligned}
    \mathcal H^+(v, z_0) &= \left\lbrace
        (z, \xi) \left|
            \xi - \langle a, z - z_0\rangle
            \ge 0
        \right.
    \right\rbrace, 
    \\
    \mathcal H^-(v, z_0) &= \left\lbrace
        (z, \xi) \left|
            \xi - \langle a, z - z_0\rangle
            \le 0
        \right.
    \right\rbrace. 
\end{aligned}
$$

Since $E$ is convex, there exists $v, z_0 \in \R^n$ such that separations of the points: $(x, f(x)) \in E$ and $(y, f(y) - \epsilon)\not \in E$ for all $x, y, \epsilon > 0$. 
Separation theorem of convexity asserts that $(x, f(x)) \in \mathcal H^+(v, z_0)$ and $(y, f(y) - \epsilon) \in \mathcal H^-(v, z_0)$: 

$$
\begin{aligned}
    f(x) - \langle v, x - z_0\rangle \ge 0 \ge 
    f(y) - \epsilon - \langle v, y - z_0\rangle. 
\end{aligned}
$$

It implies the following: 

$$
\begin{aligned}
    - \epsilon &\le 
    f(x) - f(y) - \langle v, x - z_0\rangle + \langle v, y - z_0\rangle 
    \\
    & = f(x) - f(y) - \langle v, x - z_0 - y + z_0\rangle
    \\
    &= 
    f(x) - f(y) - \langle v, x - y\rangle. 
\end{aligned}
$$

Take $\epsilon \searrow 0$ this yields: 

$$
\begin{aligned}
    (\forall (x, f(x)), (y, f(y)) \in E)(\exists v \in \R^n): 
    \;0 &\le f(x) - f(y) - \langle v, x - y\rangle. 
\end{aligned}
$$

Since such an element $v$ exists for all $y$ it means that the characterization $v \in \partial f(y)\neq \emptyset$. 

**Let's shohw (2) implies (3)**. 
The proof is direct. 
Pick any $x, y\in \text{dom}\; \partial f;  x' \in \partial f(x), y' \in \partial f(y)$ then consider the following: 

$$
\begin{aligned}
    0 &\le f(x) - f(y) - \langle y', x - y\rangle
    \\
    &= f(x) - f(y) - \langle y', x - y\rangle + 0
    \\
    &\le
    f(x) - f(y) - \langle y', x - y\rangle + 
    \left(
        f(y) - f(x) - \langle x', y - x\rangle
    \right)
    \\
    &= 
    - \langle y', x - y\rangle
    + \langle x', x - y\rangle
    \\
    &= 
    \langle x' - y', x - y\rangle. 
\end{aligned}
$$

**Let's show (3) implies (1)**. 

Since $f$ is not differentiable, we have to use the resolvent operator of $\partial f$, which we defined it to be: 

$$
\begin{aligned}
    P_\lambda (x) &= (1 + \lambda \partial f)^{-1}. 
\end{aligned}
$$

Since $\partial f$ is maximally monotone, $P_\lambda(x)$ is a resolvent operator and it's firmly nonexpansive, hence it's continuous, Lipschitz and differentiable while still monotone. 
These are from [Firmly Nonexpansive Operators](../Operators%20Theory/Firmly%20Nonexpansive%20Operators.md) and [Resolvent Operators](../Operators%20Theory/Resolvent%20Operators.md). 
i.e: for all $x, y$ it satisfies: 

$$
\begin{aligned}
    0 &\le 
    \Vert x - y\Vert^2 - \Vert P_\lambda(x) - P_\lambda(y)\Vert^2
    - \Vert x - P_\lambda(x) - y + P_\lambda(y)\Vert^2. 
\end{aligned}
$$

The above definition of firmly nonexpansive operator has
$P_\lambda(x)$ is firmly nonexpansive if and only if $I - P_\lambda$ is firmly nonexpansive and hence monotone. 
Recall from [Moreau Envelope and Convex Proximal Mapping](../Proximal%20Operator/Moreau%20Envelope%20and%20Convex%20Proximal%20Mapping.md) that: 

$$
\begin{aligned}
    \nabla \env_f^\lambda(x) = \lambda^{-1}(x - P_\lambda(x)).
\end{aligned}
$$

Therefore, using gradient characterization of convexity it shows that $\text{env}_f^\lambda$ is convex for all $\lambda \ge 0$. 
Finally, the monotone set convergence of the epigraph of the envelope to the original function preserves convexity and has: 

$$
\begin{aligned}
    \Lim{\lambda \searrow 0}\left(
        \text{epi}\;(\env_f^\lambda)
    \right)
    &= \text{epi}\; f. 
\end{aligned}
$$

The convexity is preserved over the set limit and hence $f$ is convex. 
See [Convexity Preserving Operations of Sets](../CVX%20Geometry/Convexity%20Preserving%20Operations%20of%20Sets.md), the intersection of convex sets for the set limits. 



$\blacksquare$


**Remarks**

For the last part of the proof see Theorem 22.18 in Heinz's book as well. 
