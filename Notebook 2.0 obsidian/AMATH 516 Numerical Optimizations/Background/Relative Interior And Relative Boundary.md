- [Interior Topology](Interior%20Topology.md)
- [Closure Topology](Closure%20Topology.md)
- [Affine Hull, Affine Span](Affine%20Hull,%20Affine%20Span.md)

---
### **Intro**

Rockafellar was motivated by the fact that the natural interior of a set in $\mathbb R^n$ might not exists when the set belongs to a lower dimensional subset of $\mathbb R^n$. He still wants the interior so he changed the background set for the topology to be the affine span of the set instead. We will follow chapter 6 of his Convex Optimization Textbook. 

**Definition | Relative Interior** 
> Let $Q\subseteq \mathbb{E}$ be a set in the Euclidean space, then the relative interior of the set $Q$ denoted as $\text{ri}(Q)$ is the interior of the Affine Hull $\text{affhull}(Q)$: 
> $$
> \text{ri}(Q):= 
> \{
>     x\in Q:  \exists\; \epsilon > 0 \text{ s.t: }
>     \mathbb{B}_\epsilon(x)\cap \text{affhull}(Q)\subseteq Q
> \}
> $$

**Observation**

The relative boundary of the set is defined as $\text{rb}(Q):= \text{cl}(Q)\setminus \text{ri}(Q)$. Since the background set is the affine span, it loosens the condition for a set being in the relative interior, resulting in $\text{int}(C)\subseteq \text{ri}(C)$. 

**Simple Consequences**

1. One simple observation that could be made is $\text{int}(Q)\subseteq \text{ri}(Q)$ for any set. 
2. And it's not the case that if $C_1 \subseteq C_2$ we have $\text{ri}\;C_1 \subseteq \text{ri}\;C_2$, imagine the case where $C_1$ is a cube and $C_2$ is one of the faces of the cube. 
The face of the cube is part of it, but the relative interior doesn't intersect the relative interior (the strict inside) of the cube. 
3. Based on this definition and the natural definition of a boundary of a set, the relative boundary of the set $C$ can be defined to be $\text{cl}(C)\setminus \text{ri}C$. Similarly, the set is relatively open then we have $C = \text{ri}\;C$. 
4. If $C\subseteq \R^n$and $C \neq \emptyset$, then $\text{ri}\; C \neq \emptyset$. 
Every convex spans some non-trivial affine space, and we get an interior from that. 


---
### **Important theorems for the relative interior sets**

The following lemmas, theorems are taken from Rockafellar's red book on convex analysis. 


#### **Lemma | Accessibility lemma**
> Let $C\subseteq \R^n$ be convex. For any $x \in \text{ri}\; C, y \in \text{cl}; C$, the line segment $[x, y) \in \text{ri}\; C$. 


**Proof**

See [Accessibility Lemma](../CVX%20Analysis/Accessibility%20Lemma.md) for more information. 

**Remarks**

The lemma is instrumental to claiming points about line segment of a convex functions/sets.
The theorems follow will apply this lemma we just proved. 

#### **Theorem | Closure and relative interior under convexity**
> For any convex $C\subseteq \R^n$, $\text{cl}\; C = \text{cl.}\text{ri}\; C$ and $\text{ri.cl}\; C = \text{ri}\; C$. 

**Proof**

Let $x_0$ be a sequence in $\text{ri}\; C$.
Let $x_1 \in \text{cl}\; C$. 
Define $x_\lambda = x_0 + (1 - \lambda)x_1$, for all $\lambda \in [0, 1)$. 
By accessibility lemma $x_\lambda \in \text{ri}\; C$ for all $\lambda \in [0, 1)$. 
Taking the limit we have $\lim_{\lambda \nearrow 1} x_\lambda = x_1 \in \text{cl}\; C$. 
But because all the intermediate $x_\lambda \in \text{ri}\; C$, it means that $x_1 \in \text{cl.ri}\; C$, therefore, $\text{cl.ri}\; C = \text{cl}\; C$. 

