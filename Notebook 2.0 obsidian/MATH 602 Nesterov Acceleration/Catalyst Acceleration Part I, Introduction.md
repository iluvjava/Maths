- [Nesterov Original Conception of Momentum Method](Nesterov%20Original%20Conception%20of%20Momentum%20Method.md)
- [Accelerated PPM Method](Accelerated%20PPM%20Method.md)
- [Nestrov Estimating Sequence of APG](Nestrov%20Estimating%20Sequence%20of%20APG.md)
- [A Review on Nesterov's Estimating Sequence Technique](A%20Review%20on%20Nesterov's%20Estimating%20Sequence%20Technique.md)

---
#### **Intro**

In this file we are focusing on the convex case of the Catalyst accelerations. 
We draw connections to theoretical works and key inequalities used in the analysis of the convergence proof of the algorithm. 

#### **Standardizing the notations**

In this section, we will first standardize the notations, it helps with summarizing contents from several papers that are talking about the same topic. We are focusing first order optimizations with the following list of major entities: 

$$
\begin{aligned}
    & F: \R^n \mapsto \R^n
    \\
    & \mathcal M^{\lambda}_F(x; y) := F(x) + \frac{1}{2\lambda}\Vert x - y\Vert^2, 
    \\
    & \mathcal J_{\lambda F} :=  (I + \lambda\partial F)^{-1}
    = \argmin{x \in \R^n}
    \left\lbrace
        \mathcal M_F^\lambda(x; y)
    \right\rbrace,
    \\
    & \mathcal G_{\lambda F} := 
    \lambda^{-1}(I - \mathcal J_{\lambda F}). 
\end{aligned}
$$

Here, $F, \mathcal J, \mathcal G$ denotes objective function, resolvent on the objective function. Their subscript correlates to the constant $\lambda_k$ used in the resolvent operator. 
Their approximation counterpart has $\widetilde{(\cdot)}$ on them. 
To ease the notation, sometimes their subscript will become $k$ when it's clear that we are talking about a sequence of proximal point iteration with $(\lambda_k)_{k \ge 0}$.


#### **Definition | Nesterov's estimating sequence**
> Denote $\phi_k(x): \R^n \mapsto \R$ be the Nesterov's estimating sequence associated with the objective function $F$. 
> For it to be a Nesterov's estimating sequence, it satisfies the conditions that: 
> 1. There exists sequence $(x_k)_{k \ge 0}$ where $F(x_k) \le \phi_k^* := \min_{x} \phi_k(x)$. 
> 2. Let $(\alpha_k)_{k \ge0}$ be a sequence of $\alpha_i \in (0, 1)$, and it has $\phi_{k + 1}(x) - \phi_k(x) \le -\alpha_k(\phi_k(x) - F(x))$ for all $x \in \R^n$. 


---
### **H. Lin 2015, Universal Catalyst**

Equation below defines the inexact proximal point evaluation with absolute error. 

$$
\begin{aligned}
    J_{1/\kappa F}^\epsilon (y) := 
    \left\lbrace
        x \in \R^n \left |\;
            \mathcal M_{F}^{1/\kappa}(x, y) - 
            \mathcal M^*_{F,1/\kappa}(x, y) 
            \le 
            \epsilon
        \right.
    \right\rbrace.
\end{aligned}
$$

We summarize some key points for lemmas in the Appendix: 
1. Lemma A.7 shows us the Proximal Gradient Inequality that incorporates an inexact evaluation of the proximal point method, together with the error bound on the Moreau Envelope. 
2. Theorem A.6 shows the Nesterov's estimating sequence only incorporates the inexact proximal point iterates. 
3. A.8 Shows how the canonical form of the Nesterov's estimating sequence with the inexact proximal point evaluations. 
4. A.9 Evaluates the consequence of inexact evaluation of proximal point method on the convergence rate implied by the Nesterov's estimating sequence frameworks. 


#### **Lemma A.7 | Inexact proximal point inequality**
> Let $y \in \R^n, x \in \R^n$. 
> Suppose that $\tilde x$ approximates $\mathcal J_{1/\kappa F}(y)$ such that there exists some $\epsilon > 0$ with $\mathcal M_F^{1/\kappa}(\tilde x) - \mathcal M^*_{F, 1/\kappa}(y) \le \epsilon$ and $x^* = \mathcal J_{1/\kappa F}(y)$ is exact.
> Then for all $x \in \R^n$ it has 
> $$
> \begin{aligned}
>   & F(x) - F(\tilde x) + \frac{\kappa}{2}(\Vert x - y\Vert^2 - \Vert \tilde x - y\Vert^2 - \Vert x - \tilde x\Vert^2) - \frac{\mu}{2}\Vert x - \tilde x\Vert^2
>   \\
>   &=
>   F(x) - F(\tilde x) + \kappa\langle x - \tilde x, \tilde x - y\rangle - \frac{\mu}{2}\Vert x - \tilde x\Vert^2
>   \\
>   &\ge - \epsilon + (\kappa + \mu)/2\Vert \tilde x - x^*\Vert^2 + (\kappa + \mu)\langle x - \tilde x, \tilde x - x^*\rangle. 
> \end{aligned}
> $$


