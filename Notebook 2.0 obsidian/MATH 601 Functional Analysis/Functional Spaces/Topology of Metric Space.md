- [[Metric Space Introduction]], [[../l-p Sequence Space]], 
- [[../../MATH 000 Math Essential/Analysis/Real Analysis Basics]], 
- [[../../MATH 000 Math Essential/Countability of Sets]]. 
- [[../../MATH 000 Math Essential/Topological Spaces]]


---
### **Intro**

A metric space is a topological space. Separability, Denseness, and completeness of the Metric Spaces and their derivatives. For the introduction, we define some of the concepts and then use theorems to paint a better picture for the topologies inside of a metric space. To start define a metric ball: 

$$
\begin{aligned}
	\mathbb B_r(\bar x|X) &= \{x\in X| d(x, \bar x) \le r\}
	\\
	\overline{\mathbb B}_r(\bar x|X) &= \text{cl}(\mathbb B_r(\bar x|X))
\end{aligned}
$$


To start, we define the concept of vicinity around any "point" in the metric space. Given $(X, d)$, we then define 

**Definition: An Open set**
> $A\subseteq X$ is open when for all $x\in A$ there exists $\epsilon > 0$ such that $\mathbb B_\epsilon(x)\in A$. 

**Definition: A Closed Set**
> $A\subseteq X$ is closed when $X\setminus A$ is open. 

**Remarks**: 

Sometimes we need the convergence in a metric space to characterize the property of a closed set, see [[Convergence, Completeness in Metric Space]]. 

**Definition: An Accumulation Point**

>Let $M\subseteq X$, with $x_0\in X$, $x_0$ is an accumulation point of M if for all $\epsilon > 0$, we have $\mathbb B_\epsilon(x_0|M)\setminus \{x_0\} \neq \emptyset$. 

**Observations**: 

- It's saying that the element $x_0$ is an accumulation point when it has neighbors in the subset $M$ that are infinitely close to itself. 
- The accumulation point of a set doesn't have to be in that set $M$, but it does have to be in the background set $X$. 
- It has to have some other neighbors that are not itself in $M$ that is as close we want them to be. 
- This is not exactly the same as the definition of a limit point in real analysis as that one doesn't require the point to be excluded $A\subseteq \mathbb R$. 
- If the union of all limit points of $A$ is the same as background set $X$, then the set $A\subseteq X$ is dense in the set $X$. 


**Theorem: Sequential Characterization of an Accumulation Point**

> $x_0 \in X$ is an accumulation point of $M$ if and only if for all $\epsilon > 0$, $\mathbb B_{\epsilon}(x_0)\setminus \{x_0\}$ contains point/points of $M$, i.e: there exists a sequence $(x_n)_{n\in \mathbb N}$ such that $\lim_{n\rightarrow \infty}x = x_0$ with $x_n \neq x \; \forall n \in \mathbb N$. 


**Proof**:

This theorem is analogous to the limit point in the real line, but instead of the absolute value, we have the metric, hence we are skipping the proof here. 

**Example: No Accumulation Points**

The set $\mathbb Z\subseteq \mathbb R$ with metric $|\cdot|$ is not having any accumulation point because all the points in the set are all singletons. 

**Definition: Points in Closure**

An element in the closure of some set is characterized by the neighborhood of that point. Recall that a point $x\in X$ (note necessarily in $M$) is an accumulation point  of $M\subseteq X$ if every neighborhood of $x$ has at least one point $y\in M$ such that $y\neq x$. Using this, we define points in the closure. 

> All points in $M$ union with all the accumulation points of $M$ is the closure of the set. It's also the smallest close set containing $M$.

That was the definition. 

**Definition: Dense Subset**

> A subset $A\subseteq X$ is dense when $\text{cl}(A) = X$. 

**Definition: A Separable Subset**

> $X$ is a separable metric space if it has a countable subset that is dense in $X$. 

**Note**: It has nothing to do with completeness. $\mathbb Q$ is a separable space, because it itself is a dense subset of itself, but, it's not complete. 

**Intuitive Explanations**: 

There is a subset that is countable such that it can cover almost every point in the set $X$ via the use of sequential limit. If this is not the case, then we can't really distinguish points "with enough precision" using limits on the metric for this metric space. Because a sequential limit only has countably many points. In fact, this is as much as I can explain, more in depth explanations for this concept requires general topology. Anyway, see [here](https://math.stackexchange.com/questions/770146/why-do-we-need-separability), a stack exchange post for more information. 

**Example: Separable Spaces**

The set $\mathbb R$ equipped with the usual $\Vert \cdot\Vert$ Euclidean space is separable because the closure of $\mathbb Q^n$, a countable subset gives us the space $\mathbb R^n$. The set of all rationals, $\Q^n$ is also separable, because the closure of the set is, itself, if the whole space is itself. 


---
### **Separability Examples**

Here we show that the sequence space $l_\infty$ is an example of separable space, and $l_2$ is an example of a non-separable metric space. 

**Claim: $l_2$ is Separable**
> The $l_2$ sequence space is a separable space. The sequence space equipped with 2-norm. 

