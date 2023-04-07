- [[Characterizing Functions for Optimizations]], we use strong convexity. 
- [[Convex Function is Locally Lipschitz]], we use the property that there is a closed subset of the function that we can project onto in the domain and still have Lipschitz Continuity. 
- [[Convex Sets Projections and Dist, Intro]], we use the fact that projecting onto a convex set is L-1 Lipschitz. 


---
### **Intro**

The projected subgradient methods assume a closed convex function $f:\mathbb E \mapsto \mathbb{\bar R}$ that has a subgradient and minimizes the function value over a convex set $Q$ where $Q$ is closed, then it performs the following updates: 
$$
\begin{aligned}
    x^{(t + 1)} = \Pi_Q (x^{(t)} - \eta_t v_t) \quad \text{ where } v_t \in \partial f(x^{(t)}), 
\end{aligned}
$$

we use $\Pi$ to denote the set projection operator. And we list the following convergence results for the algorithm. We list these parameters for the remaining part of this excerpt: 

1. $\bar x$, the optimal solution for the optimization problem that might not be unique, but it will have finite value in this case because the set $Q$ is bounded and closed. 
2. $\bar f$ is the optimal value for the optimization problem. 
3. $L$ is the Lipschitz constant for the function over the closed domain $Q$. 
4. $x^{(t)}$ is the solution obtained at the $t$ step of the iteration. 

We show the convergence of the objective value by the projected subgradient method. 

**Reference**: One of Jame Burke's Video for MATH 516 you know, probably his last few lectures for the class MATH 516. It's at the end of [this](https://sites.math.washington.edu/~burke/crs/516-21/recorded-lectures/051921.mp4) lecture. 


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
> and constant step size with $\eta_t = R/(L\sqrt{T + 1})$ where $R \ge \Vert x_0 - \bar x\Vert$, with $T$ being the total number of steps executed by the algorithm then:
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
>         \frac{2}{T(T + 1)}\sum_{t = 1}^{T} t x_t
>     \right) - \bar f
>     \le 
>     \frac{2 L^2}{\alpha(T + 1)}
> \end{aligned}
> $$


**Remarks on Both Statements**

Later in the proof, please observe that we only required the L-1 Lipschitz continuity from the projection on to the convex set $Q$, which means that this proof will be applicable to [[Proximal Gradient via Forward Backwards Envelope]], the proximal gradient algorithm. The reason that such an analysis is not utilized is because the projection onto a set is not necessarily smooth, but the proximal operator is, which gives it *stronger* convergence properties. Additionally, when applying this convergence proof for the case where Proximal Gradient has 2 non-smooth objectives, we need the additional assumptions that $\bar x$ is coming from a bounded set. Coersiveness of a function can ensure this. 

Furthermore, what if the function has an relative interior of it's domain that is not the whole Euclidean space of its input? This might affect the Lipschitz condition of the original function, which is quite bad and it would be great to change the formulation of the problem. 


---
### **Proof of Statement 1**

Start by considering a non-unique optimal value $\bar x$ in the set $Q$: 

$$
\begin{aligned}
    \Vert x^{(t+ 1)} - \bar x\Vert^2 
    &= 
    \Vert 
        \Pi_Q(x^{(t)} - \eta_t v_t) - 
        \Pi_Q(\bar x)
    \Vert^2
    \\
    [0]\implies & \le \Vert 
        x^{(t)} - \bar x - \eta_t v_t
    \Vert^2
    \\
    & = \Vert x^{(t)} - \bar x\Vert^2 + \eta^2_{t} \Vert v_t\Vert^2
    -2\eta_t\langle x^{(t)} - \bar x, v_t\rangle, 
    \\
    [1]\implies & \le 
    \Vert x^{(t)} - \bar x\Vert^2 + \eta_t^2L^2 - 2\eta_t(f(x^{(t)}) - \bar f)
    \\
    [2]\implies
    & \le \Vert x^{(0)} - \bar x\Vert^2 + L^2 \sum_{i = 0}^{t}\eta_i^2 - 2 \sum_{i = 0}^{t}\eta_i(f(x^{(i)}) - \bar f), 
\end{aligned}
$$

\[0\]: Nonexpansiveness of the projection onto a closed and convex set. 

\[1\]: This is done using the Lipschitz Continuity of $f$ implies that the gradient has to be bounded by the same constant, giving us $\forall v \in \partial g(x), \Vert v\Vert \le L$, and we can also use convexity giving us: 
$$
\begin{aligned}
    2\eta_t \langle x^{(t)} - \bar x, v_t\rangle \le  \bar f - f(x^{(t)})
    \\
    - 2\eta_t \langle x^{(t)} - \bar x, v_t\rangle \ge f(x^{(t)}) - \bar f
