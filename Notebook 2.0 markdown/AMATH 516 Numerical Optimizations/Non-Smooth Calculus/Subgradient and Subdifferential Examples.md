- [Subgradient Introduction](Subgradient%20Introduction.md),
- [Subdifferentials Subgradient Computations](Subdifferentials%20Subgradient%20Computations.md),
- [Fenchel Identity, Inequality](../Duality/Fenchel%20Identity,%20Inequality.md)


---
### **Intro**

We look at some examples for subgradient. 


---
### **Example 1: The L1 Norm**


---
### **Example 2: The Indicator Function**

Before we start, recall contents from [Normal Cone](../Background/Normal%20Cone.md). 

> Let $C$ be any subset of the Euclidean space, let $N_C$ denotes the normal cone of $C$, then $N_C = \partial \delta_C$, the normal cone equals to the convex subgradient on the indicator function of set $C$. 

Let $x\in \mathbb E$, when $x\neq C$, we have $N_C(x) = \partial \delta_C(x) = \emptyset$. Assuming that $x\in C$ and let $u \in \mathbb E$ then: 

$$
\begin{aligned}
    u\in N_C(x) &\iff \forall c \in C: \langle c - x, u\rangle\le 0
    \\
    &\iff \forall y\in \mathbb E: \underbrace{\delta_C(x)}_{=0} + \langle y - x, u\rangle \le \delta_C(y)
    \\
    & \iff 
    u \in \partial \delta_C(x), 
\end{aligned}
$$

and that completes the proof. 

**Remarks**

When $C$ is a polyhedra, this is just another way of phrasing the duality of linear programming problem. 

**References:** Heinz's course notes, theorem 10.2

---
### **Example 3: Piecewise Linear**


---
### **Example 4: Subgradient of the Max Eigenvalue Function**



**References**: Example 3.8 in Amir Beck's book: [First-Order Methods in Optimization-Societ - Beck, A_](../References/First-Order%20Methods%20in%20Optimization-Societ%20-%20Beck,%20A_.pdf). 

---
### **Example Omega: Subgradient of the Value Functions**


**References**: I think it's in Amir's Beck book. 
