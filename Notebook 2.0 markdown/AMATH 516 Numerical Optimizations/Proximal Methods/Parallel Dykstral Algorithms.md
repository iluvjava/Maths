[Convex Sets Projections and Dist, Intro](../Background/Convex%20Sets%20Projections%20and%20Dist,%20Intro.md), [Dykstra Via ADMM](../Operator%20Splitting/Dykstra%20Via%20ADMM.md)


---
### **Intro**

Here we use the 2 projections Dykstra algorithm and use an important observation about the averaged polling from [ADMM The Consensus Sharing](../Operator%20Splitting/ADMM%20The%20Consensus%20Sharing.md) to derive a parallel version of the Dykstra projection algorithm suitable for solving constraints represented by intersection between finitely many closed and convex constraints. This is also based on claims from Tibishirani's paper [Dykstra’s Algorithm, ADMM, and Coordinate Descent-Connections, Insights, and Extensions](../../MATH%20999%20Paper%20Reviews%20and%20Frontier%20Mathematics/References%20Sep%202022/Dykstra%E2%80%99s%20Algorithm,%20ADMM,%20and%20Coordinate%20Descent-Connections,%20Insights,%20and%20Extensions.pdf). 

The algorithm of Dykstra for finding any $x\in C\cap D$ where $C, D$ are convex is given as: 

$$
\begin{aligned}
    \begin{cases}
        u_1^{(k)} = \Pi_C\left(u_2^{(k - 1)}\right), 
        \\
        u_2^{(k)} = \Pi_D\left(
            u_1^{(k)} + z^{(k - 1)}
        \right),
        \\
        z^{(k)} = z^{(k - 1)} + u_1^{(k)} - u_2^{(k)}, 
    \end{cases}
\end{aligned}
$$

**Remarks**:

This is directly taken from Tibshirani's paper. Different formulation exists but I am too lazy to verify their equivalences. 

**Problem formulations**

The problem is

$$
\begin{aligned}
    \underset{x}{\text{argmin}} 
    \sum_{i = 1}^{N}\delta_{C_i}(x), 
\end{aligned}\tag{0}
$$

take note that we can rephrase the constraints $\bigcap_{i = 1}^NC_i$ as two constraints: 

$$
\begin{aligned}
    C &:= \left\lbrace
        \left. 
            (x_1, x_2, \cdots, x_N)\in \bigotimes_{i = 1}^N \mathbb R^n
        \right|
        x_1 = x_2=\cdots, x_N 
    \right\rbrace
    \\
    D &:= 
    \left\lbrace
        \left. 
            (x_1, x_2, \cdots, x_N)\in \bigotimes_{i = 1}^N \mathbb R^n
        \right|
        \\
        x_i \in C_i\; \forall i\in [N]
    \right\rbrace. 
\end{aligned}\tag{1}
$$

Note, here we use $\otimes$ to denote the set cross product. However, take notice that the first set $D$ can be characterize by the range of the matrix $\vec{\mathbf 1}_N \bigotimes I_n$, where $\bigotimes$ denotes the kronecker products between matrices. Therefore, the first problem (1) is equivalent to the problem below: 

$$
\begin{aligned}
    \underset{x=(x_1,\cdots, x_n)}{\text{argmin}}
    \delta_C(x) + \delta_D(x), 
\end{aligned}
$$

running algorithm (0) on problem (1) will produce the parallel dykstra algorithm. 

**Remarks**

For convergence, it will have to be the case that $\text{ri}(C)\cap \text{ri}(D)\neq \emptyset$. Whether such a conditions is exactly the same as the regularity conditions for problem described in (0) is unknown to me. 

---
### **The Parallel Dykstra Algorithm**

To use (0), we just need to consider $\Pi_C, \Pi_D$. The first projection onto $C$ can be summarized as: 

$$
\begin{aligned}
    \Pi_C(b) &= 
    \underset{x\in \text{ran}(\vec{\mathbf 1}_N\otimes I_n)}
    {\text{argmin}}
    \left\lbrace
        \Vert x  - b\Vert^2_2
    \right\rbrace
    \\
    &= 
    \underset{x\in \mathbb R^{nN}}{\text{argmin}}
    \left\lbrace
        \Vert 
            (\vec{\mathbf 1}_N \otimes I_n)x - b
        \Vert_2^2
    \right\rbrace
    \\
    &= 
    \vec{\mathbf 1}_n\otimes
    \underset{x\in \mathbb R^{nN}}{\text{argmin}}
    \left\lbrace
        \sum_{i = 1}^{N}
            \Vert x_i - b_i\Vert^2_2
    \right\rbrace
    \\
    &= 
    \vec{\mathbf{1}}_n\otimes 
        \left(
            N^{-1} \sum_{i = 1}^{N}b_i
        \right)
\end{aligned}
$$

where $b = (b_1, \cdots, b_N)\in \mathbb R^{nN}$, in the same format as the vector $x$. And of course, observe that at the end, we are just taking out $n$ length blocks of vector from the vector $b$, taking the average of all of them element wise, and then copy them $N$ times to concatenate them, which produces $\Pi_C(b)$. When projecting onto $D$, because the projection happens on a cross product space, we can broadcast it and get: 

$$
\begin{aligned}
    \Pi_D(b) &= 
    \bigotimes_{i = 1}^N \Pi_{C_i}(b), 
\end{aligned}
$$

which is trivially parallelizable. 

**Remarks**

In practice, we won't know whether the algorithm can converge in advance because most of the time we don't know whether there exists a feasible solutions for the system of constraints: $C_i$. To make it better, we might consider using the ADMM with consensus instead, and consider using $\text{dist}_{C_i}(x)^2$ instead because this function has desirable properties when the set $C_i$ are convex. 
