- [Weak Accelerated Proximal Gradient Part I](MATH%20602%20Nesterov%20Acceleration/Weak%20Accelerated%20Proximal%20Gradient%20Part%20I.md)
- [Proximal Gradient Inequality Part I](AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/Proximal%20Gradient%20Inequality%20Part%20I.md)

---
### **Intro**

#### **Assumption 1 | smooth non-smooth sum**
> 1.  The objective function $F := f + g$ with $g:\R^n \rightarrow \overline \R$ being a closed convex proper function and $f:\R^n \rightarrow \overline \R$ is a $L$-Lipschitz smooth convex function. 
> 2. For practical purpose, assume $g$ has an accessible proximal operator. 
> 3. $F$ admits a set of minimizers $X^+ = \argmin{x \in \R^n} F(x) \neq \emptyset$. 

#### **Assumption 2 | constrained smooth problem**
> 1. $F := f + g$ satisfies Assumption 1
> 2. $g$ is the indicator function of the set $X_g^+$. 
> 3. $X_g^+$ intersects with the set of minimizer for $f$, which we denoted $X_f^+$. 

**Notations now begins.**
Denote $\overline {(\cdot)}$ for the projection some non-empty convex set $C\subseteq \R^n$, for example $\bar x = \Pi_{X^+} x$. 


A more flexible extension of strong convexity is needed to formulate the behavior of Accelerated Proximal Gradient method in a boarder context. 
The following definition is proposed to capture it. 

#### **Definition | restricted strong convexity**
> Assume $F:\R^n \rightarrow \overline \R$ be a convex function. 
> Then, $F$ satisfies the restricted strong convexity assumption if in addition, there exists convex non-empty $C\subseteq \R^n$ and $\mu \ge 0$ such that for all $x \in \R^n$, $\lambda \in (0, 1)$, $\bar x = \Pi_{C}x$ the following inequality is true: 
> $$
> \begin{aligned}
>     F(\lambda \bar x + (1 - \lambda)x) &\le 
>     \lambda F(\bar x) + (1 - \alpha)F(x) - \frac{\mu\lambda(1 - \lambda)}{2}\Vert \bar x - x\Vert^2. 
> \end{aligned}
> $$

**Remarks**

We are not yet clear what consequences this definition has, but it's clear that if $F$ is strongly convex with $\mu > 0$, then it satisfies restricted strong convexity with $\mu > 0$ and $C = \{y\}$, with $y \in \R^n$ arbitrary. 

#### **Definition | restricted Bregman divergence condition**
> Let $f: \R^n \rightarrow \R$ be a differentiable function. 
> Then we say that it satisfies the restricted Bregman divergence condition with $L > \mu \ge 0$ if there exists non-empty convex set $C \subseteq \R^n$ such that for all $x \in \R^n, \lambda \in (0, 1)$, let $\bar x = \Pi_C x$, and $x_\lambda := \lambda \bar x + (1 - \lambda) x$, it has 
> $$
> \begin{aligned}
>     \frac{\mu}{2} \Vert x - x_\lambda\Vert^2 \le D_f(x, x_\lambda) \le \frac{L}{2}\Vert x - x_\lambda\Vert^2. 
> \end{aligned}
> $$

**Remarks**

If $f$ is $\mu \ge 0$ strongly convex and, has $L$ Lipschitz smooth gradient, then the above condition is satisfied for all $C = \{y\}$, with arbitrary $y \in \R^n$. 


#### **Definition | the proximal gradient operator**
> Let $F = f + g$. 
> Suppose that $f$ is differentiable and has Lipschitz continuous gradient. 
> Then, the proximal gradient operator for $\beta > 0$ is defined as 
> $$
> \begin{aligned}
>   T_{\beta}(x) =  \argmin{z \in \R^n} \left\lbrace
>       g(z) + f(x) + \langle \nabla f(x), z - x\rangle + \frac{\beta}{2}\Vert x - z\Vert^2
>   \right\rbrace. 
> \end{aligned}
> $$

**Remarks**

When $g \equiv 0$, $T_L(x)$ performs a step of gradient descent with step size $\beta^{-1}$.

#### **Definition | quadratic growth condition**
> A convex function $f:\R^n \rightarrow \overline \R$ satisfies quadratic growth condition if it admits a set of non-empty minimizers $X_f^+$ and, there exists $\mu > 0$ such that for all $x \in \R^n$, $\bar x = \Pi_{X_f^+}x$ it satisfies: 
> $$
> \begin{aligned}
>     \frac{\mu}{2}\Vert x - \bar x\Vert^2 \le 
>     f(x) - f(\bar x). 
> \end{aligned}
> $$

**Remarks**

Obviously, when $f$ is strongly convex, this is true. 

---
### **An important inequality**



#### **Lemma | restricted projected gradient inequality**
> Let $F$ satisfies Assumption 1. 
> If in addition, the smooth part $F$ is $\mu \ge 0$ strongly convex. 