\end{aligned}
$$
which lead us the inequality on the 4th line. 

\[2\]: we expand the relation recursively by applying the inequality itself to $\Vert x^{(t)} - \bar x \Vert^2$ repeatedly for different value of $t$, giving us the summation of the other 2 terms in the expression as an upper bound. Next we continue from the end of the end of the expression: 

$$
\begin{aligned}
    \Vert x^{(T + 1)} - \bar x\Vert^2 
    & \le \Vert x^{(0)} - \bar x\Vert^2 + L^2 \sum_{i = 0}^{T}\eta_i^2 - 2
    \sum_{t = 0}^{T}\eta_t(f(x^{(t)}) - \bar f)
    \\
    \sum_{t = 0}^T \eta_t f(x^{(t)}) - \bar f
    &\le \frac{1}{2}
    \left(
        \Vert x^{(0)} - \bar x\Vert^2 + L^2 \sum_{i = 0}^{T}\eta_i^2
         - \Vert x^{(T + 1)} - \bar x\Vert^2
    \right)
    \\
    \sum_{t = 0}^T \eta_t f(x^{(t)}) - \bar f\sum_{t = 0}^{T}\eta_t
    &\le 
    \frac{1}{2}\left(
        \Vert x^{(0)} - \bar x\Vert^2 + L^2 \sum_{i = 0}^{T}\eta_i^2
    \right)
    \\
    \sum_{t = 0}^{T} \frac{\eta_t f(x^{(t)})}{\sum_{t = 0}^{T}\eta_t f(x^{(t)})} - \bar f 
    & \le 
    \frac{1}{2\sum_{t = 0}^{T}\eta_t} \left(
        \Vert x^{(0)} - \bar x\Vert^2 + L^2 \sum_{i = 0}^{T}\eta_i^2
    \right)
    \\ [3]\implies 
    f \left(
        \frac{\eta_tx^{(t)}}{\sum_{t = 0}^{T}\eta_t} 
    \right) - \bar f
    &\le 
    \frac{
        \Vert x^{(0)} - \bar x\Vert^2 + L^2 \sum_{i = 0}^{T}\eta_i^2
    }{2\sum_{t = 0}^T \eta_t}. 
\end{aligned}
$$

\[3\]: It's from the convexity definition of the function. 

And that completes the demonstration. Finally, a direct substitution of $\eta_t = \frac{R}{L\sqrt{T + 1}}$ with the relation that $R \ge \Vert x_0 - \bar x\Vert$ will complete the second part of the claim. We skip it here. 

**Remarks**

The convergence of the objective value doesn't imply the convergence of the weighted average over all the $x^{(t)}$. We can't say that, we only asserted the convergence of the objective value, given desired properties of the sequence $\eta_t$. One of the prime example for the sequence $\eta_t$ are the harmonic sequence because: 

$$
\begin{aligned}
    \sum_{t = 0}^{\infty}\eta_t  = \infty \wedge \sum_{t = 0}^{\infty} \eta_t < \infty, 
\end{aligned}
$$
which allows the RHS of the objective value gap to be decreasing as $T \rightarrow \infty$. For constant step size, we need to be careful about how we choose the step size, which involves some extra information about the initial error. 

Further notice that non-uniqueness assumption of $\bar x$, which would imply that the upper bound could potentially be higher. But due to the fact that $Q$ is closed and $\bar x\in Q$, we are saved from having a RHS that is unbounded. 

---
### **Proof of Statement 2**

The first few steps are the same compare to the proof for statement 1, then we re-derive the conditions related to the strong convexity: 

$$
\begin{aligned}
    \frac{\alpha}{2}\Vert x^{(t)} - \bar x\Vert^2 
    &\le 
    f(\bar x) -  f(x^{(t)}) - \langle v_t, \bar x - x^{(t)}\rangle
    \\
    \implies
    \langle v_t, \bar x - x^{(t)}\rangle 
    &\le 
    f(\bar x) -  f(x^{(t)}) - \frac{\alpha}{2}\Vert x^{(t)} - \bar x\Vert^2, 
\end{aligned}
$$

we use the results of above at \[4\] in below giving us: 