**Proof**

See [Catalyst Accelerations Part IV, Inexact Oracles](Catalyst%20Accelerations%20Part%20IV,%20Inexact%20Oracles.md) for more information. 

**Remarks**

When $\epsilon = 0$, this is the proximal gradient inequality. 
See [Moreau Envelope and Convex Proximal Mapping](../AMATH%20516%20Numerical%20Optimizations/Proximal%20Operator/Moreau%20Envelope%20and%20Convex%20Proximal%20Mapping.md). 

Under the context of the Catalyst Acceleration, the inequality is used with $y = y_{k - 1}, \tilde x = x_k \approx J_{\kappa F}(y_{k - 1})$. 

#### **Theorem A.6 | Nesterov's estimating sequence results with inexact PPM**
> Define the sequence $(y_k)_{k\ge0}$ for the estimating sequence. 
> Define the recursive relations of estimating sequence $\phi_k$ for all $k\ge 2$: 
> $$
> \begin{aligned}
>     \phi_0(x) &= F(x_0) + \frac{\gamma_0}{2}\Vert x - x_0\Vert^2; 
>     \\
>     \phi_k(x) &= 
>     (1 - \alpha_{k - 1})\phi_{k - 1}(x) + 
>     \alpha_{k - 1}(F(x_k) + \langle \kappa(y_{k - 1} - x_k), x - x_k\rangle + \mu/2\Vert x - x_k\Vert^2). 
> \end{aligned}
> $$
> Then the canonical form of the Nesterov's estimating sequence, it defines the relations between $(\gamma_{k})_{k \ge0}, (v_k)_{k \ge 0}, (\phi_k^*)_{k\ge 0}$ and for all $k \ge 1$
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

The proof here comes from the recursive definition of the estimating sequence $\phi_k$. 
$\gamma_k$, v_k comes from a hessian and gradient argument on the recursive form. 
It is essentially the same argument from what can be found in [Nestrov Estimating Sequence of APG](Nestrov%20Estimating%20Sequence%20of%20APG.md). 
Without repeating, we work on the expression for $\phi_k^*$. 

$$
\begin{aligned}
    \phi_k(x_k) &= 
    \phi_k^* + \frac{\gamma_k}{2}\Vert x_k - v_k\Vert^2
    \\
    & = (1 - \alpha_{k - 1})\left(
        \phi_{k - 1}^* + \frac{\gamma_{k - 1}}{2}\Vert x_k - v_{k - 1}\Vert^2
    \right) + \alpha_{k - 1}F(x_k)
    \\
    \iff 
    \phi_k^* &= 
    (1 - \alpha_{k - 1})\left(
        \phi_{k - 1}^* + \frac{\gamma_{k - 1}}{2}\Vert x_k - v_{k - 1}\Vert^2
    \right) + \alpha_{k - 1}F(x_k) - \frac{\gamma_k}{2}\Vert x_k - v_k\Vert^2
    \\
    &= 
    (1 - \alpha_{k - 1})\phi_{k - 1}+ \alpha_{k - 1}F(x_k)
    + 
    \frac{(1 - \alpha_{k - 1})\gamma_{k - 1}}{2}\Vert x_k - v_{k - 1}\Vert^2
    - \frac{\gamma_k}{2}\Vert x_k - v_k\Vert^2.
\end{aligned}\tag{eqn1}
$$

Now, it would be great to express $\Vert x_k - v_k\Vert^2$, so it depends on the iterates from previous iteration. 
From the definition of $v_k$ we have: 

