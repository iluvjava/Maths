- [Nesterov Original Conception of Momentum Method](Nesterov%20Original%20Conception%20of%20Momentum%20Method.md)
- [Accelerated PPM Method](Accelerated%20PPM%20Method.md)
- [Nestrov Estimating Sequence of Proximal Gradient](Nestrov%20Estimating%20Sequence%20of%20Proximal%20Gradient.md)
- [A Review on Nesterov's Estimating Sequence Technique](A%20Review%20on%20Nesterov's%20Estimating%20Sequence%20Technique.md)

---
#### **Intro**

In this file we are focusing on the convex case of the Catalyst accelerations. 
We draw connections to theoretical works and key inequalities used in the analysis of the convergence proof of the algorithm. 

#### **Standardizing the notations**

In this section, we will first standardize the notations, it helps with summarizing contents from several papers that are talking about the same topic. We are focusing first order optimizations with the following list of major entities: 

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
We summarize some key quantities in the context of H. Lin's writing on the method of Catalyst Meta Acceleration: 

$$
\begin{aligned}
    x_k^* 
    &=\mathcal J_{\kappa^{-1}} y_{k - 1}, 
    \\
    x_k &= 
    \widetilde{\mathcal J}_{\kappa^{-1}} y_{k - 1}. 
\end{aligned}
$$

We summarize some of the key points for lemmas in the Appendix: 
1. Lemma A.7 shows us the Proximal Gradient Inequality that incorperates an inexact evaluation of the proximal point method, together with the error bound on the Moreau Envelope. 
2. Theorem A.6 shows the Nesterov's estimating sequence only incorperates the inexact proximal point iterates. 
3. A.8 Shows how the canonical form of the Nesterov's estimating sequence incorperates the errors from inexact proximal point evaluations. 
4. A.9 Evaluates the consequence of inexact evaluation of proximal point method on the convergence reate implied by the Nesterov's estimating sequence frameworks. 


#### **Lemma A.7 | Controlling the Error on the Nesterov's Lower Estimating Sequence**
> Let $F$ be a $\mu\ge 0$ strongly convex.
> Suppose $x_k$ is an inexact proximal point evaluation of $x_k \approx \mathcal J_{\kappa^{-1}} y_{k - 1}$ with $\kappa$ fixed. 
> Assume the approximation error is haracterized by $\mathcal M^{\kappa^{-1}}(x_k; y_{k - 1}) - \mathcal M^{\kappa^{-1}}(\mathcal J_{\kappa^{-1}} y_{k - 1}, y_{k - 1}) \le \epsilon_k$. 
> Denote $x_k^* = \mathcal J_{\kappa^{-1}} y_{k - 1}$ to be the exact evaluation of the proximal point then for all $x$: 
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
The key here is that the proximal gradient inequality doesn't have any $x_k^*$, the exact proximal point step involved here. 

The the parts that follows, we summarize key points made to accomodate and realize the errors made by the approximations on the Moreau Envelope and how they innovate the algorithms design of. 

#### **Theorem A.6 | Nesterov's estimating sequence results with inexact PPM**
> Representing in the cannonical form of the Nesterov's estimating sequence, it defines the relations between $(\gamma_{k})_{k \ge0}, (v_k)_{k \ge 0}, (\phi_k^*)_{k\ge 0}$ and for all $k \ge 1$
> $$
> \begin{aligned}
>     \gamma_k &= (1 - \alpha_{k - 1})\gamma_{k - 1} + \alpha_{k - 1}\mu, 
>     \\
>     v_k &= 
>     \gamma_k^{-1}(
>         (1 - \alpha_{k - 1})\gamma_{k - 1}v_{k - 1}
>         + \alpha_{k - 1}\mu x_k - \alpha_{k - 1}\kappa(y_{k - 1} - x_k)
>     ), 
>     \\
>     \phi_k^* &= (1 - \alpha_{k - 1})\phi_{k - 1}^*
>     + \alpha_{k - 1}F(x_k)
>     - \frac{\alpha_{k - 1}^2}{2\gamma_k}\Vert \kappa(y_{k - 1} - x_k)\Vert^2
>     \\
>     &\quad 
>     + \frac{\alpha_{k - 1}(1 - \alpha_{k - 1})\gamma_{k - 1}}{\gamma_k}
>     \left(
>         \frac{\mu}{2}\Vert x_k - v_{k - 1}\Vert^2 + 
>         \langle \kappa(y_{k - 1} - x_k), v_{k - 1} - x_k\rangle
>     \right). 
> \end{aligned}
> $$

**Proof**

Complicated.
Skipped.

**Remark**

