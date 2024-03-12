### **Intro**

Metric space is a function defines over a set $S\times S$ and returns a non-negative real number that gives a sense of distance between any 2 elements in the set. For any 2 elements $x, y, z$ from $S$ the following must be true for the definition of a metric $d$: 

$$
\begin{aligned}
    & d(x, y) = 0 \iff x = y
    \\
    & d(x, y) = d(y, x)
    \\
    & d(x, z) + d(z, y) \ge d(x, y)
\end{aligned}
$$

**Remarks**

Generally, for intuitive purposes, element of the set $X$ is called point. This make sense due to the wide application of metrics to vector space. 

**References**:
Introductory Functional Analysis with Applications, Kreyszig.

---
### **Subspace of Metric Space**

A subspace $(Y, \tilde d)$ of the metric space $(X, d)$ is where $Y\subseteq X$ with $\tilde d$ being a restriction to $Y\times Y$. 

The first 2 axioms are trivially true, however, to verify that the subspace is again a metric space, we need to prove that the triangle inequality axiom holds. 

---
### **Example | Sequence Space $l^\infty$**

> Any sequence $(x_n)_{n\in \mathbb N}$ where $x_n\in \mathbb C$ is a complex sequence such that $|x_n|\le \infty$ for all $n\in \mathbb N$. Given metric $d(x, y)$ as $\sup_{i\in \mathbb N}|x_i - y_i|$ for the complex sequence. 

---
### **Example | Function Space**

> Let $C[a, b]$ denotes real functions defined on the closed interval $[a, b]$ such that it's continuous. Then the metric $d(x, y) := \max_{x\in [a, b]} |x(t) - y(t)|$ is a metric. 

---
### **Example | The Sequence Space $l_+^2$**
> Let $(x_n)_{n\in \Bbb{N}}$, then all sequence such that $\sum_{n=1}^{\infty}x_n^2 < \infty$, with $x_n \ge 0$ for all $n\in N$, with metric $d(x, y) = \sum_{i=1}^{\infty}(x_n - y_n)^2$ defines a metric space. 


---
### **Example | Discrete Metric Space**


#### **Example 1 | Indicator Metric**
> Suppose that we were given any non-empty set $X$ and define the metric $d(x, y)$ such that $d(x, y) = 1$ whenever $x \neq y$, and $=0$ whenever $x = y$, then $(X, d)$ still would form a metric space and this is an example of: discrete metric space. 

**Remarks** 

Remember that a classification error matrix for multi-class labeling in machine learning is an example of such a discrete metric. 
In a more general sense, the number of edges for the *shortest path* between 2 vertex in a graph can also be a discrete metric. 
The continuous analog of the shortest path metric is the geodesic. 

However, one can make the underlying space to be $X$, then this metric has several surprises to it.
1. Not separable. 
2. Not dense. 
3. Not continuous. 

If the space $X$ is infinite. 


#### **Example 2 | Hamming Distances**
> The number of differences in bits in 2 bits stream with the same length. One can view this as an 1-norm applied directly on a vector of binary values. 

#### **Example 3 | Shortest Path on Graph**
> The shortest $x-y$ path of a graph containing no negative directed cycles induces a metric for all the vertices in the graph. 

See [Single Source Shortest Path Optimality Conditions](../../CSE%20000%20Basics%20Algorithms/Single%20Source%20Shortest%20Path%20Optimality%20Conditions.md) for more information on this discrete metric. 

#### **Example 4 | The P-adic Metric** 
> It's a metric used for the P-adic field. For more about this field, this is the [wiki](https://en.wikipedia.org/wiki/P-adic_number). 



---
### **More Examples**

See [l-p Sequence Space](../l-p%20Sequence%20Space.md) for more. 

---
### **Vector Space with a Norm**

> Given any vector field $(V, F, \Vert\cdot \Vert)$ denoting the vectors and the scalars and a norm function that maps the vector to the non-negative reals, then this space is a normed vector space. 

**Remarks**

Matrices and vectors, this forms the axiomatic foundations for numerical linear algebra, and the norm creates the "metric" components for numerical linear algebra. 

---
### **Topologies**

There are a lot of things related to the the topologies for Metric Spaces. See [[Topology of Metric Space]] for more information. 


---
### **Convergences**

Sometimes, when there are infinitely many things in the metric space, one would like to characterize specific elements in it via limit, please read [Convergence, Completeness in Metric Space](Convergence,%20Completeness%20in%20Metric%20Space.md) for more information. 

---
### **Equivalences of Metrics**

We introduce 2 type of equivalence between metric spaces. These are just the standard math stuff and can be found as a wiki topic [here](https://en.wikipedia.org/wiki/Equivalence_of_metrics). 

#### **Thm | Strong Equivalence Conditions**
> Let $d, d'$ be metrics on $X$, $d$ and $d'$ are strongly/bilipschitz equivalent if there exists $a, b > 0$ such that: 
> 
> $$
> ad'(x, y) \le d(x, y) \le bd'(x, y) \; \forall x, y\in X. 
> $$

**Remarks**: 

This fact in itself is not useful, please see the [[Topology of Metric Space]] for a topological and convergence characterizations of metrics that are equivalent to each other. The inequality will limit the convergence due, a direct application of squeeze theorem, giving equivalent metrics the same limit for the same converging sequence. 

The example metric: [l-p Sequence Space](../l-p%20Sequence%20Space.md), contains p-norm in the Euclidean space, and all p-norm for $p \ge 1$ is equivalent. 

This becomes important when we discuss about [[Finite Dimensional Normed Space]]. Because finite finite dimensional, normed spaces, as a stronger type of metric spaces, has equivalences for all possible norms in the space. A very strong results. 


#### **Thm | A Weaker Equivalence Conditions**
> Let $X$ be a set and $d_1, d_2$ be metrics in that set then they are equivalence if, The identity mapping between the space $(X, d_1)$ and $(X, d_2)$ are continuous and its inverse is also continuous. 

**Observations**

Using the topological characterization of a continuous mapping, the above conditions is equivalence of saying that, $d_1, d_2$ are equivalence if and only if, any open set under $d_1$ is also an open set under $d_2$. 



---
### **Isometry**

Definition directly taken from [wiki](https://en.wikipedia.org/wiki/Isometry). 

#### **Def | Metric isometry**

> Let $X,Y$ be metric spaces with metrics $d_X, d_Y$, let $f$ be a functional $X\mapsto Y$, this functional is call isometry if it's distance preserving, meaning that $d_X(x, y) = d_Y(f(x), f(y))$. 