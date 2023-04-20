- [KKT in Linear Programming](KKT%20in%20Linear%20Programming.md), read this to gain more insights about how LP duality is a specific case of the KKT conditions. 
- [Linear Programming Strong Duality via Farkas, Standard Forms](Linear%20Programming%20Strong%20Duality%20via%20Farkas,%20Standard%20Forms.md), read this for more insight specifically about LP duality. 

---
### **Intro**

This is a quick reference when we need to find the dual of LP and don't want to use the simplex standard form method. 


$$
\begin{aligned}
    \begin{aligned}
        & \min 
        \\
        \text{con} & \left\lbrace
            \begin{aligned}
                \ge 
                \\
                \le
                \\
                =
            \end{aligned}
        \right.
        \\
        \text{var} & \left\lbrace
            \begin{aligned}
                & \ge \mathbf 0 
                \\
                & \le \mathbf 0 &
                \\
                & \text{unres} 
            \end{aligned}
        \right.
    \end{aligned}
    & 
    \begin{aligned}
        \max &
        \\
        \left.
            \begin{aligned}
                \ge \mathbf 0 & 
                \\
                \le \mathbf 0 & 
                \\
                \text{unres} & 
            \end{aligned}
        \right\rbrace
        &
        \text{var}
        \\
        \left.
            \begin{aligned}
                \le& 
                \\ 
                \ge &
                \\ 
                =& 
            \end{aligned}
        \right\rbrace
        &
        \text{con}
    \end{aligned}
\end{aligned}
$$

- Con: Represents the inequality for constraints where we have the decision variables only on the left hand side, and the constants on the right hand side. 
- Var: The sign of the variables that corresponds to the dual constraints type. 

That is the cheat sheet. The variables the primal chooses its sign that penalizes the constraints violations of the dual in favor of the primal objective, the constraints of the primal determine the sign of the dual variables that favors the dual objectives.  

---
### **The Ultimate Example to Demonstrate the Use of the Table:** 

Suppose that the primal is a maximization problem of the form: 

$$
\begin{aligned}
    & \max \langle c, x\rangle + \langle d, y\rangle + \langle f, z\rangle \text{ s.t: }
    \\
    & 
    \begin{bmatrix}
        A_{1, 1} & A_{1, 2} & A_{1, 3}
        \\
        A_{2, 1} & A_{2, 2} & A_{2, 3}
        \\
        A_{3, 1} & A_{3, 2} & A_{3, 3}
    \end{bmatrix}
    \begin{bmatrix}
        x \\ y \\ z
    \end{bmatrix}
    \begin{matrix}
        \le \\ \ge \\ =
    \end{matrix}
    \begin{bmatrix}
        b_2 \\ b_2 \\ b_3
    \end{bmatrix}
    \\
    \text{where}& \begin{cases}
        x \ge \mathbf 0 \\ y \le \mathbf 0 \\ z \text{ free}
    \end{cases}
\end{aligned}
$$

then the dual problem assign a dual variable for each of the constraints of the primal, and it assign constraints according to each of the primal decision variable. Reading the columns from right to left on the table, we can get: 

$$
\begin{aligned}
    & \begin{cases}
        u \ge \mathbf 0 
        \\
        w \le \mathbf 0
        \\
        v  \text{ free}
    \end{cases}
    \\
    &
    \begin{bmatrix}
        u^TA_{1, 1}^T & w^TA_{2, 1}^T & v^TA_{3, 1}^T
        \\
        u^TA_{1, 2}^T & w^TA_{2, 2}^T & v^TA_{3, 2}^T
        \\
        u^TA_{1, 3}^T & w^TA_{2, 3}^T & v^TA_{3, 3}^T
    \end{bmatrix}
    =
    \begin{bmatrix}
        u \\ w \\ v
    \end{bmatrix}^T
    \begin{bmatrix}
        A_{1, 1}^T & A_{2, 1}^T & A_{3, 1}^T
        \\
        A_{1, 2}^T & A_{2, 2}^T & A_{2, 3}^T
        \\
        A_{1, 3}^T & A_{2, 3}^T & A_{3, 3}^T
    \end{bmatrix}
    \begin{matrix}
        \ge \\ \le  \\  = 
    \end{matrix}
    \begin{bmatrix}
        c \\ d \\ f
    \end{bmatrix}
    \\
    &
    \min
    \langle b_1, u\rangle + \langle b_2, w\rangle + \langle b_3, v\rangle
\end{aligned}
$$

Here, the dual variable plays the roles of selecting the correct combinations of rows from the transpose of the constraints matrix so that the regime where the primal variable controls forms a constraints, and the constraints try to bound the objective vector. 


---
### **Complementary Slackness**

The complementary slackness for dual variable $u, w$ holds as usual. They corresponds to the $\le, \ge$ inequality system. if $u_i$ is non zero, then the corresponding $i$ constraint is tight for the primal optimal solution. Since the equality constraints are always tight, the free dual variables, $z, v$, is free and there is no constraints on them. 

