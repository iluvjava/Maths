- [Convex Sets Intro](../Background/Convex%20Sets%20Intro.md)
- [Topological Basics for Optimizations](../Background/Topological%20Basics%20for%20Optimizations.md)

---
### **Intro**

The following claim establishes the existence of convex sets with non-empty interior having a line that inside of the interior of the convex set. 
We state it and then prove it. This lemma is stated in Heinz's course in convex optimizations, with the same code number. 
The proof below is, a much simplified proof compare to the original, and it captures the essence. 
The lemma basically says that the interior/(relative interior) of a line segment found in the convex set is still in the interior/(relative interior) of the convex set. 



#### **Lemma (2.22) | Accessibility Lemma**
> Let $C$ be a convex subset of $X$. Suppose that $x_0 \in \text{int} C$, and $x_1\in C$, then 
> $$
>   \forall \lambda \in (0, 1) : x_\lambda := (1 - \lambda)x_0 + \lambda x_1\in \text{int}C, 
> $$
> The whole line segment is in the interior of the subset. 


**Proof**

Without loss of generality, the argument above can be simplified a lot by considering the alternative statement:

> If $\mathbf 0 \in \text{int} C$, and let $x_1 \in \text{cl}C$, then $(1 - \lambda)x_1\in \text{int}\; C$ for all $\lambda\in(0, 1)$. 

By translating $x_0$ from lemma 2.22 to point $\mathbf 0$, these 2 statements are saying the same thing. Denote $\overline{\mathbb B}_\epsilon$ to be the closed epsilon ball around $\mathbf 0$, then 

$$
\begin{aligned}
    & 
    \mathbf 0 \in \text{int}C \implies \exists \epsilon > 0: \overline{\mathbb B}_\epsilon \subseteq \text{cl}C, 
\end{aligned}
$$

consider 2 parameterized line segment $x_\lambda = \lambda\rho + (1 - \lambda)x_1$ for all $\lambda\in (0, 1), \rho \in \overline{\mathbb B}_\epsilon$, and $x_\lambda' = \lambda\mathbf 0 + (1 - \lambda)x_0, \forall \lambda\in (0, 1)$. By convexity we have 

$$
\begin{aligned}
    & \forall \lambda\in (0, 1)\;  x_\lambda \in \text{cl}C
    \\
    & x_\lambda = x_\lambda' + \lambda \rho \in \text{cl}C
    \\
    \implies & 
    x_\lambda' + \overline{\mathbb B}_\epsilon \subseteq \text{cl}C
    \\
    \implies & 
    x_\lambda'\in \text{int}C, \text{ or equivalenetly } x_1\in (1 - \lambda)^{-1} \text{int}C,
\end{aligned}
$$

which is essentially saying that $\text{cl}\;C\subseteq (1 - \lambda)^{-1} \text{int} C$, $\forall \lambda\in (0, 1)$. The slightly dilated interior of $C$ is able to contain the closure of the set $C$. Assuming $C$ has $\mathbf 0$ in its interior. 

#### **Thm 6.1 | Accessibility Lemma with Relative Interior**
> Let $C$ be cvx in $\mathbb R^n$, let $x \in \text{ri}\; C$ and $y \in \text{cl}\; C$, then $(1 - \lambda)x + \lambda y$ belongs to $\text{ri}\; C$ and it's also in $C$ for $0\le \lambda < 1$. 

**Proof**

Project any set to the $\text{aff}(C)$, which should be span by $m\le n$  many points, then perform the same accessibility proof as above but for $C$ in $\mathbb R^m$. 