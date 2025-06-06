- [Local, Global Lipschitz Continuity](AMATH%20516%20Numerical%20Optimizations/Background/Local,%20Global%20Lipschitz%20Continuity.md)
- [Limit Sumpremum and Limit Infimum](MATH%20000%20Math%20Essential/Analysis/Limit%20Sumpremum%20and%20Limit%20Infimum.md)

---
### **Intro**

This type of subgradient and subderivative for locally/globally Lipschitz continuous function. 
The following contents are taken from Professor Wang's class at UBCO. 
And it's basically taken from Clarke's Book titled: "Optimization and Nonsmooth Analysis", page 25. 

#### **Definition | Clarke generalized directional derivative**
> Let $O$ be an open set in $\R^n$. 
> Suppose that $f: O \rightarrow \overline \R$ is locally Lipschitz on $O$. 
> For all $x \in O, v \in \R^n$, the Clarke generalized directional derivative is defined as
> $$
> \begin{aligned}
>     f^\circ(x; v) := \limsup_{\substack{y \rightarrow x \\ t \searrow 0}}
>     \frac{f(y + tv) - f(y)}{t}. 
> \end{aligned}
> $$

#### **Lemma | Basic properties of Clarke's generalized directional derivative**
> Let $f$ be locally Lipschitz around $x$ with constant $K$. 
> Then, 
> 1. $v \mapsto f(x, v)$ is finite, homogenous and sub-additive. $|f^\circ (x; v)|\le K \Vert v\Vert$. 
> 2. $f(x; v)$ is upper semicontinuous as a function of $(x, v)$, and it's $K$ Lipschitz as a function of $v$. 
> 3. $f^\circ(x; -v) = (-f)^\circ(x; v)$. 

**Proof**

For the notation let's define the differential quotient: $\Delta_f(x; v) := (f(x + v) - f(x))$. 

**We now prove (1.)**. 
It's direct because for all $t > 0, v$ it has from the $K$ Lipschitz continuity that: 
$$
\begin{aligned}
    |\Delta_f(x; v)| &= 
    \left|
        f(x + v) - f(x)
    \right| \le K \Vert v\Vert
    \\
    \implies 
    |f^\circ(x, v)| =
    \left| 
        \limsup_{\substack{t \searrow 0 \\ w \rightarrow x}}\;
        t^{-1}\Delta_f(w; tv) 
    \right|
    &\le
    \limsup_{t\searrow 0} t^{-1}K \Vert tv\Vert = K \Vert v\Vert. 
\end{aligned}
$$
Therefore, it is finite. 
To show that it's homogenous, let $\lambda > 0$, it's not hard to see it because: 

$$
\begin{aligned}
    f^\circ(x; \lambda v) &= 
    \limsup_{\substack y\rightarrow x, s \searrow 0} 
    s^{-1}\Delta_f(y; s\lambda v)
    \\
    &= \limsup_{\substack y\rightarrow x, \tau \searrow 0} 
    (\lambda^{-1}\tau)^{-1}\Delta_f(y; \tau v)
    \\
    &= \lambda f^\circ(x; v). 
\end{aligned}
$$

To see it's sub-additive on the second parameter, recall the property of limit supremum, consider

$$
\begin{aligned}
    f^\circ(x; u + v) &= 
    \limsup_{w \rightarrow x, s\searrow 0} s^{-1}\Delta_f(w; s(u + v))
    \\
    &= \limsup_{w \rightarrow x, s\searrow 0}
    s^{-1}(f(w + s(u + v)) - f(w + su) + f(w + su) - f(w))
    \\
    &= 
    \limsup_{w \rightarrow x, s\searrow 0}
    s^{-1}(f(w + su + sv) - f(w + su) + f(w + su) - f(w))
    \\
    &\le \limsup_{w \rightarrow x, s\searrow 0} s^{-1}\Delta_f(w + su; sv)
    + \limsup_{w \rightarrow x, s\searrow 0}s^{-1}\Delta_f(w; su)
    \\
    &= f^\circ(x; v) + f^\circ(x, u). 
\end{aligned}
$$

