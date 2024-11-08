- [Nesterov Estimating Sequence](Nesterov%20Original%20Conception%20of%20Momentum%20Method.md)
- [Convex Proximal Point Method, Part I](../AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/Convex%20Proximal%20Point%20Method,%20Part%20I.md)
- [Nesterov Type Acceleration via Proximal Point Method Part II](Nesterov%20Type%20Acceleration%20via%20Proximal%20Point%20Method%20Part%20II.md)

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
To ease the notation, sometimes their subscript will become $k$ when it's clear that we are talking about a sequence of proximal point iteration with $(\lambda_k)_{k \ge 0}$.



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

By a direct observations, $\phi_k$ is a sequence of simple quadratic functions. 
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
        \nabla \phi(x)
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


#### **Claim | It has the potential to be an estimating sequence**
> With a prior assumption of $(x_k)_{ k \ge0}$ such that $F(x_k) \le \phi_k^*$, then $(\phi_k)_{k \ge0}$ has the potential to be a Nesterov's estimating sequence. 
> By definition of an Nesterov's estimating sequence, it means that we have the following inequality satisfied for all $k \ge 0$. 



#### **Claim | Full Canonical form of the Estimating Sequence**
> The parameters from the Cannonical form given by the sequences $(\phi_k^*)_{k\ge 0}, (v_k)_{k\ge 0}, (A_k)_{k\ge 0}$ is a sequence that satisfies for all $k \ge0 $ the following conditions:
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





