- [Inner Product Space](Inner%20Product%20Space.md), 
- [Convex Sets Intro](../../AMATH%20516%20Numerical%20Optimizations/Background/Convex%20Sets%20Intro.md). 

---
### **Into**

[Hilbert space](https://mathworld.wolfram.com/HilbertSpace.html) is a complete inner product space. It's Banach space Enhanced with Euclidean geometry. There is one important results that come from the completeness of the Hilbert space, and that is the projection theorem. For more about the projection theorem in finite dimensional spaces, visit [Convex Sets Projections and Dist, Intro](../../AMATH%20516%20Numerical%20Optimizations/Background/Convex%20Sets%20Projections%20and%20Dist,%20Intro.md) for more info. Other interests of Hilbert space includes orthogonal basis and linear operator, which will be more interesting due to the fact that [Hilbert spaces are self dual to each other](https://mathworld.wolfram.com/Self-Dual.html), which allows for an inner product, bilinear form representation for linear mapping, and the important Rietz Representation Theorem. 


**References**

All the content are comming from the lecture notes from Prof Shawn Wang at UBCO for his Math 328 class, I am not sure where he find these fascinating proofs. 

---
### **Hilbert Space Projection Theorem**

We apply definition of Hilbert space, inner product, and norms to prove theorems in the Hilbert space. 

> Let $\mathcal H$ be a Hilbert space, and $M\subseteq \mathcal H$, and $M$ is a closed, convex set, then $\forall x \in \mathcal H \; \exists ! y \in M: \Vert x - y\Vert = \inf_{y'\in M} \Vert y' - x\Vert$, in brief, there is a unique point in the set $M$ such that it's closest to any arbitrary point $x \in \mathcal H$. 

**Observations**: 

Take note that, this is a generalized case of the extreme-value theorem where, the function is the distance function from a closed convex set, which is continuous, and it's stronger in the sense that we have a unique minimizer to such function and without compactness to hold for the domain of the function, which is $M \subseteq \mathcal H$. In the proof, please observe how the properties of Hilbert space and inner product space is being used. To summarize the proof: 

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

From the property of $\inf$, take sequence $(y^{(n)})_{n\in \N}$ with $y^{(n)} \in M$, for all $n\in \N$, then we have $\lim_{n\rightarrow \infty} \Vert x - y^{(n)}\Vert = d_M(x)$. We show that the sequence $y^{(n)}$ is Cauchy. By $M$ is convex, we have: 

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
\begin{aligned}
    \Vert 
        \underbrace{y^{(n)} - x - (y^{(m)}- x)}_{ = y^{(n)} - y^{(m)}}
    \Vert^2 + 
    \Vert y^{(n)} - x + (y^{(m)}- x)\Vert
    &= 
    2 \Vert y^{(n)} - x\Vert^2 + 2\Vert y^{(m)} - x\Vert^2
    \\
    \Vert y^{(m)} - y^{(n)}\Vert^2 &= 
    2\Vert y^{(n)} - x\Vert^2 + 2 \Vert y^{(m)} - x\Vert^2 
    - \Vert (y^{(m)} - x) + (y^{(n)} - x)\Vert^2
    \\
    &= 2(\Vert y^{(n)} - x\Vert^2 + \Vert y^{(m)} - x\Vert^2) 
    - \Vert y^{(m)} - y^{(n)} - 2x\Vert^2
    \\
    &= 
    2(\Vert y^{(n)} - x\Vert^2 + \Vert y^{(m)} - x\Vert^2) 
    - 4\left\Vert
        \frac{y^{(m)} - y^{(n)}}{2} - x
    \right\Vert^2
    \\
    &\le 
    2(\Vert y^{(n)} - x\Vert^2 + \Vert y^{(m)} - x\Vert^2) 
    - 4d_M^2(x), 
\end{aligned}
$$

by $\lim_{n\rightarrow \infty} \Vert y^{(n)} - x\Vert = d_M(x)$, we have: 

$$
\begin{aligned}
    \lim_{n, m\rightarrow \infty} \Vert y^{(n)} - y^{(m)}\Vert \le 
    2d^2_M(x) + 2d^2_M(x) - 4d^2_{M}(x) = 0, 
\end{aligned}
$$

therefore, the sequence $y^{n}$ is indeed a Cauchy sequence, it sure has a limit, and therefore, by closure of $M$, denote the limt $\bar y \in M\subseteq \mathcal H$, and $\bar y\in \Pi_M(x)$. Next we show that the projection point onto the set $M$ is unique. Choose $\bar y_0 \in \Pi_M(x)$, then $d_M(x) = \Vert y_0 - x\Vert$, we use the Parallarogram law and consider: 

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

A subspace in Hilbert space is convex, but not necessarily closed. If it's closed, then we can applied the above theorems and the theorem below. 

#### **Thm | Characterizing Projections onto Hilbert Spaces**
> Let $Y\subseteq \mathcal H$ be a closed subspace, then we have the following that is true about the projection operator: 
> 1. $\Pi_Y$ is linear. 
> 2. $\Pi_Y$ is idempotent. 
> 3. $\text{rng}(\Pi_Y) = Y, \text{null}(\Pi_Y) = Y^\perp$. 
> 4. $\Pi_Y + \Pi_Y = I$. 

**References**

Shawn Wang's Lecture notes. 

---
### **The Obtuse Angle Theorem in Hilbert Spaces**

Minimizing over a convex set or a subspace is of upmost interests in applications. We list theorems for them in the Hilbert spaces. Projecting onto a finite subspace is what engineers need to do everyday, i.e: The overused Fourier Basis. 

#### **Thm | Obtuse Angle Theorem Hilbert Space**
> Let $M\subseteq \mathcal H$ be closed and convex, then $y \in \Pi_M(x)$ if and only if $\langle z - y, x - y\rangle \le 0$ for all $z\in M$. 

**Proof**

For the direction $\impliedby$, the requirement of convexity for set $M$ is not required. We just use the definition of inner product, Cauchy inequality to get it. For more see [Convex Sets Projections and Dist, Intro](../../AMATH%20516%20Numerical%20Optimizations/Background/Convex%20Sets%20Projections%20and%20Dist,%20Intro.md). For the $\implies$ direction, we present a simpler proof. Let $y = \Pi_M(x)$, by property of projection, $y\in M$, now for all $\lambda \in [0, 1]$ and $z\in M$, we have $(1 - \lambda)y + \lambda z \in M$ from convexity. From the minimization property of convex set projection we have: 

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

\[1\]:If, $\lambda = 0$, then $z = y$, the obtuse angle theorem is true trivially. Therefore at this step we may assume that $\lambda \neq 0$and we divided it on both side of $\lambda$ because $\lambda \in (0, 1)$. 

At the last step, the result is equivalent to the claim. 

**Remarks**

The use of limit on this proof surprises me. 

**References**: 

From Prof Wang's course notes for Math 328, haven't seem this type of argument anywhere it's very interesting way of proving it. 

#### **Corollary | Projection onto Subspaces**
> Let $M\subseteq \mathcal H$ be a closed subspace, let $x \in \mathcal H$, then $\bar x = \Pi_M(x)$ if and only if $\bar x - x \perp \text{span}(M)$.

**Observations**: 

$M$ is a closed subspace. In finite dimensional space, the closure is not required. But infinite dimension, the subspace itself can also be infinite, and it would require the closure to describe the span of the whole subspace. Pay attention and try to see where the closure of $Y$ is used and what if this conditions is not present? 

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

therefore, the direction $\implies$ is done. For $\impliedby$ by, we use the defintion of orthognality to have $\langle \bar x - x, y'\rangle = 0 \; \forall y' \in M$, $\bar x = \Pi_M(x) \in Y$ too by projection theorem and closure, therefore $y' - \bar x \in Y$ by $Y$ is a subspace, therefore $\langle y' - \bar x, \bar x - x\rangle = 0 \; \forall y' \in M$. 

**Remarks:**

When closure of $Y$ is not present, the $\impliedby$ direction is failing. Let $M$ be a subspace of $\mathcal H$, if we have $\bar x - x \perp \text{span}(M)$ for all $x \in \mathcal H$, we can only have $x \in \text{cl}(M)$, the closure. 

**References**: 

Professor wang's lecture notes for Math 328. Haven't seem it in other places yet. 

---
### **Orthogonal Completements In Hilber Spaces**

We discuss the properties of orthogonal complements and their properties. Please read carefully since they are not exactly the same as in finite dimensional inner product spaces. 

#### **Def | Orthogonal Complement Subspace**
> Let $Y\subseteq \mathcal H$ be a subspace, then we define the orthogonal complement to be $Y^\perp := \{x\in \mathcal H | x \perp Y\}$. 

**Fact**: 

If, $Y = \mathcal H$, then $\{\mathbf 0\}$ is the complement of that. 


#### **Thm | Orthogonal Decomposition**
> Ler $Y\subseteq \mathcal H$ be a closed subspace, for all $x \in \mathcal H$, there exists unique $u\in Y, v\in Y^\perp$ such that $x = y + v$. 

**Observations**: 

The set $Y\subseteq \mathcal H$ is said to be closed. 

**Proof**

Let $x\in \mathcal H$, we have: $x = \Pi_Yx + (x - \Pi_Yx)$. By Hilbert Subspace projection theorem, we have $\Pi_Y(x) \in Y$, and $x - \Pi_Yx \in Y^\perp$. To show uniqueness suppose that: 

$$
\begin{aligned}
    \text{Let } & (u', u \in Y), (v', v \in Y^\perp)  
    \\
    &
    x = u + v = u' + v'
    \\
    \implies
    &
    \underbrace{u - u'}_{\in Y} = 
    \underbrace{v - v'}_{\in Y^\perp}
    \\
    \implies &
    u - u' = v - v' \in Y\cap Y^{\perp} = \{\mathbf 0\}
    \\ 
    \iff 
    &
    u - u' = v - v' = \mathbf 0. 
\end{aligned}
$$

Therefore, we have the uniqueness of the orthogonal complement projection proven at the end. 

**Remark**

In general, we have $Y \subseteq Y^{\perp\perp}$ and $Y^\perp$ is always a closed set. In fact, we have $\text{cl}(Y) = Y^{\perp\perp}$. This is important because $Y$ is specifically said to be a closed subspace in $\mathcal H$, and in $\mathcal H$, there are subspace that are not closed. In which case, we don'thave the same looking teorem as above from the cause of finite dimensional spaces. 

---
### **Orthogonal Normal Basis In Hilbert Spaces**

We introduce the idea of ortho-normal basis in the Hilbert space. A type of infinite dimension basis ([Schauder Basis](https://en.wikipedia.org/wiki/Schauder_basis)). 

#### **Def | Orthogonal Basis**

> $\{e\}_{i\in \mathcal I}$ is an orthogonal basis for an inner product space if: 
> $$
> \begin{aligned}
>     (\forall i, j \in \mathcal I)\; 
>     \langle e_i, e_j\rangle
>     =
>     \begin{cases}
>         0  & i \neq j
>         \\
>         1 & i = j
>     \end{cases}
> \end{aligned}
> $$

**Remarks**

The set of standard basis vector is not closed. Denote $\mathcal B = \{e_i\}_{i\in \mathbb N}$ to be the basis for space $l^2$, which is a Hilbert space. The set $\text{span}(\mathcal B)$ is not closed. For example, the sequence $(1, 1, \cdots)\not\in \mathcal B$, but rather, this number is in $\text{cl.span}(\mathcal B)$. This is very different to the way things work in finite dimensions. 