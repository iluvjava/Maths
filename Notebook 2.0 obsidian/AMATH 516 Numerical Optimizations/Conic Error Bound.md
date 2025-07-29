---
alias: Conic Programming Error Bounds

---
- [Dual Cone](Background/Dual%20Cone.md)
- [KKT, Slater's Conditions](Duality/KKT,%20Slater's%20Conditions.md)
- [Hoffman Error Bound](Hoffman%20Error%20Bound.md)

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
- $\mathcal K \subseteq \R^n$. Further, assume that $\mathcal K$ is a closed, pointed and solid cone. 

$\mathcal K$ is pointed means $\mathcal K \cap (- \mathcal K) = \{\mathbf 0\}$, it is solid means $\text{dim}\; \mathcal K = n$. 

Denote $\mathcal K^\star$ for the dual cone of $\mathcal K$. 
$\mathcal K^\star$ is also closed, pointed, and solid. 
Remark that the dual cone has definition: $\mathcal K^\star := \{x : \langle x, y\rangle \ge 0 \; \forall y \in \mathcal K\}$. 

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

Assumption 2 and 4 are musually exclusive cases. 

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

---- 
### **Some other things**

Continue using the same notations as from the previous section. 


#### **Definition 2.2 | Constraints violations**
> For any $x \in \R^n$, define 
> $$
> \begin{aligned}
>     v(x ; \mathcal F) := \dist(x, b + \mathcal L) + \Vert x_d\Vert,
> \end{aligned}
> $$
> As the constraint violation function for $\mathcal F$. 

#### Modified KKT

