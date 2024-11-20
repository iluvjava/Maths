- [Nesterov Original Conception of Momentum Method](Nesterov%20Original%20Conception%20of%20Momentum%20Method.md)

---
### **Intro**

Nesterov's estimating sequence technique is an absolute genius of idea. 
In introduction, we introduce the basic setup of Nesterov's estimating sequence for optimizing the objective value of some function. 


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
> The quantity $\Delta_k(x) = \phi_k(x) - f(x)$ is a Lyapunov quantity when $x \in \{x_*, x_k\}$ for all $k\ge 0$, meaning that it's non-negative, and it's decreasing, and its convergence rate is characterized as $\prod_{i = 0}^k(1 - \alpha_i)$. 

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
To classify as a Lyapunov quantity, it would also have to be non-negative. 
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

Since $x_k$ is different from each iteration, if we require $\Delta_k(x) \ge 0$ for all $k\ge0$, then $x_*$ is the only choice. 
With that we have 

$$
\begin{aligned}
    (\forall k \ge 0)\; \Delta_{k + 1}(x_*) - (1 - \alpha_k)\Delta_k(x_*) &\le 0. 
\end{aligned}
$$

By the previous claim: $\Delta_k(x_*) \ge f(x_k) - f_*$, therefore the convergence of $\Delta_k(x)$ by the estimating sequence will translate to the convergence of the optimality gap $f(x_k) - f_*$. 

**Remarks**

It's fascinating. 



---
### **How universal is this argument**


Here is not an exhaustive list of algorithms and ideas that made use of the Nesterov's estimating sequence. 

1. [Nesterov Original Conception of Momentum Method](Nesterov%20Original%20Conception%20of%20Momentum%20Method.md). The original Nesterov's accelerated gradient method, (2.2.19) In Nesterov's new book. 
2. [Nesterov Estimating Sequence of Proximal Gradient](Nestrov%20Estimating%20Sequence%20of%20Proximal%20Gradient.md). Proximal gradient method derived by Nesterov's estimating sequence. 
3. [Accelerated PPM Method](Accelerated%20PPM%20Method.md). Guler's 1993 paper on accelerated proximal gradient method for convex optimization. 
4. [The Catalyst Acceleration Idea Part I](The%20Catalyst%20Acceleration%20Idea%20Part%20I.md). Lin's 2015 paper on accelerated inexact proximal point with strong convexity support and a concrete algorithm tailored for machine learning practices. 
5. (6.6.63) in Nesterov's book, the method of similar triangle. 
6. Accelerated Cubic Newton method in a paper titled "Accelerating the cubic regularization of Newton’s method on convex problems". 



Next, we summarize the important ways they made use of the Nesterov's estimating sequence. 
Most of the argument is very similar. 

#### **Definition | A lower bounding function**
> Fix any $y$ in the domain of $f$. 
> Define $l_f(x; y)$ as a lower bounding function if for all $x$ it satisfies, $\psi, \Psi$ be a function the induces Bregman divergences $\Psi, \psi$. 
> $$
> \begin{aligned}
>     l_f(x; y) + D_\psi(x, y)
>     \le f(x) + D_\Psi(x, y). 
> \end{aligned}
> $$

#### **Definition | Recursive estimating sequence**
> Let $\phi_k: \R^n \rightarrow \R$ be a sequence of function; $(\alpha_k)_{k \ge 0}$ be a sequence such that $\alpha_i \in (0, 1)$ for all $i \in \N$; $(y_k)_{k \ge 0}$ be any sequence. 
> We define $\phi_{k + 1}$ recursively such that for all $x \in \R^n$ it has 
> $$
> \begin{aligned}
>     \phi_{k + 1}(x) &= 
>     (1 - \alpha_k)\phi_k(x) + \alpha_k(l_f(x; y) + D_\psi(x; y))
> \end{aligned}
> $$


To validate as a Nesterov's estimating sequence, it remains to identify the existence of a sequence $(x_k)_{k \ge 0}$ such that it has for all $k \ge 0: f(x_k) \le \phi_k^* := \min_x \phi_k(x)$. 
The implicit assumption here is the $\phi_k$ has a minimum, and it has a canonical form admitting simple analysis. 

