[[Probability Spaces]]. 


---
### **Intro**

Infinite probability spaces are used for a set of outcomes $\Omega$ that is infinite.

**Disclaimer**: 
The textbook only uses infinite coin toss to introduce the concept, negating the mathematical rigor. And for the purpose of the class, it's enough and the lesson will be true, in spirit. 

---
### **Intersection of $\sigma$ Algebra**

Let $I$ be an index set then: 

$$
(\mathcal{F}_{i\in I}, \Omega) \text{ is } \sigma \text{ alg} \implies 
\bigcap_{i\in I} \mathcal{F}_i \text{ is $\sigma$ alg}
$$

Because, $\emptyset$ and $\Omega$ is in the set trivially, all sigma algebra contains these 2 sets. If $A$ is in $\bigcap_i\mathcal{F}_i$, then then certainly $A^C$ is in $\bigcap_i F_i$ because each sigma algebra has $A^C$, therefore, $A^C$ is in the intersections of all $\sigma$ Algebra. 


---
### **Generating Sigma Algebra**

$\mathcal{A}\subset \Omega$, then a $\sigma$ algebra can be generated on this subspace of outcomes. 

* Consider all the possible intersection between $a_i\in \mathcal{A}$, then consider all the complement. 
* Consider all the unions of $a_i\in \mathcal{A}$, then after this set, a sigma algebra is formed and: 

**Minimality**

> The sigma algebra generated will be the minimal. Which means that, among all the possible sigma algebra containing the set $\mathcal{A}$, the generated set will be the smallest. 

This is important to generating uncountable probability spaces. 



---
### **Construction of Uncountable Probability Spaces**

The conflict is that, Lebesgue Measure can't be extended to the power set of $(0, 1)$. In addition, we need Lebesgue measure to create probability spaces because of the properties of the measure. Let $p(x) = p$ for all $x\ in [0, 1]$, so that each number has equal probability of being chosen. Consider the probability that a chosen number is rational: 

$$
\begin{aligned}
    & \mathbb{P}\left(\mathbb{Q}\cap [0,1]\right) = \mathbb{P}\left(
        \bigcup_{x\in \mathbb{Q}\cap[0,1]} \{x\}
    \right) = \sum_{x\in \mathbb{Q}\cap[0, 1]}^{}
    p(x) = \sum_{x\in \mathbb{Q}\cap[0, 1]}^{} p = 0. 
\end{aligned}
$$

It's equal to zero because any singleton (no interior) has a measure of zero. Any $p > 0$ will give a measure of infinite on all the rational, therefore it has to be that $p = 0$.  With this knowledge, consider the sum of all the uncountable subsets of $[0, 1]$ and assigning probability to it, let the set be $B$ we have: 

$$
\mathbb{P}\left(\bigcup_{x\in B}\{x\}\right) = \sum_{x\in B}^{}p(x) = \sum_{x\in B}^{} 0 = 0
$$

By prior knowledge, we have $p(x) = 0$, and then we have zero. which actually mean any sub interval of $[0, 1]$ has a measure of zero. So we are doomed and a measure can't be constructed. 

> Uncountable additivity doesn't hold for probability measure. 

---
### **Lebesgue Measure on Unit Interval**

Specify $\mathbb{P}((b - a]) = b - a$ for all $0 \le a < b\le 1$. 

---
### **Borel $\sigma$ measure**

Consider generating on a subset of $[0, 1]$, using the set $\mathcal{A} := \{(a, b] :  0 \le a < b \le 1\}$

By the Caratheodory's Extension theorem, there is only one way to assign probability to set that are in the set $\sigma(\mathcal{A})$ but are not in $\mathcal{A}$. 

Such a generated sigma-algebra on all non degenerate intervals of the set is Borel Sigma Algebra, and it's denoted as $\mathcal{B}([0, 1])$. 

> This is the way to make a probability assignment on the Unit interval, it's using Borel Sigma Measure. 