$$
\begin{aligned}
    v_k - x_k &= 
    \gamma_k^{-1}(
    (
        1 - \alpha_{k - 1})\gamma_{k - 1}v_{k - 1}
        + \alpha_{k - 1}\mu x_k - \alpha_{k - 1}\kappa(y_{k - 1} - x_k)
    ) - x_k
    \\
    &= 
    \gamma_k^{-1}(
        (1 - \alpha_{k - 1})\gamma_{k - 1}v_{k - 1}
        + (\alpha_{k - 1}\mu - \gamma_k) x_k - \alpha_{k - 1}\kappa(y_{k - 1} - x_k)
    )
    \\
    &= 
    \gamma_k^{-1}(
        (1 - \alpha_{k - 1})\gamma_{k - 1}v_{k - 1}
        - (1 - \alpha_{k - 1})\gamma_{k - 1} x_k - \alpha_{k - 1}\kappa(y_{k - 1} - x_k)
    )
    \\
    &= \gamma_k^{-1}(
        (1 - \alpha_{k - 1})\gamma_{k - 1}(v_{k - 1} - x_k)
        - \alpha_{k - 1}\kappa(y_{k - 1} - x_k)
    ).
\end{aligned}
$$

Taking the norm and multiplying by $\gamma_k/2$ to match the terms in (eqn1) then: 

$$
\begin{aligned}
    \Vert v_k - x_k\Vert^2 &= 
    \gamma_k^{-2}\Vert (1 - \alpha_{k - 1})\gamma_{k - 1}(v_{k - 1} - x_k) \Vert^2
    + 
    \gamma_k^{-2}\Vert \alpha_{k - 1}\kappa(y_{k - 1} - x_k)\Vert^2
    \\
    & \quad 
    - 2\gamma_k^{-2}\gamma_{k - 1}(1 - \alpha_{k - 1})\alpha_{k - 1}\langle v_{k - 1} - x_k, \kappa(y_{k - 1} - x_k) \rangle
    \\
    \frac{\gamma_k}{2}
    \Vert v_k - x_k\Vert^2 
    &= 
    \frac{(1 - \alpha_{k - 1})^{2}\gamma_{k - 1}^{2}}{2\gamma_k}\Vert x_k - v_{k - 1}\Vert^2
    + 
    \frac{\alpha_{k - 1}^2}{2\gamma_k} \Vert \kappa(y_{k - 1} - x_k)\Vert^2
    \\
    &\quad 
    - 
    \frac{
        \gamma_{k - 1}(1 - \alpha_{k - 1})\alpha_{k - 1}
    }{\gamma_k}\langle v_{k - 1} - x_k, \kappa(y_{k - 1} - x_k)\rangle.  
\end{aligned}
$$

Substituting it back we have 

$$
\begin{aligned}
    \phi_k^* &= 
    (1 - \alpha_{k - 1})\phi_{k - 1}+ \alpha_{k - 1}F(x_k)
    + 
    \frac{(1 - \alpha_{k - 1})\gamma_{k - 1}}{2}\Vert x_k - v_{k - 1}\Vert^2
    - 
    \frac{(1 - \alpha_{k - 1})^{2}\gamma_{k - 1}^{2}}{2\gamma_k}\Vert x_k - v_{k - 1}\Vert^2
    \\
    & \quad 
        + \left(
            - 
            \frac{\alpha_{k - 1}^2}{2\gamma_k} \Vert \kappa(y_{k - 1} - x_k)\Vert^2
            + 
            \frac{
                \gamma_{k - 1}(1 - \alpha_{k - 1})\alpha_{k - 1}
            }{\gamma_k}\langle v_{k - 1} - x_k, \kappa(y_{k - 1} - x_k)\rangle
        \right)
    \\
    &= 
    (1 - \alpha_{k - 1})\phi_{k - 1}+ \alpha_{k - 1}F(x_k)
    + 
    \frac{\alpha_{k - 1}(1 - \alpha_{k - 1})\gamma_{k - 1}\mu}{2\gamma_k}
    \Vert x_k - v_{k - 1}\Vert^2
    - 
    \frac{\alpha_{k - 1}^2}{2\gamma_k} \Vert \kappa(y_{k - 1} - x_k)\Vert^2
    \\
    &\quad + 
    \frac{\gamma_{k - 1}(1 - \alpha_{k - 1})\alpha_{k - 1}}{\gamma_k}
    \langle v_{k - 1} - x_k, \kappa(y_{k - 1} - x_k)\rangle
    \\
    &= 
    (1 - \alpha_{k - 1})\phi_{k - 1} + \alpha_{k - 1}F(x_k)
    + \frac{\alpha_{k - 1}(1 - \alpha_{k - 1})\gamma_{k - 1}}{\gamma_k}
    \left(
        \frac{\mu}{2}\Vert x_k - v_{k - 1}\Vert^2 
        + 
        \langle v_{k - 1} - x_k, \kappa(y_{k - 1} - x_k) \rangle. 
    \right)
