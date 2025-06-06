[Topological Basics for Optimizations](Topological%20Basics%20for%20Optimizations.md)

---
#### **Def | Lower-Smicontinuous Functions**
> A function $f: \mathbf{E}\mapsto \mathbb{\bar{R}}$, then the function is lower semi-continuous if: 
> $$
>   \forall x \in \mathbf{E}: \liminf_{y\rightarrow x} f(y)\ge f(x). 
> $$

The definition prevents discrete Jump at the point say $a$, and the function has $f(a) = 1$ but $f(x) = 1 \;\forall\; x < a$. 
Graphically it's saying that there is no upper jump in the value of the function. 
In the case of 1D, an upper jump discontinuity doesn't exist on the domain of the function. 

**Example**

The following function is **not** lower semi-continuous: 

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

Therefore, the function is not lower semi-continuous. 

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
    & (\forall \epsilon > 0)(\exists \delta > 0)(\forall x \in \mathbb B(\bar x | \delta)\setminus \{x\})\;
    f(x) - f(\bar x) \ge - \epsilon
    \\
    \iff &  
    (\forall \epsilon > 0)(\exists \delta > 0) \;
    \inf \left\lbrace
        f(x) - f(\bar x) : 0 < \Vert x - \bar x\Vert \le \delta
    \right\rbrace \ge - \epsilon
    \\
    \iff &
    \lim_{\delta \searrow 0}
    \inf \left\lbrace
        f(x) - f(\bar x) : 0 < \Vert x - \bar x\Vert \le \delta
    \right\rbrace \ge0
    \\
    \iff & 
    \liminf_{x\rightarrow \bar x} f(x) - f(\bar x) \ge 0. 
\end{aligned}
$$

$\blacksquare$


#### **Claim | Sequential limits under lower semi-continuity**
> Let $(x_n)_{n\ge 0}$ be any sequence converging to $\bar x$. 
> $f$ is l.s.c if and only if $\liminf_{n\rightarrow \infty} f(x_n) \ge f(\bar x)$.

**Proof**

By l.s.c it has 
$$
\begin{aligned}
    (\forall \epsilon > 0)(\exists \delta_\epsilon > 0)\; 
    \inf_{x}
    \left\lbrace
        f(x) - f(\bar x) : x \in \mathbb B(\bar x | \delta_\epsilon)
    \right\rbrace > -\epsilon. 
\end{aligned}
$$
So, let $\epsilon > 0$. 
Consider any $\bar x \rightarrow \bar x$, the convergence asserts that there exists $k(\epsilon) \in \N$ such that eventually $\Vert x_n - \bar x\Vert \le \delta_\epsilon$ for all $n \ge k(\epsilon)$. 
Since $f$ is l.s.c it has: 

$$
\begin{aligned}
    \inf_{n}\left\lbrace
        f(x_n) - f(\bar x) : n \ge k(\epsilon)
    \right\rbrace \ge 
    \inf_{x} \left\lbrace
        f(x) - f(\bar x) | x \in \mathbb B(x | \delta_\epsilon)
    \right\rbrace > - \epsilon. 
\end{aligned}
$$
Since $\epsilon > 0$ arbitrary, it's saying: 
$$
\begin{aligned}
    (\forall \epsilon > 0)(\exists k(\epsilon) \in \N): 
    \inf_{n}\left\lbrace
        f(x_n) - f(\bar x) : n > k(\epsilon)
    \right\rbrace > - \epsilon. 
\end{aligned}
$$
It's the equivalent of $\lim_{m\rightarrow\infty}\inf_{n \ge m} f(x_n) - f(\bar x) \ge 0$. 
To see the converse of the claim, consider a sequence $x_n\rightarrow \bar x$ that has $\liminf_{n\rightarrow \infty} f(x_n) - f(\bar x) = -c < 0$. 
By convergence of limit infimum, it has 

$$
\begin{aligned}
    & (\forall \epsilon > 0)(\exists k(\epsilon) \in \N) 
    \;\inf_{n} \left\lbrace
        f(x_n) - f(\bar x) : n \ge k(\epsilon) 
    \right\rbrace < c + \epsilon
    \\
    \implies &
    \inf_{n} \left\lbrace
        f(x_n) - f(\bar x) : n \ge k(c/2)
    \right\rbrace < -c/2
\end{aligned}\tag{a}
$$

This is not good since a convergence sequence is bounded, with $(x_{k(c/2) + n})_{n \ge 0}$ it would claim: 

$$
\begin{aligned}
    (\exists \delta > 0)(\forall n \in \N)
    \left\Vert x_{k(c/2) + n} - \bar x\right\Vert < \delta. 
\end{aligned}
$$

This means $f$ is not l.s.c because combining the above with Equation (a): 

$$
\begin{aligned}
    \inf_{x}\left\lbrace
       f(x) - f(\bar x) : x \in \mathbb(\bar x | \delta)
    \right\rbrace 
    \le 
    \inf_{n} \left\lbrace
        f(x_n) - f(\bar x) : n \ge k(c/2)
    \right\rbrace < - c/2. 
\end{aligned}
$$

So $f$ is not l.s.c 
$\blacksquare$


**Remarks**

Under a metric space, sequential characterization of l.s.c is sufficient to the continuous limit over the full space. They are equivalent if axiom of choice can be used. 


