It's an iterative algorithm that designed for solving Linear Programming problems, discussed in: [Linear Programming Everything](Linear%20Programming%20Everything.md)


---
### **Intro**

List of things
1. Conversion to the standard form
2. Splitting the variables into basic feasible set and the Non-Basic feasible, indicating the primal variable that is current saturating the constraints settings. 

#### **Simplex Standard Form**

The Primal problem we are trying to solve is: 

$$
\min \{ r^Ty: Ty \le g, My = c\}
$$

But notice the trick of representing $Ax \le b$ as $Ax + s = b$ and $My = c$ as $My \le c \wedge My \ge c$, which changes it to equality constraints. Thefore, we can say that: 

$$
A = \begin{bmatrix}
    T & I\\ M & \mathbf{0}
\end{bmatrix} 
\quad x = \begin{bmatrix}
    y \\ s
\end{bmatrix}
\quad
r^T = \begin{bmatrix}
    c^T & \mathbf{0}
\end{bmatrix}
\quad 
b = \begin{bmatrix}
    g \\ c
\end{bmatrix}
$$

And therefore, we can write the formulation of any linear programming problem in the form of: 

$$
\min \{ r^Tx : Ax = b, s \ge 0\} \text{ where: } x = \begin{bmatrix}
    y \\ s
\end{bmatrix}
$$

Close, but no quiet, we have $s\ge 0$, but $y$ is still unbounded. Now let's consider the substitution $y = y^+ + y^-$, by splitting the primal decision variables into positive and negative parts. With this we can reduce the above primal problem into: 

$$
\min \left\lbrace
    \begin{bmatrix}
        c\\ -c\\ \mathbf{0}
    \end{bmatrix}^T
    \begin{bmatrix}
        y^+ \\ y^- \\ s
    \end{bmatrix} 
    : 
    \begin{bmatrix}
        A & -A & I
    \end{bmatrix}
    \begin{bmatrix}
        y^+ \\ y^- \\ s
    \end{bmatrix} = b
\right\rbrace
$$

And that was pretty god damn complicated

> Such a reduction will assert that $A$ be a wide matrix, where $m$ is the number of constraints for the original problem, and $n$ is the length of vector $y$. 
>
> Ok, let's not worry about what the problem before the reduction is, and just assume that $A$ is $m\times n$, where $n > m$ and let the primal variable simply be x. And therefore, the problem we are actually considering would be: 
> $$\min \{c^Tx : Ax = b \wedge x \ge 0\}$$
> Let's call it the **STD Simplex** form. 

#### **The KTT**

Following the previous case, we need the fundamental formulation of the programming problem and the KTT: 

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
> \end{cases}\tag{1}
> $$




**Setting Up**

1. Let's assume that $A \in \mathbb{R}^{m\times n}$ where $m \ge n$, at least. 

2. Lets assume that $A$ is full  row rank. This means that the rows are enough to trap a feasible point, so it's solvable at the **best case**. 

3. Let $\mathcal{B}$ be a set of indices in $[n]$, indicating the $x_j$ that we are improving. 

4. This matrix $A$ whose columns are indexed by $\mathcal{B}$ will have to be **Non-Singular**, which corresponds to a vertex of the polytope that lock the solution $x$, which also mean that $|\mathcal{B}| = m$. 

5. Let the set $\mathcal{N}$ be all the other indices, together we have $\mathcal{N} \dot\cup \mathcal{B}$ to be 2 disjoint sets representing all the columns for the matrix $A$. 


**Variables, Notations**

1. $x\in \mathbb{R}^n$, primal variable
2. $s \in \mathbb{R}^n$, dual slack variable
3. $\lambda \in \mathbb{R}^m$, dual decision variable
4. $\mathcal{B}$, where $|\mathcal{B}| = m$, indeices for the primal variable. 
5. $[x_i]_{i \in\mathcal{B}}$, the solutions that are choosen to be in $\mathcal{B}$
6. $[x_i]_{i\in\mathcal{N}}$, the primal decision variable 
7. $[s_i]_{i\in \mathcal{B}}$, $[s_i]_{i\in \mathcal{N}}$ and the same for $c$ ($[c_i]_{i\in \mathcal{B}}$ and $[c_i]_{i \in \mathbb{N}}$), where each of them are splitted and mapped to the basic feasible set of indices. 

