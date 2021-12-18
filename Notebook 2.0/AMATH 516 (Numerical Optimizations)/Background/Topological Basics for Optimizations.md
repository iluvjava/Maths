In fact, we need a bit of topology to get identify the type of functions that can fit with first order optimizations. 
[[Linear Algebra Basics for Optimization]]

Please note that, some of the discussion will feel familiar to discussion spotted here: [[Closed, Proper, Level Bounded, Strong Convex]], which also concerns the topological properties of sets related to the family of convex functions. 

---
### **Intro**

The geometric properties of function classifies them, and their properties that are relevant to optimizations. 

---
### **Notations**

$$
\begin{aligned}
    \limsup_{x\rightarrow y}
    \\
    \limsup_{x\rightarrow y}
\end{aligned}
$$

In which, the operator imposes the $\sup, \inf$ onto the tail of a sequence. Suppose that $a_i$ is a countable sequence the converges to $a$, then we can say that: 

**Limsup of a sequence**

> $$
> \limsup_{a\rightarrow a} a_i = \lim_{i\rightarrow \infty} > \left\lbrace
>     \sup_{j\ge i} \left\lbrace
>         a_i
>     \right\rbrace
> \right\rbrace
> $$
> The limit of the upper bound of the tail as the function goes up. Basically, how big can it bounce if I just snap it in the middle and look at its tail. 

And extending the argument to a Euclidean space, we have for example, a function that is a mapping from $\mathbf{E}$ to the set $\bar{\mathbb{R}}$, then we can say: 

**Liminf of a function on Euclidean space**

> $$
> \liminf_{y\rightarrow x} f(y) = \lim_{r\rightarrow 0} \left\lbrace
>     \inf_{y\in \mathbb{B}_r(x)-\{x\}} f(y)
> \right\rbrace
> $$
> The liminf as $y\rightarrow x$ on a function is the limit of the lower bound of function value mapping an epsilon ball centered at $x$ (excluding $x$). 

**Epsilon Balls**

$$
\mathbb{B}_r(x) = \{y: \Vert y - x\Vert_2^2 \le r\}
$$

---
### **Basic Set Topologies**

**Closure**

The closer for a set is the set of all points such that, the epsilon ball of that point has non-empty intersection of that set. Lets denote the closure set as $\text{cl}(Q)$, where $Q$ is the set under discussion. 

> $$
> \forall x \in \mathbf{E}: \forall x \in \text{cl}(Q) \iff 
> \forall \epsilon > 0: (\mathbb{B}_\epsilon \cap Q) \neq \emptyset
> $$


**Interior**

The interior of a set $B$ is the set of all the point such that for each point, there exists an epsilon ball surrounding that point and the whole ball is in the set $B$. Denotes the interior of the set as $\text{int}(B)$, then we have the definition that: 

> $$
> x\in \text{int}(B)\iff 
> \exists \delta: \mathbb{B}_\delta \subset Q
> $$

Nice and easy. 

And then we will be able to define a closed and an opened: 

* A set is open iff $Q = \text{int}(Q)$ 
* A set is closed iff $Q = \text{cl}(Q)$

To prove it, we will need to use the epsilon balls, and arbitrary sequences on the set under discussion. 

If a set is closed, then every limit point is in the set. If a set of open, then that is false. 

If a set if compact, then it means it's closed and bounded. 

---
### **Set Operations**

Choose subset $A, B \subset \mathbf{E}$ of the Euclidean space, then consider real number $\lambda \in \mathbb{R}$ then we have: 

$$
\begin{aligned}
    & \lambda A := \left\lbrace
        \lambda a: a \in A
    \right\rbrace
\\
    & 
    A + B = \left\lbrace
        a + b: a\in A, b \in B 
    \right\rbrace
\end{aligned}
$$

Where the first is scaling the subspace by a real number $\lambda$ and the second is the Minkowski Addition on sets. 

Another operation is generating the cone containing a given set: 

$$
\mathbf{R}_+(A) := \left\lbrace
    \alpha x: x \in A, \lambda >  0 
\right\rbrace
$$

---
### **Existence of a minimizer**

The existence of a minimizer depends on the continuity and the compactness of the set. And to do that we need to define a few things first. 

**Lower-Smicontinuous**

A function $f: \mathbf{E}\mapsto \mathbb{\bar{R}}$, then the function is lower semi-continuous if: 

> $$
> \forall x \in \mathbf{E}: \liminf_{y\rightarrow x} f(y)\ge f(x)
> $$

The definition prevents discrete Jump at the point say $a$, and the function has $f(a) = 1$ but $f(x) = 1 \;\forall\; x < a$. 

**Theorem: Closed Epigraph**

> The epigraph of a function is closed iff the function is lower-semi-continuous. 

**Proof**: Not Yet Given

**Coercive Function**

Definition: 
> Function $f:\mathbf{E}\mapsto \mathbb{\bar{R}}$ is coercive if for any sequence $x_i$ with $\Vert x\Vert_i\rightarrow \infty$ it must be that $f(x_i)\rightarrow + \infty$. 

**Existence of a Minimizer**

> If a function is closed and Coercive, then it must have minimizers		. 

