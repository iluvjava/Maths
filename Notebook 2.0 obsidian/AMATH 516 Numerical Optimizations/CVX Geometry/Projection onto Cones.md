- [Convex Sets Projections and Dist, Intro](Convex%20Sets%20Projections%20and%20Dist,%20Intro.md)
- [Convex Sets Projection Obtuse Angle Theorem](Convex%20Sets%20Projection%20Obtuse%20Angle%20Theorem.md)
- [Introducing Cone](Introducing%20Cone.md)

---
### **Intro**

Let $X$ be a Hilbert space. 
We discuss some of the properties of projection onto a cone in $X$. 
Here we denote $\Pi_C$ to be the projection onto the set $C$. 
Let $X$ be xome Hilbert space for generaity of our statements. 


#### **Thm | Projection onto Cones**
> Let $K \subseteq X$ to be a cone that is closed, and non-empty. Then 
> $$
>     p \in \Pi_Kx \iff
>     (p \perp x - p \wedge x - p \in K^{\ominus} \wedge p \in K). 
> $$

**Observations**

This is similar to the obtuse angle projection theorem but strengthened under the assumption that $K$ is a cone. 
The projected vector of $x$ onto the cone is perpendicular to the vector that goes from the projection vector to $x$. 

**Proof**

We prove $(\implies)$. 
$K$ is a cone and it's closed means that $\mathbf 0 \in K$, $2p \in K$. 
Let $p = \Pi_k x$ for any $x \in X$. 
It would be trivial that $p \in K$. 
Let $k = 2p, k = \mathbf 0$, using the obtuse angle characterizations on both vector from the cone then it is implied that: 

$$
\begin{aligned}
    \iff & \langle 2p - p , x - p \rangle 
    \le 0 \wedge 
    \langle \mathbf 0 - p, x - p\rangle \le 0
    \\
    \iff& 
    \langle p, x - p\rangle 
    \le 0 \le \langle p , x- p\rangle 
    \\
    \iff &  p \perp x- p. 
\end{aligned}
$$

Next, let $k \in K$, since $p \in \Pi_K x$ then obtuse angle theorem gives: 

$$
\begin{aligned}
    \langle  k - p, x - p\rangle &\le 0 
    \\
    \langle k, x - p\rangle - \langle p, x- p\rangle &\le 0
    \\
    p \perp x - p \implies 
    \langle k, x - p\rangle &\le 0 
    \\
    \iff x - p &\in K^\ominus. 
\end{aligned}
$$

How we show the converse of the statement $(\impliedby)$. 
Let $p \in K, x - p \perp p, x- p\in K^\ominus$, then $p \in K \implies p \in \text{rng}(\Pi_K)$. 
Therefore $p$ is a point that satisfies the obtuse angle characterizations. 
Therefore considering any $x \in X$, we would have 
$$
\begin{aligned}
    \langle k - p, x- p\rangle
    &= \langle k, x- p\rangle + \langle p, x - p\rangle
    \\
    & \text{by: } x- p \perp p, \langle k, x- p \rangle \le 0, 
\end{aligned}
$$

Therefore $\langle k - p, x - p \rangle\le 0$. 
Regardless of whether the cone is convex or not, this obtuse angle characterization is sufficient to show that $p \in \Pi_K$. 

**Remarks**
Convexity is not needed in this theorem. 
Convexity would only makes $\Pi_k x$ to be a singleton in this case. 
In general when it's nonconvex, this is still true surprisinly. 



---
### **The Double Polar Cone**

#### **Thm | Double Polar Cone includes the Original Cone**
> Let $K$ be a cone that is non-empty. Then $K \subseteq K^{\ominus\ominus}$. 

**Proof**

$$
\begin{aligned}
    k' \in K^\ominus \implies (k \in K \implies \langle k, k'\rangle \le 0),
\end{aligned}
$$

In the above, fix $k \in K$, then we have $\langle k, k'\rangle\le 0$ for all $k\in K^\circ$, therefore $k \in K^{\ominus\ominus}$ by the definition of polar cone, which we write in terms of $C$, giving us $C^\ominus := \{u | \langle c, u\rangle \le 0 \; \forall c \in C\}$. 

**Remarks**

The converse is not true if $K$ is not a convex cone. 
It's true when $K$ is a convex cone because $K^{\ominus\ominus}$ is the convex hull of the original cone $K$. 

---
### **The Cone Decomposition**
> If $K$ is a cone that is non-empty, define $p = \Pi_K$, then we have $x - p \in \Pi_{K^{\ominus} x}$. 

**Proof**

Define $q := x - p$. 
Let $x \in X$ be arbitrary. 
$$
\begin{aligned}
    & p \in \Pi_K x \implies x - p = q \in K^\ominus
    \\
    & p \in \Pi_K x \implies q\perp x - q = p
    \\
    & p \in K \subseteq K^{\ominus\ominus}. 
\end{aligned}
$$

with that we have $q \in K^\ominus$ and $q \perp x - q$, and $x - q \in K^{\ominus\ominus}$ which means $q \in \Pi_{K^\ominus}x$, using the projection onto cones theorem with the cone $K^{\ominus}$. 
Therefore we have $q := x - p \in \Pi_{K^\ominus} x$. 

---
### **Examples of Projections onto Cones**


There are many cones in applications. 
Some cones are non-convex. 
Some cones are convex. 



