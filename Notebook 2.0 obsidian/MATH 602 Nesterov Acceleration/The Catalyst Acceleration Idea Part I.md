- [Nesterov Original Conception of Momentum Method](Nesterov%20Original%20Conception%20of%20Momentum%20Method.md)
- [Accelerated PPM Method](Accelerated%20PPM%20Method.md)

---
#### **Intro**

In this file we are focusing on the convex case of the Catalyst accelerations. 
We draw connections to theoretical works and key inequalities used in the analysis of the convergence proof of the algorithm. 

In this section, we will first standardize the notations, it helps with summarizing contents from several papers that are talking about the same topic. We are focusing first order optimizations with the folloing list of major entities: 

$$
\begin{aligned}
    & F: \R^n \mapsto \R^n, \tilde F  \approx F, 
    \\
    & \mathcal M_F^{\lambda_k}(x; y) := F(x) + \frac{1}{2\lambda_k}\Vert x - y\Vert^2. 
    \\
    & \mathcal J_{\lambda_k} :=  (1 + \lambda_k\partial F)^{-1}, 
    \\
    & \widetilde{\mathcal J}_{\lambda_k} \approx  (1 + \lambda_k\partial F)^{-1},
    \\
    & \mathcal G_{\lambda_k} := \lambda_k^{-1}(I - \mathcal J_{\lambda_k}),
    \\
    & \widetilde{\mathcal G}_{\lambda_k} := \lambda_k^{-1}(I - \widetilde{\mathcal J}_{\lambda_k}). 
\end{aligned}
$$

Here, $F, \mathcal J, \mathcal G$ denotes objective function, resolvent on the objective function. Their subscript correlates to the constant $\lambda_k$ used in the resolvent operator. 
Their approximation counter part has $\widetilde{(\cdot)}$ on on them. 
To ease the notation, sometimes their subscript will become $k$ when it's clear that we are talking about a sequence of proximal point iteration with $(\lambda_k)_{k \ge 0}$.




#### **Definition | Nesterov's estimating sequence**
> Denote $\phi_k(x): \R^n \mapsto \R$ be the Nesterov's estimating sequence associated with the objective function $F$. 
> For it to be a Nesterov's estimating sequence, it satisfies the conditions that: 
> 1. There exists sequence $(x_k)_{k \ge 0}$ where $F(x_k) \le \phi_k^* := \min_{x} \phi_k(x)$. 
> 2. Let $(\alpha_k)_{k \ge0}$ be a sequence of $\alpha_i \in (0, 1)$ and it has $\phi_{k + 1}(x) - \phi_k(x) \le -\alpha_k(\phi_k(x) - F(x))$ for all $x \in \R^n$. 




---
### **H. Lin 2015, Universal Catalyst**


We summarize some of the key ideas involved in H. Line 2015 Universal Catalyst paper. 

#### **Controlling the Error on the Nesterov's Lower Estimating Sequence**
> Let $F$ be a $\mu\ge 0$ strongly convex function.
> Suppose $x_k$ is an approximated proximal point meaning that $x_k \approx \mathcal J_{\kappa^{-1}} y_{k - 1}$ for some $\kappa$ fixed. 
> Its approximation error can be characterized by $\mathcal M_F^{\kappa^{-1}}(x_k; y_{k - 1}) - \mathcal M_F^{\kappa^{-1}}(\mathcal J_{\kappa^{-1}} y_k, y_{k - 1}) \le \epsilon_k$. 
> Use $x_k^* = \mathcal J_{\kappa^{-1}} y_{k - 1}$ to denote the exact evaluation of the proximal point method then we have for all $x$: 
> $$
> \begin{aligned}
>     F(x) &\ge 
>     F(x_k) + \kappa \langle y_{k - 1} - x_k, x - x_k\rangle
>     + \frac{\mu}{2}\Vert x - x_k\Vert^2 
>     + (\kappa + \mu)\langle  x_k - x_k^*, x - x_k\rangle 
>     - \epsilon_k.
> \end{aligned}
> $$

