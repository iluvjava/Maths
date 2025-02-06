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
> Consider any $(x_n)_{n \in \mathbb N}$ to be a sequence such that it converges to $a$ then the sequential limit $\text{liminf}_{n\rightarrow \infty} f(x_n) \ge f(a)$ holds. This claim is equivalent to saying that $f$ is l.s.c at $a$. 

**Proof**

The above claim is a consequence of definition of l.s.c from the previous section. 
To do that we need to use the axiom of choice. 
Consider the previous claim

$$
\begin{aligned}
    \forall \epsilon > 0 \;\exists \delta > 0: 
    \inf_{x \in \mathbb B_{\delta}(a)} f(x)\ge f(a) - \epsilon, 
\end{aligned}
$$

choose $\epsilon = 1/n$ then it asserts the existence of $\mathbb B_{\delta_n}(a)$ for each $n\in \mathbb N$. 
Using axiom of choice, we choose $x_n \in \mathbb B_{\delta_n}(a)$ for all $n\in \mathbb N$. 
We had identify that sequence $(x_n)_{n\in \mathbb N}$ that satisfies $\lim_{n\rightarrow \infty} f(x_n) \ge f(a)$ with $x_n \rightarrow a$, which is a stronger than the convergence of the subsequential limit. 

To show the converse that the sequential lower semi-continuity is sufficient to the definition of l.s.c we show that if the above claim is not true, then the definition of l.s.c doesn't hold for $f$. 
This part of the proof is direct and doesn't need the axiom of choice. 

**Remarks**

Under a metric space, sequenctial characterization of l.s.c is sufficient to the continuous limit over the full space. They are equivalent if axiom of choice can be used. 


#### **Thm | A list of Equivalent Conditions**
> Let $f$ be a l.s.c function then the following conditions are equivalent to l.s.c:
> 1. The $\text{epi}(f)$ is a closed set. 
> 2. For all $\alpha \in \mathbb R$ we have $\text{lev}_\alpha(f)$ being a closed set. 
> 3. $\liminf_{x\rightarrow a}f(x) = \min\{\alpha \in \mathbb {\bar R} : \exists x_n \rightarrow \bar x \wedge f(\bar x) = \alpha \}$. 

**Observations**

For (1.) iff (2.) see:[Lower Semi-Continuity is Closedness of Epigraph](Lower%20Semi-Continuity%20is%20Closedness%20of%20Epigraph.md).
Conditions 3 is trivial. 
Choose $\alpha \in \arg\min\{\alpha \in \mathbb{\bar R} : \exists x_n \rightarrow \bar x \wedge f(\bar x) = \alpha\}$ then $\exists (x_n)_{n\in \mathbb N}$ such that $\lim_{n\rightarrow \infty} x_n = \bar x$, at the same time for all $x_n'\rightarrow \bar x$ such that $\lim_{n\rightarrow \infty} f(x_n) = \alpha '$, we must have $\alpha \le x'$. 
Select that specific best sequence $x_n$, then its subsequential limit automatically equals to $\lim_{x\rightarrow a}f(x)$. 
Therefore using the equivalence between the first 2 conditions we would have: (3.) iff $f$ is l.s.c iff $\text{epi}(f)$ is closed. 

**Proof of (2.) => (3.)**

It's direct by the observation that $\text{lev}_\alpha(f)\times \{\alpha\} = \text{epi}(f)\cap (\mathbb R^n \times \{\alpha\})$. 
The set $\mathbb R^n\times \{\alpha\}$ is a closed set and since $\text{lev}_\alpha(f)$ is closed, the intersection of 2 closed set is still a closed set by basic topology of $\mathbb R^n$. 

**Proof of (3.)==> (1.)**



---
### **Calculus of Lower Semi-continuity**

We investigate when and under what conttext, lower semi-continuity continue to work. 
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
However, infinitely many union of open sets is always an open set, meaning that inifinitely may intersection of closed set is still a closed set, justifying 3. in the infinite case. 
Infinitely many intersection of closed set is not a closed set. 
Simply consider the closure of the list of singletons $\text{cl}\{1/n : n \in \mathbb N\}$. 

#### **Thm | Composition with a Continuous Mapping**
> Let $f = g \circ F$ where $g : \mathbb R^n \mapsto \mathbb {\bar R}$ is a l.s.c mapping at $F(\bar x)$, and $F: \mathbb R^\ om \mapsto \mathbb R^n$ is a continuous mapping at $\bar x$. 
> Then $f$ is a l.s.c mapping.

**Proof**

Take $x \rightarrow \bar x$ to be an arbitrary convergence sequence in $\mathbb R^n$, for all $\epsilon \ge 0$, using the l.s.c property of $g$, wehave 

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

