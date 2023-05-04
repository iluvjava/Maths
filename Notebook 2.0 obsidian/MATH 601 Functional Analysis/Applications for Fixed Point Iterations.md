[[Banach Contraction in Metric Space]]

---
### **Intro**

We view over some fixed point iterations method that we probably learned at some point but wasn't able to make the connections for it. 

**Applications:Minimum of Strongly Convex Function**

> One immediate applications of the algorithm is to find minimum of a function that is strongly convex. Suppose that $f: \mathbb E\mapsto \R$ to be a strongly convex function. To perform the fixed point iterations, we solve the equation $\mathbf 0 = \nabla f(x)$ by transforming it to the fixed point form: $x = x - \beta \nabla f(x), \beta > 0$, then $(I - \beta \nabla f)^{-1}$ is now a contraction. A fixed point iterations performed on this operator is a proximal point method. 


---
### **Stationary Method for Linear/Nonlinear System**

Consider $(\R^n, \Vert \cdot\Vert_\infty)$ metric. And we eventually want to solve the equation $Ax + b = 0$ using fixed point iterations. We ask the question that, what if, $T=Ax + b$ converges with Banach Contraction? Of course, in this case would be solving the equation $x = Ax + b$. What conditions would have to be true for this to be a contraction? Here we will: 
- Establish the convergence conditions for the operator $Ax + b$, 
- Splitting the matrix for a linear system. 
- Derive that one of the sufficient condition is a linear system with diagonally dominant matrix. 
- Conclude that this is the Jacobi Method. 
- Extend the Jacobi method to non-linear system trivially. 

**Step 1**: 

It would be great to just iterate on $Tx = Cx + b$, and then we have a convergence theorem. To see that we characterize it as a contraction: 

$$
\begin{aligned}
    y_i := (Tx)_i &= \sum_{ i = 1}^{n}c_{i, k}x_k + b_i
    \\
    d(Tx, Tz) = \Vert Tx - Tz\Vert_\infty &= \max_{i\in [n]} 
    \left|
        \sum_{k = 1}^{n} c_{i, k}(x_k - z_k)
    \right|
    \\
    &\le \max_{k\in [n]} |x_k - z_k|
    \max_{i\in [n]} \left|
        \sum_{k= 1}^{n}c_{i, k}
    \right|
    \\
    &= d(x, z) \max_{i\in [n]}\left|
        \sum_{k = 1}^{n}c_{i, k}
    \right|, 
\end{aligned}
$$

If, the max of the absolute sum of rows of matrix $c$, is less than 1 then, a contraction. To derive the iterative schemes for matrix solve, we need to spit the matrix. Suppose we are solving $Ax = c$, let $D$ be the diagonal part of $A$, let $G = A - D$, then $Ax = c \iff (D + G)x = c \iff Dx = -Gx + c \iff x = D^{-1}(D - A)x + D^{-1}c$. Then the max row sum condition become: 

$$
\begin{aligned}
    \max_{i \in [n]} 
    \left(\sum_{k = 1, k\neq i}^{n} \left|
        \frac{a_{i, k}}{a_{i, i}}
    \right|\right) < 1, 
\end{aligned}
$$
because the iterative matrix, $C$, now is $D^{-1}(D - A)$. This is called a diagonally dominant matrix. Such a splitting scheme generate the Jacobi Method.See [[../../AMATH 585 Numerical Analysis of BVP/Stationary Iterative Methods]] for more info. 

**Remarks**: 

From Greenbaum's work, we know that this is strictly stronger to show the convergence of the iterative method. The spectral radius of the function sometimes is $< 1$ but the norm might be larger. In which case, the method would still converge, at the end. 

**References**: Wang's Analysis II class. 


---
### **Stong Convexity**

Strong convexity of functions make gradient operator that is also a contraction. This property allows to state the convergence properties of many algorithms for this special type of function. 
