### **Intro**

Metric space is a function defines over a set $S\times S$ and returns a non-negative real number that gives a sense of distance between any 2 elements in the set. For any 2 elements $x, y, z$ from $S$ the following must be true for the definition of a metric $d$: 

$$
\begin{aligned}
    & d(x, y) = 0 \iff x = y
    \\
    & g(x, y) = g(y, x)
    \\
    & g(x, z) + g(z, y) \ge g(x, y)
\end{aligned}
$$

**Remarks**

Generally, for intuitive purposes, element of the set $X$ is called point. This make sense due to the wide application of metrics to vector space. 

**References**: 
- \<Introductory Functional Analysis with Applications\> 

---
### **Subspace**

A subspace $(Y, \tilde d)$ of the metric space $(X, d)$ is where $Y\subseteq X$ with $\tilde d$ being an restriction to $Y\times Y$. 

The first 2 axioms are trivially true, however, to verify that the subspace is again a metric space, we need to prove that the triangle inequality axiom holds. 

---
### **Example: Sequence Space L-Inf**

> Any sequence $(x_n)_{n\in \mathbb N}$ where $x_n\in \mathbb C$ is a complex sequence such that $|x_n|\le \infty$. Given metric $d(x, y)$ as $\sup_{i\in \mathbb N}|x_i - y_i|$ for the complex sequence. 

---
### **Example: Function Space**

> Let $C[a, b]$ denotes real functions defined on the closed interval $[a, b]$ such that it's continuous. Then the metric $d(x, y) := \max_{x\in [a, b]} |x(t) - y(t)|$ is a metric. 


---
### **Example: Discrete Metric Space**

> Suppose that we were given any non-empty set $X$ and define the metric $d(x, y)$ such that $d(x, y) = 1$ whenever $x \neq y$, and $=0$ whenever $x = y$, then $(X, d)$ still would form a metric space and this is an example of: discrete metric space. 

**Remarks:** 

Remember that a classification error matrix for multi-class labeling in machine learning is an example of such a discrete metric. In a more general sense, the number of edges for the *shortest path* between 2 vertex in a graph can also be a discrete metric. 

> Hamming Distances. The number of differences in bits in 2 bits stream with the same length. One can view this as an 1-norm applied directly on a vector of binary values. 

---
### **More Examples**

See [[Further Examples for Metric Space]] for more. 

---
### **Vector Space with a Norm**

> Given any vector field $(V, F, \Vert\cdot \Vert)$ denoting the vectors and the scalars and a norm function that maps the vector to the non-negative reals, then this space is a normed vector space. 
>
**Remarks**

Matrices and vectors, this forms the axiomatic foundations for numerical linear algebra, and the norm creates the "metric" components for numerical linear algebra. 

---
### **Topologies**

There are a lot of things related to the the topologies for Metric Spaces.


---
### **Equivalences of Metrics**

> Let $d, d'$ be metrics on $X$, $d$ and $d'$ are equivalent if there exists $a, b > 0$ such that: 
> 
> $$
> ad'(x, y) \le d(x, y) \le bd'(x, y) \; \forall x, y\in X. 
> $$

**Remarks**: 

This fact in itself is not useful, please see the [[Topology of Metric Space]] for a topological and convergence characterizations of metrics that are equivalent to each other. The inequality will limit the convergence due, a direct application of squeeze theorem, giving equivalent metrics the same limit for the same converging sequence. 

The example metric: [[../Further Examples for Metric Space]], contains p-norm in the Euclidean space, and all p-norm for $p \ge 1$ is equivalent. 