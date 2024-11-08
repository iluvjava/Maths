- [Nesterov Original Conception of Momentum Method](Nesterov%20Original%20Conception%20of%20Momentum%20Method.md)

---
### **Intro**

Nesterov's estimating sequence technique is an absolute genius of idea. 
In introduction we introduce the basic setup of Nesterov's estimating sequence for optimizing the objective value of some function. 


#### **The Setup**
1. $f$ is a function from $\R^n \mapsto \R$. 
2. $f$ is bounded below with $f_* = \inf_xf(x)$. 
3. $(\alpha_k)_{k \ge 0}$ is a sequence of scalar where $\alpha_i \in (0, 1)$. This sequence will be used to characterize the convergence rate some Lyapunov quantity. 

**Assumption set 1**
1. In addition to The Setup, assume $\exists x^* \in \argmin{x}f(x)$, at least one minimizer exists for $f$. 


#### **Definition | Nesterov's estimating sequence**
> Let $(\phi_k : \R^n \mapsto \R)_{k \ge 0}$ be a sequence of function. 
> We call this sequence of function a Nesterov's estimating sequence when it satisfies the conditions that: 
> 1. There exists another sequence $(x_k)_{k \ge 0}$ such that for all $k \ge 0$ it has $f(x_k) \le \phi_k^*$. 
> 2. There exists a sequence of $(\alpha_k)_{k \ge 0}$ such that for all $x \in \R^n$, $\phi_{k + 1}(x) - \phi_k(x) \le - \alpha_k(\phi_k(x) - f(x))$



---
### **The Lyapunov argument hidden in the Nesterov's Estimating sequence Technique**


#### **Claim | Non-negativity from Nesterov's estimating sequence**
> The difference between estimating sequence and $f$, denoted and defined by: $\Delta_k(x) = \phi_k(x) - f(x)$, is non-negative at exactly 2 points: $x_k, x^*$. 

**Proof**

By definition of $\phi_k$, $\Delta_k(x) := \phi_k (x) - f(x)$ for all $x \in \R^n$. 
Then observe that $\forall k \ge 0$:  
$$
\begin{aligned}
    \Delta_k(x) 
    &= \phi_k(x) - f(x) \ge \phi_k^* - f(x)
    \\
    x = x_k\implies 
    \Delta_k(x_k) 
    &\ge 
    \phi_k^* - f(x_k) \ge 0
    \\
    x = x_* \implies 
    \Delta_k(x_*)
    &\ge \phi_k^* - f_* \ge f(x_k) - f_* \ge 0
\end{aligned}
$$

The function $\Delta_k(x)$ is non-negative specifically at the points: $x_*, x_k$. 

#### **Claim | The Lyapunov quantity**
> The quantity $\Delta_k(x) = \phi_k(x) - f(x)$ is a Lyapunov quantity when $x \in \{x_*, x_k\}$ for all $k\ge 0$, meaning that it's non-negative, and it's decreasing and its convergence rate is characterzed as $\prod_{i = 0}^k(1 - \alpha_i)$. 

**Proof**

By definition, the second property of estimating sequence yields for all $x$: 
$$
\begin{aligned}
    \phi_{k + 1}(x) - \phi_k(x) 
    &\le - \alpha_k (\phi_k(x) - f(x))
    \\
    \iff 
    \phi_{k + 1}(x) - f(x) - (\phi_k(x) - f(x))
    &\le 
    -\alpha_k(\phi_k(x) - f(x))
    \\
    \iff
    \Delta_{k + 1}(x) - \Delta_k(x) &\le
    - \alpha_k\Delta_k(x)
    \\
    \iff 
    \Delta_{k + 1}(x) 
    &\le 
    (1 - \alpha_k)\Delta_k(x). 
\end{aligned}
$$

Therefore, $\Delta_k(x)$ is a monotone decreasing quantity, for all $x$. 
To classify as a Lyapunov quantity, it would also has to be non-negative. 
Which it is at specifically 2 points $x\in \{x_*, x_k\}$ by the previous claim. 
Unrolling the recurrence gives the convergence rate of the Lyapunov quantity: 

$$
\begin{aligned}
    \Delta_{k + 1}(x) &\le 
    (1 - \alpha_k)\Delta_k(x) \le \cdots \le 
    \left(
        \prod_{i = 0}^k(1 - \alpha_i)
    \right)\Delta_0(x). 
\end{aligned}
$$

Since $x_k$ is different from each iteration, if we requires $\Delta_k(x) \ge 0$ for all $k\ge0$, then $x_*$ is the only choice. 
With that we have 

$$
\begin{aligned}
    (\forall k \ge 0)\; \Delta_{k + 1}(x_*) - (1 - \alpha_k)\Delta_k(x_*) &\le 0. 
\end{aligned}
$$

By the previous claim: $\Delta_k(x_*) \ge f(x_k) - f_*$, therefore the convergence of $\Delta_k(x)$ by the estimating sequence will translate to the convergence of the optimality gap $f(x_k) - f_*$. 

**Remarks**

It's super interesting. 



---
### **How universal is this argument**


### **Nesterov's Accelerated Proximal Gradient Descent Method**


