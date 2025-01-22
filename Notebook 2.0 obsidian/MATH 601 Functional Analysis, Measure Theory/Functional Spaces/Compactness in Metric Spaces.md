- [Convergence, Completeness in Metric Space](Convergence,%20Completeness%20in%20Metric%20Space.md), we are talking about convergence subsequence in here. 
- [Continuous Mapping in Metric Spaces](Continuous%20Mapping%20in%20Metric%20Spaces.md), we are using continuity here. 

---
### **Intro**

For a definition about compactness in finite dimension, see [Finite Dimensional Normed Space](Finite%20Dimensional%20Normed%20Space.md). 
Let $C\subseteq X$ be a finite dimensional Banach space, then the following conditions defining compactness are equivalent. 
1. $C$ is a closed and bounded set. (Real analysis, Bozano Weirestrass Theorem)
2. If $\{x_n\}_{n \ge 0} \subseteq C$ then $x$ has a convergence subsequence. (Metric space, sequential compectness.)
3. Every open cover of the set as a finite subcover. (Topological spaces, compact topological spaces. )

Results from classical analysis of $\R$ states: 
$$
\begin{aligned}
    & (1.) \iff (2.) \quad \text{ By finite dimension}. 
\end{aligned}
$$ 

A demonstration of condition (3.) in the real number line can be found in [Heine Borel](../../MATH%20000%20Math%20Essential/Analysis/Heine%20Borel.md). 
Conditions (2.) remains relevant to characterize compactness in infinite dimensional spaces (i.e: Some Banach Spaces). 
We eventually want convergent subsequence (metric space convergence) in proofs. 
The concept of a finite length interval, a bounded and closed set now requires the conclusion of B.W instead. 




#### **Definition | Compact spaces in Metric spaces via Bozano Wereistrass**
> All bounded sequence in the space (or set) has a convergent subsequence. 

See [Bozano Weierstrass](../../MATH%20000%20Math%20Essential/Analysis/Bozano%20Weierstrass.md) in basic real analysis. 
The theorem states that a compact set has convergent subsequence in $\R^n$.


---
### **Compactness of Metric Spaces**

We introduce theorems that are corollaries of a compact metric spaces. 

#### **Thm | Continuous Mapping Preserves Compact Space (2.5-6)**
> Let $X, Y$ be metric spaces. Let $T: X \mapsto Y$ be a continuous mapping. Then the image of a compact subset $M$ of $X$ is, compact. $TM$ is a compact set as well. 

**Proof**: 

Denote $T^{-1}M$ to be the pre-image on the set $M\subseteq Y$. To show that the image of a compact set is compact, we make the sequence $(y_n)_{n\in N}$ in $TM$, the range of $T$ over $M$, for each $y_n$, we consider $y_n = Tx_n$ for another sequence $(x_n)_{n\in \N}$ in $T^{-1}M$, which might not be unique. By the fact that $M$ is compact, we have a convergence subsequence $(x_{n_k})_{k\in \N}$, it corresponds to the same subsequence $y_{n_k}$ that is also convergence by continuity. Therefore, the image of $TM$ is also a compact set. 

**Remarks**: 

Take note that this statement is about metric spaces in general. This theorem allows us to generalize some theorems used for single variable calculus. 

**References:** Kreyzig's textbook, 2.5-6. 

**Thm | Minimizer and Maximizer of a Compact Mapping**
> A mapping from a compact subspace of a metric space, $M\subseteq X$ to $\R$ will give a maximum and a minimum at some point in $M$. 

**Proof**

Unfinished. 

