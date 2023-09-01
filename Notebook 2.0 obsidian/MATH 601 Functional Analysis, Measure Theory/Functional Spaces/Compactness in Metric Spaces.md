- [Convergence, Completeness in Metric Space](Convergence,%20Completeness%20in%20Metric%20Space.md), we are talking about convergence subsequence in here. 
- [Continuous Mapping in Metric Spaces](Continuous%20Mapping%20in%20Metric%20Spaces.md), we are using continuity here. 


---
### **Intro**

For a definition about compactness, please visit [Finite Dimensional Normed Space](Finite%20Dimensional%20Normed%20Space.md), because compactness is generalized from finite dimensional spaces. In finite dimensional spaces, compactness are two equivalent conditions of
1. being closed, and bounded
2. Having convergence subsequences for all sequence in the compact space. 
However, this is not the cause in general, infinite dimensional normed spaces, as a corollaries of the compactness condition, we define the subsequence characterizations of it in generalized metric space. 

---
### **Compactness of Metric Spaces**

We introduce theorems that are corollaries of a compact metric spaces. 

**Thm | Continuous Mapping Preserves Compact Space (2.5-6)**
> Let $X, Y$ be metric spaces. Let $T: X \mapsto Y$ be a continuous mapping. Then the image of a compact subset $M$ of $X$ is, compact. $TM$ is a compact set as well. 

**Proof**: 

Denote $T^{-1}M$ to be the pre-image on the set $M\subseteq Y$. To show that the image of a compact set is compact, we make the sequence $(y_n)_{n\in N}$ in $TM$, the range of $T$ over $M$, for each $y_n$, we consider $y_n = Tx_n$ for another sequence $(x_n)_{n\in \N}$ in $T^{-1}M$, which might not be unique. By the fact that $M$ is compact, we have a convergence subsequence $(x_{n_k})_{k\in \N}$, it corresponds to the same subsequence $y_{n_k}$ that is also convergence by continuity. Therefore, the image of $TM$ is also a compact set. 

**Remarks**: 

Take note that this statement is about metric spaces in general. This theorem allows us to generalize some of the theorems used for single variable calculus. 

**References:** Kreyzig's textbook, 2.5-6. 

**Thm | Minimizer and Maximizer of a Compact Mapping**
> A mapping from a compact subspace of a metric space, $M\subseteq X$ to $\R$ will give a maximum and a minimum at some point in $M$. 

**Proof**

Unfinished. 