**Proof Preparations**

Define $S_n$ to be the set of all $(x_1, x_2, \cdots, x_n, 0, 0, \cdots)$ sequences. By basic knowledge about countability of sets, we get that $\bigcup_{n\in \N} S_n$ is also a countable set. To show that the space is separable, we claim $\text{cl}(S_n) = l_2$, hence, it's a dense subset of $l_2$. 

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


**Claim $l^\infty$ is not Separable** 

> The set $l^\infty$, is not a separable sequence space. 

**Proof Preparations**:

We recall that $l_\infty$is the set of sequence equipped with the metric $\sup_{n\in \N}|x_i - y_i| = d(x, y)$. To proof, we consider the following uncountable subset of sequence space: 
$$
\begin{aligned}
    S = \left\lbrace
       (x_n)_{n\in \mathbb N}| x_n\in \{0, 1\}
    \right\rbrace, 
\end{aligned}
$$

which characterize a sequence of only ones and zero $\in l^\infty$. This is an uncountable set. The proof shows a contraction that, it's impossible to find a countable set $C\subseteq l_\infty$ such that for any $x, y\in S$, we can find $c_x, c_y$ close to each of those point, and if it were the case, then the set $C$ would be unctountable. 

**Proof**

By construction, let any $x, y\in S$ such that $x \neq y$, then $d(x, y) \ge 1$, however: 

$$
\begin{aligned}
    \mathbb B_{1/3}(x) \cap \mathbb B_{1/3}(y) = \emptyset. 
\end{aligned}
$$

$S$ is unctountable, this is a fact. If there exists some $C\subseteq l_\infty$ such that $\text{cl}(C) = l_\infty$, then there exists some $c_x, c_y\in C$ (by the fact that we can choose one element and approach the limit such that it's close enough to $x, y$) with: 

$$
\begin{aligned}
    c_x \in \mathbb B_{1/3}(x), c_y \in \mathbb B_{1/3}(y). 
\end{aligned}
$$

This would bring the contradiction that $C$ is also uncountable like $S$, hence, the space $l_\infty$ is not a separable set. This is concluded by the fact that for every $x, y$ we would need a distinct $c_x, c_y$ that is at least 1/3 away from $x, y$ under inf metric. 


**Claim $(\R, d)$ with a discrete metric is not separable**: 
> Allowed $d(x, y)$ to be the indicator function of $\mathbf 1\{x = y\}$, let the space to be tbe reals, then this metric space is not a Separable space. 

We use contradiction. If there were some subset $C \subseteq \R$ such that $\text{cl}(C) = \R$, meaning that for any $x\in \R$, for all $\epsilon > 0$, there exists $c_x\in C$ such that $d(c_x, x) \le \epsilon$, deriving a contradiction and hence, space is impossible to be separable. 

**Proof**: 

Let $C\subseteq \R$  be countable. For contradiction assume that $\text{cl}(C) = \R$, hence for all $x \in \R$, for all $\epsilon > 0$ there exists $c_x \in C$ such that $c_x\in\mathbb B_{\epsilon}(x)$. Make $\epsilon = 1/2$, then we have: 

$$
c_x \in \mathbb B_{1/2}(x) = \{x\}, 
$$

by the discrete metric. This is true for all $x \in \R$, therefore, $c_x$ is now uncountable, contradicting the assumption. This metric space is not separable. 

---
### **Topological Characterizations of Equivalence Metric**

> Let $d, d'$ be equivalent metrics, if and only if: 
> - $x_n\rightarrow x$ in $d$ if and only if $x_n\rightarrow x$ in $d'$. 
> - $M$ is open in d if and only if it is open in $d'$. 
> 
> Another sufficient (strictly stronger than needed) condition of equivalences between $d$ and $d'$ is:
> - there exists $\alpha, \beta > 0$ such that for all $x, y\in X$: $\alpha d(x, y) \le d'(x, y) \le \beta d(x, y)$

**Fact/Examples**:

Consider the metrics $\Vert \cdot\Vert_\infty$ and $\Vert \cdot\Vert_1$ defined for $C[0, 1]$, they are not equivalent metrics for the same space. One of the counter example to consider is simple the function $x^n$ as $n\rightarrow \infty$, under these different metric, they are converging to different number when measured under these 2 norms. More specifically, $\Vert x^n\Vert_1 \rightarrow 0$ but $\Vert x_n\Vert_\infty = 1\;\forall n\in \N$. Therefore, these 2 metrics are not equivalent. 

---
### **Completeness of Metric Space**

Similar to real analysis, where we discussed that a sequence is Cauchy if and only if it converges to a real number, here we use the Cauchy sequence and the convergence in metric space to define the concept of a complete metric space. See [[Convergence, Completeness in Metric Space]] for more details. 

---
### **Examples And Exercises**

Here is a good list of exercises from the textbook that will enhance our understanding of the matter. The specific examples that are incomplete spaces are interesting and they had been separated into: [[Examples of Incomplete, Complete Metrics Space]]. 

**Example: Interior of $l_+^\infty$ is Empty**

#UNFINISHED 
