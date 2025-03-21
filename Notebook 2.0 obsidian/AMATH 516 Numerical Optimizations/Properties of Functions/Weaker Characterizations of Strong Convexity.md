[Characterizing Functions for Optimizations](Background/Characterizing%20Functions%20for%20Optimizations.md)


---
### **Intro**

The class of Quasi-strongly convex function is a generalizations of the class of strongly convex function. 
**References**
- Necoara et al. "Linear convergence of first order methods for non-strongly convex optimization"

The targets of relaxations on the ideas of strong convexity focuses on the error bound and quadratic growth conditions. 

---
### **Global Settings of the theories**

The following assumption will be made throughout this entire file. 


#### **Assumption Set 1**
> 1. $X \subseteq \R^n$ be a convex set. 
> 2. $f: \R^n \rightarrow \R$ be a differentiable function with $\nabla f$ $L_f$ Lipschitz continuous. 
> 3. Suppose that problem **(P)** $f_* = \min_{x \in X} f(x)$ minimum and set of minimzers $X^* = \argmin{x \in X} f(x)$ exists. 


Denote $\mathcal P$ to be the projected gradient operator: 

$$
\begin{aligned}
    \mathcal P_\lambda (x) &:= \Pi_X(x - \lambda^{-1} \nabla f(x)), 
    \\
    \mathcal G_{\lambda} &:= \lambda(I - P_\lambda). 
\end{aligned}
$$

Define Bregman Divergence 

$$
\begin{aligned}
    D_{f}: \R^n \times \R^n \rightarrow \R &= 
    (x, y) \mapsto f(x) - f(y) - \langle \nabla f(y), x - y\rangle. 
\end{aligned}
$$

#### **Definition | Strongly convex**
> A function $f \in \mathbb S(L_f, \kappa_f, X)$ is strongly convex if and only if there exists $L_f \ge \kappa_f \ge 0$ such that for all $x, y \in X$ it satisfies: 
> $$
> \begin{aligned}
>   \kappa_f \Vert x - y\Vert^2 \le D_f(x, y) \le L_f \Vert x - y\Vert^2. 
> \end{aligned}
> $$

#### **Definition | Weaker characterizations**
> $f$ Let $L_f \ge \kappa_f \ge 0$ such that for all $x \in X$, $\bar x = \Pi_X^* x$. 
> We define the following: 
> 1. Quasi-strong convexity (Q-SCNVX): $0 \le D_f(\bar x, x) - \frac{\kappa_f}{2}\Vert x - \bar x\Vert^2$. Denoeted by $\mathbb S'(L_f, \kappa_f, X)$. 
> 2. Quadratic under approximation (QUA): $0 \le D_f(x, \bar x) - \frac{\kappa_f}{2}\Vert x - \bar x\Vert^2$. Denoeted by $\mathbb U(L_f, \kappa_f, X)$. 
> 3. Quadratic Gradient Growth (QGG): $0\le D_f(x, \bar x) + D_f(\bar x, x) - \kappa_f/2\Vert x - \bar x\Vert^2$. Denoted by $\mathbb G(L_f, \kappa_f, X)$. 
> 4. Quadratic Function Growth (QFG): $0 \le f(x) - f^* - \kappa_f/2\Vert x - \bar x\Vert^2$. Denoted by $\mathbb F(L_f, \kappa_f, X)$. 
> 5. Error Bound (EB): $\Vert \mathcal G_{L_f}(x)\Vert \ge \Vert x - \bar x\Vert$. Denoted by $\mathbb E(L_f, \kappa_f, X)$. 


#### **Literature's Contributions**
In Necoara's paper, they did: 
1. Introduce relations between various weaker characterizations of strong convexity with proofs. 
2. Gave examples of convex functions satisfiyings the conditions. 
3. Showed linear convergence rate of Projected Gradient, or Accelerated Projected Gradient Method under some weaker settings of strong convexity. 

---

### **Important theoretical results in the paper on wkear characterizations of strong convexity**

The theorems that follow will be given the same numberings as it appeared in the referenced literature. 

#### **Theorem 1 | Quasi-strongly convex implies quadratic under approximations**
> It has $\mathbb S'\subseteq \mathbb U$. 

#### **Theorem 2 | Quasi-strongly convex implies Quadratic Gradient Growth**
> $\mathbb S' \subseteq \mathbb G$. 

#### **Theorem 3 | Quadratic gradient growth implies Quadratic under approximations**
> $\mathbb G \subseteq \mathbb U$. 

#### **Theorem 4 | Strong convexity hiearchy**
> $\mathbb S \subseteq \mathbb S' \subseteq \mathbb G \subseteq \mathbb U \subseteq \mathbb F$. 

#### **Theorem 5**


