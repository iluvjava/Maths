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

Generally, for intuitive purposes, element of the set $X$ is called point. 

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
### **Completeness**

> A metric space is complete if for all Cauchy Sequence in the set, the limit of the sequence is in the set itself. 

$\mathbb Q$  Let the metric space be the absolute value. Then the set would not be complete because a sequence of rational can converge to an irrational after a limit, however, it's not in the set. 

$\mathbb R$ Let the metric space be the absolute value, then this set is complete. 