Please observe that the entire design of the sequence is based on the in-exact approximated iteration sequence $(x_k)_{k \ge 0}$. 


#### **Theorem A.8 | Controlling Error Bounds on the Nesterov's Estimating Sequence**
> The caoninical representation of estimating sequence $\phi_k^*$ and the function value at the inexact proximal point iterates $F(x_k)$ satisfies the conditions for all $k\ge 1$
> $$
> \begin{aligned}
>     F(x_k) &\le \phi_k^* + \xi_k, 
>     \\
>     \xi_k &= 
>     (1 - \alpha_{k - 1})(
>         \xi_{k - 1} + \epsilon_k 
>         - (\kappa + \mu)\langle x_k - x_k^*, x_{k - 1} - x_k\rangle
>     ). 
> \end{aligned}
> $$
> Where we have the base case that $\xi_0 = 0$. 

**Proof**

The proove is achieved via induction. 
Basecase is trivially satisfied via $\phi_0^* = F(x_0)$ and $\xi_0 = 0$. 
Inductively we assume that $F(x_{k - 1}) \le \phi_{k - 1}^* + \xi_k$. 
By definition it means 

$$
\begin{aligned}
    \phi_{k - 1}^* &\ge 
    F(x_{k - 1}) - \xi_{k - 1}
    \\
    &\ge 
    F(x_k) + 
    \langle \kappa(y_{k - 1} - x_k), x_{k - 1} - x_k\rangle
    + 
    (\kappa + \mu)\langle x_k - x_k^*, x_{k - 1} - x_k\rangle
    - \epsilon_k - \xi_{k - 1}
    \\
    &= 
    F(x_k) + 
    \langle \kappa(y_{k - 1} - x_k), x_{k - 1} - x_k\rangle
    - (1 - a_{k - 1})^{-1}\xi_k. 
\end{aligned}\tag{A.8.1}
$$

Using A.6, we have the inequality from the inexact estimating sequence that 

$$
\begin{aligned}
    \phi_k^* &= 
    (1 - \alpha_{k - 1})\phi_{k - 1}^* 
    + 
    \alpha_{k - 1}F(x_k)
    - 
    \frac{\alpha_{k - 1}}{2\gamma_k}
    \Vert \kappa(y_{k - 1} - x_k)\Vert^2
    \\
    &\quad 
    + \frac{\alpha_{k - 1}(1 - \alpha_{k - 1})\gamma_{k - 1}}{\gamma_k}
    \left(
        \frac{\mu}{2}\Vert x_k - v_{k - 1}\Vert^2
        + \langle \kappa(y_{k - 1} - x_k), v_{k - 1} - x_k\rangle
    \right)
    \\
    &\quad \text{By (A.8.1)}
    \\
    &\ge 
    (1 - \alpha_{k - 1})
    \left(
        F(x_k) + 
        \langle \kappa(y_{k - 1} - x_k), x_{k - 1} - x_k\rangle
        - (1 - a_{k - 1})^{-1}\xi_k
    \right)
    + 
    \alpha_{k - 1}F(x_k)
        \\
        &\quad 
        + 
        \frac{\alpha_{k - 1}(1 - \alpha_{k - 1})\gamma_{k - 1}}{\gamma_k}
        \left(
            \frac{\mu}{2}\Vert x_k - v_{k - 1}\Vert^2
            + \langle \kappa(y_{k - 1} - x_k), v_{k - 1} - x_k\rangle
        \right)
        -
        \frac{\alpha_{k - 1}}{2\gamma_k}
        \Vert \kappa(y_{k - 1} - x_k)\Vert^2
    \\
    &= 
    (1 - \alpha_{k - 1})\langle \kappa(y_{k - 1} - x_k), x_{k - 1} - x_k \rangle
    - \frac{\alpha_{k - 1}}{2\gamma_k}\Vert \kappa(y_{k - 1} - x_k)\Vert^2
        \\
        & \quad 
        + 
        \frac{\alpha_{k - 1}(1 - \alpha_{k - 1})\gamma_{k - 1}}{\gamma_k}
        \left(
            \frac{\mu}{2}\Vert x_k - v_{k - 1}\Vert^2
            + 
            \left\langle 
                \kappa(y_{k - 1} - x_k), v_{k - 1} - x_k
            \right\rangle
        \right)+ F(x_k) - \xi_k
    \\
    &= 
    (1 - \alpha_{k - 1})\left\langle 
        \kappa(y_{k - 1} - x_k), 
        \frac{
            \alpha_{k - 1}\gamma_{k - 1}
        }{
            \gamma_k
        }(v_{k - 1} - x_k) + x_{k - 1} - x_k
    \right\rangle
    - \frac{\alpha_{k - 1}}{2\gamma_k}\Vert \kappa(y_{k - 1} - x_k)\Vert^2
    \\
        &\quad 
        + \frac{\mu\alpha_{k - 1}(1 - \alpha_{k - 1})\gamma_{k - 1}}{2\gamma_k}
        \Vert x_k - v_{k - 1}\Vert^2 + F(x_k) - \xi_k. 
