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

- From basic analysis fact, a Cauchy sequence is the same as a convergence sequence. But we don't know what exact value the sequence is going to converge to. This definition is saying that we have a converging sequence that is converging to some point that is not in the space, and we don't necessarily know what that point is. 
- The definition is very similar to the definition of closure, because a Cauchy sequence is a limit sequence, and hence it brings back to the definition of closure, however, they are also different because the closure is for $M\subseteq X$ but completeness is only focused on the background set and its metric. Different focus. 

**Definition Completeness**: 

> $(X, d)$ is a complete metric space if every Cauchy sequence in $(X, d)$ in the space converges to a limit that is in $X$. 


---
### **Quick and Dirty Incomplete Spaces**

**Example: $\mathbb Q$**: 
> The set $\mathbb Q$ equipped with $|\cdot|$ is not complete, because the limit of a sequence of rationals can easly become an irrational number. 

Therefore, this is an incomplete metric space. 

**Example: Polynomials**: 
> Let $X$ be the set of polynomial on a closed interval $[a, b]$, then the metric $\Vert \cdot\Vert_\infty$ is incomplete. 

Any polynomial that converges uniformally to some real function $f$ on $[a, b]$ that is not a polynomial is an example of a Cauchy sequence that punch a hole in this set after the limit. Uniform convergence is need for this matric: $\Vert \cdot\Vert_\infty$. Therefore this is incomplete. 

**Example: Continuous Funtion**

> Let $(X, d)$ be metric space where $X$ is the set of functions that is continuous on $[0, 1]$. Let $d$ be the $\Vert \cdot\Vert_1$ metric for functions. 

The space is incomplete, consider the function $f_m(x)$ paramaterized by $m \le 1/2$ defined as the following: 

$$
\begin{aligned}
    f_m(x) = \begin{cases}
        0 & x \in [0, 1/2],
        \\
        \min(x/m, 1) & \text{else}, 
    \end{cases}
\end{aligned}
$$
then this function is converging as $m \rightarrow 0$ under the metric, however, this function is piece-wise linear and it has a vertical line at $x=1/2$, a discontinuous function if we insist on taking the limit $m\rightarrow \infty$. 

For more complicated examples for incomplete metric spaces, view [[Example of Incomplete Metrics Space]]. 