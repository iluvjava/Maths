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


---
### **Cauchy Convergence and Completeness**


**Definition: Cauchy Convergence Sequence**

> A sequence $(x_n)$ in $(X, d)$ is Cauchy if for every $\epsilon > 0$, there exists $N \in \N$ such that $d(x_n, x_m) < \epsilon$ for all $m, n > N$. 

**Observation**: 

- From basic analysis fact, a Cauchy sequence is the same as an convergence sequence. 
- The definition is very similar to the definition of closure, because a Cauchy sequence is a limit sequence, and hence it brings back to the definition of closure, however, they are also differen because the closure is for $M\subseteq X$ but completeness is only focused on the background set and its metric. Different focus. 

**Definition Completeness**: 

> $(X, d)$ is a complete metric space if every Cauchy sequence in $(X, d)$ in the space converges to a limit that is in $X$. 