Next, let $z \in \text{ri.cl}\; C$, let $x \in \text{ri}\; C$. 
With $x\neq z$, i.e: $\exists \mu > 1$, such that $y$ can be an extension on one side of the line segment defined by $x, z$. 

$$
\begin{aligned}
    y - x &= \mu(z - x)
    \\
    \iff 
    y &= (1 - \mu)x + \mu z
    \\
    \iff 
    y &= z - (\mu - 1)(x - z). 
\end{aligned}
$$

But, $z \in \text{ri.cl}$, this set is open hence there exists $\mu > 1$ small enough such that $y \in \text{ri.cl}\; C$. 
Re-arranging the equation then: 

$$
\begin{aligned}
    y &= z - (\mu - 1)(x - z)
    \\
    &= (1  + \mu - 1)z - (\mu - 1)x
    \\
    &= \mu z + (1 - \mu)x
    \\
    \iff 
    y - (1 - \mu)x
    &= \mu z
    \\
    \mu^{-1}y + \mu^{-1}(\mu - 1)x &= z. 
\end{aligned}
$$

So $z$ is a strict convex combination of $x, y$. 
Therefore, $z \in \text{ri}\; C$ by the accessibility lemma. 

**Remarks**

Convexity and accessibility lemmas are crucial in this theorem.
This theorem has the following consequences. 


#### **Corollary 6.31 | Closure equality equivalent to relative interior equality under convexity**
> Let $C_1, C_2$ be convex subsets of $\R^n$. 
> Then $\text{cl}\; C_1  = \text{cl}\; C_2$ if and only if $\text{ri}\; C_1 = \text{ri}\;C_2$
> In addition, both are equivalent to $\text{ri}\;C_1 \subseteq C_2\subseteq \text{cl}\;C_1$. 

**Proof**

The equivalency between $\text{cl}\; C_1 = \text{cl}\; C_2$ and $\text{ri}\; C_1 = \text{ri}\; C_2$ is just taking closure/relative interior using the previous theorem. 
We do this because $C_1, C_2$ are both convex. 
Taking the closure on: $\text{ri}\;C_1 \subseteq C_2\subseteq \text{cl}\;C_1$ then 

$$
\begin{aligned}
    \text{cl}\;C_1=\text{cl.ri}\; C_1 \subseteq \text{cl}\; C_2 \subseteq \text{cl}\; C_1. 
\end{aligned}
$$

So $C_1, C_2$ shares the same closure. 
Take the relative interior on the chain: $\text{ri}\;C_1 \subseteq C_2\subseteq \text{cl}\;C_1$ produces: 

$$
\begin{aligned}
    \text{ri}\;C_1 \subseteq \text{ri}\; C_2 \subseteq \text{ri.cl}\; C_1 = \text{ri}\;C_1. 
\end{aligned}
$$

The first $\subseteq$ andthe last $=$ establishes that the relative interior of $C_1, C_2$ are both the same. 


**Remarks**

This is taken from Rockafellar's red convex analysis textbook, under the same name. 

#### **Theorem 6.4 | Epsilon extension at a point in relative interior**
> Let $\emptyset \neq C\subseteq \R^n$ and convex. 
> Then $z \in \text{ri}\; C$ is and only if $\forall x \in C$: 
> $$
> \begin{aligned}
>     \exists \mu > 1 :\; 
>     y = (1 - \mu)x + \mu z \in C. 
> \end{aligned}
> $$

**Proof**

If $z \in \text{ri}\; C$ then $y$ is in $C$ because it's in the relative interior by the definition of relative interior. 
The converse is more difficult. 
Choose both $x\in \text{ri}\; C, y \in C$, for some $\mu > 1, z$ such that $y = (1 - \mu)x + \mu z$. 
This is always possible by the assumption $C\neq \emptyset$, because it means that $\text{ri}\;C \neq \emptyset$. 
Solving for $z$: 

