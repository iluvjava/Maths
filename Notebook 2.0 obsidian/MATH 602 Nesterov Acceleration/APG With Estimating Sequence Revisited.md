[Nestrov Estimating Sequence of APG](Nestrov%20Estimating%20Sequence%20of%20APG.md)

---
### **Intro**

We address and expand some of the remarks after the proof in details. 
There seems to be some big room for improving things. 
Before we start, we restate important definitions and claims here. 

Throughout we consider minimization problem of the form: 
$$
\begin{aligned}
    \min_x \left\lbrace
        F(x) := f(x) + g(x)
    \right\rbrace
\end{aligned}
$$

where $f$ is $\mu \ge 0$ strongly convex and $L$-Lipschitz smooth, and $g$ is just convex. 
$\mathcal J_{L^{-1}}$, $\mathcal G_{L^{-1}}$ are the proximal gradient and the gradient mapping given by 

$$
\begin{aligned}
    \mathcal J_{L^{-1}}y 
    &= \argmin{x}\left\lbrace
        g(x) + f(y) + \langle \nabla f(y), x - y\rangle 
        + 
        \frac{L}{2}\Vert x - y\Vert^2
    \right\rbrace,
    \\
    \mathcal G_{L^{-1}} y &= L(I - \mathcal J_{L^{-1}}). 
\end{aligned}
$$

The estimating sequence $(\phi_k: \R^n \rightarrow \R)_{k \ge 0}$ used to prove the algorithm is given by the following 2 definitions. 

#### **Def | Recursive estimating sequence**
> 

#### **Def | Canonical form of the estimating sequence**

