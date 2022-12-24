[[Markov Chain Introduction]]

---
### **Intro**

A doubly stochastic chain has some desirable properties. 

**Definition: Doubly Stochastic Chain**

> A chain $P(x, y), x, y\in S$  is doubly stochastic when $P(x, y) = P(y, x)$ for all $x, y\in S$.
 
It is implied that such a chain in the discrete case has a matrix that is symmetric whose row sum and columns sums both equals to one. Such a matrix is called a doubly stochastic matrix. 

**Remark**: 

The uniform distribution is a stationary distributions for all doubly stochastic chain. The proof is direct and make use of the property that the column sum of the matrix equals to one. 
