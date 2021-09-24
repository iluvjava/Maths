This one is a useful lemma for the Lagrangian, and the Fenchel conjugate transform. 

---
### **Intro**

It's introduced independently as a lemma from topics in duality. 

It serves the double conjugacy, hence strong duality indirectly. It also serves for the lagrangian too. 

**Claim 1**

> $$
> \sup_y\inf_x F(x, y) \le \inf_x\sup_y F(x,y)
> $$
> For any $x, y$ as a vector/scalar, and the function $F(x,y)$ is a scalar function. 

**Claim 1 Proof**


$$
\begin{aligned}
    \forall x: F(x, y) &\ge \inf_x F(x, y)
    \\
    \forall x, y: F(x, y) &\ge \inf_x F(x, y)
    \\
    \forall x: \sup_y F(x, y) &\ge \sup_y \inf_x F(x, y)
    \\
    \inf_x\sup_y F(x,y) &\ge \sup_y \inf_x F(x, y)
    \\
\end{aligned}
$$

Adding a $\sup$ with $y$ on $\inf$ for $x$ won't change the existing sign. 

By the same idea, starting with $\forall y \sup_y\{F(x, y)\} \ge F(x, y)$ can also reach the same conclusion, hopefully you are convinced. $\blacksquare$

---
### **Intuitive Understanding**

> It's a 2 players games, the play who plays it first will have more advantage for its objective. "Playing it first" means nested inside the expression. 

For example, $\sup_y\inf_x F(x, y)$, the player $x$ plays first, so it has more advantage for its own objective, therefore, $\sup_y\inf_x F(x, y)\le \inf_x\sup_y F(x, y)$
