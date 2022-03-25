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

We assume that $f(x)$, $G(x)$, $H(x)$ are all differentiable, having Hessian and Gradient. 

This formulations is a generalization of the Fenchel-Rockafellar Duality. It's a minimization problem of objective functon $f(x)$, m constraints function $g_i(x)$, both equality and inequality constraints are presented here. We assume that $f:\mathbb{R}^n\mapsto \overline{\mathbb{R}}$ is proper and $g_i(x) \mathbb{R}^n\mapsto\mathbb{R}$. 

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
        \nabla[G](x)\mu \le  \mathbf{0}
        \\
        \nabla[H](x)\lambda = \mathbf{0}
        \\
        \mu \ge \mathbf{0}
        \\
        \langle G(x), \mu\rangle = \mathbf{0}
    \end{cases}
\end{aligned}
$$

The first conditions is setting the $\nabla_x[\mathcal{L}]$ to be the zero vector. The second and third are the primal feasiblity conditions, the 4th is the dual feasibility condition, and the last one is referred to as the complementary slack. 