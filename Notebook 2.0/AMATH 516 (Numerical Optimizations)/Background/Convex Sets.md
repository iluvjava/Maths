 [[Topological Basics for Optimizations]]


---
### **Intro**

This entity is by far some the most important entities we will have for convex optimization, both in applications and analysis. The same topic has also been covered in [[AMATH 515 (Optimization Fundamentals)/Basic Convexity/Convexity]], which is not organized well. 

**Definition of a Convex Set**

### **Convex Set**

A set is said to be convex if any convex combinations of 2 arbitrary elements from the set are inside of the set as well. For this class, we are exclusively talking about $\mathbb{R}^n$.A set $C$ is said to be convex if:

$$
\forall\; x, y \in C: \lambda x + (1-\lambda)y \in C \text{ where } \lambda \in (0, 1)
$$

 
**Examples**:
1. Planes,
2. Lines,
3. Half-spaces(System of Linear Inequalities) are convex.
4. Normal Balls ($||x||_p \forall p \geq 1$)
  
(These are going to be **useful short cuts** for convex analysis)

---
**Properties**:

The intersection of Convex Sets is a convex set. 

> The intersection of 2 convex set is going to be another convex set.$C_1, C_2$ are convex --> $C_1 \cap C_2$ is convex.
> Bruh, the proof is trivial and it's skipped here.

Scaling retains convexity

> Using [[Generating Cone of a Set]], Any cone generated on a convex set is still convex. 

Adding sets still convex 

> Suppose that the set $A, B$ are 2 convex sets, then their addition is still convex. Set addition [[Set Addition]]. 

Preimage and Image of Linear Mapping preserves convexity

> For any 2 convex sets, $Q\subseteq\mathbb{R}^n, L\in\mathbb{R}^m$, suppose that mapping $A:\mathbb{R}^n\mapsto\mathbb{R}^m$ is a [[Linear Mapping]], then the image $AQ$ and pre-image $A^{-1}L$ is still a convex set. 


