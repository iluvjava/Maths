- [[../Background/Characterizing Functions for Optimizations]], 
- [[../Non-Smooth Calculus/Convex Function is Locally Lipschitz]], 
- [[../Background/Convex Sets Projections and Dist, Intro]], 

---
### **Intro**

Polyak step-size is like projected subgradient, but we have an additional assumptions on the objective value for the optimization problem. See [[Projected Subgradient Method Convergence Proof]] for more context. With the use of a Polyak step size, the projected subgradient gradient algorithm achieves monotone convergence of the $x^{(k)}$, and objective value. Significantly different to when, the stepsize $\eta_t$ is only: 

$$
\begin{aligned}
    \left(
        \sum_{i = 1}^{\infty} \eta_i = \infty 
    \right)\wedge 
    \left(
        \sum_{}^{}\eta_i^2 < \infty
    \right), 
\end{aligned}
$$

which gives very interesting results, theoretically. 

**References:** 28.4 In Heinz's Course note. 
