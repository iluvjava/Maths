- [Nesterov Estimating Sequence](Nesterov%20Original%20Conception%20of%20Momentum%20Method.md)
- [Convex Proximal Point Method, Part I](../AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/Convex%20Proximal%20Point%20Method,%20Part%20I.md)
- [Catalyst Acceleration Part I, Introduction](Catalyst%20Acceleration%20Part%20I,%20Introduction.md) 
---
### **Intro**

This writing will follow some of the mathematics in Osman Guller's writings, on his way of accelerating the Proximal point method using Nesterov Acceleration sequence. 
We will follow the paper faithfully with method of Nesterov's Estimating sequence. 
We will first introduce the notations that we are going to work with: 


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
To ease the notation, sometimes their subscript will become $k$, so we have $\mathcal J_k, \mathcal G_k$ instead. The $k$ here is the $k$ th element in the PPM sequence $(\lambda_k)_{k \ge 0}$. 

#### **Fundamental Prox Inequality**

Restated here is the fundamental proximal point inequality

$$
\begin{aligned}
    (\forall x) \quad 
    F(x) 
    &\ge 
    F(\mathcal J_k y_k) + 
    \left\langle 
        \mathcal G_k y_k, x - \mathcal J_k y_k
    \right\rangle
\end{aligned}
$$


---
### **Guler's 1993**

Guler 1993 accelerated PPM method didn't make use of strong convexity constant for the function in anyway. 
Using the notations introduce at the start of the writing, the proposed Nesterov's estimating sequence $(\phi_k(x))_{k \ge 0}$ is given by the recurrence relations for all $k \ge 0$ that 

$$
\begin{aligned}
    \phi_0 &:= f(x_0) + \frac{A}{2}\Vert x - x_0\Vert^2, 
    \\
    \phi_{k + 1}(x) &:= 
    (1 - \alpha_k)\phi_k(x)
    + 
    \alpha_k(F(\mathcal J_k y_k) + \langle \mathcal G_k y_k, x - \mathcal J_k y_k\rangle). 
\end{aligned}
$$

Observe $\phi_k$ is a sequence of simple quadratic functions. 
Therefore it has connonical representation: 

$$
\begin{aligned}
    (\forall k \ge 0) \quad 
    \phi_k(x) &= \phi_k^* + \frac{A_k}{2} \Vert x - v_k\Vert^2. 
\end{aligned}
$$

Consider the Hessian and the gradient, it also satisfies the recursive relations which gives us the following relations: 
$$
\begin{aligned}
    &
    \phi_{k+ 1}^* + \frac{A_{k + 1}}{2}\Vert x - v_{k + 1}\Vert^2
    = 
    (1 - \alpha_k)
    \left(\phi_k^* + \frac{A_k}{2}\Vert x - v_k\Vert^2\right)
    + 
    \alpha_k(F(\mathcal J_k y_k) + \langle \mathcal G_k y_k, x - \mathcal J_k y_k\rangle)
    \\
    \implies 
    &
    \left\lbrace
    \begin{aligned}
        A_{k + 1} 
        &= (1 - \alpha_k)A_k
        \\
        \nabla \phi_{k + 1}(x)
        &= 
        (1 - \alpha_k)A_k(x - v_k) + \alpha_k \mathcal G_ky_k
    \end{aligned}
    \right.
\end{aligned}
$$

On the above we took the gradient and the Hessian. 
To find the minimizer $v_{k + 1}$ of $\nabla \phi_k(x)$, we solve $\nabla \phi_{k + 1}(x) = \mathbf 0$ for $x$: 

$$
\begin{aligned}
    \mathbf 0 &= (1 - \alpha_k)A_k(x - v_k) + \alpha_k \mathcal G_k y_k
    \\
    x- v_k &= 
    \frac{\alpha_k}{\lambda_k(1 - \alpha_k)A_k}
    \left(
        y_k - \mathcal J_k y_k
    \right)
    \\
    &= \frac{\alpha_k}{\lambda_kA_{k + 1}}
    \left(
        y_k - \mathcal J_k y_k
    \right). 
