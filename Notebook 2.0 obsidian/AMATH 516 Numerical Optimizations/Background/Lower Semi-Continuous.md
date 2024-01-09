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
    \forall \epsilon > 0 \exists \delta > 0: 
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
> Let $f$ be a l.s.c function then the following conditions are equivalent to l.s.c. 
> 1. The $\text{epi}(f)$ is a closed set. 
> 2. For all $\alpha \in \mathbb R$ we have $\text{lev}_\alpha(f)$ being a closed set. 
> 3. $\liminf_{x\rightarrow a}f(x) = \min\{\alpha \in \mathbb {\bar R} : \exists x_n \rightarrow \bar x \wedge f(\bar x) = \alpha \}$. 

**Observations**

For a proof about the first equivalent condition visit:[Lower Semi-Continuity is Closedness of Epigraph](Lower%20Semi-Continuity%20is%20Closedness%20of%20Epigraph.md) for more information. 


---
### **Calculus of Lower Semi-continuity**

We investigate when and under what conttext, lower semi-continuity continue to work. 


---
### **Misc**