\end{aligned}\tag{A.8.2}
$$

We focus on the first 2 terms selected from the RHS of the above inequality: 

$$
\begin{aligned}
    & (1 - \alpha_{k - 1})\left\langle 
        \kappa(y_{k - 1} - x_k), 
        \frac{
            \alpha_{k - 1}\gamma_{k - 1}
        }{
            \gamma_k
        }(v_{k - 1} - x_k) + x_{k - 1} - x_k
    \right\rangle
    - \frac{\alpha_{k - 1}}{2\gamma_k}\Vert \kappa(y_{k - 1} - x_k)\Vert^2. 
\end{aligned}\tag{A.8.3}
$$

Focusing on the first term from above it has: 

$$
\begin{aligned}
    & 
    \left\langle 
        \kappa(y_{k - 1} - x_k),
        x_{k - 1} - y_{k - 1} 
        + 
        \frac{\alpha_{k - 1}\gamma_{k - 1}}{\gamma_k}
        (v_{k - 1} - y_{k - 1} + y_{k - 1} - x_k) 
    \right\rangle
    \\
    &= 
    \left\langle 
        \kappa(y_{k - 1} - x_k), 
        x_{k - 1} - y_{k - 1}
        + 
        \frac{\alpha_{k - 1}\gamma_{k - 1}}{\gamma_k}
        (v_{k - 1} - y_{k - 1})  
    \right\rangle
    \\ 
    &\quad 
        + 
        \left\langle 
            \kappa(y_{k - 1} - x_k), 
            y_{k - 1} - x_k + 
            \frac{\alpha_{k - 1}\gamma_{k - 1}}
            {\gamma_k}
            (y_{k - 1} - x_k)
        \right\rangle
    \\
    &= 
    \left\langle 
        \kappa(y_{k - 1} - x_k), 
        x_{k - 1} - y_{k - 1}
        + 
        \frac{\alpha_{k - 1}\gamma_{k - 1}}{\gamma_k}
        (v_{k - 1} - y_{k - 1})  
    \right\rangle
    \\ 
    &\quad 
        + 
        \kappa\left(
            1 + \frac{\alpha_{k - 1}\gamma_{k - 1}}{\gamma_k}
        \right)
        \Vert v_{k - 1} - y_{k - 1}\Vert^2. 
\end{aligned}
$$

With the above, we can simplifiy (A.8.3) by substituting it back which gives: 

$$
\begin{aligned}
    &
    (1 - \alpha_{k - 1})\left\langle 
        \kappa(y_{k - 1} - x_k), 
        x_{k - 1} - y_{k - 1}
        + 
        \frac{\alpha_{k - 1}\gamma_{k - 1}}{\gamma_k}
        (v_{k - 1} - y_{k - 1})  
    \right\rangle
    \\
        & 
        - \frac{\alpha_{k - 1}}{2\gamma_k}
        \Vert \kappa(y_{k - 1} - x_k)\Vert^2
        + 
        \kappa(1 - \alpha_{k - 1})\left(
            1 + \frac{\alpha_{k - 1}\gamma_{k - 1}}{\gamma_k}
        \right)
        \Vert v_{k - 1} - y_{k - 1}\Vert^2
    \\
    &=
    (1 - \alpha_{k - 1})
    \left\langle 
        \kappa(y_{k - 1} - x_k), 
        x_{k - 1} - y_{k - 1}
        + 
        \frac{\alpha_{k - 1}\gamma_{k - 1}}{\gamma_k}
        (v_{k - 1} - y_{k - 1})  
    \right\rangle
        \\
        &\quad 
        + 
        (1 - \alpha_{k - 1})\kappa\left(
            1 + \frac{\alpha_{k - 1}\gamma_{k - 1}}{\gamma_k}
            - \frac{\kappa\alpha_{k - 1}}{2\gamma_k}
        \right)
        \Vert y_{k - 1} - x_k\Vert^2. 
\end{aligned}
$$

Focusing on the coefficient of on the term $\Vert y_{k - 1} - x_k\Vert^2$, simplify that by the recurrence on the Cannonical form of the Nesterov's estimating sequence given by A.6. 

