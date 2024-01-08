[Topological Basics for Optimizations](Topological%20Basics%20for%20Optimizations.md)

---
#### **Def | Lower-Smicontinuous Functions**

> A function $f: \mathbf{E}\mapsto \mathbb{\bar{R}}$, then the function is lower semi-continuous if: 
> $$
>   \forall x \in \mathbf{E}: \liminf_{y\rightarrow x} f(y)\ge f(x). 
> $$
> The definition prevents discrete Jump at the point say $a$, and the function has $f(a) = 1$ but $f(x) = 1 \;\forall\; x < a$. 
> Graphically it's saying that there is no upper jump in the value of the function. 
> In the case of 1D, an upper jump discontinuity doesn't exist on the domain of the function. 

**Example**

The following function is not lower semi-continuous: 

$$
\begin{aligned}
    f(x):= 
    \begin{cases}
        0 & x < 0
        \\
        1 & x \ge 0    
    \end{cases}
\end{aligned}
$$

The lower semi-continuity failed at the point $x = 0$. Consider $\mathbb B_\epsilon(0)\setminus\{0\}$, then: 

$$
\begin{aligned}
    \lim_{\epsilon \rightarrow 0} 
    \left\lbrace
        \inf_{y\in \mathbb B_\epsilon(0)\setminus \{0\}} f(y)
    \right\rbrace 
    = 
    0 \le f(0) = 1
\end{aligned}
$$

Therefore the function is not lower semi-continuous. 

**Remarks:**

A lower semi-continuous function doesn't have a jump discontinuity that goes up. 

---
### **Equivalent Characterization of Lower Semi-Continuity of Functions**

There are several equivalent characterizations. 

#### **Claim | Equivalent Characterization**
> $f$ is l.s.c iff $\forall \epsilon > 0$ there exists $\delta > 0$ such that $\Vert x - a\Vert < \delta \implies f(x)\ge f(a) - \epsilon$. 

**Proof**

It's equivalent because let's fix some value of $\delta > 0$ for any $\epsilon>0$ then the claim has

$$
\begin{aligned}
    \Vert x - a\Vert < \delta \implies 
    f(x) - f(a) \ge - \epsilon 
    &\iff
    \forall x \in \mathbb B_\delta(a) : f(x) - f(a) \ge -\epsilon
    \\
    \iff 
    \inf \{f(\mathbb B_\delta(a))\} - f(a) \ge -\epsilon
\end{aligned}
$$

Since the choice of $\epsilon > 0$ is arbitrary, and the fact that limit works with inequality then $\lim_{\delta \searrow 0} \inf \{f(\mathbb B_\delta(a))\} \ge f(a)$. 
The see the converse, simply use the definition of liminf illustrated in the above definition. 

#### **Claim | Sequential Lower Semi-Continuity**
> Consider any $(x_n)_{n \in \mathbb N}$ to be a sequence such that it converges to $a$ then the sequential limit $\text{liminf}_{n\rightarrow \infty} f(x_n) \ge f(a)$ holds. 

**Proof**

The above claim is a consequence of definition of l.s.c from the previous section. 
To do that we need to use the axiom of choice. 
Consider the previous claim

$$
\begin{aligned}
    \forall \epsilon > 0 \exist \delta > 0: 
    \inf_{x \in \mathbb B_{\delta}(a)} f(x)\ge f(a) - \epsilon, 
\end{aligned}
$$

choose $\epsilon = 1/n$ then it asserts the existence of $\mathbb B_{\delta_n}(a)$ for each $n\in \mathbb N$. 
Using axiom of choice, we choose $x_n \in \mathbb B_{\delta_n}(a)$ for all $n\in \mathbb N$. 
Therefore $f(x_n) \ge f(a) - 1/n$. 
And so $\inf_{m\ge n} f(x_n) \ge f(a) - 1/n$. 
Taking the limit as $m\rightarrow \infty$, proved the sequential limit. 

To show the converse that the sequential lower semi-continuity is sufficient to the definition of l.s.c we have


