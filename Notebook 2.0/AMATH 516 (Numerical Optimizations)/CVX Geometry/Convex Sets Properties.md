[[Convex Sets]]
[[Set Projections and Dist]]


---
### **Intro**

We list/prove some of the useful properties of convex sets, in Finite Euclidean spaces. 

---
### **Obtuse Angle Projection**

> For any closed, convex, non-empty set $Q$ in the finite Eulidean space, the projection (it's a singleton set) of any points on to the set to the point itself make an abstuse angle with all the other points in the set $Q$. Mathematically: 
> $$
> \begin{aligned}
>     \forall y \exists z: \{z\} &= \underset{Q}{\text{proj}}(y)
>     \\
>     \text{AND: }
>     \langle y - z, x - z\rangle &\le 0 \quad \forall x \in Q
> \end{aligned}
> $$

**Proof**:

The proof involves 2 directions, firstly we wish to show the conclusion by assuming $z \in \text{proj}_Q(y)$, and then we do the reverse by assuming the abtuse angle part is true, proving the $z\in \text{proj}(y)$. 

For the $\impliedby$ direction, consider: 

$$
\begin{aligned}
    
\end{aligned}
$$


---
### **Uniqueness**

> For an nonempty closed convex set $Q$ and any points $y\in \mathbb R^n$, the projection of $y$ onto $Q$ is unique and it's in the set $Q$. 