\end{aligned}
$$

Let $v_{k + 1} = x$ then we obtained the desired inequality. 


#### **Claim | It has the potential to be an estimating sequence**
> With a prior assumption of $(x_k)_{ k \ge0}$ such that $F(x_k) \le \phi_k^*$, then $(\phi_k)_{k \ge0}$ has the potential to be a Nesterov's estimating sequence. 
> By definition of an Nesterov's estimating sequence, it means that we have the following inequality satisfied for all $k \ge 0$. 



#### **Claim | Full Canonical form of the Estimating Sequence**
> The parameters for the estimating sequence: $(\phi_k^*)_{k\ge 0}, (v_k)_{k\ge 0}, (A_k)_{k\ge 0}$ satisfies for all $k \ge0 $ the following conditions:
> $$
> \begin{aligned}
>     A_{k + 1} &= (1 - \alpha_k)A_k, 
>     \\
>     v_{k + 1} - v_k
>     &= 
>     - \frac{\alpha_k}{A_{k + 1}\lambda_k}(y_k - \mathcal J_k y_k), 
>     \\
>     \phi_{k + 1}^*
>     &\ge 
>     F(\mathcal J_ky_k) + 
>     \frac{1}{2\lambda_k}\left(
>         2 - \frac{\alpha_k^2}{A_{k + 1}\lambda_k}
>     \right)
>     \Vert y_k - \mathcal J_k y_k\Vert^2
>     + 
>     \lambda_k^{-1}
>     \langle 
>         y_k - \mathcal J_k y_k, (1 - \alpha_k)x_k + \alpha_k v_k - y_k
>     \rangle.
> \end{aligned}
> $$

**Proof**

Using induction, we assume the inductive hypothesis: $\phi_k^* \ge f(x_k)$ for the sequence $(x_i)_{i \ge 0}$ up to and including $i = k$.
Proceed with the inductive hypothesis we have 

$$
\begin{aligned}
    \phi_k^* 
    &\ge F(x_k)
    \ge F(\mathcal J_k y_k) + \langle \mathcal G_k y_k, x_k - \mathcal J_k y_k\rangle. 
\end{aligned}
$$

Here we used the prox lower bound of a function. 
Inductively using the definition of the estimating sequence and substitute the cannonical form we will have 

$$
\begin{aligned}
    \phi_{k + 1}^*
    &= \phi_{k + 1}(v_{k + 1})
    \\
    &= 
    (1 - \alpha_k) \phi_k(v_{k + 1})
    + \alpha_kF(\mathcal J_k y_k)
    + \alpha_k\lambda_k^{-1}\langle 
        y_k - \mathcal J_k y_k, v_{k + 1} - y_{k + 1}
    \rangle
    \\
    &= 
    \left(
        1 - \alpha_k
    \right)\left(
        \phi_k^* + \frac{A_k}{2}\Vert v_{k + 1} - v_k\Vert^2
    \right)
    + 
    \alpha_k F(\mathcal J_k y_k) 
    + 
    \alpha_k\lambda_k^{-1}\langle 
        y_k - \mathcal J_k y_k, v_{k + 1} - y_{k + 1}
    \rangle
    \\
    & \textcolor{gray}{
        A_{k + 1} = (1 - \alpha_k)A_k
    }
    \\
    &=
    (1 - \alpha_k)\phi_k^*
    + 
    \frac{A_{k + 1}}{2}\Vert v_{k + 1} - v_k\Vert^2
    + \alpha_k F(\mathcal J_k y_k)
    + \alpha_k\lambda_k^{-1}\langle 
        y_k - \mathcal J_k y_k, v_{k + 1} - y_{k + 1}
    \rangle
\end{aligned}
$$

Next, we substitute the inequality by the inductive hypothesis which gives: 

