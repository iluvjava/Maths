[Stopping Time and Classification of States](Stopping%20Time%20and%20Classification%20of%20States.md)


---
### **Intro**

Stationary distributions is the limiting behaviors of any Markov Chain. Using $\pi$ to denote the *stationary distribution*, and it's a stationary distributions if and only if $\pi^TP = \pi$, with $\pi^T\mathbf 1 = 1, \pi \ge \mathbf 0$. In other words, it's eigenvector for the transition matrix $P$, and it's in fact representing a distributions on the states. We start directly with a theorem that states the existence and uniqueness for a stationary distributions and the conditions, for a finite chain. 

#### **Thm 1.14 | Irreducibility Means Existence of stationary Distributions**
> Suppose that a $k\times k$ matrix is irreducible. Then there is a unique solution to $\pi P =\pi$, such that $\pi$ is a distribution vector and $\pi_x > 0$ for all state $x\in \mathcal S$, and it's unique. 

**Observations**

The Markov chain is finite and irreducible, then the stationary distribution is non-negative for all states and it's unique. Observe that it said nothing about the convergence, or whatever will happen for an infinite state spaces. 

**Proof**





