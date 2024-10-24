[Multivalued Functions, Set-valued Mappings](Multivalued%20Functions,%20Set-valued%20Mappings.md)

---
### **Intro**

Due to the fact that there are so much things with operators, and monotone operator, here we will summarized different type of operators as an introduction. When we refers to operators, we are referring to a set-valued mapping. 

Operator in general, introduces a relations between the 2 sets, or the set itself. It's a pairing between elements from the domain and the range of the operator. The inverse of an operator in this sense, simply invert the domain and range of the operator. 


**References**
1. **\<Large-scale convex Optimizations: Algorithms and analysis via Monotone Operators\>** by Ernest K. Ryu & Wotao Yin. A very complicate textbook, which should serve as primary references. 
2. **\<A Primer on Monotone Operators\>**, this one is a really good one! The collections are extremely good.  See [Primer on Monotone Operators](Primer%20on%20Monotone%20Operators.pdf) for more. 
3. **\<Convex Analysis and Monotone Operator Theory in Hilbert Spaces\>**, this one is from Professor Heinz and it should be treated as an essential reference. 

---
### **Lipschitz Operator**

Lipschitz operator bound the distance between 2 points in the output space of the operator wrt the input space. [Lipschitz Operator in Euclidean Space](Lipschitz%20Operator%20in%20Euclidean%20Space.md). In practice, we actually want [Firmly Nonexpansive Operators](Firmly%20Nonexpansive%20Operators.md), which is a type of operations that has a Lipschitz constant that is less than or equal to one. Under the best case we want to deal with operator that creates a contraction, see [Banach Contraction in Metric Space](../../MATH%20601%20Functional%20Analysis/Functional%20Spaces/Banach%20Contraction%20in%20Metric%20Space.md) for more information. 


**Definition: Non-Expansive Operator**
> The non-expansive operator has to be Lipschitz first and it has to be $X\mapsto X$, a , as a result, it has to be a single-valued mapping. A non-expansive operator has a Lipschitz constant of exactly $1$. 


- Firmly non-expansive operator has fixed point montone convergences, see [Firmly Nonexpansive Operators](Firmly%20Nonexpansive%20Operators.md) for more information.
- The classical projection onto a convex set is a type of Non-expansive operator. Which is also firmly nonexpansive, see [Convex Sets Projections and Dist, Intro](../Background/Convex%20Sets%20Projections%20and%20Dist,%20Intro.md) for more information. 


**Definition: Contraction**
>  A contraction is a Lipschitz operator with a Lipschitz constant that is strictly less than one.

**Facts**: 

A contraction has a singleton as its fixed point set. For more information about contraction, see [Banach Contraction in Metric Space](../../MATH%20601%20Functional%20Analysis/Functional%20Spaces/Banach%20Contraction%20in%20Metric%20Space.md) for this type of operator in Banach space. 

---
### **Monotone and Maximally Monotone Operator**

Maximally monotone operator can be have resolvent that are invertible. 

**Definition: A Monotone Operator**:

> The operator $F$ is monotone when $\langle Fy - Fx, y - x\rangle \ge 0$ for all $x, y \in \text{dom}(F)$. 

For example, the subgradient operator of a convex function is monotone. 

**Definition: Strongly Monotone Operator**: 
> A monotone operator $T$ is strongly monotone with parameter $m$ if $\langle Tx - Ty, x - y\rangle \ge m \Vert x - y\Vert^2$ for all $x, y\in \mathbb E$. 

For example, the subgradient of a strongly convex function is a strongly monotone operator. 


---
### **Example: Convex Sets Projection Operator, Proximal Operators**

Recall from that the projection operator onto a closed and convex set is a *non-expansive operator* that is also *monotone* and singled valued. This is true because the projector has a Lipschitz constant that is $\le 1$ (Showed in [Convex Projection is L1 Lipschitz](../CVX%20Geometry/Convex%20Projection%20is%20L1%20Lipschitz.md)). The monotone property can be derived using the obtuse angle theorem. 


---
### **Concepts Central Hubs**

In here we list all the relevant and important concepts for equipping operator theory for optimization problem, these concepts will be more advanced. 

* [Minty's Theorem, The Surjectivity Theorem](Minty's%20Theorem,%20The%20Surjectivity%20Theorem.md)
* [Resolvent and Minty Paramaterization](Resolvent%20and%20Minty%20Paramaterization.md)


