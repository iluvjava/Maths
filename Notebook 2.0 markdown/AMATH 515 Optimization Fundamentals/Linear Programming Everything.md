Basics of the Linear Programming. 
This is stated similarly to the book: Numerical Optimization

[Exploiting the Lagrangian (KKT)](Duality%20Remastered/Exploiting%20the%20Lagrangian%20(KKT).md), [Lagrangian and Dualization Techniques](Duality%20Remastered/Lagrangian%20and%20Dualization%20Techniques.md)

---
### **Intro**

One General Format for the linear programming problem is: 

> $$
> \min_x \{c^Tx : Ax = b, x \ge \mathbf{0}\}\tag{1}
> $$

We assume that $A$'s row does not repeat, this is necessary for bounding a unique solutions for the system. And let's say that $A \in \mathbb{R}^{m\times n}$. The argument is that any linear programming problem can be put into this form because of the following reduction techniques for different type of constraints: 

> $$
> \begin{aligned}
>     x \le u &\iff x + w = u, w \ge 0
>     \\
>     Ax \ge b &\iff Ax - y = b, y \ge 0
>     \\
>     x \in \mathbb{R}^n &\iff x = x^+ + x^- : x^+ \ge 0 \wedge x^- \le 0
> \end{aligned}\tag{2}
> $$
> The idea is to pad the inequality with positive slack variables. 

**Different Forms:** 

> $$
> \begin{aligned}
>   \max_x\left\lbrace
>       c^Tx: Ax \le b, x\ge \mathbf{0}
>    \right\rbrace
> \end{aligned}
> $$

Here, we will take use this as an reduction example to reduce the system of equation the general form. 

$$
\begin{aligned}
   Ax &\le b
   \\
   Ax + y &= b \quad y \ge \mathbf{0}
   \\
   \implies \max_{x,y}& \left\lbrace
      c^Tx: Ax + y = b, x, y \ge \mathbf{0}
   \right\rbrace
\end{aligned}
$$

Swapping the objective from max to min will reduce it to the general form. 


---
### **Lagrangian**

> $$
> \mathcal{L}(x, \lambda, s) = c^Tx - \lambda^T(Ax - b) - s^Tx
> \tag{1.1}
> $$

* $x$ is the primal variable. 
* $s$ Is the slack variable for the dual. 
* $\lambda$ Dual variable, tweakable. 


The **KKT** for (1.1) will be: 

> $$
> \begin{cases}
>     A^T\lambda + s &= c
>     \\
>     Ax &= b
>     \\
>     x &\ge 0
>     \\
>     s &\ge 0
>     \\
>     x_i s_i &= 0, \;i = 1, 2, \cdots, n
> \end{cases}\tag{1.1.1}
> $$


The **Dual Problem** for (1) is: 

> $$
> \begin{aligned}
>     & \max \{ b^T \lambda \; :   A^T\lambda \le c \} 
>     \\
>     =& -\min\{ -b^T\lambda: A^T \lambda \le c\} 
> \end{aligned}\tag{1.2}
> $$
> 
> Using (2) and it reduced to: 
> 
> $$
> \begin{aligned}
>     & \max \{ b^T \lambda \; : A^T\lambda + s = c, s\ge 0 \} 
>     \\
>     =& - \min \{
>             -b^T \lambda \; : A^T\lambda + s = c, s\ge 0 
>         \}
> \end{aligned}\tag{1.3}
> $$


The **Lagrangian** for Expression (1.2) will be given as 

> $$
> \begin{aligned}
>     \bar{\mathcal{L}}(\lambda, x) &= -b^T \lambda -x^T(c - A^T\lambda)
> \end{aligned}\tag{1.2.1}
> $$

Andthe **KTT** conditions based on expression (4), using the lagrangian (6), modified dual becomes: 

> $$
> \begin{cases}
>     Ax &= b 
>     \\
>     A^T\lambda &\le c 
>     \\
>     x &\ge 0
>     \\
>     x_i(c - A^T\lambda)_i &= 0 \quad \forall i \in [n]
> \end{cases}\tag{1.2.2}
> $$

And we can make the substitution for (1.2.2), with $s = c - A^T\lambda$, the slack variable that transformed (1.2) to (1.3), and it can simplifies (1.2.2) into the same conditions as stated in (1.1.1)

---
### **Transforming the Lagrangian**

We can write the Lagrangian in different form so that it's either in the perspective of the Dual, or the primal. 

$$
\begin{aligned}
   \bar{\mathcal{L}}(\lambda, x) &= -b^T \lambda -x^T(c - A^T\lambda)
   \\
   &= -\lambda^Tb - c^Tx + \lambda^TAx
   \\
   &= \lambda^T(Ax - b) - c^Tx
\end{aligned}
$$

The Lagragian can be converted in such a way that it feels symmetric, by which I mean, the parameters of Dual and Primal can be swapped and the Lagragian will remains exactly the same. To illustrate the point, consider Primal, Dual Linear Programming Problem: 

$$

$$

---
### **Theorems: Fundamental Theorems of Linear Programming**

1. If problem has a non-empty feasible region, then there is at least one basic feasible point. (Feasible point exists)
2. If problem has solutions, then at least one such solution is a basic optimal point. (BFOP exists if has solution)
3. If problem is feasible and bounded, then it has an optimal solution. (Optimal exists if it's feasible and bounded)

---
### **Strong Duality** 

Strong Duality applies here, meaning that the primal objective and the dual objectives equals, when any one of the primal or the dual got solved. To be more percise: 

**Claim 3**

> 1.  If either of the solutions for (1), or (1.2) is found, then the other is also found, and $b^T\lambda = c^Tx$. 
> 2. If Primal is unbounded then dual is infeasible, if Primal is infeasible then the dual will be unbounded. 

---
### **The Geometry**

> The feasible region is a polytope. 

Algorithmically, the Simplex algorithm will try to achieve the followings: 

* Choose the columns of $A$ such that it maximizes the $x$ values. Name that set $\mathcal{B}$. 
* If the column is not choosen then that $x_j$ will be set to zero. 
* A chosen set of columns for the solutions is the vertex of the simplex of the Polytope representing the feasible region. 
* If a tight constraint (Chosen set) has $x_j = 0$, then that is Degenercy. 


---
### **The Simplex Algorithm**

It moves the feasible point from one vertex of the polytope to another vertex of the Polytope. There are 2 cases: 

1. Reduce any linear programming problem to a standard form, the equality pluse slack formulations. As described in (2). 
2. Goes to another vertex with an objective value that is less than or equal to the last value. And there are 2 other cases for this:
   1. Goes to infinity. 
   2. Get stuck due to degeneracy of the vertex of polytope. 

The algorithm is kinda complicated hence it will be stated in another file. 


---
### **Pre-solving**

This is a complicated topic and someone wrote their master thesis about it [here](http://etd.fcla.edu/UF/UFE1000157/sadhana_v.pdf). 
