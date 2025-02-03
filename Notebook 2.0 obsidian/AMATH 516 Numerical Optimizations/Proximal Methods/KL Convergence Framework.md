- [Kurdyka Lojasiewicz Inequality](Kurdyka%20Lojasiewicz%20Inequality.md)
- [Mordukhovich Limiting Subdifferential](../Non-Smooth%20Calculus/Limiting%20Subgradient.md)

---
### **Intro**

We will introduce a framework of ideas for show the convergence of sequences applied to a function satisfying the KL property. 
Our discussion is based on a paper by Attouch et al. [^1][^2]


#### **The proximal point algorithm**

The proximal point algorithm has $(\lambda)_{k \ge0}$ with $\lambda_+ \le \lambda_k \ge \lambda_- < \infty$. 
It generates $(x_k)_{k\ge 0}$ for any initial feasible $x_0$ by: 
$$
\begin{aligned}
    x_{k + 1} \in \argmin{x} \left\lbrace
        f(x) + \frac{1}{2\lambda_k}\Vert x - x_k\Vert^2
    \right\rbrace. 
\end{aligned}
$$

It chooses the global minimizer of the problem. 
It's impossible to compute in practice but a very strong oracle to work with theoretically. 
See [Basics of Proximal Point Convergence in the Nonconvex case](PPM%20N-CNVX%20Basics.md) for a basic introduction of convergence of the proximal point method in Metric space. 

**Notations and quantities**
1. $\partial f$ here is the Modokovich Limiting subdifferential. 
2. Critical points of $f$ is the set of all $x$ such that $\mathbf 0 \in \partial f(x)$, denoted by $\text{crt}f$. 
3. $x^{(j)}$ denotes a vector with index and not the $j$ th index for an element in the vector. 


---
### **Conditions | The Convergence Conditions**


#### **Convergence conditions**
> Let $f:\mathbb R^n \mapsto \overline {\mathbb R}$ be a proper and l.s.c function. 
> There exists some $a, b > 0$ such that the sequence $(x_k)_{k \in \mathbb N}$ satisfies 
> 1. **(H1):** Sufficient decrease. 
> $$
> \begin{aligned}
>     f(x^{(k + 1)}) + a \Vert x^{(k + 1)} - x^{(k)} \Vert^2 \le f(x^{(k)}). 
> \end{aligned}
> $$
> 2. **(H2):** Relative error conditions. 
> $$
> \begin{aligned}
>     \forall k \in \mathbb N, \exists w^{(k + 1)} \in \partial f(x^{(k + 1)}) \text{ s.t: } \Vert w^{(k + 1)}\Vert \le b \Vert x^{(k + 1)} - x^{(k)}\Vert. 
> \end{aligned}
> $$
> 3. **(H3):** Continuity conditions. 
> The sequence $(x_k)_{k \in \mathbb N}$ satisfies 
> $\exists (x^{(k_j)})_{j \in \mathbb N}$ such that 
> $x^{(k_j)}\rightarrow \tilde x$ and $f(x^{(k_j)}) \rightarrow f(\tilde x)$. 



---
### **Consequence of These Conditions**

With the assumptions that the function $f$ is a KL function, the following lemma stated in Attouch and Bolte highlighted some desirable consequences of the above conditions. 

#### **Lemma | A Very Long Lemma**
> Let $f: \mathbb R^n \mapsto \overline{\mathbb R}$ be a proper l.s.c function. 
> Let $f$ be KL at $x^*$. 
> Because $f$ is KL, we get $U(x^*), \eta, \phi$ from the definition of KL at $x^*$. 
> Let $\delta, \rho > 0$ be such that $\mathbb B_\delta(x^*) \subset U(x^*)$, and $\rho \in (0, \delta)$. 
> Consider a sequence $(x^{(k)})_{k \in \mathbb N}$ that satisfies **(H1, H2)** as stated previously. 
> Assume more over that we have: 
> 1. $f(x^*) \le f(x^{(0)}) < f(x^*) + \eta$. 
> 2. $\Vert x - x^{(0)}\Vert + \sqrt{\frac{f(x^{(0)}) - f(x^*)}{a}} + \frac{b}{a}\phi(f(x^{(0)}) -f(x^*)) < \rho$. 
> 3. $\forall k \in \mathbb N, x^{(k)} \in \mathbb B_\rho(x^*) \implies x^{(k + 1)} \in \mathbb B_\delta(x^*)$, with $f(x^{(k + 1)}) \ge f(x^*)$. 
> 
> Then, the sequence will satisfy: 
> 1. $\forall k \in \mathbb N: x^{(k)} \in \mathbb B_{\rho}(x^*)$, 
> 2. $\sum_{k = 0}^{\infty} \Vert x^{(k +1)} - x^{(k)}\Vert < \infty$
> 3. $f(x^{(k)})\rightarrow f(x^*)$, when $k\rightarrow \infty$.
>  
> And the sequence converges to a point $\bar x \in \mathbb B_{\delta}(x^*)$ such that $f(\bar x) \le f(x^*)$. 
> If in addition the sequence $(x^{(k)})_{k \in \N}$ has condition **(H3)**, then $\bar x$ is a critical point of $f$ and $f(\bar x) = f(x^*)$. 

**Remarks**


#### **Thm | Convergence to a Critical Point**
> Let $f: \mathbb R^n \mapsto \overline {\mathbb R}$ be a proper, l.s.c function. 
> Consider sequence $(x_k)_{k \in \mathbb N}$ That satisfies conditions 1, 2,3 from above. 
> If $f$ is KL at cluster point $\tilde x$ as specified in condition 3, then sequence $x^{(k)} \rightarrow \bar x = \tilde x$ as $k\rightarrow \infty$, and $\bar x$ would be a critical point of $f$. 
> Moreover, the trajectory of $x^{(k)}$ has finite length i.e: $\sum_{k = 0}^{\infty} \Vert x^{(k + 1)} - x^{(k)}\Vert < \infty$.


**Remarks**

This is theorem 2.9 from Attouch, Bolte's paper. 


[^1]: H. Attouch, J. Bolte, and B. F. Svaiter, “Convergence of descent methods for semi-algebraic and tame problems: proximal algorithms, forward–backward splitting, and regularized Gauss–Seidel methods,” _Math. Program._, vol. 137, no. 1, pp. 91–129, Feb. 2013, doi: [10.1007/s10107-011-0484-9](https://doi.org/10.1007/s10107-011-0484-9).
[^2]: H. Attouch and J. Bolte, “On the convergence of the proximal algorithm for nonsmooth functions involving analytic features,” Math. Program., vol. 116, no. 1, pp. 5–16, Jan. 2009, doi: 10.1007/s10107-007-0133-5.
