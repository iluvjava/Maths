[[Fields of Values]]

---
### **Intro**

Fields of values but generalized to set of matrices instead of just one matrix. 

**Definition**

> $$
> \mathcal{F_k}(\{A_i\}_{i = 1}^k) 
> = 
> \left\lbrace
>     \begin{bmatrix}
>         y^H A_1 y
>         \\
>         \vdots
>         \\
>         y^HA_ky
>     \end{bmatrix}
>     : 
>     y \in \mathbb{C^n} \wedge \Vert y\Vert = 1
> \right\rbrace
> $$


Such a definition can be use to characterize the convergence for GMRes related method in a easier way. 