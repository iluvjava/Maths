- [Inexact Proximal Gradient Inequality](../Proximal%20Methods/Inexact%20Proximal%20Gradient%20Inequality.md)
- [Convex Epsilon Subgradient Deep Dive](../Non-Smooth%20Calculus/Convex%20Epsilon%20Subgradient%20Deep%20Dive.md)
- [Resolvent Identity, Minty Re-Paramaterization](../Operators%20Theory/Resolvent%20Identity,%20Minty%20Re-Paramaterization.md)
- [Convex Conjugation Introduction](../Duality/Convex%20Conjugation%20Introduction.md)

---
### **Intro**

Recall the following definitions, from the files listed in the header.  

#### **Definition | The $\epsilon$-subgradient**
> Let $g: \R^n \rightarrow \overline \R$ be proper, lsc. 
> Let $\epsilon \ge 0$. 
> Then the $\epsilon$-subdifferential of $g$ at some $\bar x \in \text{dom}\;g$ is given by: 
> $$
> \begin{aligned}
>     \partial g_\epsilon(\overline x) := 
>     \left\lbrace
>         v \in \R^n \left| \; 
>             \langle v, x - \overline x\rangle \le 
>             g(x) - g(\overline x) + \epsilon \;\forall x \in \R^n
>         \right. 
>     \right\rbrace.
> \end{aligned}
> $$
> When $\bar x \not \in \text{dom}\; g$, it has $\partial g_\epsilon(\bar x) = \emptyset$. 

#### **Definition | Inexact Proximal operator**
> For all $x \in \R^n, \epsilon \ge 0, \lambda > 0$, $\tilde x$ is an inexact evaluation of proximal point at $x$, if and only if it satisfies: 
> $$
> \begin{aligned}
>     \lambda^{-1}(x - \tilde x) \in \partial_{\epsilon} g(\tilde x). 
> \end{aligned}
> $$
> which we denote by $\tilde x \approx_\epsilon \prox_{\lambda g}(x)$. 

---
### **Theory of duality under inexat proximal operator**

The resolvent identity gives the equivalent duality theory for the inexact proximal operator. 

#### **Recall Theorem | $\epsilon$-Fenchel inequality**
> Let $\epsilon \ge 0$, then:
> $$
>     x^* \in \partial_\epsilon f(\bar x)\iff f^\star(x^*) + f(\bar x) \le \langle x^*, \bar x\rangle + \epsilon \implies \bar x \in \partial_\epsilon f^\star(x^*).
> $$
> They only equivalent when biconjugation holds at $\bar x$ for $f$. 


#### **Theorem | resolvent identity of inexact proximal operator**
> Let $g: \R^n \rightarrow \overline \R$ be a closed, convex and proper function. 
> It has the equivalence
> $$
> \begin{aligned}
>     & \tilde x \approx_\epsilon \pprox{\lambda g}(x) \iff 
>     \lambda^{-1}(x - \tilde x)\approx_\epsilon \pprox{\lambda^{-1} g^\star}\left(\lambda^{-1}x\right), 
>     \\
>     & \tilde y \approx_\epsilon \pprox{g^\star/\lambda}(y/\lambda)
>     \iff 
>     y - \lambda \tilde y \approx_\epsilon \pprox{\lambda g}(y). 
> \end{aligned}
> $$

**Proof**

Reminding us of the fact that $\partial g_{\epsilon}$ is not necessarily maximal monotone but the genrealized resolvent identity still applies because it can be used for multi-valued mapping in general. 
Then it has the following chain of equivalences: 

$$
\begin{aligned}
    \tilde x \approx_\epsilon \pprox{\lambda g}(x)
    \iff & 
    \lambda^{-1}(x - \tilde x) \in \partial_{\epsilon} g(\tilde x)
    \\
    \iff &
    \tilde x \in (I + \lambda \partial_\epsilon g)^{-1} x
    \\
    \underset{(1)}{\iff} &
    \tilde x = x - (I + \partial_\epsilon g^\star\circ(\lambda^{-1}I))^{-1}x
    \\
    \iff &
    (x - \tilde x, x) \in
    \text{gph}\; (I + \partial_\epsilon g^\star\circ(\lambda^{-1}I))
    \\
    \iff &
    (\lambda^{-1}(x - \tilde x), x) \in
    \text{gph}\; (\lambda I + \partial_\epsilon g^\star)
    \\
    \iff &
    (\lambda^{-1}(x - \tilde x), \lambda^{-1}x) \in
    \text{gph}\; (I + \lambda^{-1}\partial_\epsilon g^\star)
    \\
    \iff &
    \lambda^{-1}(x - \tilde x) \in 
    (I + \lambda^{-1}\partial_\epsilon g^\star)^{-1}(\lambda^{-1}x). 
\end{aligned}
$$

At (1), we used the resolvent identity for multi-valued mapping. 
This gives us the relation: 

$$
\begin{aligned}
    & \tilde x \approx_\epsilon \pprox{\lambda g}(x)
    \\
    \iff &
    \tilde x \in (I + \lambda \partial_\epsilon g)^{-1} x
    \\
    \iff &
    \lambda^{-1}(x - \tilde x) \in 
    (I + \lambda^{-1}\partial_\epsilon g^\star)^{-1}(\lambda^{-1}x). 
    \\
    \iff &
    \lambda^{-1}(x - \tilde x) \approx_\epsilon 
    \pprox{\lambda^{-1} g^\star}\left(\lambda^{-1}x\right). 
\end{aligned}
$$

