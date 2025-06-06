- [Tangent Cone](../Background/Tangent%20Cone.md)
- [Variational Subderivatives Introduction](Variational%20Subderivatives%20Introduction.md)

---
### **Intro**

This file gives description for the geometric interpretations of variational subderivatives. 
These contents are from teaching of Prof Wang in UBCO. 
The writings are improved to make everything brutally clear. 
For discussion, suppose that $f:\R^n \rightarrow \overline \R$ is a l.s.c function. 
The following theorem about variational subderivative follows. 

#### **Theorem | epi tangent cone interpretation of variational derivative**
> Let $\bar x \in \R^n$. 
> The variational subderivative $df(\bar x)$ of $f$ satisfies
> $$
> \text{epi}\;(df(\bar x) ) = T((\bar x, f(\bar x))| \text{epi}\; f). 
> $$
**Proof**

We show $(\subseteq)$ first. 
With the notation $\Delta_f(x, y) = f(x) - y$, an element of $(\bar w, r)$ from the epi graph of $df(\bar x)$ has 
$$
\begin{aligned}
    & (\bar w, r) 
    \in \text{epi}\; df(\bar x)
    \\
    \iff 
    & \liminf_{\tau \searrow 0, w \rightarrow \bar w} \tau^{-1}\Delta_f(\bar x + \tau w, \bar x) 
    \le r
    \\
    \implies & 
    \left(\exists w_n \rightarrow \bar w, \tau_n \searrow 0\right)\;
    \lim_{n\rightarrow \infty} \tau^{-1}\Delta_f(\bar x + \tau w, \bar x)  
    \le r. 
\end{aligned}\tag{a}
$$
Mark that $w_n \rightarrow \overline w, \tau_n \searrow 0$, it will be used later. 
Define sequence $x_n$ in $\R^n$ and, $\alpha_n$ in $\R$: 

$$
\begin{aligned}
    x_n &:= \bar x + \tau_n w_n,
    \\
    \alpha_n 
    &:= f(x_n) + \tau_n\left(
        r - \lim_{n\rightarrow \infty} \tau^{-1}\Delta_f(\bar x + \tau w, \bar x) 
    \right). 
\end{aligned}
$$
Observe that $(x_n, \alpha_n) \in \text{epi}\;f$ and $x_n \rightarrow \bar x$. 
This will be used later. 
Consider: 

$$
\begin{aligned}
    \lim_{n\rightarrow \infty} \tau_n^{-1}\left(
        (x_n, \alpha_n) - (\bar x, f(\bar x))
    \right) &= 
    \lim_{n\rightarrow \infty}\left(
        \frac{x_n - \bar x}{\tau_n}, 
        \frac{\alpha_n - f(\bar x)}{\tau_n}
    \right)
    \\
    &= \lim_{n\rightarrow \infty}
    \left(
        w_n, \tau_n^{-1}\Delta_f(x_n, \bar x) + 
        r - \lim_{n\rightarrow \infty} \tau^{-1}\Delta_f(\bar x + \tau w, \bar x) 
    \right)
    \\
    &\underset{\text{(1)}}{=} \left(
        \bar w, r
    \right). 
\end{aligned}
$$

At (1), we used the fact that $w_n \rightarrow \bar w$ to take the limit on the second component. 
The limit verifies $(\bar w, r) \in T((\bar x, f(\bar x)) |\; \text{epi}\; df)$ by the definition of the variational tagent cone. 
We now show $(\supseteq)$. 
Consider an element $(\bar w, r) \in T((\bar x, f(\bar x))|\; \text{epi}\; f)$, then it has
$$
\begin{aligned}
    & (\bar w, r) \in T((\bar x, f(\bar x))|\; \text{epi}\; df)
    \\
    \iff &
    (\exists (x_n, \alpha_n), \tau_n \searrow 0)\; \text{s.t: }
    \tau^{-1}_n(x_n - \bar x, \alpha_n - f(x_n)) \rightarrow (\bar w, r)
    \wedge
    (\forall n \in \N)\; (x_n, \alpha_n) \in 
    \text{epi}\; f
    \\
    \iff & 
    (\forall n \in \N)\; (x_n, \alpha_n) \in 
    \text{epi}\; df \wedge
    \lim_{n\rightarrow \infty}\left(
        \frac{x_n - \bar x}{\tau_n}, \frac{\alpha_n - f(\bar x)}{\tau_n}
    \right) = (\bar w, r). 
\end{aligned}
$$

Using $\alpha_n \ge f(x_n)(x_n)$ by $(x_n, \alpha_n) \in \text{epi}\; f$, it yields
$$
\begin{aligned}
    df(\bar x)(\bar w) &\le 
    \lim_{n \rightarrow \infty}
    \tau_n^{-1}(f(\bar x + \tau_n w_n) - f(\bar x)) 
    \le 
    \lim_{n\rightarrow \infty}\tau_n^{-1}(\alpha_n - f(\bar x)) = r. 
\end{aligned}
$$
This inequality verifies $(\bar w, r) \in \text{epi}\; df(\bar x)$. 
$\blacksquare$