Fixing $\bar x \in \mathcal F$, we consider the KKT system in terms of $\mu, \lambda$. 
The system is given by: 
$$
\begin{aligned}\tag{KKT'}
    & \mu - \lambda = \bar x - z, 
    \\
    & \langle \bar x, \mu\rangle = 0,
    \\
    & \mu \in \mathcal K^\star, 
    \\
    & \lambda \in \mathcal L^\perp. 
\end{aligned}
$$

Define $\overline{\mathcal{K}}^\star = \mathcal{K}^\star \cap \{\mu : \langle x, \mu\rangle = 0\}$. 


---
### **Consequences of the assumptions**

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


#### **Lemma 2.4**
> If Assumption 2 holds, then $\mathcal L^\perp \cap \overline {\mathcal K}^\star = \{\mathbf 0\}$. 

**Proof**

For contradiction assume there exists $y \neq \mathbf 0$ such that $y \in \mathcal L^\perp \cap \overline {K^\star}$. 
Then obviously:
$$
\begin{aligned}
    y \in \mathcal L^\perp \cap \mathcal K \cap \{\mu | \langle \bar x, \mu\rangle = 0\} \subseteq \mathcal L^\perp \cap \mathcal K \subseteq \mathcal K. 
\end{aligned}
$$

Consider $\bar x \in \mathcal F \overset{\triangle}{=} (b + \mathcal L) \cap \mathcal K$ so $\bar x$ admits representation $\bar x = \bar x_l + b$ with $\bar x_l \in \mathcal L$. 
Therefore
$$
\begin{aligned}
    & \langle \bar x,y \rangle
    \\
    &= \langle \bar x_l + b, y\rangle
    \\
    &= \langle \bar x_l, y\rangle + \langle b, y\rangle
    \\
    &= 0 + \langle b, y\rangle \underset{\text{(1)}}{>} 0. 
\end{aligned}
$$

At (1), we used Lemma 2.3 because $y \in \mathcal L^\perp \cap \mathcal K$ and Assumption 2 is assumed to hold, and we made the assumption that $y \neq \mathbf 0$ at the start. 
Therefore, it holds that $\langle \bar x, y\rangle > 0$ and hence $y \not \in \{\mu : \langle \mu, x\rangle = 0\}$ which contradicts $y \in \overline{\mathcal K^\star}$. 

$\blacksquare$


Define the minimum angle between the sets $\mathcal L^\perp, \overline {\mathcal K^\star}$. 
$$
\begin{aligned}
    \angle(\mathcal L^\perp, \mathcal K^\star) 
    &= 
    \min\left\lbrace
        \arccos(\langle u, v\rangle/\Vert u\Vert\Vert v\Vert) : 
        u \in \mathcal L^\perp \setminus \{\mathbf 0\}, 
        v \in \overline{\mathcal K^\star} \setminus \{\mathbf 0\}
    \right\rbrace. 
\end{aligned}
$$

Take note that both sets are closed sets, by Lemma 2.4, it must be that $\angle (\mathcal L^\perp, \mathcal K^\perp) > 0$ for all $\bar x \in \mathcal F$. 
Take note that the definition here is the $\min$, instead of $\inf$. 

Under Assumption 3, which stated that $\mathcal F$ is compact, there exists $\theta$ such that for all $\bar x \in \mathcal F$ it has 

$$
\begin{aligned}
    \angle (\mathcal L^\perp, \mathcal K) \ge \theta > 0. 
\end{aligned}
$$

The following is also true for all $\mu \in (\bar x - z + \mathcal L^\perp) \cap \overline {\mathcal K^\star}$. 
Let $p$ be the projection of $\mathbf 0$ onto $\bar x - z + \mathcal L^\perp$. 
Denote $\varphi$ to be the angle between $\mu, \mu - p$, then $\theta \le \varphi \le \pi/2$. 
Moreover, it has 
$$
\begin{aligned}
    \Vert \mu\Vert = \Vert p\Vert/\sin\varphi 
    \le \Vert p\Vert/\sin \theta 
    \le \Vert \bar x - z\Vert/\sin\theta. 
\end{aligned}
$$

The first equality comes from the fact that $p$ is the hypotenuse and, $p$ is the opposite of right triangle formed via points $\mu, \mu - p, p$. 
The second inequality is just $\sin$ being monotone and $\varphi \ge \theta$. 
The third inequality is because $\bar x - z$ is in $\bar x - z + \mathcal L^\perp$ and, the definition of $p$. 

Before stating the major results, denote 

$$
\begin{aligned}
    \kappa = 1 + 1/\sin\theta. 
\end{aligned}
$$

---
### **Main Results in the Paper**

This section states the main results of the error bounds in the paper. 
Proofs are omitted, read the paper for the proofs. 

#### **Theorem 2.5 | A basic bound**
> If Assumption 2, 3 hold, then $\dist(z ; \mathcal F) \le k v(z; \mathcal F)$ for all $z \in \R^n$. 

#### **Theorem 2.6**
> If Assumption 4 holds, then for any $b \in \R^n$ we must have $(b + \mathcal L) \cap \text{int}\; \mathcal K\neq \emptyset$. 
> Moreover, there is a constant $\kappa > 0$, independent of $b$, such that $\dist(z; \mathcal F) \le \kappa v(z; \mathcal F)$, where $\mathcal F = (b + \mathcal L)\cap \mathcal K$. 

#### **Theorem 2.7**
> Suppose that $\mathcal K_1$ is a closed convex cone and, $\mathcal K_2$ is a closed, convex, solid, and pointed cone.
> Furthermore, suppose that $(b + \mathcal K_1) \cap \text{int}\; \mathcal K_2 = \emptyset$ and, $(b + \mathcal K_2 ) \cap \text{int}\; \mathcal K_2 \neq \emptyset$ is compact. 
> Then there is a constant $\kappa > 0$ such that 
> $$
> \begin{aligned}
>     \dist(z; \mathcal F) &\le \kappa (\dist(z; b + \mathcal K_1) + \dist(z\; \mathcal K_2)). 
> \end{aligned}
> $$
> For all $z \in \R^n$ where $\mathcal F = (b + \mathcal K_1)\cap \mathcal K_2$. 


---
### **In Relations to Hoofman Error Bounds**

The main results in the paper are the extension of Hoofman error bound into the world of semidefinite programming. 