**Observations**

Set $\epsilon_k = 0$ so $x_k = x_k^*$ by strong convexity of $\mathcal M_F^{\kappa^{-1}}(\cdot\; ; y_{k - 1})$ (See [Strong Convexity, Equivalences and Implications](../AMATH%20516%20Numerical%20Optimizations/Strong%20Convexity,%20Equivalences%20and%20Implications.md) for more information here) so it gives the usual proximal inequality: 
$$
\begin{aligned}
    F(x) \ge F(x_k) + \kappa\langle y_{k - 1} - x_k, x - x_k \rangle + 
    \frac{\mu}{2} \Vert x - x_k\Vert^2. 
\end{aligned}
$$

Replacing $x_k = x_k^*$, this inequality is the same as the exact evaluation of the proximal point method. 

**Proof**

The only ingredient is the coersivity of the envelope function $G_k := \mathcal M_F^{\kappa^{-1}}(\cdot, y_{k - 1}), G_k^* = \mathcal M_F^{\kappa^{-1}}(x_k^*, y_{k - 1})$, which is a $\mu + \kappa$ convex function, therefore it has: 

$$
\begin{aligned}
    (\forall x)\quad G_k(x) &\ge G_k^* + \frac{\kappa + \mu}{2}\Vert x - x_k^*\Vert^2. 
\end{aligned}
$$

This condition is weaker than strong convexity. 
Substituting the definition of the terms we have 

$$
{\small
\begin{aligned}
    F(x) &\ge 
    G_k(x_k) + (G_k^* - G_k(x_k)) + 
    \frac{\mu + \kappa}{2}\Vert x - x_k^*\Vert^2 
    - \frac{\kappa}{2}\Vert x - y_{k - 1}\Vert^2
    \\
    &\ge 
    G(x_k) - \epsilon_k + \frac{\kappa + \mu}{2}\Vert x - x_k^*\Vert^2
    - \frac{\kappa}{2}\Vert x - y_{k - 1}\Vert^2
    \\
    &= G_k(x_k) - \epsilon_k + \frac{\kappa + \mu}{2}
    \left(
        \Vert x - x_k - x_k + x_k^*\Vert^2
    \right)
    - \frac{\kappa}{2}\Vert x - y_{k - 1}\Vert^2
    \\
    &= G_k(x_k) - \epsilon_k + \frac{\kappa + \mu}{2}
    \left(
        \Vert x - x_k\Vert^2 + \Vert x_k - x_k^*\Vert^2
        + 
        2\langle x - x_k, x_k - x_k^*\rangle
    \right)
    - \frac{\kappa}{2}\Vert x - y_{k - 1}\Vert^2
    \\
    &= 
    \left(
        G_k(x_k) + \frac{\kappa}{2}\Vert x - x_k\Vert^2 - \frac{\kappa}{2}\Vert x - y_{k - 1}\Vert^2
    \right)
    - \epsilon_k
    + \frac{\mu}{2}\Vert x - x_k\Vert^2
    + \frac{\kappa + \mu}{2}\Vert x_k - x_k^*\Vert^2
    + (\kappa + \mu)\langle x - x_k, x_k - x_k^*\rangle. 
\end{aligned}
}
$$

Focusing on the terms inside parenthesis we have 

