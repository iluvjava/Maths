Major Reference Sources: 
[Stanford University](https://stanford.edu/~boyd/admm.html)

---
### **Intro**

Alternating direction method of multiplier (ADMM). 

This algorithm breaks the optimization problem apart into many smaller pieces and then solve then individually, combining to get the larger solution for the optimization problem. 

It's like Raleigh Quotient: 

$$
\begin{aligned}
    \mathcal{F}(A) &=\left\lbrace
        \frac{y^HAy}{y^Hy}: y\in \mathbb{C}^n, y \neq \mathbf{0}
    \right\rbrace
\end{aligned}
$$

The set is CONVEX. 


The Maximal Fields of defines that idea of a Numerical Radius of a matrix as: 

$$
\nu(A) = \max\{|z|: z \in \mathbb{C}\}
$$


---
### **Properties**





