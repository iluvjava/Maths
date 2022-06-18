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
    \min_x f(x) &
    \\
    s.t: 
    \\
    g_i(x) \le 0 & \quad\forall i \in [k]
    \\
    h_i (x) = 0 & \quad i = k + 1, \cdots,  m
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
\end{aligned}\tag{1}
$$

We assume that $f(x)$, $G(x)$, $H(x)$ are all differentiable, having Hessian and Gradient(Jacobian) In the case of non-smooth function, we use sub-gradient technieques(**CITATION NEEDED**). This formulations is a generalization of the Fenchel-Rockafellar Duality. It's a minimization problem of objective functon $f(x)$, m constraints function $g_i(x)$, both equality and inequality constraints are presented here. We assume that $f:\mathbb{R}^n\mapsto \overline{\mathbb{R}}$ is proper and $g_i(x) : \mathbb{R}^n\mapsto\mathbb{R}$. 

**Lagrangian:** 

$$
\begin{aligned}
    \mathcal{L}(x, \mu, \lambda)
    &= 
    f(x) 
    +
    \langle \mu, G(x)\rangle
    + 
    \langle \lambda, H(x)\rangle
    \text{ For Minimizing} 
    \\
    \mathcal{L}(x, \mu, \lambda)
    &= 
    f(x) 
    -
    \langle \mu, G(x)\rangle
    -
    \langle \lambda, H(x)\rangle
    \text{ For Maximizing} 
\end{aligned}\tag{2}
$$

$\nabla$ is the gradient when it applied to $f$, and the Jacobi matrix when applied to $G, H$. Next, an optimal solution for both the Primal and the Dual Problems gives the following set of conditions on the Lagrangian. Let the optimal solutions be denoted using super script $^+$.  

**Remarks**
The lagrangian is a 2 player games. Player one holds variable $x$, and it has the objective as $f(x)$ in (1), the second player holds $\mu, \lambda$ by penalizing the constraints vialations of $G(x), H(x)$, its objective is the opposite of the first player. Here, $\mu\ge 0$ because we only want to penalize entries of positive $G(x)$, and with $\lambda$ be a free variable to penalize $H(x)$ for either type of violations. 

**The Conditions**

By assuming that the constraints set is a convex set and the objective function is convex. Let $x, \mu, \lambda$ be the optimal parameters to the primal and the dual (Meaning that it's a stationary point $(x, \mu, \lambda)$ to the function $\mathcal L$), then the following conditions holds for it: 

$$
\begin{aligned}
    \begin{cases}
        \nabla[f](x) + \nabla[G(x)]_x^T\mu + \nabla[H(x)]_x^T\lambda = \mathbf{0} 
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
\end{aligned}\tag{3}
$$
 
**First Condition Interpretations**

> The first condition asserts the saddle point of Lagragian is reached, meaning that the minimization objective of first player $f(x)$ balanced out with the constraint panalizer, the adversarial player: $\nabla[G](x)\mu, \nabla[H](x)\lambda$. When the saddle point is satisfies, it means that there is no way to minimize $f(x)$ without violating the constraints. 

**Second and Third Conditions**

> Primal problem must still be at least feasible for the optimal solution. 

**Fourth Conditions**

> The dual can only maximizes it's objective by panelizing constraint violation of $G(x)\ge \mathbf 0$, it can't penelize by maximizing when $G(x) \le 0$, therefore, it has to choose $\mu \ge \mathbf 0$, it's also the constraint for the dual problem. 

**Complementary Conditions**

**Proof**: 

For contradiction assume that $\langle G(x), \mu\rangle\neq 0$, then it's implied that $\exists i \in [k]: g_i(x) \neq 0 \wedge u_i\neq 0$. Such a constraint violation gives 2 cases for $g_i(x)$: 
* If $g_i(x) > 0$, then a positive $\mu_i$ can be increased indefinitely to satisifes the maximizing objective of the second player (Dual). 
* If $g_i(x) < 0$, then a zero $\mu_i$ can increase the objective of the dual, the second player. 

Under either case, the point $x, \mu$ are not going to be stationary. 

**Remark**

Complimentary slackness implies stationary points. But the converse should also be true because it's intuitive. 


---
**References**: 
An afternoon when I was feeling inspired. 
