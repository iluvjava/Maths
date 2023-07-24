[Convex Sets Intro](../Background/Convex%20Sets%20Intro.md)

---
### **Intro**

The following claim establishes the existence of convex sets with non-empty interior having a line that inside of the interior of the convex set. We state it and then prove it. This lemma is stated in Heinz's course in convex optimizations, with the same code number. 

#### **Lemma 2.22 | Accessibility Lemma**
> Let $C$ be a convex subset of $X$. Suppose that $x_0 \in \text{int} C$, and $x_1\in \text{cl} C$, then 
> $$
>   \forall \lambda \in (0, 1) : x_\alpha := (1 - \lambda)x_0 + \lambda x_0\in \text{int}C, 
> $$
> The whole line segment is in the interior of the subset. 

**Proof**

Before the proof, we make the following claim that will assist with the proof. Firstly, for any $x_0\in \text{int}C$, we have a value of $\epsilon > 0$, and all values less than that $\epsilon$ staisfying the claim:

**Claim 1**
> Let $\overline{\mathbb B}_\epsilon$ denote an closed epsilon ball centered at zero $\mathbf 0$, for short, then $x_0 + \frac{1 + \lambda}{1 - \lambda}B_\epsilon\subseteq C$, for all $\lambda\in (0, 1)$. 

From the fact that $x_0\in \text{int}C$, there exists $\epsilon$ such that 

$$
\begin{aligned}
    \overline {\mathbb B}_\epsilon(x_0) &\subseteq C 
    \\
    (1 - \lambda)\bar {\mathbb B_\epsilon}(x_0) &\subseteq (1 - \lambda)C
    \\
    \overline{\mathbb B} (x_0) - \lambda \overline {\mathbb B}(x_0)
    &\subseteq (1 - \lambda)C
    \\
    x_0 + \overline{\mathbb B}_\epsilon-\lambda(x_0 - \overline{\mathbb B}_\epsilon)
    & \subseteq (1 - \lambda) C
    \\
    (1 - \lambda)x_0 + (1 + \lambda)\overline {\mathbb B}_\epsilon 
    &\subseteq (1 - \lambda)C
    \\
    x_0 + \frac{1 + \lambda}{1 - \lambda}\overline {\mathbb B}_\epsilon \subseteq C. 
\end{aligned}
$$

Keep this fact in mind then we consider $x_\lambda = (1 - \lambda)x_0 + x_1$, then 

$$
\begin{aligned}
    x_\lambda + \overline {\mathbb B}_\epsilon &= 
    (1 - \lambda)x_0 + \lambda x_1 + \overline {\mathbb B}_\epsilon
    \\
    &= (1 - \lambda)x_0 + 
    (C + \overline {\mathbb B}_\epsilon) + \overline {\mathbb B}_\epsilon
    \\
    &= 
    (1 - \lambda)x_0 + (1 + \lambda) \overline {\mathbb B}_\epsilon + \lambda C
    \\
    &= (1 - \lambda)\left(
        x_0 + \frac{1 + \lambda}{1 - \lambda} \overline {B}_\epsilon
    \right) + \lambda C
    \\
    & \subseteq (1 - \lambda)C + \lambda C = C,
\end{aligned}
$$

finally, with the claim that $x_\lambda + \overline {\mathbb B}_\epsilon = \overline {\mathbb B}_\epsilon(x_\lambda)\subseteq C$ for some fixed $\epsilon$ determined by $x_0\in \text{int}C$ we have that $x_\lambda\in \text{int }C$ as well. The lemma is now proven. 
