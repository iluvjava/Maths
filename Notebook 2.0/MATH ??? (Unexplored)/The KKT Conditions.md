[[MinMax MaxMin Lemma]]
KKT: Karush–Kuhn–Tucker conditions
Wiki: [here](https://en.wikipedia.org/wiki/Karush%E2%80%93Kuhn%E2%80%93Tucker_conditions). 

---
### **Intro**

Consider Optimization Problem that takes the following form:

$$ 
\begin{aligned}
    &
    \begin{cases}
    \min_x f(x)    &
    \\
    s.t: & g_i(x) \le 0 \quad\forall i \in [k]
    \\
    g_i (x) = 0 & \quad i = k + 1, \cdots,  m
    \end{cases}
    \\
    \equiv& 
    \begin{cases}
        \min_x f(x)
        \\
        G(x) \le \mathbf{0} & G(x): \mathbb{R}^n \mapsto \mathbb{R}^k
        \\
        H(x) = \mathbf{0} & H(x): \mathbb{R}^n : \mapsto \mathbb{R}^m
    \end{cases}
\end{aligned}
$$

We assume that $f(x)$, $G(x)$, $H(x)$ are all differentiable, having Hessian and Gradient(Jacobian). This formulations is a generalization of the Fenchel-Rockafellar Duality. It's a minimization problem of objective functon $f(x)$, m constraints function $g_i(x)$, both equality and inequality constraints are presented here. We assume that $f:\mathbb{R}^n\mapsto \overline{\mathbb{R}}$ is proper and $g_i(x) : \mathbb{R}^n\mapsto\mathbb{R}$. 

**Lagrangian:** 

$$
\begin{aligned}
    \mathcal{L}(x, \mu, \lambda)
    &= 
    f(x) +
    \langle \mu, G(x)\rangle
    + 
    \langle \lambda, H(x)\rangle
\end{aligned}
$$

**Warning**: The intuition for Lagrange Multiplier doesn't diretly translate to the case for the Lagrangian of KKT conditions. This is true because of the inequality. 

$\nabla$ is the gradient when it applied to $f$, and the Jacobi matrix when applied to $G, H$. Next, An optimal solution for both the Primal and the Dual Problems gives the following set of conditions on the Lagrangian. Let the optimal solutions be denoted using super script $^+$.  

**The Conditions**

By assuming that the constraints set is a convex set and the objective function is convex. Let $x, \mu, \lambda$ be the optimal parameters to the primal and the dual, then the following conditions holds for it: 

$$
\begin{aligned}
    \begin{cases}
        \nabla[f](x) + \nabla[G](x)\mu + \nabla[H](x)\lambda = \mathbf{0} 
        & \text{Saddle Point}
        \\
        G(x)\le \mathbf 0   & \text{Primal Feasible}
        \\
        H(x) = \mathbf 0    & \text{Primal Feasible}
        \\
        \mu \ge \mathbf{0}  & \text{Dual Feasible}
        \\
        \langle G(x), \mu\rangle = \mathbf{0} & \text{Complementary Slack}
    \end{cases}
\end{aligned}
$$
 
**First Condition Interpretations**

> The first condition asserts the saddle point of Lagragian is reached, meaning that the minimization objective of first player $f(x)$ balanced out with the constraint panalizer, the adversarial player: $\nabla[G](x)\mu, \nabla[H](x)\lambda$. When the saddle point is satisfies, it means that there is no way to minimize $f(x)$ without violating the constraints. 

**Second and Third Conditions**

> Primal problem must still be at least feasible for the optimal solution. 

**Fourth Conditions**

> The dual can only maximizes it's objective by panelizing constraint violation of $G(x)\ge \mathbf 0$, it can't penelize by maximizing when $G(x) \le 0$, therefore, it has to choose $\mu \ge \mathbf 0$, it's also the constraint for the dual problem. 

**Complementary Conditions**
> If some of the constraints $g_i(x)< 0$, then $\mu$ has to be zero, so that the dual problem is optimal as well. If the primal is saturated: $g_i(x) = 0$ then the dual variable can some positive number, which is going to be determined by the saddle point constraints. 