$$
\begin{aligned}
    &
    G_k(x_k) 
    + \frac{\kappa}{2}\Vert x - x_k\Vert^2 - \frac{\kappa}{2}\Vert x - y_{k - 1}\Vert^2
    \\
    &= 
    F(x_k) + \frac{\kappa}{2}\Vert x_k - y_{k - 1}\Vert^2
    + \frac{\kappa}{2}\Vert x - x_k\Vert^2 - \frac{\kappa}{2}\Vert x - y_{k - 1}\Vert^2
    \\
    &= 
    F(x_k) + 
    \frac{\kappa}{2}\left(
        \Vert x_k - y_{k - 1}\Vert^2 - \Vert x - y_{k - 1}\Vert^2
    \right)
    + \frac{\kappa}{2} \Vert x - x_k\Vert^2
    \\
    &= 
    F(x_k) + 
    \frac{\kappa}{2}\left(
        \Vert x_k - x\Vert^2 
        + 
        2\langle x_k - x, x - y_{k - 1} \rangle
    \right)
    + 
    \frac{\kappa}{2} \Vert x - x_k\Vert^2
    \\
    &= 
    F(x_k) + 
    \kappa\Vert x_k - x\Vert^2
    + 
    \kappa\langle x_k - x, x - y_{k - 1}\rangle
    \\
    &= 
    F(x_k) + 
    \kappa\langle x_k - x, x - y_{k - 1} + x_k - x\rangle
    \\
    &= F(x_k) + \kappa\langle x_k - x, x_k - y_{k - 1} \rangle. 
\end{aligned}
$$

Therefore have the inequality: 

$$
\begin{aligned}
    F(x) 
    &\ge 
    F(x_k) + \kappa\langle x_k - x, x_k - y_{k - 1} \rangle
    - \epsilon_k
    + \frac{\mu}{2}\Vert x - x_k\Vert^2
    + \frac{\kappa + \mu}{2}\Vert x_k - x_k^*\Vert^2
    + (\kappa + \mu)\langle x - x_k, x_k - x_k^*\rangle
    \\
    & \ge
    F(x_k) + \kappa\langle x_k - x, x_k - y_{k - 1} \rangle
    - \epsilon_k
    + \frac{\mu}{2}\Vert x - x_k\Vert^2
    + (\kappa + \mu)\langle x - x_k, x_k - x_k^*\rangle. 
\end{aligned}
$$

Re-arranging it to a form I personally like: 

$$
\begin{aligned}
    F(x) - F(x_k) - \kappa\langle x_k - x, x_k - y_{k - 1} \rangle
    - \frac{\mu}{2}\Vert x - x_k\Vert^2
    &\ge 
    - \epsilon_k
    + (\kappa + \mu)\langle x - x_k, x_k - x_k^*\rangle. 
\end{aligned}
$$

Now we have the RHS to be exlusively about the inexact evaluation $x_k \approx \mathcal J_{\kappa^{-1}} y_{k - 1}$, and $G_k(x_k) - G^*_k \le \epsilon_k$. 


**Remarks**

What would be the error of evaluation for the method of proximal gradient?
We are confident here that this lemma is as general as it could get for the proximal inequality. 
1. The theorem is based on a weaker consequence of strong convexity. 
2. The theorem includes an untrackable error bound $\epsilon_k$. How to achieve such an error bound when designing the algorithm would be a bit of a problem. 

Finally, compare the results to the proximal gradient inequality derived in our notations, we assume that $F = f + g$ with $f$ $L$-smooth and $g$ convex. 
Fix any $y\in \R^n$ then we have $\forall x \in \R^n$: 

$$
\begin{aligned}
    & F = g + h
    \\
    & 
    \widetilde {\mathcal J}_{L^{-1}} 
    = [I + L^{-1}\partial g]^{-1}\circ[I - L^{-1}\nabla f]
    \\
    & 
    F(x) - F\left(\widetilde{\mathcal J}_{L^{-1}}y\right) 
    - 
    \left\langle 
        \widetilde{\mathcal G}_{L^{-1}}(y), 
        x - \widetilde{\mathcal J}_{L^{-1}}y
    \right\rangle
    \ge 
    D_f(x, y) - \frac{L}{2}
    \left\Vert 
        y - \widetilde{\mathcal J}_{L^{-1}}y
    \right\Vert^2
\end{aligned}
$$

Setting the $\mu = 0$ in our derivations, the similarity between the two inequality is very interesting. 


---
### **Guller 1993, Accelerated Inexact Proximal Point Method**



