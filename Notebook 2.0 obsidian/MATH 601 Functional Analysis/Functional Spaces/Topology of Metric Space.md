- [[Metric Space]], [[../Further Examples for Metric Space]]
- [[../../MATH 000 Math Essential/Analysis/Real Analysis Basics]], 
- [[../../MATH 000 Math Essential/Countability of Sets]]. 


---
### **Intro**

Separability, Denseness, and completeness of the Metric Spaces and their derivatives. For the introduction, we define some of the concepts and then use theorems to paint a better picture for the topologies inside of a metric space.


To start, we define the concept of vicinity around any "point" in the metric space. Given $(X, d)$, we then define 

**Definition: An Open set**
> $A\subseteq X$ is open when for all $x\in A$ there exists $\epsilon > 0$ such that $\mathbb B_\epsilon(x)\in A$. 

**Definition: A Closed Set**
> $A\subseteq X$ is closed when $X\setminus A$ is open. 

**Definition: Dense Subset**

> A subset $A\subseteq X$ is dense when $\text{cl}(A) = X$. 

**Definition: An Accumulation Point**

>Let $M\subseteq X$, with $x_0\in X$, $x_0$ is an accumulation point if for all $\epsilon > 0$, we have $\mathbb B_\epsilon(x_0)\setminus \{x_0\} \neq \emptyset$. 


**Observation**
- The accumulation point of a set doesn't have to be in that set $M$, but it does have to be in the background set $X$. 
- It has to have some other neighbors in $M$ that is as close we want them to be $M$. 
- This is not exactly the same as the definition of a limit point in real analysis as that one doesn't require the point to be part of the subset $A\subseteq \mathbb R$. 
- If the union of all limit points of $A$ is the same as background set $X$, then the set $A\subseteq X$ is dense in the set $X$. 


**Theorem: Sequential Characterization of an Accumulation Point**

> $x_0 \in X$ is an accumulation point of $M$ if and only if for all $\epsilon > 0$, $\mathbb B_{\epsilon}(x_0)\setminus \{x_0\}$ contains infinitely many points of $M$, i.e: there exists a sequence $(x_n)_{n\in \mathbb N}$ such that $\lim_{n\rightarrow \infty}x = x_0$ with $x_n \neq x \; \forall n \in \mathbb N$. 


**Proof**:

This theorem is analogous to the limit point in the real line, hence we are skipping the proof here. 

**Example:**
The set $\mathbb Z\subseteq \mathbb R$ with metric $|\cdot|$ is not having any accumulation point because all the points in the set is a singleton. 

**Definition: A Separable Subset**

> $X$ is a separable metric space if it has a countable subset that is dense in $X$. 

**Intuitive Explanations**: 

There is a subset that is countable such that it can cover almost every point in the set $X$ via the use of sequential limit. If this is not the case, then we can't really distinguish points "fine enough" using limits on the metric for this metric space. 

**Example: Separable Space**

The set $\mathbb R$ equipped with the usual $\Vert \cdot\Vert$ Euclidean space is separable because the closure of $\mathbb Q^n$, a countable subset gives us the space $\mathbb R^n$. 

---
### **Separability Examples**

Here we show that the sequence space $l_\infty$ is an example of incomplete space, and $l_2$ is an example of a complete metric space. 

**Claim**: 
> The $l_2$ sequence space is a separable space. 

**Proof Preparations**

Define $S_n$ to be the set of all $(x_1, x_2, \cdots, x_n, 0, 0, \cdots)$ sequences. Observe that $|S_n|$ by basic knowledge about countability of sets. Furthermore we get that $\bigcup_{n\in \N} S_n$ is also a countable set. To show that the space is separable, we consider $\text{cl}(S_n) = l_2$. 

**Proof**