**We now prove (2.).** 
We can jump to the results to the proof using the following claim. 
Consider an arbitrary sequence $(x_n, v_n)\rightarrow (x, v)$. 
For all $n \in \N$, there exists this sequence $(w_n - x_n, s_n)\rightarrow (0, 0)$ such that: 
- (a): For all $n \in \N$, it has $-1/n < s_n^{-1}\Delta_f(x_n; s_nv_n) - f^\circ (x_n, v_n)$. 

We list the following additional facts as well. 

- (b): $f$ is $K$ Locally Lipschitz at $x$. 
- (c): A property of liminf. If $\lim_{n\rightarrow \infty}b_n = b$, then $\liminf_{n\rightarrow \infty} a_n + b_n = \liminf_{n\rightarrow \infty} a_n + b$. 
- (d): $w_n \rightarrow x$ too because $\Vert w_n  - x\Vert \le \Vert w_n - x_n\Vert + \Vert x_n - x\Vert$. It's zero on the RHS. 

Using this item (a), it would have. 

$$
\begin{aligned}
    f^\circ(x_n, v_n) - 1/n &\le 
    s_n^{-1}\Delta_f (w_n; s_nv_n) 
    \\
    &= s_n^{-1}(f(w_n + s_n v_n) - f(w_n))
    \\
    &= s_n^{-1}(f(w_n + s_n v) - f(w_n) + f(w_n + s_nv_n) - f(w_n + s_n v))
    \\
    &\underset{\text{(b)}}{\le} 
    s_n^{-1}(f(w_n + s_n v) - f(w_n)) + K\Vert v_n - v\Vert
    \\
    &= s_n^{-1}\Delta_f(w_n; s_nv) + K\Vert v_n - v\Vert. 
\end{aligned}\tag{$*$}
$$

Taking the limit on the inequality it gives:

$$
\begin{aligned}
    \limsup_{n\rightarrow \infty} f^\circ(x_n, v_n) 
    &\underset{\text{(c)}}{=} 
    \limsup_{n\rightarrow \infty} f^\circ(x_n, v_n) - 1/n
    \\
    &\underset{(*)}{\le} 
    \limsup_{n\rightarrow \infty}
    \left(
        s_n^{-1}\Delta_f(w_n; s_nv) 
        + K\Vert v_n - v\Vert
    \right)
    \\
    & \underset{\text{(c)}}{=}
    \limsup_{n\rightarrow \infty}
    s_n^{-1}\Delta_f(w_n; s_nv) 
    \\
    &\underset{\text{(d)}}= 
    f^\circ(x; v). 
\end{aligned}
$$

Therefore, it is upper semicontinuous. 
Now, we go back and prove (a), (b). 
By definition, $f^\circ(x_n, v_n) = \limsup_{w\rightarrow x_n, s \searrow 0} s^{-1}\Delta_f(x_n; sv_n)$ implies that there exists a sequence $(x_k, s_k)\rightarrow (x_n, 0)$ with $s_k > 0$ such that: $\lim_{k\rightarrow \infty}s_k^{-1}\Delta_f(x_k, s_kv_k) = f^\circ(x_n; v_n)$. 
By convergence of a sequential limit, for all $n \in \N$, there exists a subsequence $(x_{k(n)}, v_{k(n)})$ such that
$$
\begin{aligned}
    & - 1/n < s_{k(n)}^{-1}\Delta_f\left(w_{k(n)}; v_{k(n)}/n\right) - f^\circ(x_n; v_n) < 1/n, 
    \\
    & \left\Vert
        w_{k(n)} - x_{k(n)}
    \right\Vert + s_{k(n)}\le 1/n. 
\end{aligned}
$$

Redefine $s_n = s_{k(n)}, w_n = w_{k(n)}$, it yields the results. 
**We now prove (3.)**. 
It's not hard since: 

$$
\begin{aligned}
    \Delta_f(w; -sv) &= 
    f(w - sv) - f(w) 
    \\
    &= f(w - sv) - f(w - sv + sv)
    \\
    &= -f((w - sv) + sv) - (-f)(w - sv)
    \\
    &= \Delta_{-f}(w- sv, sv). 
\end{aligned}
$$

Take limit as $w \rightarrow x, s \searrow 0$, it's then proved. 
$\blacksquare$

**Remarks**

We took [This stack exchange post](https://math.stackexchange.com/questions/4017434/proof-that-generalized-directional-derivative-is-upper-semicontinuous) as a reference for this file as well. 