$$
\begin{aligned}
    \phi_{k + 1}^*
    &\ge 
    (1 - \alpha_k)
    \left(
        F(\mathcal J_k y_k) + \langle \mathcal G_k y_k, x_k - \mathcal J_k y_k\rangle
    \right)
    \\
        &\quad 
        + 
        \frac{A_{k + 1}}{2}\Vert v_{k + 1} - v_k\Vert^2
        + \alpha_k F(\mathcal J_k y_k)
        + 
        \alpha_k\lambda_k^{-1}\langle 
            y_k - \mathcal J_k y_k, v_{k + 1} - y_{k + 1}
        \rangle
    \\
    &= 
    F(\mathcal J_k y_k) + \frac{A_{k + 1}}{2}\Vert v_{k + 1} - v_k\Vert^2
    + 
    \lambda^{-1}_k
    \left\langle 
        y_k - \mathcal J_k y_k, 
        (1 - \alpha_k)(x_k - \mathcal J_k y_k)
        + 
        \alpha_k(v_{k + 1} - \mathcal J_k y_k)
    \right\rangle
    \\
    &= 
    F(\mathcal J_k y_k) + \frac{A_{k + 1}}{2}\Vert v_{k + 1} - v_k\Vert^2
    + 
    \lambda^{-1}_k
    \left\langle 
        y_k - \mathcal J_k y_k, 
        (1 - \alpha_k)x_k + \alpha_k v_{k + 1} -  \mathcal J_k y_k
    \right\rangle. 
\end{aligned}
$$

This requires further simplifications. 
Here we the equality for the sequence $(x_k, y_k)_{k \ge 0}$ which gives: 
$$
\begin{aligned}
    (1 - \alpha_k)x_k + \alpha_k v_{k + 1} - \mathcal J_k y_k
    &= 
    ((1 - \alpha_k)x_k + \alpha_k v_k - y_k)
    + \alpha_k(v_{k + 1} - v_k) + (y_k - \mathcal J_k y_k). 
\end{aligned}
$$

We also use the equality: 

$$
\begin{aligned}
    v_{k + 1} - v_k &= 
    -\frac{\alpha_k}{A_{k + 1}\lambda_k}(y_k - \mathcal J_k y_k)
    \\
    \implies
    \Vert v_{k + 1} - v_k\Vert^2 
    &= 
    \left\Vert
        - \frac{\alpha_k}{A_{k + 1}\lambda_k}
        \left(
            y_k - \mathcal J_k y_k
        \right)
    \right\Vert^2
    \\
    \Vert v_{k + 1} - v_k\Vert^2 
    &= 
    \left(
        \frac{\alpha_k}{A_{k + 1}\lambda_k}
    \right)^2
    \left\Vert
        y_k - \mathcal J_k y_k
    \right\Vert^2
    \\
    \frac{A_{k + 1}}{2}
    \Vert v_{k + 1} - v_k\Vert^2 
    &= 
    \frac{\alpha_k^2}{2A_{k + 1} \lambda_k^2}
    \left\Vert
        y_k - \mathcal J_k y_k
    \right\Vert^2. 
\end{aligned}
$$

Substituting both equality we simplify the inequality into 

$$
\begin{aligned}
    \phi_{k + 1}^* &\ge 
    F(\mathcal J_k y_k)
    + \frac{\alpha_k^2}{2A_{k + 1} \lambda_k^2}
    \Vert y_k - \mathcal J_ky_k\Vert^2
    \\
        & \quad 
        + 
        \lambda_k^{-1}
        \left\langle 
            y_k - \mathcal J_k y_k, 
            (1 - \alpha_k)x_k + \alpha_k v_k - y_k
        + \alpha_k(v_{k + 1} - v_k) + (y_k - \mathcal J_k y_k)
        \right\rangle
    \\
    &= 
    F(\mathcal J_k y_k)
    + \frac{\alpha_k^2}{2A_{k + 1} \lambda_k^2}
    \Vert y_k - \mathcal J_ky_k\Vert^2
    \\
        & \quad 
        + 
        \lambda_k^{-1}
        \left\langle 
            y_k - \mathcal J_k y_k, 
            (1 - \alpha_k)x_k + \alpha_k v_k - y_k
        \right\rangle
    \\
        &\quad 
        + 
        \lambda_k^{-1}
        \langle
            y_k - \mathcal J_k y_k,
            \alpha_k(v_{k + 1} - v_k) + (y_k - \mathcal J_k y_k)
        \rangle