$$
\begin{aligned}
    &
    (1 - \alpha_k)\kappa\left(
        1 + \frac{\alpha_{k - 1}\gamma_{k - 1}}{\gamma_k}
        - \frac{\kappa\alpha_{k - 1}}{2\gamma_k}
    \right)
    \\
    &=
    \kappa\left(
        1 - \alpha_{k - 1} + 
        \frac{(1 - \alpha_{k - 1})\alpha_{k - 1}\gamma_{k - 1}}{\gamma_k}
        - \frac{\alpha_{k - 1}^2\kappa}{2\gamma_k}
    \right)
    \\
    & \text{Use: }\gamma_k - \alpha_{k - 1}\mu = (1 - \alpha_{k - 1})\gamma_{k - 1}
    \\
    &= 
    \kappa\left(
        1 - \alpha_{k - 1} 
        + 
        \frac{(\gamma_k - \alpha_{k - 1}\mu)\alpha_{k - 1}}{\gamma_k}
        - 
        \frac{\alpha_{k - 1}^2\kappa}{2\gamma_k}
    \right)
    \\
    &= \kappa
    \left(
        1 + 
        \frac{
            -2\gamma_k\alpha_{k - 1}
            + 2(\gamma_k - \alpha_{k - 1}\mu)\alpha_{k - 1}
            - \alpha_{k - 1}^2\kappa
        }{
            2\gamma_k
        }
    \right)
    \\
    &= \kappa
    \left(
        1 + \frac{-2\alpha_{k + 1}^2\mu - \alpha_{k - 1}^2\kappa}{2\gamma_k}
    \right)
    \\
    &= 
    \kappa\left(
        1 - \frac{(2\mu + \kappa)\alpha_{k - 1}^2}{2\gamma_k}
    \right)
    \\
    &= 
    \kappa\left(
        1 - \frac{(\mu + \kappa/2)\alpha_{k - 1}^2}{\gamma_k}
    \right). 
\end{aligned}
$$

Rolling back to A.8.2, we substitute our result for the first 2 terms on the RHS of the inequality and this gives: 

$$
\begin{aligned}
    \phi_k^* 
    &\ge 
    (1 - \alpha_{k - 1})
    \left\langle 
        \kappa(y_{k - 1} - x_k), 
        x_{k - 1} - y_{k - 1}
        + 
        \frac{\alpha_{k - 1}\gamma_{k - 1}}{\gamma_k}
        (v_{k - 1} - y_{k - 1})  
    \right\rangle
        \\
        &\quad 
        + 
        \kappa\left(
            1 - \frac{(\mu + \kappa/2)\alpha_{k - 1}^2}{\gamma_k}
        \right)
        \Vert y_{k - 1} - x_k\Vert^2
        + \frac{\mu\alpha_{k - 1}(1 - \alpha_{k - 1})\gamma_{k - 1}}{2\gamma_k}
        \Vert x_k - v_{k - 1}\Vert^2 + F(x_k) - \xi_k
    \\
    &\ge 
    (1 - \alpha_{k - 1})
    \left\langle 
        \kappa(y_{k - 1} - x_k), 
        x_{k - 1} - y_{k - 1}
        + 
        \frac{\alpha_{k - 1}\gamma_{k - 1}}{\gamma_k}
        (v_{k - 1} - y_{k - 1})  
    \right\rangle
        \\
        &\quad 
        + 
        \kappa\left(
            1 - \frac{(\mu + \kappa/2)\alpha_{k - 1}^2}{\gamma_k}
        \right)
        \Vert y_{k - 1} - x_k\Vert^2
        + 
        \Vert x_k - v_{k - 1}\Vert^2 + F(x_k) - \xi_k. 
\end{aligned}
$$

The second inequality above came from the non-negativity of the term $\Vert x_k - v_{k - 1}\Vert^2$ because its coefficient is non-negative. 
Finally, if we were to continuelly assert the conditions $\phi_k^* + \xi_k \ge F(x_k)$ for current iterate $x_k$, one sufficient conditions for $(\alpha_k, v_k, x_k, y_k)_{k\ge 1}$ to satisfy would be: 

$$
\begin{aligned}
    x_{k - 1} - y_{k - 1}
    + 
    \frac{\alpha_{k - 1}\gamma_{k - 1}}{\gamma_k}
    (v_{k - 1} - y_{k - 1}) 
    &= 
    \mathbf 0, 
    \\
    1 - \frac{(\kappa/2 + \mu)\alpha_{k - 1}^2}{\gamma_k}
    \le 
    1 - (\kappa + \mu)\frac{\alpha_{k - 1}^2}{\gamma_k} 
    & \le 0. 
\end{aligned}
$$


#### **Proposition A.9 | Nesterov's estimating sequence with implicit descent error control**
> 

