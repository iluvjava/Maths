- [Subdifferentials Subgradient Computations](Subdifferentials%20Subgradient%20Computations.md)


---
### **Intro**

Here we prove provide counter example for the converse case and establishes the  strong and the weak subgradient sum rule and characterize their conditions. 
This one is a very important subgradient rule, preluding the huge development of variational analysis. 

The following example demonstrate that the sum of the normal cone of 2 convex set, is a smaller set than the normal cone of the intersection of the set. 

#### **Example | Sum of Subgradient is not Subgradient of Sum**

> In $\mathbb R^2$, let $C, D$ be $(1, 0) + \mathbb B$ and $(-1, 0) + \mathbb B$, where $\mathbb B$ is the unit ball centered at $(0, 0)$. 
> Then $N_C = \partial \delta_C$, and $N_D = \partial \delta_D$, and we have $N_D(0, 0) + N_C(0, 0) \subsetneq N_{C \cap D}(0, 0)$. 
> Implying that $\partial [\delta_C + \delta_D](0, 0)$ is a strictly larger set than $\partial \delta_C(0, 0) + \partial \delta_D(0, 0)$. 

**Observations**

We have $C, D$ both being a convex sets on $\mathbb R^2$ but with $\text{int}(C)\cap C = \emptyset$. 

**Demonstrations**

$\delta_C + \delta_D = \delta_{C\cap D}$, and therefore we have $\partial [\delta_C + \delta_D] = \partial [\delta_{C\cap D}]$. 
$C \cap D = \{(0, 0)\}$ and hence $\partial [\delta_{C \cap D}](0, 0) = \mathbb R^2$. 
However $N_C(0, 0) = \mathbb R_- \times \{0\}$ and $N_D(0, 0) = \mathbb R_- \times \{0\}$ and hence we have $N_C(0, 0) + N_D(0, 0) = \mathbb R\times \{0\}$, which is a strictly smaller set than $\mathbb R^2$. 
Therefore, the subgradient of summed function is not the sum of the subgradient of each of the function. 



---
### **Convex Subgradient Sum Rule**

The subgradient sum rule is true when functions are convex. 

**References**
- Rockafellar's "Convex Analysis" theorem 23.8. 
- Heinz Combette's Monotone convex book, see Corollary 16.48 for more information. 



