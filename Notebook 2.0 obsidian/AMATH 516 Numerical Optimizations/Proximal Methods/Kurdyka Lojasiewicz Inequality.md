- [Semi-Algebraic Sets](../Background/Semi-Algebraic%20Sets.md)
- [Characterizing Functions for Optimizations](Characterizing%20Functions%20for%20Optimizations.md). 

---
### **Intro**

Kurdyka Lojasiewicz inequality helps with asserting the convergence of iterates for proximal point methods and its variants. 


**Reference**

We will use https://doi.org/10.1007/s10107-011-0484-9, title "Convergence of descent methods for semi-algebraic and tame problems: proximal algorithms, forward–backward splitting, and regularized Gauss–Seidel methods" as the major source for discussion in this file. 

#### **Def | KL Functions, Pointwise**
> $f: \mathbb R^n \mapsto \overline {\mathbb R} \in \{\text{KL at } x^* \in \text{dom}(\partial f)\}$ if and only if the following conditions are true: 
> $\exists \eta \in (0, + \infty]$, neighborhood around $x^*$, denoted by $U(x^*)$ and a function $\phi : [0, \eta) \mapsto \mathbb R_+ \in \{\text{Continuous}\} \cap \{\text{Concave}\}$, such that these are true: 
> 1. $\phi(0) = 0$, 
> 2. $\phi$ is $C^1$ on $(0, \eta)$, 
> 3. $\phi'(s) > 0 \; \forall s \in (0, \eta)$, 
> 4. $\forall x \in U(x^*) \cap \{x | f(x^*) < f(x) < f(x^*) + \eta\}$, 
> An we have the condition that 
> $$
>   \phi'(f(x) - f(x^*))\text{dist}(\mathbf 0, \partial f(x)) \ge 1. 
> $$
> Finally, if $f$ is KL at all $x^* \in \text{dom}\partial f$, and it's proper and lower semi-continuous, then we call $f$ a *KL function*. 

**Notes**

This definition has a lot of parts in it. 
Firstly, the subgradient $\partial f$, refers to the limiting subgradient of a function. 
See [Limiting Subgradient](../Non-Smooth%20Calculus/Limiting%20Subgradient.md) for more information. 
Secondly, the function $\phi$, we used here, is often called as a *desingularizing function* for $f$ at the point $x^*$. 

**Observations**

$x \in U(x^*) \cap \{x | f(x^*) < f(x) < f(x^*) + \eta\}$ means that $f(x) - f(x^*) > 0$. 
$\phi'$ may not be differentiable at boundary point $0$. 
Also, $\phi(x) \le x$, strict monotone increasing. 



**Remark**

Reader should verify that, the point wise conditions of KL is automatically satisfied at points that are not critical points. 

#### **Lemma | Non-Critical Point of KL**
> Let $f \in \{\text{KL at } x^* \in \text{dom} \partial f\}$. 
> Let $x^*$ be a non-critical point of $f$, i.e $\mathbf 0 \not\in \partial f(x^*)$, 
> Then we claim that 
> $$
> \begin{aligned}
>     \Vert x - x^*\Vert + 
>     \Vert f(x) - f(x^*)\Vert \le c \implies 
>     \text{dist}(\mathbf 0, \partial f(x)) \ge c. 
> \end{aligned}
> $$

**Proof**

We prove by contradiction. 
