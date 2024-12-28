- [[Interior Topology]]
- [[Closure Topology]]
- [[Affine Hull, Affine Span]]

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

The relative boundary of the set is defined as $\text{rb}(Q):= \text{cl}(Q)\setminus \text{ri}(Q)$. Since the background set is the affine span, it loosen the condition for a set being in the relative interior, resulting in $\text{int}(C)\subseteq \text{ri}(C)$. 

**Simple Consequences**

1. One simple observation that could be made is $\text{int}(Q)\subseteq \text{ri}(Q)$ for any set. 
2. And it's not the case that if $C_1 \subseteq C_2$ we have $\text{ri}\;C_1 \subseteq \text{ri}\;C_2$, imagine the case where $C_1$ is a cube and $C_2$ is one of the faces of the cube. 
The face of the cube is part of it, but the relative interior doesn't intersect the relative interior (the strict inside) of the cube. 
3. Based on this definition and the natural definition of a boundary of a set, the relative boundary of the set $C$ can be defined to be $\text{cl}(C)\setminus \text{ri}C$. Similarly, the set is relatively open then we have $C = \text{ri}\;C$. 
4. If $C\subseteq \R^n$and $C \neq \emptyset$, then $\text{ri}\; C \neq \emptyset$. 
Every convex spans some non-trivial affine space, and we get an interior from that. 


---
### **Important theorems for the relative interior sets**



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
with $x\neq z$, i.e: $\exists \mu > 1$, such that $y$ can be an extension on one side of the line segment defined by $x, z$. 

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
By assessibility lemma, $z_\lambda \in \bigcap_{i \in I} \text{ri}\; C_i$ for all $\lambda \in [0, 1)$. 
Then $y = \lim_{\lambda \nearrow 1} z_\lambda$, so $y \in \text{cl}\; \bigcap_{i \in I} \text{ri}\; C_i$. 
Therefore: $\bigcap_{i \in I}\text{cl}\; C_i \subseteq \text{cl}\bigcap_{i \in I} \text{ri}\; C_i$. 
Extending the chain further we have the relation: 

$$
\begin{aligned}
   \bigcap_{i \in I}\text{cl}\; C_i \subseteq \text{cl}\bigcap_{i \in I} \text{ri}\; C_i
   \subseteq 
   \text{cl}\bigcap_{i \in I} C_i. 
\end{aligned}
$$
The last $\subseteq$ is by $\text{ri}\;C_i \subseteq C_i$.  

To see the second equality, we make the assumption that $I$ is a finite set. 
