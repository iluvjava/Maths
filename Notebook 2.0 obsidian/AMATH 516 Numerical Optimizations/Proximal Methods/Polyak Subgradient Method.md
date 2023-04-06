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
        \sum_{i = 1}^{\infty}\eta_i^2 < \infty
    \right), 
\end{aligned}
$$

which gives very interesting results, theoretically. 

**References:** 28.4 In Heinz's Course note. 

**Assumptions**: 

The method solves $\min_{x}f(x)$ given that we know: 

* $\mu = \sup_{x}f(x)$ exists, and it's not $-\infty$. 
* $f$ is, closed convex and proper. 
* $\partial f(x)$, the subgradient at the domain of $f$. We only need to know any vector in the subgradient operator at $x$. 
- The $f$ in the region of interest, Lipschitz. More specifically, we would like to have $Q$.
- The function $f$ is also, convex. 
- The set $Q$ is a closed set, and it is a set where $Q\cap \text{ri.dom}(f) \neq \emptyset$, with the property that $f$ is Lipschitz in the set $Q$. And hence, we will have the fact that $\text{rng}(\partial(f)|_Q)$ is bounded, hence the norm of all vector from the subgradient will be bounded by a constant: $L$. 
- $S= \arg\min_{x}f(x)$ is the set of minimizer, which it will exist, as a consequence that a closed function in a compact set will attain some type of minimum. 

**Algorithm Statement**: 

> We dente $f'(x) \in \partial f(x)$, and $x^{(k)}$ to be the successive iterates produced by the algorithm. The algorithm can be stated like: 
> $$
>     x^{(k +1)} = \Pi_Q(x - \eta_tf'(x^{(k)}))\;, \eta_t = \frac{f(x^{(k)}) - \mu}{\Vert f'(x) \Vert^2}, 
> $$
> If it happens to be the case that $f'(x^{(k)}) = \mathbf 0$ at some iteration, then the algorithm will terminate. 

**Algorithm Properties**

1. It's a montone convergence method, $x^{(k)}$ has Fejer Montone convergence towards the set $S$. 
2. $f(x^{(k)})\rightarrow \mu$ at an rate of $\mathcal (1/\sqrt{k})$. 
3. The iterates, $x^{(k)}\rightarrow \bar x$, where, the point $\bar x \in S$ will be clear later on. 

We prove these properties one by one in the up coming section. Before we start we list a major results from the pre-requisite of this file, which we will be reusing. 
 