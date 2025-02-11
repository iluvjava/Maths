[Catalyst Acceleration Part I, Introduction](Catalyst%20Acceleration%20Part%20I,%20Introduction.md)

---

### **Introduction**

#### **Assumption 1**
1. Let $F:\R^n \rightarrow \overline \R$ is a $\mu \ge 0$ strongly convex function. 


**Notations**. 
Define for all $x, y \in \R^n$ and some $\kappa > 0$ the model function

$$
\begin{aligned}
    \mathcal M_F^{1/\kappa}(x; y) 
    &= 
    F(x) + \frac{\kappa}{2}\Vert x - y\Vert^2, 
    \\
    \mathcal M_{F, 1/\kappa}^{*}(y) 
    &= 
    \min_{x \in \R^n} \left\lbrace
        \mathcal M_F^{1/k}(x; y)
    \right\rbrace, 
    \\
    \mathcal J_{1/\kappa F}(y) 
    &= \argmin{x \in \R^n}
    \left\lbrace
        \mathcal M_F^{1/k}(x; y)
    \right\rbrace. 
\end{aligned}
$$

They are the model function, the Envelope function, and the resolvent/proximal operator. 

--
### **Inexact proximal inequality**
The lemmas that follows show the inequality proximal inequality with inexact evaluations on the resolvent operator. 

#### **Lemma 1 | Gradient error proximal inequality**
> Let $y \in \R^n, \tilde x \in \R^n$, $w \in \partial \mathcal M(\tilde x; y)$. 
> Then for all $x \in \R^n$: 
> $$
> \begin{aligned}
>     F(x) - F(\tilde x) + \frac{\kappa}{2}
>     (
>         \Vert x - y\Vert^2 + \Vert \tilde x + y\Vert^2 
>         - \Vert \tilde x - x\Vert^2
>     )
>     - \frac{\mu}{2}\Vert x - \tilde x\Vert^2 
>     &\ge \langle w, x - \tilde x\rangle. 
> \end{aligned}
> $$

**Proof**

The model function $\mathcal M_F^{1/\kappa}(\cdot; y)$ (Write $\mathcal M(x; y)$ for short.) is $q = \mu + \kappa$ strongly convex and hence it has quadratic subgradient inequality: 

$$
\begin{aligned}
    \langle w, x - \tilde x\rangle
    &\le 
    \mathcal M(x; y) - \mathcal M(\tilde x; y) - \frac{q}{2} \Vert x - \tilde x\Vert^2 
    \\
    &= 
    F(x) - F(\tilde x) + 
    \frac{\kappa}{2}\left(
        \Vert x - y\Vert^2 + \Vert \tilde x - y\Vert^2
    \right)
    - \frac{q}{2}\Vert x - \tilde x\Vert^2
    \\
    &= 
    F(x) - F(\tilde x) + \frac{\kappa}{2}(\Vert x - y\Vert^2 + \Vert \tilde x - y\Vert^2 - \Vert x - \tilde x\Vert^2) - \frac{\mu}{2}\Vert x - \tilde x\Vert. 
\end{aligned}
$$

**Remarks**

This is Lemma A.7 in Lin et al.'s 2015 Catalyst paper. 

#### **Lemma 2 | Absolute error proximal inequality**
> Let $y \in \R^n, \tilde x \in \R^n$. 
> Suppose that $\tilde x$ is an approximation of $\mathcal J_{1/\kappa F}(y)$ such that there exists some $\epsilon > 0$ with $\mathcal M_F^{1/\kappa}(\tilde x) - \mathcal M^*_{F, 1/\kappa}(y) \le \epsilon$ and $x^* = \mathcal J_{1/\kappa F}(y)$ is the exact solution of the proximal point problem.
> Then for all $x \in \R^n$ it has 
> $$
> \begin{aligned}
>   & F(x) - F(\tilde x) + \frac{\kappa}{2}(\Vert x - y\Vert^2 + \Vert \tilde x - y\Vert^2 - \Vert x - \tilde x\Vert^2) - \frac{\mu}{2}\Vert x - \tilde x\Vert^2
> \\
> &\ge - \epsilon + (\kappa + \mu)/2\Vert \tilde x - x^*\Vert^2 + (\kappa + \mu)\langle x - \tilde x, \tilde x - x^*\rangle. 
> \end{aligned}
> $$

**Proof**

The model function has quadratic growth conditions over the minimizer $x^*$ by $F$ $\mu \ge 0$ strongly convex. 
Let $q = \mu + \kappa$ then it has for all $x \in \R^n$: 

$$
\begin{aligned}
    \frac{q}{2}\Vert x - x^*\Vert^2
    &\le 
    \mathcal M(x; y) - \mathcal M(x^*; y)
    \\
    &\le 
    \mathcal M(x; y)
    + \epsilon - \mathcal M(\tilde x; y)
    \\
    &= 
    F(x) - F(\tilde x) + \frac{\kappa}{2}(\Vert x - y\Vert^2 - \Vert \tilde x - y\Vert^2)
    + \epsilon
    \\
    \iff 
    \frac{q}{2}\Vert x - \tilde x\Vert^2 
    &\le 
    F(x) - F(\tilde x) + \frac{\kappa}{2}(\Vert x - y\Vert^2 - \Vert \tilde x - y\Vert^2)
    + \epsilon - \frac{q}{2}\Vert \tilde x - x^*\Vert^2 
    - q\langle x - \tilde x, \tilde x - x^*\rangle
    \\
    \frac{q}{2}\Vert x - \tilde x\Vert^2 
    &\le 
    F(x) - F(\tilde x) + \frac{\kappa}{2}(
        \Vert x - y\Vert^2 - \Vert \tilde x- y \Vert^2 
        - \Vert \tilde x - x^*\Vert^2
    )- \frac{\mu}{2}\Vert \tilde x - x^*\Vert^2
    - q\langle x - \tilde x, \tilde x - x^*\rangle
    + \epsilon. 
\end{aligned}
$$

Re-arranging the inequality yields the final result which proves the lemma. 

#### **Discussions**

Lemma 1 only requires quadratic growth conditions while Lemma 2 requires the characterizations of subgradient inequality which is equivalent to the definition of strong convexity. 
Lemma 2 is made on a stronger assumption on the model function $\mathcal M^{1/\kappa}_F$. 


