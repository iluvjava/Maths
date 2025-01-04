Pre-requisite: 

- [Catalyst Acceleration Part I, Introduction](Catalyst%20Acceleration%20Part%20I,%20Introduction.md)

---
### **Intro**

This file's major focus is Hongzhou Lin's second paper on Catalyst Meta Acceleration Method. 

We made the choice to redefine some of the notation, in hope of making things clearer. 

#### **Assumption 1 | Catalyst simple objective**
> Let $F: \R \rightarrow \overline \R$ be closed convex and $\mu \ge 0$ strongly convex. 
For any fixed $y \in \R^n$ and regularization parameter $\kappa > 0$, we define the following: 
$$
\begin{aligned}
    (\forall x \in \R^n) \; 
    \mathcal M_F^{1/\kappa}(x; y) &:= F(x) + \frac{\kappa}{2}\Vert x - y\Vert^2, 
    \\
    \mathcal J_{\kappa^{-1}F}(y) 
    &:= \argmin{x} \left\lbrace
        \mathcal M_F^{1/\kappa}(x; y)
    \right\rbrace,
    \\
    \mathcal M^*_{F, \kappa^{-1}}(y) 
    &:= \min_x
    \left\lbrace
        \mathcal M_F^{1/\kappa}(x; y)
    \right\rbrace. 
\end{aligned}
$$
$\mathcal M_{F}^{\kappa^{-1}}(\cdot, y)$ is a $\mu + \kappa$ strongly convex function, and $\mathcal M^*_{F, 1/\kappa}(y)$ is the Moreau Envelope of the function. 
It exhibits smoothness and strong convexity and it's full domain: $\R^n \rightarrow \R$. 


---
### **Lin et al., first Catalyst paper**

For easier notation, we also define the inexact proximal gradient introduced in Lin et al.'s first catalyst paper. 

#### **Definition 1 | Inexact Proximal operator with absolute error**
> Let $F$ be given by Assumption 1, we define the inexact proximal operator with absolute error $\epsilon > 0$ for any $y \in \R^n$ to be the following set: 
> $$
> \begin{aligned}
>     \mathcal J_{\kappa^{-1}F}^\epsilon (y) &= 
>     \left\lbrace
>         x \left | 
>             \mathcal M_F^{1/\kappa}(x; y) - 
>             \mathcal M^*_{f, 1/\kappa}(y) \le \epsilon
>         \right.
>     \right\rbrace. 
> \end{aligned}
> $$

#### **Definition 2 | The Basic Catalyst algorithm**


We now clarify on a very high level, additional key innovations in Lin's first Catalyst paper. 