\end{aligned}
$$

On the second equality, we made use of the following to simplify the coefficients for $\Vert x_k - v_{k - 1}\Vert^2$: 

$$
\begin{aligned}
    \frac{(1 - \alpha_{k - 1})\gamma_{k - 1}}{2} - 
    \frac{(1 - \alpha_{k - 1})^{2}\gamma_{k - 1}^{2}}{2\gamma_k}
    &= 
    \frac{(1 - \alpha_{k - 1})\gamma_{k - 1}}{\gamma_k}
    \left(
        \frac{\gamma_k}{2} - \frac{(1 - \alpha_{k - 1})\gamma_{k - 1}}{2}
    \right)
    \\
    &= 
    \frac{(1 - \alpha_{k - 1})\gamma_{k - 1}}{\gamma_k}
    \left(
        \frac{\gamma_k - (1 - \alpha_{k - 1})\gamma_{k - 1}}{2}
    \right)
    \\
    &= 
    \frac{(1 - \alpha_{k - 1})\gamma_{k - 1}}{\gamma_k}
    \left(
        \frac{
            \alpha_{k - 1}\mu
        }{2}
    \right). 
\end{aligned}
$$

We used the recurrence for $\gamma_k$ to simplify the numerator a bit. 
The goal here is to make the expression short for future use, nothing more. 


**Remark**

Please observe that the entire design of the sequence based on the inexact approximated iteration sequence $(x_k)_{k \ge 0}$. 
This canonical form for $\phi_k^*$ differs slightly from the original approach used in Nesterov's text. 
But the difference doesn't seem major, and it's just doing things in different order during the proofs. 



#### **Theorem A.8 | Controlling Error Bounds on the Nesterov's Estimating Sequence**
> If the auxiliary sequences $v_k, y_k, \gamma_k, \alpha_k$ satisfies the conditions: 
> $$
> \begin{aligned}
>     \gamma_k - (\kappa + \mu)\alpha_{k - 1}^2 
>     &= 0
>     \\
>     (1 - \alpha_{k - 1})\gamma_{k - 1} + \alpha_{k - 1}\mu 
>     &= (\kappa + \mu)\alpha_{k - 1}^2. 
> \end{aligned}
> $$
> Then the canonical representation of estimating sequence $\phi_k^*$ and the function value at the inexact proximal point iterates $F(x_k)$ satisfy for all $k\ge 1$
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
> Where we have the base case that $\xi_0 = 0$

**Proof**

The proof is achieved via induction. 
Base case is trivially satisfied via $\phi_0^* = F(x_0)$ and $\xi_0 = 0$. 
Inductively we assume that $F(x_{k - 1}) \le \phi_{k - 1}^* + \xi_k$. 
By definition, it means 

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
    - (1 - \alpha_{k - 1})^{-1}\xi_k. 
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
    & 
    (1 - \alpha_{k - 1})\left\langle 
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

With the above, we can simplify (A.8.3) by substituting it back which gives: 

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


If we assume that it instead holds with equality then $\alpha_k$ satisfies for all $k\ge 1$: 

$$
\begin{aligned}
    \gamma_k - (\kappa + \mu)\alpha_{k - 1}^2 
    &= 0
    \\
    (1 - \alpha_{k - 1})\gamma_{k - 1} + \alpha_{k - 1}\mu 
    &= (\kappa + \mu)\alpha_{k - 1}^2. 
\end{aligned}
$$


**Remarks**

Now, take note that the expression for $v_{k + 1}$ had been discussed in other articles in this notebook. 
For any $k \ge 1$, suppse we were given vectors $x_k, v_k$ and scalars $\alpha_k, \gamma_k$, then the following can generate $x_{k + 1}, v_{k + 1}$ and $\alpha_{k + 1}$ by: 

$$
\begin{aligned}
    \gamma_{k + 1} &= (1 - \alpha_{k})\gamma_k + \alpha_k \mu = (\kappa + \mu)\alpha_{k - 1}^2
    \\
    y_k &= (\gamma_k + \alpha_k \mu)^{-1}
    (\alpha_k \gamma_k v_k + \gamma_{k + 1}x_k)
    \\
    v_{k + 1} &= 
    \gamma_{k + 1}^{-1}\left(
        (1 - \alpha_k)\gamma_k v_k + 
        \alpha_k(\mu + \kappa)x_k 
        - \alpha_k \kappa y_k
    \right)
    \\
    \tilde x_{k + 1} &\approx \mathcal J_{\kappa^{-1}} y_{k} 
    \text{ s.t: } 
    \mathcal M^{\kappa^{-1}}(x_{k + 1}, y_k) - 
    \mathcal M^{\kappa^{-1}}(\mathcal J_{\kappa^{-1}} y_{k} , y_k) \le \epsilon_k
    \\
    \widetilde{\mathcal G}_{\kappa^{-1}} y_k &= \kappa(y_k - \tilde x_{k + 1})
    \\
    x_{k + 1} &= y_k - \widetilde{\mathcal G}_{\kappa^{-1}} y_k. 