\end{aligned}\tag{1}
$$

Simplifying the second cross term on the RHS of (1): 

$$
\begin{aligned}
    & \lambda_k^{-1}
        \langle
            y_k - \mathcal J_k y_k,
            \alpha_k(v_{k + 1} - v_k) + (y_k - \mathcal J_k y_k)
        \rangle
    \\
    &= 
    \lambda_k^{-1}
        \left\langle
            y_k - \mathcal J_k y_k,
            -\frac{\alpha_k^2}{A_{k + 1}\lambda_k}(y_k - \mathcal J_k y_k)
            + 
            (y_k - \mathcal J_k y_k)
        \right\rangle
    \\
    &= 
    \lambda_k^{-1}
        \left\langle
            y_k - \mathcal J_k y_k,
            -\frac{\alpha_k^2}{A_{k + 1}\lambda_k}(y_k - \mathcal J_k y_k)
            + 
            (y_k - \mathcal J_k y_k)
        \right\rangle
    \\
    &=
    \lambda_k^{-1} 
    \left(
        1 - \frac{\alpha_k^2}{A_{k + 1}\lambda_k}
    \right)
    \Vert y_k - \mathcal J_k y_k\Vert^2. 
\end{aligned}
$$

The above term repeats with one of the term in (1), merging their coefficient it yields

$$
\begin{aligned}
    & 
    \lambda_k^{-1} 
    \left(
        1 - \frac{\alpha_k^2}{A_{k + 1}\lambda_k}
    \right) + 
    \frac{\alpha_k^2}{2A_{k + 1} \lambda_k^2}
    \\
    & = 
    \lambda_k^{-1}
    - 
    \frac{\alpha_k^2}{A_{k + 1}\lambda_k^2}
    + 
    \frac{\alpha_k^2}{2A_{k + 1}\lambda_k^2} 
    \\
    &= 
    \frac{1}{2\lambda_k}
    \left(
        2 - \frac{\alpha_k^2}{2A_{k + 1}\lambda_k}
    \right). 
\end{aligned}
$$

Substituting it back to (1) it has: 

$$
\begin{aligned}
    \phi_{k + 1}^* 
    &\ge 
    F(\mathcal J_k y_k)
    + \frac{\alpha_k^2}{2A_{k + 1} \lambda_k^2}
    \Vert y_k - \mathcal J_ky_k\Vert^2
    \\
        & \quad 
        + 
        \lambda_k^{-1}
        \left\langle 
            y_k - \mathcal J_k y_k, 
            (1 - \alpha_k)x_k + \alpha_k v_k - y_k
        \right\rangle
    \\
        &\quad 
        + 
        \lambda_k^{-1}
        \langle
            y_k - \mathcal J_k y_k,
            \alpha_k(v_{k + 1} - v_k) + (y_k - \mathcal J_k y_k)
        \rangle
    \\
    &= 
    F(\mathcal J_k y_k)
    + 
    \frac{1}{2\lambda_k}
    \left(
        2 - \frac{\alpha_k^2}{A_{k + 1}\lambda_k}
    \right)
    \Vert y_k - \mathcal J_ky_k\Vert^2
    \\
        & \quad 
        + 
        \lambda_k^{-1}
        \left\langle 
            y_k - \mathcal J_k y_k, 
            (1 - \alpha_k)x_k + \alpha_k v_k - y_k
        \right\rangle. 
\end{aligned}
$$

Next, if induction hypothesis $\phi_{k + 1}\ge F(\mathcal J_k y_k) = F(x_{k + 1})$ is true, it's sufficient to take the coefficient of $\Vert y_k - \mathcal J_k y_k\Vert^2$ to be greater than zero and make the inner product term zero which produces: 
$$
\begin{aligned}
    & 
    y_k = (1 - \alpha_k)x_k + \alpha_k v_k
    \\
    &
    \frac{1}{2\lambda_k}
    \left(
        2 - \frac{\alpha_k^2}{A_{k + 1}\lambda_k}
    \right) 
    \ge 0.
