- [[Topological Basics for Optimizations]]


---
### **Intro**

A set $K$ is a cone if, under $\lambda K, \lambda > 0$ scaling, we have $\lambda K\subseteq K$, then the set is a cone. 
In brief, the set is invariant after a strictly positive scaling transformation. 
Immediately observe that, 

**Obervations**

1. If $K$ is a cone and it's closed, then $\mathbf 0 \in K$. Take limits of $\lambda \searrow 0$ to see why. 
2. The Minkowski sum of 2 cones is still a cone. 
3. The intersection of 2 cones is still a cone. 
4. The union of 2 cones is still a cone. 
5. A cone come be convex, or it can be non-convex.

**Examples** 

* The set $\mathbb{R}^n_+$ is a cone. 
* The set $\{x| Ax \ge \mathbf 0\}$ is a cone, and we call it the polyhedral cone. 
* The set $\{(x, y)\in \mathbb R^2 | xy = 0\}$ is a cone. This cone is not a convex cone compare to the previous 2. 
* $\{y \in \mathbb R^n | \langle a, y\rangle \le 0\}$ is a cone, for all $a \in \mathbb R^n$. 

**Remarks**: 

A subspece is a special case of a cone. 
It's a restrictions of a subspace because it describes only positively weighted elements from the subspace. 

When we talk about cone, the tip of the cone is usually centered around the origin. 

**Pointed Cones**
* A cone is called pointed if $-C \cap C= \{\mathbf 0\}$
* It's also convex. 

**Reproducing Cones**
* Some times, $C - C = \mathbb E$, the whole Euclidean space. Then that space is called reproducing. 

**References**

This is take from Prof Dimitri's teaching of MATH 516 at UW 2021. 

----
### **More Definitions about Cones**

- [Dual Cone](Dual%20Cone.md). Related to the Fenchel dual of indicator functions. 
- [Polar Cone](Polar%20Cone.md). A polar cone is the result of a transformation on a cone such that it's perpendicular to the original cones. 
- [Normal Cone](Normal%20Cone.md). A conic descriptions of sets with convex analysis or variational flavors. 
- [Tangent Cone](Tangent%20Cone.md). A conic descriptions of functions and sets with convex analysis or variational flavors. 