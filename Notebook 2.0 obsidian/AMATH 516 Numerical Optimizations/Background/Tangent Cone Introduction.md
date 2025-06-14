- [Introducing Cone](Introducing%20Cone.md)

--- 
### **Intro**

A tangent cone is a cone that is define via the set $Q$ and a point $\bar{x}\in Q$ where $Q\subseteq \R^n$: 

#### **Def | Bouligand Tangent Cone**
> The Bouligand tangent cone is a set of limits defined by: 
> $$
> T_Q(\bar{x}):= 
> \left\lbrace
>     \lim_{i \rightarrow ∞} \tau_i^{-1}(x_i - \bar{x}) :
>     x_i \rightarrow \bar{x} \in Q, \tau_i ↘ 0
> \right\rbrace. 
> $$

**Observations**

1. The set is a cone. If $x = \lim_{i \rightarrow \infty}\tau_i^{-1}(x_i - \bar x)$, then for all $\lambda > 0$, $\lambda x = \lim_{i\rightarrow \infty}(\lambda \tau_i^{-1})(x_i - \bar x)$ has $\lambda^{-1}\tau_i \searrow 0$, which means $\lambda x \in T_Q(\bar x)$. 
2. The set is a closed set. It has something to do with the set limit formulation of the Bouligand Tangent cone. See [Variational Tangent Cone](../Variational%20Geometry/Variational%20Tangent%20Cone.md) for more information. 

---
### **Tangent Cone on A convex Set**

Notations. 
$\text{cone}(Q):= \{\lambda q : q \in Q, \lambda \ge 0\}$. 
It's not necessarily closed from this definition yet. 

#### **Theorem | Conic span of the set and Bouligand Tanget Cone**
> Suppose $Q \subseteq \R^n$ is non-empty. 
> Than it has $T_Q(\bar x) \subseteq \text{cl.cone}(Q - \bar x)$. 
> In addition, if we assume that $\mathbf 0 \in \text{cl}(Q - \bar x)$ and, $Q$ is a convex set, then it has $\text{cl.cone}(Q - \bar x)\subseteq T_Q(\bar x)$. 

**Proof**

It's direct to see $T_Q(\bar x) \subseteq \text{cl.cone}(Q - \bar x)$. 
For all $x \in T_Q(\bar x)$ there exists $\tau_i \searrow 0, x_i\rightarrow \bar x, x_i \in Q$ such that $x = \lim_{i \rightarrow \infty}\tau_i^{-1}(x_i - \bar x)$, then: 
$$
\begin{aligned}
    x_i &\in Q 
    \\
    x_i - \bar x & \in Q - \bar x 
    \\
    \tau_i^{-1}(x_i - \bar x) &\in \text{cone}(Q - \bar x)
    \\
    \lim_{i\rightarrow \infty} \tau_i^{-1}(x_i - \bar x) 
    &\in \text{cl.cone}(Q - \bar x).
\end{aligned}
$$

Let's now prove $\text{cl.cone}(Q - \bar x) \subseteq T_Q(\bar x)$. 
Take the following facts. 
* (a): $c \in \text{cl.cone}(Q - \bar x)$ means $\exists \lambda \ge 0, \exists q \in \text{cl}(Q): c = \lambda (q - \bar x)$, because $\mathbf 0 \in \text{cl}(Q - \bar x) \iff \bar x \in \text{cl}(Q)$, hence it was $\lambda \ge 0$. 
* (b): Consider any $\tau_i \searrow 0: \tau_i \in(0, 1)$, define sequence $q_i := (1 - \tau_i)\bar x + \tau_i q$, then it has $q_i \in Q$ for all $i \in \N$ and $\lim_{i \rightarrow \infty} q_i = \bar x$. 

Fitting the sequence $q_i$ to the definition of tangent cone, assume $\lambda > 0$, it gives: 

$$
\begin{aligned}
    0 &\underset{\text{(b)}}{=} q_i - \bar x - \tau_i (q - \bar x)
    \\
    &= (\lambda \tau_i^{-1})(q_i - \bar x) - \lambda(q - \bar x)
    \\
    &\underset{\text{(a)}}{=} \lim_{i\rightarrow \infty}(\lambda \tau_i^{-1})(q_i - \bar x) - c. 
\end{aligned}
$$

Hence, $c \in T_Q(\bar x)$. 
Otherwise $\lambda = 0$ then $c = 0$, and $T_Q(\bar x)$ always can contain zero. 
To do that, for any sequence $(\lambda_i)_{i\ge 1}$ that fulfills the definition of $T_Q(\bar x)$, we make it converges to zero slower. 
We make $\tau_i\searrow 0$ such that $\lim_{i \rightarrow \infty} \tau_i^{-1}\Vert x_i - \bar x\Vert = 0$. 
$\blacksquare$

**Remarks**: 

Dimitri's Exercise 2.33, course notes. 