#### **Thm | A list of Equivalent Conditions**
> Let $f$ be a l.s.c function then the following conditions are equivalent to l.s.c:
> 1. The $\text{epi}(f)$ is a closed set. 
> 2. For all $\alpha \in \mathbb R$ we have $\text{lev}_\alpha(f)$ being a closed set. 
> 3. $\liminf_{x\rightarrow a}f(x) = \min\{\alpha \in \mathbb {\bar R} : \exists x_n \rightarrow \bar x \wedge f(\bar x) = \alpha \}$. 

**Observations**

For (1.) iff (2.) see: [Lower Semi-Continuity is Closedness of Epigraph](Lower%20Semi-Continuity%20is%20Closedness%20of%20Epigraph.md).
Conditions 3 is trivial. 
Choose $\alpha \in \arg\min\{\alpha \in \mathbb{\bar R} : \exists x_n \rightarrow \bar x \wedge f(\bar x) = \alpha\}$ then $\exists (x_n)_{n\in \mathbb N}$ such that $\lim_{n\rightarrow \infty} x_n = \bar x$, at the same time for all $x_n'\rightarrow \bar x$ such that $\lim_{n\rightarrow \infty} f(x_n) = \alpha '$, we must have $\alpha \le x'$. 
Select that specific best sequence $x_n$, then its subsequential limit automatically equals to $\lim_{x\rightarrow a}f(x)$. 
Therefore, using the equivalence between the first 2 conditions we would have: (3.) iff $f$ is l.s.c iff $\text{epi}(f)$ is closed. 

**Proof of (2.) => (3.)**

It's direct by the observation that $\text{lev}_\alpha(f)\times \{\alpha\} = \text{epi}(f)\cap (\mathbb R^n \times \{\alpha\})$. 
The set $\mathbb R^n\times \{\alpha\}$ is a closed set and since $\text{lev}_\alpha(f)$ is closed, the intersection of 2 closed set is still a closed set by basic topology of $\mathbb R^n$. 

**Proof of (3.) => (1.)**



---
### **Calculus of Lower Semi-continuity**

We investigate when and under what context, lower semi-continuity continue to work. 
We list all of them. 

#### **Claims**

> Let $f_1, f_2, \cdots f_m$ be many l.s.c functions mapping from $\mathbb R^n$ to $\mathbb{\bar R}$. 
> 1. $f_1 + f_2$ is l.s.c. 
> 2. $\lambda f_1$ is l.s.c on $\mathbb R^n$ for all $\alpha \ge 0$. 
> 3. $\max\{f_1, \cdots, f_m\}$ is a l.s.c function. This one can work for infinitely many l.s.c functions as well. 
> 4. $\min\{f_1, \cdots, f_m\}$ is a l.s.c function. Won't work for infinitely many l.s.c functions. 
> 5. $\max\{f_1, \cdots, f_m\}$ and $\min\{f_1, \cdots, f_m\}$ are continuous if each of $f_1, \cdots, f_m$ are continuous functions.

**Arguments**

If we let $f = \max(f_1, f_2), g = \min(f_1, f_2)$, then we have 

$$
\text{epi}(f) = \text{epi }(f_1) \cap \text{epi }(f_2); 
\text{epi}(g) = \text{epi }(f_1) \cup \text{epi }(f_2). 
$$

In the above case 3., 4., finite number of intersection and union of closed set is still a closed set. 
However, infinitely many unions of open sets is always an open set, meaning that infinitely may intersection of closed set is still a closed set, justifying 3. in the infinite case. 
Infinitely many intersections of closed set is not a closed set. 
Simply consider the closure of the list of singletons $\text{cl}\{1/n : n \in \mathbb N\}$. 

#### **Thm | Composition with a Continuous Mapping**
> Let $f = g \circ F$ where $g : \mathbb R^n \mapsto \mathbb {\bar R}$ is a l.s.c mapping at $F(\bar x)$, and $F: \mathbb R^\ om \mapsto \mathbb R^n$ is a continuous mapping at $\bar x$. 
> Then $f$ is a l.s.c mapping.

**Proof**

Take $x \rightarrow \bar x$ to be an arbitrary convergence sequence in $\mathbb R^n$, for all $\epsilon \ge 0$, using the l.s.c property of $g$, we have 

$$
\begin{aligned}
    \exists \epsilon_\epsilon: \Vert y - F(\bar x)\Vert < \delta_\epsilon: 
    g(y) - g(F(\bar x)) > -\epsilon, 
\end{aligned}
$$

From the continuity of $F$, $\exists M(\delta_\epsilon) \in \mathbb N$ such that $\Vert F(x_n) - F(\bar x)\Vert \le \delta_\epsilon$, so then 

$$
\begin{aligned}
    n \ge M(\delta_\epsilon) \implies g(F(x_n)) - g(F(\bar x)) > -\epsilon
    \\
    \implies 
    \inf_{n> M(\delta_\epsilon)} \left\lbrace
        g\circ F(x_n) - g\circ F(\bar x)
    \right\rbrace > -\epsilon, 
\end{aligned}
$$

and therefore, considering $\epsilon \searrow 0$, we derived the fact that $g\circ F$ is a l.s.c mapping at the point $x = \bar x$. 

#### **Thm | Composition of l.s.c functions**
> let $f(x) = \theta \circ g (x)$, where $g:\mathbb R^n\mapsto \mathbb{\bar R}$ and $\theta: \mathbb R \mapsto \mathbb {\bar R}$ both be l.s.c functions, let $\theta$ be non-decreasing, then $f$ would be a l.s.c function as well. 

**Proof**




**Remarks**

Composition of l.s.c functions are never l.s.c. 
Consider the example of the characteristic function $\chi_{0}$ and the function $x^2 - 1$. 
Both functions are l.s.c. 



---
### **Misc**

