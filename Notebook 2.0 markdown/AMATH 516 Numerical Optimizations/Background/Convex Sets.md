 [Topological Basics for Optimizations](Topological%20Basics%20for%20Optimizations.md)


---
### **Intro**

This entity is by far some the most important entities we will have for convex optimization, both in applications and analysis. The same topic has also been covered in [Introduction to Convexity](../../AMATH%20515%20Optimization%20Fundamentals/Basic%20Convexity/Introduction%20to%20Convexity.md), which is not organized well. 


### **Convex Set**

**Definition**

> A set is said to be convex if any convex combinations of 2 arbitrary elements from the set are inside of the set as well. For this class, we are exclusively talking about $\mathbb{R}^n$.A set $C$ is said to be convex if:
> 
> $$
> \forall\; x, y \in C: \lambda x + (1-\lambda)y \in C \text{ where } \lambda \in (0, 1)
> $$

 
**Examples**:
1. Hyperplanes: $\mathcal H_{\pm}(a, b):=\{x: \pm\langle x, a\rangle \ge b\}$, A [Cone](Cone.md) a special case of a convex set. 
3. Half-spaces(System of Linear Inequalities: [Polytopes](../../AMATH%20514%20Combinatorics%20Optimizations/Polytopes.md), polyhedra) are convex and can be used to characterize all convex sets. 
4. Normal Balls ($||x||_p \forall p \geq 1$)
5. The [Convex Hull, Convex Span](Convex%20Hull,%20Convex%20Span.md) of any kind of sets, and it can also be used to characterize all convex sets. 
6. Positive definite matrices! (Which is alsoa cone)
  
(These are going to be useful for developing **useful shortcuts** for convex analysis)

**Remarks**

The study of convex sets is important for convex optimiations and other things. We study it's properties, characterizations, and how the convexities are propergated and manifested in real world applications. 


---
### **Convexity Preservations Operations**:

The intersection of Convex Sets is a convex set. 

> The intersection of 2 convex set is going to be another convex set.$C_1, C_2$ are convex --> $C_1 \cap C_2$ is convex.
> Bruh, the proof is trivial and it's skipped here.

Scaling retains convexity

> Using [Generating Cone of a Set](Generating%20Cone%20of%20a%20Set.md), Any cone generated on a convex set is still convex. 

Adding sets still convex 

> Suppose that the set $A, B$ are 2 convex sets, then their addition is still convex. Set addition [Set Addition](Set%20Addition.md). 

Preimage and Image of Linear Mapping preserves convexity

> For any 2 convex sets, $Q\subseteq\mathbb{R}^n, L\in\mathbb{R}^m$, suppose that mapping $A:\mathbb{R}^n\mapsto\mathbb{R}^m$ is a [Linear Mapping](Linear%20Mapping.md), then the image $AQ$ and pre-image $A^{-1}L$ is still a convex set. 

For more discussion, see [Convexity Preserving Operations of Sets](../CVX%20Geometry/Convexity%20Preserving%20Operations%20of%20Sets.md)


---
### **Notations: Line Seg**

$$
[x, y]_Q := \{\lambda x + (1 - \lambda)y: 0 \le \lambda \le y\}\quad x, y \in Q
$$

And the definition for $(x, y), [x, y)$ follows through naturally with a different definition on whether to include the boundary points or not. Next, we list some examples of convex sets that are foundamental to the discussion, 

---
### **Example: Affine Subspace, Half Spaces**

> The set $Q = \{x: \langle a, x\rangle\le b\}$ is convex. 

$$
\begin{aligned}
    & \overline{x}, x\in Q
    \\
    \iff& \langle a, \overline{x}\rangle  \le b \;\wedge\;
    \langle a, x\rangle\le b
    \\
    \iff &\langle \lambda x + (1 - \lambda)\bar{x}\rangle \le 
    \lambda b + (1 - \lambda)b = b
    \\
    \implies & [x, \overline{x}] \subseteq Q
\end{aligned}
$$

Therefore, the affine subspace is convex. 

---
### **Example: Cone**

> A set $K$ which is a [Cone](Cone.md) is also convex. 

$$
\begin{aligned}
    & x \in K \iff \forall \lambda \ge 0 : \lambda x\in K 
    \\
    & \overline{x}\in K \iff \forall \lambda \ge 0 : \lambda \overline{x}\in K 
    \\
    \iff & 
    \lambda x + \overline{\lambda}\overline{x} \in K \;\forall \lambda, \overline{\lambda} \ge 0 
    \\
    \implies & 
    [x, \overline{x}] \subseteq K
\end{aligned}
$$

Done. 


---
### **Theorem: HyperPlane Separations**
> For any point lying outside of the set $Q$, which is a non-empty convex set, there exists a hyperplan separating the point and the set $Q$. 

See proofs in [Strict Separations Theorem](../CVX%20Geometry/Strict%20Separations%20Theorem.md).	


---
### **Theorem: Supporting Halfspaces**

> For any convex set, it can be seen as the union of all affine subspace that contains the convex set. 


For such a characterizations of the convex sets, consider: [Supporing Convex Sets using Halfspaces](../CVX%20Geometry/Supporing%20Convex%20Sets%20using%20Halfspaces.md). 