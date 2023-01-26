For a brief introduction of Topology that doesn't touch on optimizations, see [[Topological Spaces]], for optimization, the neighbours are point close to an element by the metric in a [[Metric Space]] (We are talking about Euclidean space). But in the most general sense, the concept of a "neighbour" as described by the epsilon ball around a point, should directly from the definition of a topological space. 

Please note that, some of the discussion will feel familiar to discussion spotted here: [[Closed, Proper, Level Bounded, Strong Convex]], which also concerns the topological properties of sets related to the family of convex functions. 

---
### **Intro**

The geometric properties of function classifies them, and their properties that are relevant to optimizations. We focuses on Finite Euclidean spaces for real numbers with the usual p-norm as the metric, which is most applicable to most of the optimizations theories. 

Set Topologies are particular useful for characterizing the behavior of functions that are $C1$, the ramp function. 

**What is Closed Set?** 
* $Q$ is closed
* $\text{cl}(Q) = Q$: The closure of the set equals to the set itself. 
* $Q$ contains all of it's limit points. 
* $Q^C$ is an opened set. 


**Definition: Opened Set**

> The set $Q\subseteq X$ is *open* if for all $x\in Q$ we have $\exists \epsilon: \mathbb B_\epsilon(x)\subseteq Q$.

**Definition: Interior**

> The interior of the set $Q\subseteq X$ is $\text{int}(Q):= \{x\in X|\mathbb B_\epsilon(x) \subseteq Q\}$. 

**Definiton Closure**

See [[Closure Topology]] for reference. 

Observe that trivially, if a set is open, then it equals to its interior. 

**Remark**

Sometimes we discuss the openness of the set relative to a subset of the whole space. For example, the use of  [[Relative Interior And Relative Boundary]] discuss the interior of a set relative to a linear subspace. Or, we can discuss some subset of $\mathbb R$'s openess relative to $\mathbb Q$. 

**Theorem: Topology of the Complement**

> $Q$ is open iff $Q^C$ is closed

A complement on the set $Q$ is a negation of the statement that defines interior of set $Q$. Consider the negation from the definition of the interior of $Q$: 

$$
x\in Q: \forall \epsilon: \mathbb B_\epsilon(x) \not\subseteq Q
$$

Since $\mathbb B_\epsilon(x)$ contains $x$ which is $\in Q$, we have the negation of subset denoted as $\mathbb B_\epsilon(x) \cap Q \neq \emptyset$, and the gives the definition of the closure of a set. 

**Remarks**

* **Subtleties**: 
	* A set is closed if it has its own boundary inside of itself. 
	* A set can be both opened and closed, only opened or closed, or both. A set that is opened and closed would be $[a, b)$, and a set that is both opened and closed is $\mathbb R$. And *the empty set is closed and opened*. 

**Basic Examples**
* The empty set is open because we can't choose any element from it and exam its neighbour. The empty set is closed because for all element's neighbour, it intersects with the empty set, thus it's open trivially. The empty set is *clopen (closed and open)*. 
* The set $\mathbb Q$ is neither closed nor open. For every epsilon ball open around $x\in \mathbb Q$, there exists an irrational number. Hence it's not open. It's not closed because a sequence of rational numbers can converge to an irrational number. 
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
> \limsup_{a\rightarrow a} a_i = \lim_{i\rightarrow \infty}  \left\lbrace
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
>     \inf_{y\in \mathbb{B}_r(x)\setminus\{x\}} f(y)
> \right\rbrace
> $$
> The liminf as $y\rightarrow x$ on a function is the limit of the lower bound of function value mapping an epsilon ball centered at $x$ (excluding $x$). 

**Epsilon Balls**

$$
\mathbb{B}_r(x) = \{y: \Vert y - x\Vert_2^2 \le r\}
$$


---
### **A List of Topics**

More Topology Related
* [[Closure Topology]]
* [[Convex Sets Intro]]
* [[Interior Topology]]
* [[Affine Hull, Affine Span]]
* [[Relative Interior And Relative Boundary]]
* [[Compact and Bounded Sets]]

Sets and Convex Geometry related
* [[Convex Sets Intro]]
* [[Euclidean Space]]
* [[Lower Semi-Continuous]]
* [[Generating Cone of a Set]]
* [[Convex Hull, Convex Span]]