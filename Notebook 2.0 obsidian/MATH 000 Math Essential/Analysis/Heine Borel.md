- [Topological Spaces](../Topological%20Spaces.md). 
- [Real Analysis Basics](Real%20Analysis%20Basics.md). 
---
### **Intro**

The theorem is rooted in topology and it defines compactness in topological spaces, and it only becomes closed and bounded in finite Euclidean spaces. 
See [here](https://en.wikipedia.org/wiki/Heine%E2%80%93Borel_theorem) for more info. 
In finite dimensional Banach space, the theorem states the equivalence between closed and bounded condition, and existence of sub-sequential convergence. 
For information regarding sequential compactness, see [Compactness in Metric Spaces](../../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Functional%20Spaces/Compactness%20in%20Metric%20Spaces.md) for more details. 

#### **Def | Sequential compactness**
> A metric space $X, d$ is sequentially compact if and only if all the sequence in $X$ has a convergent subsequence. 

#### **Def | Topological compactness**
> A topology $X$ is compact if and only if for all open cover of $X$, there also exists a finite subcover of $X$. 

We note that an open cover is simply a family of $X$ with open sets such that $X$ is contained within it. 
This file demonstrates the principle of Heine Borel in the context of real analysis on the set $\R$. 
But in general we have: 
1. Sequential compactness is equivalent closed and bounded in finite dimensional Banach spaces. 
2. Sequential compactness in metric space defines compactness but being closed and bounded is no longer sufficient for sequential compactness. 
3. Sequential compactness has nothing to do with compactness in non-metrizable topological spaces. 

**References**

1. an undergraduate friendly textbook: **Measure, Integration, and Real Analysis by Sheldon Axler.** 
2. [UCLA Notes](https://www.ucl.ac.uk/~ucahad0/3103_handout_2.pdf). 


#### **Def | Open cover on $\R$, finite subcover**
> Let $A \subseteq \R$. 
> 1. A collection of $\mathcal C$ of open subsets of $\R$ is called an **open cover** if, $A \subseteq \bigcup_{C \in \mathcal C} C$, i.e: A is contained in the union of all the sets in $\mathcal C$. 
> 2. An open cover is said to have **finite sub cover** if there exists $|I| < \infty$ such that $C_i \in \mathcal C$ for all $i \in I$ and $A \subseteq \bigcup_{i \in I}C_i$; i.e: The set $A$ is contained within a finite subset of open cover $\mathcal C$. 


---
### **Heine Borel in the Reals**

We consider the equivalence of compactness and the Heine Borel theorem in the real line. 
We show that, any closed intervals in $\mathbb R$ can be covered using finite many open covers, and then we use this fact to generalize the result to all closed and bounded sets. 

#### **Lemma | Closed and bounded interval has finite sub cover for all coverings**
> For all open cover of the closed and bounded interval $[a, b]\subseteq \mathbb R$, it has a finite sub cover of $[a, b]$. 

**Observations and Context**

1. If the set of points in a topology (i.e: The interval $[a, b]$) is finite, then for every open covers of the set, will have a finite sub cover that also covers the set. 

**Proof**

$[a, b]$ is a closed interval, Let $C_{[a, b]}$ be a any open cover of $[a, b]$. 
Define $D$, a set containing all the closed sub interval that has finite sub covers from $C_{[a, b]}$, i.e: 

$$
\begin{aligned}
    D:= \left\{
        d \in [a, b]
        \left|
            [a, d] \subseteq \bigcup_{i\in J \subseteq I} G_i, 
            |J|\in \mathbb N
        \right.
    \right\}.
\end{aligned}
$$

Then, the followings are true: 

1. $D\neq \emptyset$ because $a\in D$. Choose any open $G$ s.t: $a \in G$, then $a \in G \in C_{[a, b]}$ so $a \in D$. 
2. By completeness of $\mathbb R$ and $D \neq \emptyset$, there exists $s = \sup D$. 

By the construction of $D$, $s \le d$. The proof followed shows that $s < d$ gives contradiction hence $s = d$. 

Since $D\subseteq [a, b]$, we have $s = \sup D \le b$. 
For contradiction let $s < b$. 
There exists $s\in G_s$ where $G_s$ is an open set by property of $\R$, then $G_s \in C_{[a, b]}$ is valid.
Since $G_s$ is open, $\exists \delta > 0 : (s - \delta, s + \delta) \in G_s$. 
Next we consider $d \in G_s, d' \in G_s$ where $d \le s \le d'$. 

There exists $d \in (s - \delta, s]$ then $d \in [a, s] \subseteq D$ hence finite open cover exists, and it follows: 
$$
\begin{aligned}
    \exists n \in \N: [a, d] \subseteq \bigcup_{i = 1}^n G_i. 
\end{aligned}
$$

There exists $d \le d'\in [s, s + \delta)$ also, and it follows: 

$$
\begin{aligned}
    [a, d'] \subseteq \left(
        \bigcup_{i = 1}^n G_i
    \right)\cup G_s. 
\end{aligned}
$$

Hence, $d' \in D$ as well. 
If $s < b$, then $s < d'\in D$ exists, and it breaks $s = \sup D$. 
Therefore, it has to be that $s = b$. 


**Remarks**

Proofs may be extended to finite dimensional Banach space using the construction of hypercubes. 
Without loss of generality a unit hypercube can be used because things can be rescaled. 


#### **Thm-1 (2.12) | Heine Borel in Reals**
> Every open cover of a closed bounded subset of $\mathbb R$ has a finite subcover. 

**Proof**

Using the previous lemma, we are ready to prove the theorem in $\mathbb R$. 
To show, let $F\subseteq \R$ be closed and bounded. 
Let $\mathcal C$ be an open cover of $F$ in $\mathbb R$. 
It remains to show that there exists a subset of $G_i \in \mathcal C \;\forall i = 1, \ldots, n$ such that $F \subseteq G_1\cup \ldots\cup G_n$.

$F$ is bounded hence there exists $a, b$ such that $F \subseteq [a, b]$. 
$F$ is closed hence $\R \setminus F$ is open. 
Then $\mathcal C \cup \{\R \setminus F\}$ is an open cover of $\R$, therefore it's also an open cover of $[a, b]$. 
Using the lemma there exists $G_i, i \in \{1, \ldots, n\}$ such that $[a, b] \subseteq \bigcup_{i = 1}^n G_i$. 
Of course, this is not yet related to $F$, but it implies that 

$$
\begin{aligned}
    F\subseteq [a, b] &\subseteq \left(
        \bigcup_{i = 1}^n G_i
    \right)\cup \{\R \setminus F\}
    \implies
    F\subseteq
    \left(
        \bigcup_{i = 1}^n G_i
    \right).
\end{aligned}
$$

Since, there is no intersection between $F, \R \setminus F$. 


----
### **Heine Borel in General**

In this section we illustrate the concept of compactness for a complete metric space $(M, d)$. 


#### **Def | Totally Bounded**
> A complete metric space $(X, d)$ is totally bounded is equivalent to all the following: 
> 1. For every $\epsilon > 0$, there exists a cover of finite many open/closed epsilon ball for $X$. 
> 2. For every $\epsilon > 0$, there exists a finite subset $F = \{x_i\}_{i = 1}^n$ such that $\dist(F, x) < \epsilon$ for all $x \in X$. 

**Observations**

These two conditions are indeed equivalent to each other. 

(1.) If finite open balls forms a cover for $X$, then so does closed balls because they are super sets of the open balls. 
Suppose that a collection of $\mathbb B_\epsilon(x_n)\;\forall n \in \N$ closed balls covers $X$. 
Then for all $\delta > \epsilon$, the collection of $\mathbb B_\delta(x_n) \;\forall n \in \N$ covers $X$. 

(2.) is true when (1.) is assumed because the set $F$ being the center of all the balls would satisfy the conditions we want. 


#### **Theorem 1 | Equivalent characterization of compact subsets**
> $X \subseteq M$ is compact is equivalent to all the following: 
> 1. For all collection of closed $C_i \subseteq X$ with $i \in I$ such that $\bigcap_{i \in I}C_i \cap X = \emptyset$, there exists a finite subcollection of $J \subseteq I$ such that $\bigcap_{j \in J}C_j \cap X = \emptyset$. 
> 2. If $C_i, i \in I$ is a collection such that for all finite subcollections $J \subseteq I$ it has $\bigcap_{j \in J} C_j \cap X \neq \emptyset$ then the collection $C_i$ has $\bigcap_{i \in I} C_i \neq\emptyset$. 

**Proof**

We first show that (1.) and (2.) are equivalent. 
And then we show that (1.) is equivalent to $X$ being compact by the open cover definition of compactness. 
(1.), i.e: 

$$
\begin{aligned}
    \left(
        \forall C_i \subseteq X: C_i \text{ closed }
    \right): 
    \left(
        \bigcap_{i \in I} C_i \cap X = \emptyset
    \right)
    \implies 
    \left(
        \exists J \subseteq I, |J| < \infty: 
        \bigcap_{j \in J} C_j \cap X = \emptyset
    \right), 
\end{aligned}
$$

Taking the contrapositive it says that 

$$
\begin{aligned}
    \left(
        \forall C_i \subseteq X: C_i \text{ closed }
    \right): 
    \left(
        \forall J \subseteq I, |J| < \infty: 
        \bigcap_{j \in J} C_j \cap X \neq \emptyset 
    \right)
    \implies \left(
        \bigcap_{i \in I} C_i \cap X \neq \emptyset
    \right). 
\end{aligned}
$$

i.e: (2.). 

It remains to show that compact $X$ is equivalent to (1.). 
To show that we need to complete 2 implications relations: $\implies, \impliedby$ between the compactness definition on $X$, and statement (1.). 

**To show** $\implies$, we assume that $X \subseteq M$ is compact, i.e: all open cover has a finite subcover, we also assume an arbitrary collection of closed sets whose intersection with $X$ is empty; we show that there must exist a finite subset of the collection of closed set such that it also has empty intersection. 

Let $C_i \subseteq X \;\forall i \in I$ be a family of closed sets such that it doesn't intersect with $X$, so 

$$
\begin{aligned}
    \bigcap_{i \in I} C_i \cap X &= 
    X \cap \left(
        \bigcap_{i \in I} C_i
    \right) = \emptyset
    \\
    \iff 
    \bigcup_{i \in I} C_i^\complement \cup X^\complement &= M & \text{ Taking complement. }
    \\
    \implies 
    \bigcup_{i \in I}
    X\cap C_i^\complement\cap X^\complement &= 
    X \cap M = X
    \\
    \iff 
    \bigcup_{i \in I}
    C_i^\complement
    &= X. 
\end{aligned}
$$

Because $C_i^\complement$ is open, therefore it is an open cover of $X$. 
Using the fact that $X$ is compact, there exists a finite subcover of $X$, i.e: there exists $J \subseteq I$ with $|J|< \infty$, and it has 

$$
\begin{aligned}
    X &\subseteq \bigcup_{j \in J} C_j^\complement
    = \left(
        \bigcap_{j \in J} C_j
    \right)^\complement
    \\
    \iff 
    X^\complement 
    &\supseteq
    \bigcap_{j \in J} C_j
    \iff 
    \bigcap_{j \in J} X\cap C_j = \emptyset. 
\end{aligned}
$$

Therefore, there exists $C_j, j \in J$ such that it's a finite subset where it has empty intersection in $X$. 

**To show** $\impliedby$, we consider any type open collection $O_i \subseteq X$ such that it covers $X$, then we use the empty intersection property of closed sets to show that there also exists a finite subcover for $X$. 
Since we had the open cover, we have 

$$
\begin{aligned}
    X 
    &\subseteq \bigcup_{i \in I}O_i
    \\
    X^\complement 
    &\supseteq 
    \bigcap_{i \in I} O_i^\complement
    \\
    \iff
    \emptyset  &= 
    \bigcap_{i \in I} O_i^\complement \cap X. 
\end{aligned}
$$

$O_i^\complement$ is always a closed set, therefore it exists a finite subset of collection indexed by $J \subseteq I$ such that they also have empty intersection. 
Therefore, it has 

$$
\begin{aligned}
    \emptyset &= \bigcap_{j \in J} O_j^\complement \cap X
    = X \cap \left(
        \bigcap_{j \in J} O_j^\complement
    \right)
    \\
    \iff 
    & X^\complement \supseteq
    \bigcap_{j \in J} O_j^\complement
    \\
    \iff 
    X 
    &\subseteq \bigcup_{j \in J} O_j.
\end{aligned}
$$

And therefore, we have a finite subcover for the set $X$. 


#### **Def | Relative Finite intersection property**
> A collection of closed set $C_i \subseteq M$ with index set $i \in I$ has finite intersection property relative to $X \subseteq M$ if and only if for all $J \subseteq I$ with $J$ finite, we have $\bigcap_{j \in J} C_j\cap X \neq \emptyset$.

#### **Corollary 1 | Equivalent Characterizations of compact subsets**
> $X \subseteq M$ is compact if and only if for all closed sets $C_i \in M$, $i \in I$ such that it has finite intersection relative to $X$ then it has $\bigcap_{i \in I} C_i\cap X \neq \emptyset$. 

**Proof**

This is just Theorem 1 rephrased. 



#### **Theorem 2 | Equivalent conditions for compactness of metrizable space**
> Let $(X, d)$ be a metric space then the following conditions about compactness are all equivalent. 
> 1. $X$ is compact, and every open cover has a finite subcover. 
> 2. Every collection of closed sets in $X$ with finite intersection property has non-empty intersection. 
> 3. $X$ is sequentially compact. 
> 4. $X$ is totally bounded and complete. 

**Proof**

Corollary 1 showed that (1.) is equivalent to (2.). 
We will now show (2.) implies (3.). 

**(2.) implies (3.)**

Choose a sequence $\{x_i\}_{i \in \N}$, define the subsequence as a set $F_n = \text{cl}\{x_i : i \ge n\}$ then the set has $F_1 \supseteq F_2\supseteq F_3 \supseteq \ldots \supseteq F_n \supseteq\ldots$. 
Proceeding stepwise, we wish to show the following key intermediate steps. 

- $\exists\; \bar x \in \bigcap_{n \in \N} F_n$. 
- $\exists k_1, k_2, \ldots: x_{k_n}\rightarrow \bar x$.

Suppose that we have finite collection $k_1, k_2, \cdots, k_n$, then their intersection will be $F_{k_n}$ which is non-empty. 
Since all $F_n$ are closed sets by definition, (2.) implies $\exists \bar x \in \bigcap_{n \in\N}F_n$. 

The set $F_n$ is closed for all $n \in \N$, we have for all $\epsilon > 0$, $\mathbb B_\epsilon(\bar x) \cap F_n \neq \emptyset \; \forall n \in \N$. 
Inductively, suppose that we have $x_{k_n}$ with $\mathbb B_{1/k}(\bar x)\ni x_{k _n}$. 
$F_{k_n}$ is closed and $\bar x \in F_{k_n}$ then $\mathbb B_{1/(k + 1)}(\bar x)\cap F_{k_n} \neq \emptyset$ then there exists a new value of $x_{k_{n + 1}} \in \mathbb B_{1/(k + 1)}(\bar x)\cap F_{k_n}$ where $k_{n + 1} > k_n$. 
To choose first such element, $x_{k_1}$, use closure of $F_1$. 
Then, we constructed a subsequence $x_{k_n} \rightarrow \bar x$. 


**(3.) implies (4.)**

To complete the proof, we consider the following key intermediate steps: 
- **Part I:** A Cauchy sequence has a limit in $X$ necessarily has a limit in $X$ hence $X$ is complete. 
- **Part II:** Suppose that the set $X$ is not totally bounded, i.e: there is a sequence $x_n$ and $\epsilon > 0$ such that for all $i< j \in \N$, $d(x_i, x_j) > \epsilon$, then such a sequence obviously doesn't have a convergent subsequence, which is a contradiction against (3.). 

Let's do **(Part I)**. 
Let $x_n$ be Cauchy in $X$, because $X$ is sequentially compact, we have a convergent subsequence $x_{k_n}\rightarrow \bar x \in X$. 
Because the sequence is Cauchy, the sequence has the same limit as the subsequence and hence $X$ is complete because its definition is fulfilled. 

Let's do **(Part II)**. 
Suppose that there exists $\epsilon > 0$ such that for all finite collections of $\{x_i: i = 1, \ldots, n\}$, for all $x \in X$, it has $d(x, x_n) \ge \epsilon \;\forall i= 1, \ldots, n$. 
Suppose that we add a new $x_{n + 1}$ to the collection. 
Since a finite cover is not possible we have $x_{n + 1} \in X$ and $x_n \not \in \mathbb B_\epsilon(x_{i})\;\forall i = 1, \ldots, n$. 
By induction, we showed that there is a sequence $(x_n)_{n \in \N}$ such that $d(x_i, x_j) \ge \epsilon$ for all $i \neq j \in \N$. 
Such a sequence cannot converge because for all $x \in X$, the set $\mathbb B_\epsilon(x)\cap\{x_n\}_{n \in \N}$ is a singleton, or an empty set, no cluster point can form on any such $x$. 
Hence, it is a contradiction of compactness, therefore the set must be totally bounded and there is a finite open ball cover for all $\epsilon > 0$ on $X$. 


**(4.) implies (1.)**

The proof is achieved through a proof by contradiction. 
For contradiction, we will assume that $X$ is totally bounded and complete, but there exists a collection of open sets $O_i, i\in I$ such that none of the finite sub collection can cover $X$. 
We will aim for the following key intermediate steps. 
1. **Step I**: Construct a finite epsilon ball with radius 1/2 covers for $X$ using the total boundedness of $X$, then at least one of the epsilon ball requires an infinite open cover. 
2. **Step II**: We construct a Cauchy sequence $x_n$ using the results from **(Step I)** and it converges to a point $\bar x \in X$. 
3. **Step III**: We derive a contradiction and show that the convergent sequence has a finite cover around $\bar x$ which contradicts (**Step I**). The epsilon ball has to be compact as well. 


**Step I**. 
Let $O_i, \forall i \in I$ be an open cover of $X$. 
Fix any $\epsilon > 0$, Since $X$ is totally bounded, there exists a finite cover of epsilon ball for $X$ centered at $x_{1, i}$ for $i = 1, \ldots, n_1$. 
Let $\mathcal U = \bigcup_{i \in I} C_i$ be an open cover of the set $X$ such that no finite subcover covers $X$. 
By the pigeon hole principle, one of the epsilon ball: $\mathbb B_{\epsilon}(x_{1, i_1})$ cannot be covered by any finite subcover of $\mathcal U$. 

**Step II**.
Consider a new finite cover by epsilon ball of size $\epsilon /2$ centered at $x_{2, i}$ for $i= 1,\ldots, n_2$. 
A finite subset of these balls covers $\mathbb B_\epsilon(x_{1, i_1})$ and there exists at least one of them cannot admits any finite subcover from $\mathcal U$, denote it $\mathbb B_{\epsilon/2} (x_{2, i_2})$ and it satsfies: 

$$
\mathbb B_\epsilon(x_{1, i_1}) \cap \mathbb B_{\epsilon/2} (x_{2, i_2}) \neq \emptyset. 
$$
Repeating the process indefinite it yields a Cauchy sequence $x_{n, i_n}$ because from the nonempty intersection property it has: 

$$
\begin{aligned}
    d(x_{n, i_n}, x_{n + 1, i_{n + 1}}) \le 
    \epsilon/2^n + \epsilon/2^{n + 1} \le \epsilon/2^{n - 1}. 
\end{aligned}
$$

Using the triangle inequality it has for all $m < n$ with some basic algebra: 

$$
\begin{aligned}
    d(x_{m, i_m}, x_{n, i_n}) &\le 1/2^{m - 2}. 
\end{aligned}
$$

Then, the sequence is a Cauchy sequence, and it admits limit $\bar x$ because $X$ is complete/closed.

**Step III**.
Because $\bar x \in X$, there exists an open set $O_j \in \mathcal U$ such that $\bar x \in O_j$ and since it's open there exists some $\delta > 0$ with $\mathbb B_\delta(\bar x) \in O_j$. 
Next, there exists some $k \in \N$ such that $\mathbb B_{\epsilon/2^k}(\bar x) \subseteq \mathbb B_\epsilon(\bar x)$ and therefore $O_j$ is a finite subcover in $\mathcal U$ for ball $\mathbb B_{\epsilon/2^k}(\bar x)$ which contradicts the fact that $\mathbb B_{\epsilon/2^n}(x_{n, i_i})$ cannot admit any finite subcover of $\mathcal U$ from the previous step. 

Therefore, the assumption that a finite subcover cannot exist must be false hence the theorem is proven. 


