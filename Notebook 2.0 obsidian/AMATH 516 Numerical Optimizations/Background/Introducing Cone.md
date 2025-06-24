- [[Topological Basics for Optimizations]]


---
### **Intro**

Cone is a special type of set. 
It appears a lot in convex analysis and optimizations. 

#### **Definition | A cone**
> A set $K$ is a cone if for all $\lambda K, \lambda > 0$: $\lambda K\subseteq K$. 

**Observations**
1. If $K$ is a cone, and it's closed, then $\mathbf 0 \in K$. 
Take limits of $\lambda \searrow 0$ to see why. 
2. The Minkowski sum of 2 cones is still a cone. 
3. The intersection of 2 cones is still a cone. 
4. The union of 2 cones is still a cone. 
5. A cone come be convex, or it can be non-convex.

**Examples** 

* $\mathbb{R}^n_+$.
* $\{x| Ax \ge \mathbf 0\}$. 
* $\{(x, y)\in \mathbb R^2 | xy = 0\}$. It is not a convex set. 
* $\{y \in \mathbb R^n | \langle a, y\rangle \le 0\}$. 


#### **Definition | Pointed Cones**
> A cone $C \subset \R^n$ is pointed when: 
> * A cone is called pointed if $-C \cap C= \{\mathbf 0\}$. It means the origin is an extreme point of the set. 
> * It's also convex. 

**Reproducing Cones**
* Sometimes, $C - C = \mathbb E$, the whole Euclidean space. Then that space is called reproducing. 

**References**

This is taken from Prof Dimitri's teaching of MATH 516 at UW 2021. 

----
### **More Definitions about Cones**

- [Dual Cone](Dual%20Cone.md). Related to the Fenchel dual of indicator functions. 
- [Polar Cone](Polar%20Cone.md). A polar cone is the result of a transformation on a cone such that it's perpendicular to the original cones. 
- [Normal Cone](Normal%20Cone.md). A conic descriptions of sets with convex analysis or variational flavors. 
- [Tangent Cone Introduction](AMATH%20516%20Numerical%20Optimizations/Background/Tangent%20Cone%20Introduction.md). A conic descriptions of functions and sets with convex analysis or variational flavors. 