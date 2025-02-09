- [[Real Analysis Basics]]


---
### **Intro**

The cluster point of a sequence is a very important concept in basic analysis. 

#### **Definition | Cluster point of a sequence**
> Let $(x_n)_{n \ge 0}$ be a sequence in $\R^n$. 
> $\bar x$ is a cluster point of the sequence if, for all $\epsilon > 0$, there exists $n \in \N$ such that $\Vert x_n - \bar x\Vert \le \epsilon$. 

#### **Example 1**
Consider the sequence $x_n = (-1)^n(1/n + 1)$. 
It has cluster points $\{-1, 1\}$. 
When $k_n = 2n$ it has $x_{k_n} = 1/n + 1$ and when $k_n' = 2n + 1$ it has $x_{k'_n} = -1/n - 1$. 
They are convergent subsequences with limit $1, -1$.


#### **Theorem 1 | Supremum of the set of cluster point**
> Let $C$ defines the cluster point for the sequence $(x_i)_{i \ge 0}$. 
> Then $\limsup_{n \rightarrow \infty} x_n$ equals to $\sup C$. 

**Proof**

To do that we show: 
1. $s = \limsup_{n \rightarrow \infty} x_n$ is a cluster point. 
2. For all cluster points $\bar x \in C$, we have $x \le s$. 




**References**: 
- Abbott's Understanding analysis chapter 3. 
- My own education experience because I am qualified enough to write about this bare hands. 


---
### **Bozano Weierstrass**

See [Bozano Weierstrass](Bozano%20Weierstrass.md) for the theorem. 

### **Connected set of cluster points**

See [Limit, Cluster Point of Sequence](Limit,%20Cluster%20Point%20of%20Sequence.md). 