$$
\begin{aligned}
    \Vert x^{(t + 1)} - \bar x\Vert^2
    & \le \Vert x^{(t)} - \bar x\Vert^2 + \eta^2_{t} \Vert v_t\Vert^2
    -2\eta_t\langle x^{(t)} - \bar x, v_t\rangle, 
    \\
    \implies [4] & \le \Vert x^{(t)} - \bar x\Vert^2 + \eta^2_{t} L^2
    - 2\eta_t
    \left(
        f(x^{(t)}) - \bar f + \frac{\alpha}{2}\Vert x^{(t)} - \bar x\Vert^2
    \right)
    \\
    f(x^{(t)}) - \bar f
    & \le 
    \frac{1}{2\eta_t}(\Vert x^{(t)} - \bar x\Vert^2 - \eta_t^2L^2)
    -
    \frac{\alpha}{2}
    \Vert x^{(t)} - \bar x\Vert^2
    - 
    \frac{1}{2\eta_t}\Vert x^{(t + 1)} - \bar x\Vert^2
    \\
    f(x^{(t)}) - \bar f
    & \le 
    \left(
        \frac{1}{2\eta_t} - \frac{\alpha}{2}
    \right)\Vert x^{(t)} - \bar x\Vert^2
    + \frac{L^2\eta_t}{2} - \frac{1}{2\eta_t}\Vert x^{(t + 1)} - \bar x\Vert^2. 
\end{aligned}
$$

In the next phase, we try a sequence of $\eta_t$ that allows to to invoke the telescoping series (make the terms into the same form but parameterized differently). This allows use to sum up weight sum of the left hand side and the RHS will be expression in terms of some type of error terms. The approach after will invoke convexity of $f$ on the weight sum similar to before. More specifically we consider the sequence $\eta_t = 2/(\alpha(t + 1))$, and we multiple both hand of the inequality by $t$, obtaining: 

$$
\begin{aligned}
    t\left(
        \frac{1}{2\eta_t} - \frac{\alpha}{2}
    \right) &= \frac{\alpha t (t - 1)}{4}
    \\
    \frac{t}{2\eta_t} &= \frac{\alpha t(t + 1)}{4}
    \\
    \frac{t\eta_t}{2} &= \frac{t}{t + 1}, 
\end{aligned}
$$

Therefore; 
$$
\begin{aligned}
    t(f(x^{(t)}) - \bar f) & \le 
    \frac{\alpha t(t - 1)}{4}\Vert x^{(t)} - \bar x\Vert^2
    -
    \frac{\alpha t(t + 1)}{4}\Vert x^{(t + 1)} - \bar x\Vert^2
    + \frac{t}{\alpha (t + 1)}L^2
    \\
    [5]\implies 
    \sum_{t = 0}^{T}t(f(x^{(t)}) - \bar f) 
    & \le 
    \left(
        0 - \frac{4T(T + 1)}{4}\Vert x^{(T + 1)} - \bar x\Vert^2
    \right)
    + 
    \frac{L^2}{\alpha}\sum_{t = 0}^{T} \frac{t}{t + 1} \le \frac{TL^2}{\alpha}, 
\end{aligned}
$$

where the last inequality uses the telescoping sum series, and then uses the fact that each term $\frac{t}{t + 1} < 1$ to place an upper bound. Recall the the summation $\sum_{t = 0}^T t = T(T + 1)/2$, we divided the inequality and use the convexity of the function $f$. 

$$
\begin{aligned}
    \sum_{t = 0}^{T}\frac{2t(f(x^{(t)})) }{T(T + 1)} - \bar f 
    &\le 
    \frac{2TL^2}{\alpha T (T + 1)}
    \\
    f\left(
        \sum_{t = 0}^{T}\frac{2tx^{(t)}}{T(T + 1)}
    \right) - \bar f
    &\le 
    \frac{2L^2}{\alpha(T + 1)}, 
\end{aligned}
$$

This completes the proof and the convex combinations of the weight $\eta_t$ corresponds the objective value of the function that converges. Finally, observe that from the strong convexity, the iterates will converge to a singleton, therefore, the weighted convex combinations of the iterates converge. 


**Remarks**

Intuitively, it makes sense to weight the iterates $x^{(t)}$ at the tail end a bit more because hopefully, the algorithm has converged as more $t$ were iterated, and this is what this proof above is showing us that, such a strategy indeed works under the strong convexity assumption! 

Finally, observe that under the strong convexity assumption, we are certain the the iterates will converge to a fixed value. This is not true in general in the first case since, the minimizers for a convex function is a convex set and might not be a singleton like in the second case when the function is strongly convex. 