$$
\begin{aligned}
    y &= (1 - \mu) x + \mu z
    \\
    \iff 
    z &=
    \mu^{-1}y + \mu^{-1}(\mu - 1)x. 
\end{aligned}
$$

$z$ is in the relative interior of the line segment $x, y$. 
Using the accessibility lemma, $z \in \text{ri}\; C$




#### **Lemma | Intersections and relative interiors of sets**
> Let $C_i\subseteq \R^n$ be convex sets with $i \in I$. 
> If there is one point in common for sets $\text{ri}\; C_i$ for all $i \in I$, then 
> $$
> \begin{aligned}
>     \text{cl}\; \bigcap_{i \in I} C_i = \bigcap_{i \in I} \text{cl}\; C_i. 
> \end{aligned}
> $$
> If in addition, the index set is finite, them 
> $$
> \begin{aligned}
>     \text{ri}\; \bigcap_{i \in I} C_i = 
>     \bigcap_{i \in I} \text{ri}\; C_i. 
> \end{aligned}
> $$

**Proof**

To start, we show the first equality. 
Fix $x \in \bigcap_{i \in I} \text{ri}\; C_i$, $y \in \bigcap_{i \in I} \text{cl}\;C_i$. 
Set $z_\lambda = (1 - \lambda)x + \lambda y$ for $\lambda \in [0, 1)$. 
By accessibility lemma, $z_\lambda \in \bigcap_{i \in I} \text{ri}\; C_i$ for all $\lambda \in [0, 1)$. 
Then $y = \lim_{\lambda \nearrow 1} z_\lambda$, so $y \in \text{cl}\; \bigcap_{i \in I} \text{ri}\; C_i$. 
Therefore: $\bigcap_{i \in I}\text{cl}\; C_i \subseteq \text{cl}\bigcap_{i \in I} \text{ri}\; C_i$. 
Extending the chain further we have the relation: 

$$
\begin{aligned}
   \bigcap_{i \in I}\text{cl}\; C_i \subseteq \text{cl}\bigcap_{i \in I} \text{ri}\; C_i
   \subseteq 
   \text{cl}\bigcap_{i \in I} C_i
   \subseteq \bigcap_{i \in I} \text{cl}\; C_i
\end{aligned}
$$
The second last $\subseteq$ is by $\text{ri}\;C_i \subseteq C_i\; \forall i \in I$.  
The second last $\subseteq$ used $C_i \subseteq \text{cl}\; C_i$ for all $i \in I$, and the intersection of a closed set is always a closed set. 

A side effect of the previus proof is the consequence: 

$$
\begin{aligned}
    \text{cl}\bigcap_{i \in I} \text{ri}\; C_i 
    &= 
    \text{cl}\bigcap_{i \in I} C_i
    \\
    \iff 
    \text{ri}\bigcap_{i \in I}\text{ri}\; C_i
    &= 
    \text{ri}\bigcap_{i \in I} C_i. 
\end{aligned}
$$
The $\iff$ comes from Corollary 6.4.1. 
By $\text{ri}\bigcap_{i \in I}\text{ri}\; C_i \subseteq \bigcap_{i\in I}\text{ri}\; C_i$, it showed 
$$
\begin{aligned}
    \text{ri}\bigcap_{i \in I} C_i \subseteq 
    \bigcap_{i\in I}\text{ri}\; C_i. 
\end{aligned}
$$

The converse of the above statement requires the assumption that $I$ is a finite set. 
Take $z \in \bigcap_{i\in I}\text{ri}\; C_i$. 
Choose any line segment $[z, y]$ where $y\in \text{ri}\; C_i$ in the intersection of all $i \in I$. 
Choose any point extend beyond $z$, say $x \in \bigcap_{i \in I} C_i$. 
Such a point exists in the intersection of all $C_i$ because $I$ is a finite set by Theorem 6.4. 
By accessibility lemma, $z \in \text{ri}\; \bigcap_{i \in I} C_i$ because $z$ is a strict convex combination of $x, y$. 


