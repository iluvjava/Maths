[[Topology of Metric Space]]


---
### **Intro**
Using the topology of a metric space and the metric together with real analysis, we can model the convergence some entities in the metric space, algebraic or not, using the definition of the metric. As usual, we define the concept of a epsilon ball vicinity $\mathbb B_r(x) = \{y| d(x, y) < r\}$ to be the point that is $r$ distance away for the given metric. 


**Definition: Bounded Subset**

> A subset $M\subseteq M$ is a bounded set if there exists a $x\in X$, $r > 0$ such that $M \subseteq\mathbb B_{r}(x)$. 

**Theorems:**

> Let $(X, d)$ be a metric space and $(x_n), (y_n)$ to be sequence in $X$, the: 
> - if $(x_n)$ is converging, then it's bounded and its sequence is going to be an unique element in $X$. 
> - if $x_n\rightarrow x$ and $y_n\rightarrow y$ as $n\rightarrow \infty$, then $d(x_n, y_n) \rightarrow d(x, y)$. The limit of the metric is the metric of their limit. 

**Proofs**: 

It's not hard and I will skip it for not and has a tag: #UNFINISHED for this. 

**Theorem: Complete Subspace Topological Characterizations**
> Let $M\subseteq X$ be a subspace of the metric space $(X, d)$, then the metric space is complete if and only if the set $M$ is closed in the set $X$.

**Remarks**

This theorem provides an alternative to showing that a particular subspace of a metric space is complete or incomplete. We now show that $M\subseteq X$ to be incomplete by showing that every limit point of the set is a member of the set, the alternative negates the need to use the Cauchy convergence sequence, which sometimes very complicated to use. It also provides a way of showing that a closed subspace is gong to be complete. 

For example about what metric spaces are complete and what is not, consider visiting: [[Examples of Incomplete, Complete Metrics Space]] for more examples. 

---
### **Cauchy Convergence and Completeness**


**Definition: Metric Cauchy Convergence Sequence**

> A sequence $(x_n)$ in $(X, d)$ is Cauchy if for every $\epsilon > 0$, there exists $N \in \N$ such that $d(x_n, x_m) < \epsilon$ for all $m, n > N$. 

**Observation**: 

- From basic analysis fact, a Cauchy sequence is the same as a convergence sequence. But we don't know what exact value the sequence is going to converge to. This definition is saying that we have a converging sequence that is converging to some point that is not in the space, and we don't necessarily know what that point is. 
- The definition is very similar to the definition of closure, because a Cauchy sequence is a limit sequence, and hence it brings back to the definition of closure, however, they are also different because the closure is for $M\subseteq X$ but completeness is only focused on the background set and its metric. Different focus. 

**Definition Completeness**: 

> $(X, d)$ is a complete metric space if every Cauchy sequence in $(X, d)$ in the space converges to a limit that is in $X$. 


**Examples**: 

- The Euclidean norm equipped with $\R^n$ and the p-norm metric form s complete metric space. 
- The subset of all the rationals in the metric space is not forming a complete metric space. 

