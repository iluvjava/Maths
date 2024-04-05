- [Hilbert Space Introduction](Hilbert%20Space%20Introduction.md)

---
### **Hilbert Space Projection Theorem | (3.3-1)**

We apply definition of Hilbert space, inner product, and norms to prove theorems in the Hilbert space. 

> Let $\mathcal H$ be a Hilbert space, and $M\subseteq \mathcal H$, and $M$ is a closed, convex set, then $\forall x \in \mathcal H \; \exists ! y \in M: \Vert x - y\Vert = \inf_{y'\in M} \Vert y' - x\Vert$, in brief, there is a unique point in the set $M$ such that it's closest to any arbitrary point $x \in \mathcal H$. 


**Observations**: 

Take note that, this is a generalized case of the extreme-value theorem where, the function is the distance function from a closed convex set, which is continuous. 
This makes the claim stronger and more specialized to indicator of closed and convex functions on $\mathcal H$. 
It's weaker in the sense that we have a unique minimizer to such function and without compactness to hold for the domain of the function, which is $M \subseteq \mathcal H$. 
In the proof, please observe how the properties of Hilbert space and inner product space is being used. 
To summarize the proof: 

1. We make a sequence from the infimum, and then we take the limit of it. 
2. We show that the sequence has to be Cauchy, therefore it converges to limit, which it's in $M$. 
3. Next, we show that the projection point has to be unique. 

**Proof**: 

To start, we intent the following notations to make things better: 

$$
\begin{aligned}
    \Pi_M(x) &:= \left\lbrace
        y \in M \left| 
        \Vert y - x\Vert = \inf_{y'\in M} \Vert y' - x\Vert
        \right.
    \right\rbrace,\text{ Projection on M }
    \\
    d_M(x) &:= \inf_{y'\in M} \Vert y' - x\Vert, \quad \text{ The distance func. }
\end{aligned}
$$

$d_M(x) \ge 0$ so the $\inf$ exists, from the property of $\inf$, take sequence $(y^{(n)})_{n\in \N}$ with $y^{(n)} \in M$, for all $n\in \N$, then we have $\lim_{n\rightarrow \infty} \Vert x - y^{(n)}\Vert = d_M(x)$. 
We show that the sequence $y^{(n)}$ is Cauchy. By $M$ is convex, we have: 

$$
\begin{aligned}
    \frac{y^{(m)} - y^{(n)}}{2} &\in M
    \\
    \implies d_M(x) &\le 
    \left\Vert
        x - \frac{y^{(n)} - y^{(m)}}{2}
    \right\Vert, 
\end{aligned}
$$

We now consider the paralelogram law: 

$$
{\small
\begin{aligned}
    \left\Vert 
        y^{(n)} - x - (y^{(m)}- x)
    \right\Vert^2 + 
    \left\Vert y^{(n)} - x + \left(y^{(m)}- x\right)\right\Vert
    &= 
    2 \left\Vert y^{(n)} - x\right\Vert^2 + 2\left\Vert y^{(m)} - x\right\Vert^2
    \\
    \left\Vert y^{(m)} - y^{(n)}\right\Vert^2 &= 
    2\left\Vert y^{(n)} - x\right\Vert^2 + 2 \left\Vert y^{(m)} - x\right\Vert^2 
    - \Vert (y^{(m)} - x) + (y^{(n)} - x)\Vert^2
    \\
    &= 
    2\left(\left\Vert y^{(n)} - x\right\Vert^2 + \left\Vert y^{(m)} - x\right\Vert^2\right) 
    - 
    \left\Vert y^{(m)} - y^{(n)} - 2x\right\Vert^2
    \\
    &= 
    2\left(
        \left\Vert y^{(n)} - x\right\Vert^2 + \left\Vert y^{(m)} - x\right\Vert^2
    \right) 
    - 4\left\Vert
        \frac{y^{(m)} - y^{(n)}}{2} - x
    \right\Vert^2
    \\
    &\le 
    2\left(\left\Vert y^{(n)} - x\right\Vert^2 + \left\Vert y^{(m)} - x\right\Vert^2\right) 
    - 4d_M^2(x), 
\end{aligned}
}
$$

by $\lim_{n\rightarrow \infty} \Vert y^{(n)} - x\Vert = d_M(x)$, we have: 

$$
\begin{aligned}
    \lim_{n, m\rightarrow \infty} \Vert y^{(n)} - y^{(m)}\Vert \le 
    2d^2_M(x) + 2d^2_M(x) - 4d^2_{M}(x) = 0, 
\end{aligned}
$$

therefore, the sequence $y^{n}$ is indeed a Cauchy sequence, it will have a limit. 
By closure of $M$ we have $\bar y \in M\subseteq \mathcal H$, and $\bar y\in \Pi_M(x)$. 
Next we show that the projection point onto the set $M$ is unique. 
Choose $\bar y_0 \in \Pi_M(x)$, then $d_M(x) = \Vert y_0 - x\Vert$, we use the Parallarogram law and consider: 

$$
\begin{aligned}
    \left\Vert
        \frac{\bar y + \bar y_0}{2} - x
    \right\Vert &\ge d_M(x)
    \\ 
    \Vert \bar y - \bar y _0\Vert^2 &= \Vert (\bar y - x) - (\bar y_0 - x)\Vert^2
    \\
    &= 2\Vert \bar y - x\Vert^2 + 2\Vert \bar y_0 - x\Vert^2 - 4
    \left\Vert
        \frac{\bar y_0 - \bar y}{2} - x
    \right\Vert^2
    \\
    &\le 
    2d_M^2 + 2d_M^2(x) - 4d_M^2(x) = 0, 
\end{aligned}
$$

therefore, we have $\bar y = \bar y_0$. Therefore, the projection $\Pi_M(x)$, is a singleton set. 

**Remarks**: 

A linear subspace in Hilbert space is convex, but not necessarily closed. 
If it's closed, then we can applied the above theorems and the theorem below. 

#### **Thm | Characterizing Hilbert Space Projections**
> Let $Y\subseteq \mathcal H$ be a closed subspace, then we have the following that is true about the projection operator: 
> 1. $\Pi_Y$ is linear. 
> 2. $\Pi_Y$ is idempotent. 
> 3. $\text{rng}(\Pi_Y) = Y, \text{null}(\Pi_Y) = Y^\perp$. 
> 4. $\Pi_Y + \Pi_Y = I$. 

**References**

Shawn Wang's Lecture notes. 


---
### **Complications of Infinite Dimensional Space Projection**

The roles of convexity and closedness is completely different in Hilbert space where the dimension is infinite. 
The closed and convex conditions acts differently to assert the existence of a projection point. 
In finite dimensional, if the set is closed, then the projection points exists, and if the set is convex, then the projection point would be unique. 
However in infnite dimension, closedness itself is not sufficient for the existence of a projection points. 
We provide such a counter example 

#### **Thm | Closed but No Projection**
> The set $C = \{(1 + \epsilon_n)\e_n | n \in \mathbb N\}$ is a closed set in Hilbert space $l^2$, and $\e_n$ is the standard basis set for $l^2$. Let $\epsilon_n = 1/(n + 1)$, it's a sequence that approaches zero but never get to zero. 
> This set has $\Pi_C(\mathbf 0 ) = \emptyset$. 

**Proof**

$C$ would be a closed set. 
Consider any sequence $x_n$ such that $x_n \in C$ and it converges to $\bar x$. 
We show that it's impossible that it has to be the case that, there exists $N \in \mathbb N$ such that for all $m, n \ge N$, we have $x_n = x_m$. 
Suppose that this is not the case and we have $x_n\rightarrow \bar x$ such that for all $N\in \mathbb N$ there we have $m > n > n$ such that $\Vert x_n - x_m\Vert^2 \le \epsilon$ and $x_n \neq x_m$. 
The sequence and hence it's Cauchy, and that was what we used. 
Then we consider the the norm squared of the quantity giving us 

$$
\begin{aligned}
    \Vert x_n - x_m\Vert^2 &= 
    (1 + \epsilon_n)^2 + (1 + \epsilon_n)^2 >2, 
\end{aligned}
$$

and therefore, it has to be the case that there exists some $N \in \mathbb N$ where $x_n = x_m$ for all $m, n \ge N$. 
This is the only way the sequence $x_n\rightarrow \bar x$. 
And if that is the only way $x_n$ converges, it implies that $x_n\in C$ for some $n\ge N$, because we know $x_n \in C$ and after a certain finite value of $x_n$, the sequence becomes a constant sequence. 

Next, the projection of $\Pi_C(\mathbf 0)$ by the definition of $C$ is 

$$
\begin{aligned}
    d_C(\mathbf 0)&= \inf_{n \in \mathbb N} \Vert \mathbf 0 - (1 + \epsilon_n)\e_n\Vert^2
    \\
    &= \inf_{n\in \mathbb N} (1 + \epsilon_n) = 1. 
\end{aligned}
$$

But there never exists any point $x_n$ with $n\in \mathbb N$ such that it's exactly $1$. 
Therefore, the set is closed, but there is no point of projection. 

**References**

Prof Heinz's class, MATH 565 2024 at UBCO. 

---
### **The Obtuse Angle Theorem in Hilbert Spaces**

Minimizing over a convex set or a subspace is of upmost interests in applications. 
We list theorems for them in the Hilbert spaces. 
Projecting onto a finite subspace is what engineers need to do everyday, i.e: The overused Fourier Basis. 

#### **Thm | Obtuse Angle Theorem Hilbert Space**
> Let $M\subseteq \mathcal H$ be closed and convex, then $y \in \Pi_M(x)$ if and only if $\langle z - y, x - y\rangle \le 0$ for all $z\in M$. 

**Proof**

For the direction $\impliedby$, the convexity for set $M$ is not required. 
We just use the definition of inner product, Cauchy inequality to get it. 
For more see [Convex Sets Projections and Dist, Intro](../../AMATH%20516%20Numerical%20Optimizations/Background/Convex%20Sets%20Projections%20and%20Dist,%20Intro.md). 
For the $\implies$ direction, we present a simpler proof. 
Let $y = \Pi_M(x)$, by property of projection, $y\in M$, now for all $\lambda \in [0, 1]$ and $z\in M$, we have $(1 - \lambda)y + \lambda z \in M$ from convexity. 
From the minimization property of convex set projection we have: 

$$
\begin{aligned}
    \Vert x - y\Vert^2 &\le \Vert x - ((1 - \lambda)y +z)\Vert^2 
    \\
    &= \Vert x - y + \lambda(y - z)\Vert^2
    \\
    &= \Vert x - y\Vert^2 + \lambda^2 \Vert y - z\Vert^2 + 2\lambda\langle x - y, y -z\rangle
    \\
    0 &\le \lambda^2\Vert y - z\Vert^2 + 2\lambda\langle x - y, y - z\rangle
    \\
    [1]\implies 
    0 &\le 
    \lambda \Vert y - z\Vert^2 + 2\langle x - y, y - z\rangle
    \\
    \lambda \rightarrow 0 \implies & 0 \le 
    2\langle x - y, y -z\rangle, 
\end{aligned}
$$

\[1\]:If, $\lambda = 0$, then $z = y$, the obtuse angle theorem is true trivially.
Therefore at this step we may assume that $\lambda \neq 0$and we divided it on both side of $\lambda$ because $\lambda \in (0, 1)$. 
At the last step, the result is equivalent to the claim. 

**Remarks**

The use of limit on this proof surprises me. 
The cross product in the claim is just the consequence of the 2-norm squared being used. 

**References**: 

From Prof Wang's course notes for Math 328, haven't seem this type of argument anywhere it's very interesting way of proving it. 
This is mirroring convex projection theorem that is used for optimization problem in Finite Euclidean spaces. This is not in Kryzig's textbook as far as I see. 

#### **Corollary | Projection onto Subspaces and Orthogonality**
> Let $M\subseteq \mathcal H$ be a closed subspace, let $x \in \mathcal H$, then $\bar x = \Pi_M(x)$ if and only if $\bar x - x \perp \text{span}(M)$.

**Observations**: 

$M$ is a closed subspace. In finite dimensional space, the closure is not required. 
But infinite dimension, the subspace itself can also be infinite, and it would require the closure to describe the span of the whole subspace. 
Pay attention and try to see where the closure of $Y$ is used and what if this conditions is not present? 

**Proof**

From previous obtuse angle theorem, it's enough to show the equivalence between $\langle y - \bar x,\bar x - x\rangle \le 0 \;\forall y \in M$ and $\bar x - x \perp \text{span}(M)$. 

$$
\begin{aligned}
    & 
    z\in Y \implies (\pm kz \in Y \; \forall k \in \mathbb R^+) \quad [\text{Y is a Subspace}]
    \\
    & 
    x = \Pi_M(x) \iff \langle  x- y, \pm kz - y\rangle\le 0 \; \forall y\in M \quad [\text{Obtuse Angle Proj Thm}]
    \\
    \iff 
    & 
    \left\langle 
        x - y, \pm z - \frac{y}{k} 
    \right\rangle \le 0 \quad \forall y \in M
    \\
    \implies &
    \lim_{k \rightarrow \infty}
    \left\langle 
        x - y, \pm z - \frac{y}{k} 
    \right\rangle 
    = 
    \langle x - y, \pm z\rangle
    \le 0  \;\forall y \in M
    \\
    \implies 
    & \langle x - y, z\rangle = 0 \;\forall y\in M.
\end{aligned}
$$

therefore, the direction $\implies$ is done. For $\impliedby$ by, we use the definition of orthogonality to have $\langle \bar x - x, y'\rangle = 0 \; \forall y' \in M$, $\bar x = \Pi_M(x) \in Y$ too by projection theorem and closure, therefore $y' - \bar x \in Y$ by $Y$ is a subspace, therefore $\langle y' - \bar x, \bar x - x\rangle = 0 \; \forall y' \in M$. 

**Remarks:**

When closure of $Y$ is not present, the $\impliedby$ direction is failing. Let $M$ be a subspace of $\mathcal H$, if we have $\bar x - x \perp \text{span}(M)$ for all $x \in \mathcal H$, we can only have $x \in \text{cl}(M)$, the closure. 
The theorem can be written in a quite fancy way. 
Given that $\Pi_M(x)$ is a singleton for $x \in \mathcal H$, we would have 

$$
\begin{aligned}
    \sup_{z\in M} \left\langle z - \Pi_C(x), x - \Pi_C(x) \right\rangle \le 0
\end{aligned}
$$



**References**: 

Professor wang's lecture notes for Math 328. Haven't seem it in other places yet. 



---
### **Convex Set Projection is Maximally Monotone**

In Hilbert space $\mathcal H$ the projection operator $\Pi_C$ onto a convex set $C$ is a maximally Monotone operator. 
See [Monotone Operators Introduction](Monotone%20Operators%20Introduction.md) for more info. 
See [Normal Cone](Normal%20Cone.md) for more info about normal cone operator on convex sets and sets. 

#### **Thm | Projection is Maximally Monotone**
> With $C\subseteq \mathcal H$ being a non-empty convex subsets of we have $\Pi_C = (I + N_C(x))^{-1}$ where $N_C$ is the normal cone operator, then $N_C$ is maximally monotone operator. 

**Proof**

Let $x \in X$ using the obtuse angle characterization of $\Pi_C$ by convexity of $C$ we have 

$$
\begin{aligned}
    p = \Pi_C x  
    &\iff \sup_{c\in C} \langle c - p, x - p\rangle \le 0
    \\
    &\iff
    \sup_{y \in X} \left\lbrace
        \delta_C(p) + \langle y - p, x - p\rangle
    \right\rbrace \le \delta_C(y)
    \\
    &\iff 
    x - p \in \partial_{\delta_C}(y) = N_C(y) 
    \\
    &\iff 
    p \in [I + N_C]^{-1}(x). 
\end{aligned}
$$

From the first line to the second line, the $\implies$ direction is direct because $p\in C$ by the property of a projection. 
The $\iff$ relation between is direct if $y\in C$, when $y\neq C$, then the second line is always true, and therefore only the case $y\in C$ matters of the second line, hence the equivalence still hold. 
Since the projection point is a singleton when $C$ is closed and convex, we have $\Pi_C = [I + N_C]^{-1}$. 
From the previous theorem, $\Pi_C$ has domain on $C$ and hence: 

$$
\begin{aligned}
    \text{dom}((I + N_C)^{-1})  &= X 
    \\
    \iff \text{rng}(I + N_C) &= X, 
\end{aligned}
$$

By Minty's surjectivity theorem, we have that $N_C$ is a maximally monotone operator. 
See [Minty's Theorem, The Surjectivity Theorem](Minty's%20Theorem,%20The%20Surjectivity%20Theorem.md) for more information. 



**References**: 

This is taken from Prof Heinz MATH 565 class at UBCO, 2024. 


---
### **Projecting onto Cones**

Cones are geometric objects that exists in vector spaces. 
See [Introducing Cone](Introducing%20Cone.md), [Dual Cone](../AMATH%20516%20Numerical%20Optimizations/Background/Dual%20Cone.md), [Normal Cone](../AMATH%20516%20Numerical%20Optimizations/Background/Normal%20Cone.md) for more information. 
They are special enough that projections onto these sets were used in applications quite often. 