\end{aligned}
$$
For $y_k$, we solved the equation for $y_k$ from earlier. 
Now, take note that we can conduct the following simplifications for $v_{k + 1}$ and it has 

$$
\begin{aligned}
    v_{t + 1} &= \gamma_{k + 1}^{-1}(
        (1 - \alpha_k)\gamma_k v_k + \alpha_k\mu x_k + 
        \alpha_k\kappa(x_k - y_k)
    )
    \\
    &= 
    \gamma_{k + 1}^{-1}\left(
        (1 - \alpha_k)\gamma_k v_k + \alpha_k\mu x_k - \alpha_k 
        \widetilde{\mathcal G}_{\kappa^{-1}}y_k
    \right). 
\end{aligned}
$$

This is now exactly the same as algorithm as Nesterov's 2.20.19. 
See [PPM APG Forms Analysis](PPM%20APG%20Forms%20Analysis.md) for more information. 
Set $L = \kappa + \mu$, it will then allow a similar triangle representation from the PPM APG form analysis. 
Hence, we have the following equality: 

$$
\begin{aligned}
    y_k &= x_k + \frac{\alpha_{k - 1}(1 - \alpha_{k - 1})}{\alpha_{k - 1}^2 + \alpha_k}
    (x_k - x_{k - 1}). 
\end{aligned}
$$


#### **Proposition A.9 | Nesterov's estimating sequence with implicit descent error control**


---
### **Commentaries on Universal Catalyst**

There are something worth thinking about the algorithm. 
#### **Top Comments**
1. It's a realization of accelerated PPM when $\epsilon_k = 0, \mu = 0$. 
2. The Nesterov's estimating sequence generalizes the estimating sequence used for accelerated proximal gradient method. 
3. The proximal lemma with $\epsilon_k$ has no simple relations with the proximal gradient inequality. 

#### **Realization as accelerated PPM**
More specifically, assume exact evaluation of $\epsilon = 0$, then it becomes the same as accelerated PPM but with the addition of 
1. $\mu\ge 0$, a strong convexity constant. 
Change $\kappa = \lambda_k^{-1}$ for all $k \ge 0$, with $\epsilon_k = 0$, the Catalyst algorithm reduced to accelerated PPM Method. 
2. The estimating sequence used 

Compared to APPM, catalyst is yet to incorporates case when $\kappa$ may not be a constant. 

#### **Comparison to accelerated proximal gradient method**
The lower bound used for defining the $\phi_k$ can be re-interpreted. 
We have for all $x$: 

$$
\begin{aligned}
    F(x) &\ge F(x_k) - \langle \kappa(x_k - y_k), x - x_k\rangle + \frac{\mu}{2}\Vert x - x_k\Vert^2
    \\
    &=  
    F(x_k) - \langle \kappa(x_k - y_k), x - y_k + y_k - x_k\rangle + \frac{\mu}{2}\Vert x - x_k\Vert^2
    \\
    &= F(x_k) - 
    \langle \kappa(x_k - y_k), x - y_k\rangle - \langle \kappa(x_k - y_k), y_k - x_k\rangle
    + \frac{\mu}{2}\Vert x - x_k\Vert^2
    \\
    &= F(x_k)
    - \langle \kappa(x_k - y_k), x - y_k\rangle + \Vert \kappa(x_k - y_k)\Vert^2
    + \frac{\mu}{2}\Vert x - x_k\Vert^2. 
\end{aligned}
$$

This makes the estimating sequence exactly the same as the accelerated proximal gradient method if we assume that $x_k$ produced by the proximal gradient operator. 

#### **The inexact proximal gradient inequality**

Lemma A.7 can be seemed as a variant of the proximal gradient inequality with inexact proximal point evaluation. 

---
### **Continue Next time**

See [Catalyst Acceleration Part III, Total Complexity](Catalyst%20Acceleration%20Part%20III,%20Total%20Complexity.md) for more details on how claims on the estimating sequence, the error bounds on the inner algorithm are combined together to show the overall convergence of the algorithm. 


