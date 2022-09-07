[Topological Basics for Optimizations](Topological%20Basics%20for%20Optimizations.md)


---
### **Intro**

A set $K$ is a cone if, under $\lambda K, \lambda > 0$ scaling, we have $\lambda K\subseteq K$, then the set is a cone. For example: 

* The set $\mathbb{R}^n_+$ is a cone, and the set of all semi-Definite Matrices is also cone. 
* The set $\{x| Ax \ge \mathbf 0\}$ is a cone, and we call it the polyhedral cone. 


**Remarks**: 
A cone is a special case of a subspace. It's a restrictions of a subspace because it describes only positively weighted elements from the subspace. 

When we talk about cone, the tip of the cone is usually centered around the origin. 

**Pointed Cones**
* A cone is called pointed if $-C \cap C= \{\mathbf 0\}$
* It's also convex. 

**Reproducing Cones**
* Some times, $C - C = \mathbb E$, the whole Euclidean space. Then that space is called reproducing. 