In a similar way, we have for $\tilde y \approx_\epsilon \pprox{g^\star/\lambda}(y/\lambda)$ it would mean: 

$$
\begin{aligned}
    & 
    \tilde y 
    \in (I + \lambda^{-1}\partial_\epsilon g^\star)^{-1}(\lambda^{-1}y)
    \\
    \iff &
    (\lambda^{-1}y, \tilde y)\in 
    \text{gph}(I + \lambda^{-1}\partial_\epsilon g^\star)^{-1}
    \\
    \iff &
    (\lambda^{-1}y, \tilde y)\in 
    \text{gph}(I - (I + \partial_\epsilon g\circ(\lambda I))^{-1})
    \\
    \iff &
    (\lambda^{-1}y, \lambda^{-1}y - \tilde y)\in 
    \text{gph}(I + \partial_\epsilon g\circ(\lambda I))^{-1}
    \\
    \iff &
    (\lambda^{-1}y - \tilde y, \lambda^{-1}y)\in 
    \text{gph}(I + \partial_\epsilon g\circ(\lambda I))
    \\
    \iff &
    (y - \lambda\tilde y, \lambda^{-1}y)\in 
    \text{gph}(\lambda^{-1}I + \partial_\epsilon g)
    \\
    \iff &
    (y - \lambda\tilde y, y)\in 
    \text{gph}(I + \lambda\partial_\epsilon g)
    \\
    \iff& 
    y - \lambda \tilde y \in 
    (I + \lambda \partial_\epsilon g)^{-1}y
    \\
    \iff& 
    y - \lambda \tilde y \approx_\epsilon \pprox{\lambda g}(y)
\end{aligned}
$$


$\square$

---
### **Duality gap and the inexactness**

The duality theory gives us measurable progress on tracking the error terms for the inexact subgradient. 
We make use of the following refereces for our upcoming content. 

#### **References**
> [1] S. Villa, S. Salzo, L. Baldassarre, and A. Verri, “Accelerated and inexact forward-backward algorithms,” SIAM J. Optim., vol. 23, no. 3, pp. 1607–1633, Jan. 2013, doi: 10.1137/110844805.

Before we start, when we do proximal point method, this is one of the form of proximal problem we are solving: 

#### **Problem | The Proximal Problem and its primal, dual**
> The problem is about $(g, \omega, B, \lambda, y)$ and the primal, dual problem $\Phi_\lambda, \Psi_\lambda$ and duality gap $\mathbf G_\lambda(u, v)$, in the space of $\R^m, \R^n$. 
> Define: 
> 1. Define $g(x) = \omega (Bx)$. 
> 2. A linear mapping $B \in \R^{m\times n}$, in the form of a matrix. 
> 3. $\omega$, a closed, proper convex function which its Fenchel conjugate $\omega^\star$, that is knwon. 
> 4. $y\in \R^n$ is a point were we are evaluating the proximal point. 
> 
> Then the objective of the problem of the proximal problem evaluated at point $y$ is given by: 
> $$
> \begin{aligned}
>     \Phi_\lambda(u) &:= 
>     \omega(Bu) + \frac{1}{2\lambda} \Vert u - y\Vert^2
> \end{aligned}
> $$
> Its dual has objective function for which we minimize: 
> $$
> \begin{aligned}
>     \Psi_\lambda(v) &:=
>     \frac{1}{2\lambda}\Vert \lambda B^\top v - y\Vert^2
>     + \omega^\star(v) - \frac{1}{2\lambda}\Vert y\Vert^2. 
> \end{aligned}
> $$
> The duality gap objective is expressed via: 
> $$
> \begin{aligned}
>     \mathbf G_\lambda(u, v) &:= 
>     \Phi_\lambda(u) + \Psi_\lambda(v). 
> \end{aligned}
> $$
> If the strong duality holds, and constraint qualification passes, then there exists $(\hat u, \hat v)$ such that $\min_{u} \Phi_\lambda(v) = -\min_{v} \Psi_\lambda(u)$, which gives $\mathbf G_\lambda(\hat u,\hat v) = 0$. 

For every primal feasible solution in **The Proximal Problem**, there exists a dual feasible solution. 
The following lemma will explain how to get there. 

#### **Lemma | Primal, Dual solution translation**
> Let $\epsilon \ge 0$, $g:\R^n \rightarrow \overline \R$ be convex, proper and closed then 
> $$
>    \left(
>       \forall z \approx_\epsilon \pprox{\lambda g}(y) 
>    \right)(\exists v \in \text{dom}\; \omega^\star): z = y - \lambda B^\top v. 
> $$


#### **Lemma | Duality gap and inexact proximal solution**
> For all $\epsilon \ge 0$, let $\eta = \lambda^{-1}\epsilon$, $v \in \R^n$. 
> Consider conditions 
> - (a) $\mathbf G_\lambda(y - \lambda B^\top v, v) \le \frac{\epsilon^2}{2\lambda}$. 
> - (b) $B^\top v \approx_\epsilon \prox_{\lambda^{-1}g^\star}(\lambda^{-1}y)$. 
> - (c) $y - \lambda B^\top v \approx_{\epsilon} \prox_{\lambda g}(y)$. 
> 
> They have $(a)\implies (b) \iff (c)$. 
> If in addition $\omega^\star(v) = g^\star(B^\top v)$, then all three conditions are equivalent. 


---
### **Algorithms for minimizing the proximal point error**

The previous section had established the minimizing the duality gap is sufficient to evaluate inexact proximal point. 