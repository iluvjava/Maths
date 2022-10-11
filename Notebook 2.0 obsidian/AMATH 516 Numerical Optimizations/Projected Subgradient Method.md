[[Characterizing Functions for Optimizations]], we use strong convexity. 

[[Convex Function is Locally Lipschitz]], we use the property that there is a closed subset of the function that we can project onto in the domain and still have Lipschitz Continuity. 

[[Convex Sets Projections and Dist, Intro]], we use the fact that projecting onto a convex set is L-1 Lipschitz. 


---
### **Intro**

The projected subgradient methods assumes a convex function $f:\mathbb E \mapsto \mathbb{\bar R}$ that has a subgradient oracle, with a convex set $Q$ where $Q$ is closed, then it performs the following updates: 
$$
\begin{aligned}
    x^{(t + 1)} = \Pi_Q (x^{(t)} - \eta_t v_t) \quad \text{ where } v_t \in \partial f(x^{(t)}), 
\end{aligned}
$$

we use $\Pi$ to denote the set projection operator. And we list the following convergence results for the algorithm. We list these parameters for the remaining part of this excerp: 

1. $\bar x$, the optimal solution for the optimization problem that might not be unique. 
2. $\bar f$ is the optimal value for the optimization problem. 
3. $L$ is the lipschitz constant for the function over the closed domain $Q$. 
4. $x^{(t)}$ is the solution obtained at the $t$ step of the iteration. 

**Statement 1**

> Using the above assumptions of convexity and Lipschitz continuity over a closed convex set over the domain of the function, then the value of the current iterate will satisfy: 
> 
> $$
> \begin{aligned}
>     f \left(
>         \frac{\sum_{i = 0}^{t}\eta_i x_i}
>         {\sum_{i = 0}^{t}\eta_i} 
>     \right)
>     \le 
>     \frac{\Vert x_0 - \bar x\Vert^2 + L^2 \sum_{i = 1}^{t}\eta_i^2}
>     {
>         2\sum_{i = 1}^{t}\eta_i
>     }, 
> \end{aligned}
> $$
> 
> and constant step size with $\eta_t = R/(L\sqrt{T + 1})$ where $R \ge \Vert x_0 - \bar x\Vert$, with $T$ being the pre-determined number of steps expected to reach convergence, giving us: 
> 
> $$
> \begin{aligned}
>     f \left(
>         \frac{\sum_{t = 0}^{T} x^{(t)}}
>         {1 +T}
>     \right) - \bar f \le 
>     \frac{RL}{\sqrt{T + 1}}
> \end{aligned}
> $$


**Statement 2**

> When the function is strongly convex with $\alpha$ constant, then one will be able to accelerate the convergence by the sequence $\eta_t = 2/(\alpha(t + 1))$, giving us the following optimality bound: 
> 
> $$
> \begin{aligned}
>     f\left(
>         \frac{2}{t(t + 1)}\sum_{i = 1}^{t} i x_i
>     \right) - \bar f
>     \le 
>     \frac{2 L^2}{\alpha(t + 1)}
> \end{aligned}
> $$


---
### **Proof of Statement 1**

Start by considering: 

$$
\begin{aligned}

\end{aligned}
$$