\end{aligned}
$$

Solving, the second inequality is equivalent to

$$
\begin{aligned}
    \frac{\alpha_k^2}{A_{k + 1}\lambda_k} 
    & 
    \le 2
    \\
    \alpha_k
    & 
    \le
    \sqrt{2A_{k + 1}\lambda_k}
    = \sqrt{2A_k(1 - \alpha_k)\lambda_k}. 
\end{aligned}
$$

Here we used $\alpha_k^2 = A_k(1 - \alpha_k)\lambda_k$ which comes from the recursive relations on $A_k$, solving it gives: 

$$
\begin{aligned}
    \alpha_k
    &= 
    \frac{1}{2}\left(
        \sqrt{(A_k\lambda_k)^2 + 4A_k \lambda_k}
        - A_k\lambda_k
    \right). 
\end{aligned}
$$


**Remark**

Here we did theorem 2.1 in Guler's paper and the 2 corollaries the followed it. 


---
### **Guler 1993's Inexact Proximal Gradient Method**

This section we talk about how Guler thought about the inexact evaluation of the proximal point method in his accelerated PPM method. 

#### **Def | Rockafellar's Approximations**
> We have $x_{k + 1}$ as an approximation when it satisfies the conditions that 
> $$
> \begin{aligned}
>     \text{dist}
>     \left(
>         \mathbf 0, \partial \mathcal M^{\lambda_k}(x_{k + 1}, y_k)
>     \right)
>     &\le 
>     \frac{\epsilon_k}{\lambda_k}. 
> \end{aligned}
> $$
> Here $\epsilon_k$ characterize the error made by the inexact evaluation. 
> We call this Condition (A'), same as in Rockafellar's text. 

One consequence of the error is the following (Condition A). 

$$
\begin{aligned}
    \Vert x_{k + 1} - \mathcal J_{\lambda_k}y_k\Vert 
    &\le \epsilon_k. 
\end{aligned}
$$

This is in Rockafellar 1976. 
He also characterize some more properties of the error sequence $(\epsilon_k)$ for the convergence of his inexact proximal point method. 

**Remarks**

The quantity $\partial \mathcal M^{\lambda_k}(x_{k + 1}, y_k)$ is a trackable quantity for implementing algorithms for inexact proximal point method. 


#### **Theorem | Consequence of Rockafellar's approximations**
> Consider defining minimum for the envelope function given by $\mathcal M_k^* := \min_z \mathcal {M}^{\lambda_k}(z; y_k)$. 
> If $x_{k +1}$ is an inexact evalautions under condition (A), then the estimating sequence admits the conditions that: 
> $$
> \begin{aligned}
>     \frac{1}{2\lambda_k} \Vert x_{k + 1} - \mathcal J_{k} y_k\Vert^2
>     &\le 
>     \mathcal M^{\lambda_k}(x_{k + 1}, y_k) - \mathcal M^*_k
>     \le \frac{\epsilon_k^2}{2\lambda_k}. 
> \end{aligned}
> $$

**Proof**

Denote $\mathcal M_k(x) = \mathcal M_k(x; y_k)$ for short. 
The proof is direct by considering the strong convexity of $\mathcal M_k(\cdot, y_k)$ together with the subgradient inequality. 
Choose any $w_k \in \partial \mathcal M_k(\mathcal J_{k} y_k)$ it has
$$
\begin{aligned}
    \mathcal M_k(x_{k + 1}) - \mathcal M^*_k
    &= 
    \mathcal M_k(x_{k + 1}) - \mathcal M_k(\mathcal J_{k} y_k)
    \\
    &\ge 
    \left(
        \left\langle 
            w_k, 
            x_{k + 1} - \mathcal J_{k} y_k 
        \right\rangle
        + 
        \mathcal M_k(\mathcal J_{k}y_k)
        + \frac{1}{2\lambda_k}\Vert x_{k + 1} - \mathcal J_{k}y_k\Vert^2
    \right)
    - 
    \mathcal M_k(\mathcal J_{\lambda_k}y_k) 
    \\
    &= \frac{1}{2\lambda_k}\Vert x_{k +1} - \mathcal J_{k}y_k\Vert^2. 
\end{aligned}
$$

We used $\mathbf 0 \in \partial M_k(\mathcal J_{\lambda_k}y_k)$ to get rid of the inner product. 
Consider inexact evalatuion of $x_{k + 1}$ which results in $w_k \in \partial \mathcal M_k(x_{k + 1})$ with $\Vert w_k\Vert \le \epsilon_k/\lambda_k$. 
By $\lambda_k^{-1}$ strong convexity of $\mathcal M_k$, we have 

$$
\begin{aligned}
    \mathcal M_k(\mathcal J_{k}y_k) - \mathcal M_k(x_{k + 1})
    &\ge 
    \langle w_k, \mathcal J_{k}y_k - x_{k + 1}\rangle
    + \frac{1}{2\lambda_k}\Vert \mathcal J_{k} y_k - x_{k + 1}\Vert^2
    \\
    &\ge 
    - \Vert w_k\Vert\Vert \mathcal J_{k}y_k - x_{k + 1}\Vert^2
    + \frac{1}{2\lambda_k}\Vert \mathcal J_{k} y_k - x_{k + 1}\Vert^2
    \\
    &\ge 
    - \frac{\epsilon_k}{\lambda_k}\Vert \mathcal J_{k}y_k - x_{k + 1}\Vert^2
    + \frac{1}{2\lambda_k}\Vert \mathcal J_{k} y_k - x_{k + 1}\Vert^2
    \\
    &\ge \frac{1}{\lambda_k}
    \min_{t \in \R} \left\lbrace
        \frac{1}{2}t^2 - \epsilon_k t
    \right\rbrace = - \frac{\epsilon_k}{2\lambda_k}. 
\end{aligned}
$$

The upper bound is proved. 

**Remarks**

Whe is proved here is just the PL conditions from strong convexity. 
To see that compare the above proof with the PL condition from [Strong Convexity, Equivalences and Implications](../AMATH%20516%20Numerical%20Optimizations/Strong%20Convexity,%20Equivalences%20and%20Implications.md). 


#### **Example | Proximal gradient**

Proximal gradient is an example of inexact proximal point method. 
Let $F = f + g$ where $f$ is $L$-Lipschitz smooth and $\mu \ge0$ strongly convex. 
For any $y$, $\bar L \ge L$, Let $\widetilde y^+, y^+$ be given by 
$$
\begin{aligned}
    \widetilde y^+ &=
    \argmin{x} \left\lbrace
        \widetilde{\mathcal M}(x; y):= f(y) + \langle \nabla f(x), x - y\rangle + \frac{\bar L}{2}\Vert x - y\Vert^2
    \right\rbrace
    \\
    y^+ &= \argmin{x}\left\lbrace
        \mathcal M(x; y):= F(x) + \frac{\bar L}{2}\Vert x - y\Vert^2. 
    \right\rbrace
\end{aligned}
$$

We now characterize the error made by the inexact approximation of $\tilde y^+$.
By $\widetilde y^+$ being a minimizer of the upper model function it satisfies 

$$
\begin{aligned}
    \mathbf 0 
    &\in \partial g(\widetilde y^+) + \nabla f(y) + \bar L(\widetilde y^+ - y)
    \\
    \nabla f(\widetilde y^+) - \nabla f(y^+)
    &\in 
    \nabla f(\widetilde y^+) + \partial g(\widetilde y^+) + \bar L(\widetilde y^+ - y)
    = \partial \mathcal M (\widetilde y; y)
    \\
    \implies 
    \dist^2(\mathbf 0; \partial \mathcal M(\widetilde y^+, y^+)) &\le 
    \Vert \nabla f(\widetilde y^+) - \nabla f(y)\Vert^2. 
\end{aligned}
$$


