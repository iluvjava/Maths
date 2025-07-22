---
alias: Conic Programming Error Bounds

---
- [Dual Cone](Background/Dual%20Cone.md)
- [KKT, Slater's Conditions](Duality/KKT,%20Slater's%20Conditions.md)

---
### **Intro**

The content of this file follows from the following publications: 
> Zhang, Shuzhong. Global error bounds for convex conic problems. SIAM.

The first part of the paper considers consequences of listed assumptions. 
Consider: 

$$
\begin{aligned}
    \mathcal F = (b + \mathcal L) \cap \mathcal K. 
\end{aligned}\tag{1.2}
$$

Where: 
- $b \in \R^n$. 
- $\mathcal L$ is a subspace of $\mathcal \R^n$. 
- $\mathcal K \subseteq \R^n$. 

Further, assume that $\mathcal K$ is a closed, pointed and solid cone. 
It translates to $\mathcal K \cap (- \mathcal K) = \{\mathbf 0\}$, $\text{dim}\; \mathcal K = n$. 
Denote $\mathcal K^\star$ for the dual cone of $\mathcal K$. 
$\mathcal K^\star$ is also closed, pointed, and solid. 
Remark that the dual cone has definition: $\mathcal K^\star := \{x : \langle x, y\rangle \; \forall y \in \mathcal K\}$. 

#### **Lemma 2.1 | primal dual cone decomposition** 
> For any $x \in \R^n$, there exists the unique pair $(x_p, x_d)$ such that $x_p \in \mathcal K, x_d \in \mathcal K^\star$ such that $x = x_p - x_d$ and $\langle x_p, x_d\rangle = 0$. 

**Remarks**

This comes from Moreau identity where for all $z \in \R^n$ and, $K$ as a cone, it has $z = \Pi_K z + \Pi_{Z^\circ}z$. 

#### **Assumption 1**
> $\mathcal F \neq \emptyset$. 

#### **Assumption 2**
> $\mathcal (b + \mathcal L)\cap \text{int}\; \mathcal K \neq \emptyset$. 

#### **Assumption 3**
> The set $\mathcal F = (b + \mathcal L)\cap \mathcal K$ is compact. 

#### **Assumption 4**
> $\mathcal L\cap \text{int}\; \mathcal K\neq \emptyset$. 

#### **Lemma 2.3 | consequence of assumption 2**
> If Assumption 2 holds, then for any $y \in \mathcal L^\perp \cap \mathcal K^\star$ with $y \neq \mathbf 0$ it must follow that $\langle b, y\rangle > 0$. 

**Proof**

Let $y \in (\mathcal L^\perp \cap \mathcal K^\star)\setminus \{\mathbf 0\}$. 
For contradiction let $\langle b, y\rangle \le 0$. 
Consider $H(y) = \{x : \langle x, y\rangle = 0\}$. 
For all $x \in b + \mathcal L$, $\langle y, x\rangle = \langle y, b\rangle \le 0$. 
For all $x \in \mathcal K$, because $y \in \mathcal K^\star$ it has $\langle y, x\rangle \ge 0$. 
Hence, $H(y)$ separates $b + \mathcal L$, $\mathcal K$. 
It contradicts $(b + \mathcal L)\cap \text{int}\; \mathcal K \neq \emptyset$. 

$\blacksquare$

#### A general upper bound via the KKT of conic best approximation problem

The following argument is proposed to show the format of the conic error bounds. 
Consider

$$
\begin{aligned}
    \min_{x \in \R^n}\left\lbrace
        \frac{1}{2}\Vert z - x\Vert^2 : x \in b + \mathcal L, x \in \mathcal K
    \right\rbrace. 
\end{aligned}
$$

Assume that it admits the KKT conditions by some regularity assumptions (for example, the Slator conditions). 

$$
\begin{aligned}
    &
    \bar x - z + \lambda - \mu = \mathbf 0, 
    \\
    & \langle \mu, \bar x\rangle = 0, 
    \\
    & \bar x \in (b + \mathcal L) \cap \mathcal K,
    \\
    & \mu \in \mathcal K^\star
    \\
    & \lambda \in \mathcal L^\perp. 
\end{aligned}\tag{KKT}
$$

Consider: 

$$
\begin{aligned}
    \Vert \bar x - z\Vert^2 &= 
    \langle x - z, \mu - \lambda\rangle
    \\
    &\underset{(1)}= -\langle z_p + z_d, \mu\rangle + 
    \langle z - \bar x, \lambda\rangle
    \\
    &\le 
    \langle z_d, \mu\rangle + \langle z - \bar x, \lambda\rangle
    \\
    &\le 
    \Vert z_d\Vert\Vert \mu\Vert + \langle z - \bar x, \lambda\rangle. 
\end{aligned}
$$

At (1) we used Lemma 2.1 to get $(z_p, z_d) \in \mathcal K \times \mathcal K^\star$. 
Choose $z_l$ to be the projection of $z$ onto affine space $b + \mathcal L$, then 
$$
\begin{aligned}
    \langle z - \bar x, \lambda\rangle &= 
    \langle z - z_l + z_l -  \bar x, \lambda\rangle
    \\
    &\underset{(1)}= \langle z - z_l, \lambda\rangle
    \\
    &\le \Vert z - z_l\Vert \Vert \lambda\Vert
    \\
    &\le 
    \dist(z, b + \mathcal L)\Vert \lambda\Vert. 
\end{aligned}
$$

At (1), we used the fact that $z_l, \bar x$ are both in $b + \mathcal L$, hence $z_l - \bar x \in \mathcal L$, which cancels with $\lambda \in \mathcal L^\perp$ in the inner product. 
This yields the following bound: $\dist(z, \mathcal F)^2 \le \Vert z_d\Vert\Vert \mu\Vert +\dist(z, b + \mathcal L)\Vert \lambda\Vert$. 

