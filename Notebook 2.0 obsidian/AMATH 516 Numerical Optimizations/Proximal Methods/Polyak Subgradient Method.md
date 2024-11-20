- [[../Background/Characterizing Functions for Optimizations]], 
- [[../Non-Smooth Calculus/Convex Function is Locally Lipschitz]], 
- [[../Background/Convex Sets Projections and Dist, Intro]].

---
### **Intro**

Polyak step-size is like projected subgradient, but we have an additional assumptions on the objective value for the optimization problem. See [[Projected Subgradient Method Convergence Proof]] for more context. 
With the use of a Polyak step size, the projected subgradient gradient algorithm achieves monotone convergence of the $x^{(k)}$, and objective value. Significantly different to when, the stepsize $\eta_k$ is only: 

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

**References:**

28.4 In Heinz's Course note. 
EE course notes [here](https://web.stanford.edu/class/ee364b/lectures/subgrad_method_notes.pdf) from Stephen Boyd. 

#### **Assumptions, Basic Quantities**: 

Suppose that $f: \R^n \rightarrow \overline R$ is convex and Lipschitz continuous, $Q$ is closed. 
Then $\partial f (x)$ is bounded for all $x \in \R^n$. 
Assume $Q \cap \text{ri.dom}(f) \neq \emptyset$ so it's proper. 
We define the following list of quantities: 

- $\mu = \inf_{x\in Q}f(x)$ exists, and it's not $-\infty$ because $Q$ closed and bounded and $f$ is Lipschitz continuous. 
- $f$ is, closed convex and proper. 
- $f'(x)\in\partial f(x)$: Any elements of the subgradient of $f$ at the point $x$. 
- $L$: Any constant the bound the maximum norm of the subgradient $\partial f$ at any point $x$ in $Q\cap \text{ri.dom }f$.
- $S= \arg\min_{x\in Q}f(x)$; it exists by closure of $Q$ and continuity of $f$. 
- $\bar x \in S$, fixed, it's any minimizer of $f$. 
- $e^{(k)}:= x^{(k)} - \bar x$, the error vector. 
- $E^{(k)} = f(x^{(k)}) - f(\bar x)$: Optimality gap. 

#### **Algorithm | Projected Polyak Subgradient**: 

> We dente $f'(x) \in \partial f(x)$, and $x^{(k)}$ to be the successive iterates produced by the algorithm. The algorithm can be stated like: 
> $$
>     x^{(k +1)} = \Pi_Q\left(x - \eta_kf'(x^{(k)})\right)\;, \eta_k = \frac{f(x^{(k)}) - \mu}{\Vert f'(x) \Vert^2}, 
> $$
> If it happens to be the case that $f'(x^{(k)}) = \mathbf 0$ at some iteration, then the algorithm will terminate. 

**Algorithm Properties**

1. It's a monotone convergence method, $x^{(k)}$ has Fejer Monotone convergence towards the set $S$. The fixed point of the subgradient Polyak iteration will be a minimizer. 
2. $f(x^{(k)})\rightarrow \mu$ at an rate of $\mathcal O (1/k)$. 
3. The iterates, $x^{(k)}\rightarrow \bar x$, where, the point $\bar x \in S$ will be clear later on. 

We prove these properties one by one in the up coming section. Before we start we list a major results from the pre-requisite of this file, which we will be reusing. 

#### **Lemma | Projected Subgradient First Lemma**
> Let $f$ be Lipschitz continuous on $Q$ with constant $L$, assume that $S\neq \emptyset$, let $\bar x \in S$, then: 
> $$
> \Vert x^{(k + 1)} - \bar x\Vert^2 = \Vert x^{(k)} -\bar x\Vert^2 + \eta_k^2 \Vert f'(x^{(k)})\Vert^2 -2\eta_k \langle x^{(k)} - \bar x, f'(x^{(k)})\rangle. 
> $$
> And this lemma make uses of the fact that $f$ is Lipschitz, with the non-emptiness of $S$. 

Note that the above results can be compactly written as: 

$$
\begin{aligned}
    \Vert e^{(k + 1)}\Vert^2 = \Vert e^{(k)} \Vert^2 + 
    \eta_k^2 \Vert v^{(k)}\Vert^2 - 
    2\eta_k\langle e^{(k)}, v^{(k)}\rangle
\end{aligned}
$$

where $v^{(k)}$ is a vector with membership from $\partial f(x^{(k)})$. 

**Remarks**

The convexity assumptions is not used yet. 
We only used the updating rules from the algorithm. 


---
### **Deriving The Algorithm**

We show that the update weights $\eta_k$ makes sense. Cf Lemma: Projected Subgradient First Lemma: 

$$
\begin{aligned}
    \Vert e^{(k + 1)}\Vert^2
    &= \Vert e^{(k)} \Vert^2 + 
    \eta_k^2 \Vert v^{(k)}\Vert^2 - 
    2\eta_k\langle e^{(k)}, v^{(k)}\rangle
    \\ 
    & \le 
    \Vert e^{(k)} \Vert^2 + 
    \eta_k^2 \Vert v^{(k)}\Vert^2 - 
    2\eta_k E_k. \impliedby [1]
\end{aligned}
$$
- \[1\]: Convexity, we use $\mu + \langle v^{(k)}, e^{(k)}\rangle \ge f(x^{(k)})$, which is $\langle v^{(k)}, e^{(k)}\rangle \ge E_k$. 

To obtain maximum amount of decrease in the objective value, we take derivative of $\epsilon_t$ to minimize the RHS, resulting in solving the equation: 

$$
\begin{aligned}
    2\eta_k\Vert v^{(k)}\Vert^2 - 2E^{(k)} &= 0 
    \\
    \eta_k &= \frac{E_k}{\Vert v^{(k)}\Vert^2}, 
\end{aligned}
$$

which gives use the optimal step size, using the known minimum $\mu$ and the norm of the subgradient. This is the derivative for the algorithm. 

**Remarks**

A weaker consequence of convexity is used here instead of the full global property. 
Observe that we used the condition 

$$
f(\bar x ) + \langle x^{(k)} - \bar x, f'(x^{(k)})\rangle \ge f(x^{(k)}). 
$$

This condition is strictly weaker than convexity. 
It's not yet sure what are some other conditions other than convexity can characterize this. 
Finally, any upper estimate of $E_k = f(x_k) - \mu + \epsilon$ where $\epsilon > 0$ is also an option that can weaken the claim. 

---
### **Montone Convergence results**

**Results:**
1. $\Vert e^{(k)}\Vert \rightarrow 0$ monotonically. $x^{(k)}\rightarrow S$ Fejer monotonically. 
2. $f(x^{(k)})\rightarrow 0$ at an rate of $\mathcal O(1/k)$. This is better than the lower bound for subgradient descent, because $f$ is Lipschitz continuous, a strict subset of convex functions. 

**Demonstrations**: 

We put the optimal iterates $\eta_k$ back to the above bound then we have (Skip the algebra): 

$$
\begin{aligned}
    \Vert e^{(k + 1)}\Vert^2 \le \Vert e^{(k)}\Vert^2 - 
    \frac{E_t^2}{\Vert v^{(t)}\Vert^2}, 
\end{aligned}
$$

which would mean that the error is monotonically decreasing (1). Since the choice of $\bar x$ is arbitrary at the start. This is the definition of monotone convergence. Cf from above: 

$$
\begin{aligned}
    \Vert e^{(k + 1)}\Vert^2 - \Vert e^{(k)}\Vert^2
    &\le  - 
    \frac{E_t^2}{\Vert v^{(t)}\Vert^2}
    \\
    [1]\implies 
    \sum_{t =0}^{k}
    \Vert e^{(t + 1)}\Vert^2 - \Vert e^{(t)}\Vert^2
    & \le 
    - \sum_{t = 0}^{k}
    \frac{E_t^2}{\Vert v^{(t)}\Vert^2}
    \\
    \implies 
    \Vert e^{(k + 1)}\Vert^2 - \Vert e^{(0)}\Vert^2
    &\le 
    - \sum_{k = 0}^{k}
    \frac{E_t^2}{\Vert v^{(t)}\Vert^2}
    \\
    [2]\implies 
    \sum_{t = 0}^{k}
    \frac{E_t^2}{L^2}
    \le
    \sum_{t = 0}^{k}
    \frac{E_t^2}{\Vert v^{(t)}\Vert^2} 
    &\le 
    \Vert e^{(0)}\Vert^2 - \Vert e^{(k)}\Vert^2 \le \Vert e^{(0)}\Vert^2, 
\end{aligned}
$$

- \[1\]: Performs telescoping summation. 
- \[2\]: Recall $L$ is the Lipschitz constant bounding the norm of all the subgradient of $f$. 

By the monotone property of the iterates $\Vert e^{(k)}\Vert$, the RHS is a positive quantities. This last statement means that the sum of all the gradient step sizes is a convergence series, which would implies that each term converges, hence $\eta_k$ converges to zero. Furthermore, if we characterize the smallest function value over all the iterates, then we have the following expression: 

$$
\begin{aligned}
    (k + 1)
    \min_{1\le t\le k}E_t \
    & \le 
    \sum_{t = 0}^{k}
    \frac{E_t^2}{L^2} \le \Vert e^{(0)}\Vert^2
    \\
    \min_{1\le t\le k}E_t \
    & \le 
    \frac{\Vert e^{(0)}\Vert^2}{k + 1},
\end{aligned}
$$

therefore $\lim\inf_{t\rightarrow \infty}{E_t}\rightarrow 0$[^1], and the error of the function value is converging at a rate of $\mathcal O(1/k)$ (2).  

From (1), the sequence is Fejer Monotone and also bounded. let $\bar x$ be a cluster point of the sequence, The projection operator $\Pi_Q$ asserts that $(x^{(k)})_{k\in \N}$ is a sequence in $Q$. Since $Q$ is closed, we know that $\bar x \in Q$ by limit point in a closed set. From the fact that $f$ is an l.s.c and (2): 

$$
\begin{aligned}
    \mu = \min_{x\in Q}(f(x)) \le f(\bar x) \le \lim\inf_{k \in \N}f(x_{n_k}) = \mu, 
\end{aligned}
$$

the equality on the right is by (2), By lower semi-continuity, the limit inf of the sub sequence of $f(x_{n_k})$ is bounded below by $f(\bar x)$, the cluster point, and the minimum value $\mu$. Therefore we have $f(\bar x) = \mu$. The cluster point is in the set $Q$, By the [[../Operators Theory/Fejer's Monotone]] convergence theorem, we know that $x^{(k)}\rightarrow \bar x$ as well. This finishes.

[^1]: Not very trivial you need to think about this more carefully. 