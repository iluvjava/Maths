- [Vector Space](../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Functional%20Spaces/Vector%20Space.md)

---
### **Intro**

We intend to introduce some linear algebra on the firm ground of abstract algebra. 
Please first understand the definition of a vector space. 

### **Def | Subspace**
> Let $C\subseteq \mathbb V$, then $C$ is a subspace if it's also a vector space. 

**Observations**

Let $X, Y$ be subspace of the same vector space, define $X + Y := \{x + y | x \in X, y \in Y\}$. 
The sum of two subspaces is still a vector space because a vector space if closed under addition. 


#### **Def | Linear Combinations**
> The linear combination of a set of vector, $x_i \in \mathbb V$ for $i = 1, \cdots, k$, is the vector $x = a_1 x_1 + \cdots + a_k x_k$ for $a_i \in \mathbb K$ for $i = 1, \cdots, k$. 

**Observations**

Linear combinations is for a finite set of vectors, which itself is a vector. 

#### **Def | Linear Span**
> The span of the set $S$, is the set of all linear combinations of the set $S$. 
> It's called the subspace span by $S$. 

**Observations**

In finite dimension, subspaces are closed, in infinite dimension, vector spaces are not necessarily closed. 
The vector $(1,1/2, \cdots, )$ in Hilbert space $l^2$ is not a vector that can be a finite linear combination of $\e_i, i\in \mathbb N$ the standard basis vector. 
Hence there is a limit of the sequence of vector that is in the subspace but not closed. 

#### **Prop | Minimal Subspace, Maximal Span**
> 