Choose $x\in l_2$ then for all $\epsilon > 0$. There exists $N \in \mathbb N$ such that $\sum_{i =N}^{\infty} x_i^2 < \frac{\epsilon^2}{2}$. By the fact that the set $\Q^n$ is dense in $\R^n$, we can claim that there exists another sequence $r = (r_1, \cdots, r_{N -1})$ such that $\left(\sum_{i = 1}^{N - 1}(x_i - r_i)^2\right) < \frac{\epsilon^2}{2}$. Defining $y = (r_1, r_2, \cdots, r_{N - 1}, 0, \cdots, 0)$, then $y\in S$ obviously, and then we have: 
$$
\begin{aligned}
    (d(x, y))^2 &= \left(\sum_{i = 1}^{N - 1}(x_i - r_i)^2\right) + \left(\sum_{i = N}^{\infty}x_i^2\right) < \frac{\epsilon^2}{2} + \frac{\epsilon^2}{2} = \epsilon^2 \\
    \implies d(x, y) &< \epsilon.
\end{aligned}
$$

And therefore, for any size of $\epsilon$ we can approximate any sequence $x\in l_2$ close enough, this creates a sequence such that it converges to the point $x\in l_2$, and yet we are choosing a sequence of $l_2$ sequence such that $y_n$$(y)_{n\in N} \in S$, a countable set that we established at the start of the proof. 

**Intuitive Understanding**

For any sequence that is squared absolute convergence, we can establish the fact that the first $N - 1$ element can be approximated by some element from the dense set $S_n$, dense with relative to all finite sequence of length $N$, and then by the convergence property of the sequence, the tail $N$ sequence of term also converges to zero. Since both parts of the sequence in $l_2$ is converging to something, we carry out the proof with separate convergences. 


**Claim**: 

> The set $l_\infty$, is not a separable sequence space. 

**Proof Preparations**:

We recall that $l_\infty$is the set of sequence equipped with the metric $\sup_{n\in \N}|x_i - y_i| = d(x, y)$. To proof, we consider the following uncountable subset of sequence space: 
$$
\begin{aligned}
    S = \left\lbrace
       (x_n)_{n\in \mathbb N}| x_n\in \{0, 1\}
    \right\rbrace, 
\end{aligned}
$$

which characterize a sequence of only ones and zero. This is an uncountable set. The proof shows a contraction that, it's impossible to find a countable set $C\subseteq l_\infty$ such that we can let its limit point approaches points from the set $S$ using the given metric. 

**Proof**

By construction, let any $x, y\in S$ such that $x \neq y$, then $d(x, y) \ge 1$, however: 

$$
\begin{aligned}
    \mathbb B_{1/3}(x) \cap \mathbb B_{1/3}(y) = \emptyset. 
\end{aligned}
$$

If there exists some $C\subseteq l_\infty$ such that $\text{cl}(C) = l_\infty$, then there exists some $c_x, c_y\in C$ (by the fact that we can choose one element and approach the limit such that it's close enough to $x, y$) with: 

$$
\begin{aligned}
    c_x \in \mathbb B_{1/3}(x), c_y \in \mathbb B_{1/3}(y). 
\end{aligned}
$$

This would bring the contradiction that $C$ is also uncountable like $S$, hence, the space $l_\infty$ is not a separable set. This is concluded by the fact that for every $x, y$ we would need a distict $c_x, c_y$ that is at least 1/3 away from $x, y$ under inf metric. 


---
### **Topological Characterizations of Equivalence Metric**

> Let $d, d'$ be equivalent metrics, then: 
> - $x_n\rightarrow x$ in $d$ if and only if $x_n\rightarrow x$ in $d'$. 
> - $M$ is open in d if and only if it is open in $d'$. 

**Fact/Examples**:

Consider the metrics $\Vert \cdot\Vert_\infty$ and $\Vert \cdot\Vert_1$ defined for $C[0, 1]$, they are not equivalent metrics for the same space. One of the counter example to consider is simple the function $x^n$ as $n\rightarrow \infty$, under these different metric, they are converging to different number when measured under these 2 norms. 

---
### **Completeness of Metric Space**

Similar to real analysis, where we discussed that a sequence is Cauchy if and only if it converges to a real number, here we use the Cauchy sequence and the convergence in metric space to define the concept of a complete metric space. See [[Convergence in Metric Space]] for more details. 

---
### **Examples And Exercises**

Here is a good list of exercises from the textbook that will enhance our understanding of the matter. The specific examples that are incomplete spaces are interesting and they had been separated into: [[Example of Incomplete Metrics Space]]. 