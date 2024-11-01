- [The Spectral Momentum Idea Part II](The%20Spectral%20Momentum%20Idea%20Part%20II.md)


---
### **Intro**

This file formalize some of the explorations and make them into mathematical claims about the spectral momentum algorithm stated from previously.
Assume the acceleration parameters $\theta_t \in [0, 1]$. 
Nesterov's accelerated gradient performs the iterations for iterates $y_t$: 

$$
\begin{aligned}
    y_{t + 1} &= [I - L^{-1} \nabla f]y_{t} + \theta_t([I - L^{-1}f]y_{t} - [I - L^{-1}f]y_{t - 1})
\end{aligned}
$$

#### **Claim 0 | Cannonical form of the recurrence matrix for Nesterov's accelerated gradient on all convex quadratic function**
> For the above recurrence, if we assume $f(x) = \frac{1}{2}\Vert Ax - b\Vert_2^2$ where $A \in \mathbb R^{n\times m}$, define $L$ to be any Lipschitz constant for $L$. 
> Define $y^+ = A^\dagger b$ where $A^\dagger$ is the Moreau Psuedo Inverse, define $VGV^T = A^TA$ to be the orthogonal eigendecomposition of semi-definite matrix $A^TA$ where $G$ is diagonal. Define $\Lambda = PGP^T$ where $P$ is a permutation matrix the re-orders diaognal in $G$ so that the diaognal elements of $\Lambda$ are in increasing order. 
> Then, Nesterov's acceleration recurrence can be expressed compactly by the following matrix recurrence relation: 
> $$
> \begin{aligned}
>     \begin{bmatrix}
>         \tilde y_{t} \\ \tilde y_{t + 1}
>     \end{bmatrix}
>     &= M_t 
>     \begin{bmatrix}
>         \tilde y_{t - 1} \\ \tilde y_{t}
>     \end{bmatrix}. 
> \end{aligned}
> $$
> Where $T_t = I - L^{-1} \Lambda$ and $M_t$ is the block diaognal matrix 
> $$ 
> \begin{aligned}
>     \begin{bmatrix}
>         I & \mathbf 0 
>         \\
>         -\theta_t T_t & (1 + \theta_t)T_t
>     \end{bmatrix}, 
> \end{aligned}
> $$
> and $\tilde y_t = P^TV^T(y_t - y^+)$, making it just an orthogonal transform away from the error vector $y_t - y^+$. 


**Proof** 

For simplicity we assume that $L$ is an upper bound of the Lipschitz modulus for gradient $\nabla f$. 
Assume generic quadratic form $f(x) = \frac{1}{2}\Vert Ax - b\Vert_2^2$, then the gradient operator is an affine: 

$$
\begin{aligned}
   \nabla f(x) 
   &= A^T(Ax - b)
   \\
   &= A^TAx - A^Tb
\end{aligned}
$$

If we set $y^+ = A^\dagger b$ where $A^\dagger$ is the Moreau Psuedo Inver, then it's in the zero set of $\nabla f$, which gives us $A^TAy^+ = A^Tb$. 
Using $y_+$, we write the gradient as $\nabla f(x) = A^TA x - A^TAy^+$. 
Now we may rephrase the gradient descent with momentum into: 

$$
\begin{aligned}
    y_{t + 1} &= 
    (1 + \theta_t)[I - L^{-1}\nabla f] y_t - \theta_t [I - L^{-1}\nabla f]y_{t - 1}
    \\
    &= 
    (1 + \theta_t)(
        y_t - L^{-1}A^TAy_t + L^{-1}A^Tb
    ) - \theta_t
    (
        y_{t - 1} - L{-1}A^TA y_{t - 1} + L^{-1}A^Tb
    )
    \\
    &= 
    (1 + \theta_t)(y_t - L^{-1}A^TA y_t)
    - \theta_t(y_{t - 1} - L^{-1}A^TAy_{t - 1}) 
    + L^{-1}A^Tb
    \\
    &= (1 + \theta_t)(y_t - L^{-1}A^TA y_t) 
    - \theta_t(y_{t - 1} - L^{-1}A^TAy_{t - 1}) 
    + L^{-1}A^TA y^+
    \\
    &= (1 + \theta_t)(I - L^{-1}A^TA)y_t 
    - \theta_t(I - L^{-1}A^TA)y_{t - 1} 
    + L^{-1}A^TA y^+
    \\
    \iff 
    y_{t + 1} - L^{-1}A^TA y^+ &= 
    (1 + \theta_t)(I - L^{-1}A^TA)y_t
    - \theta_t(I - L^{-1}A^TA)y_{t - 1}. 
\end{aligned}
$$

Next, $A^TA$ is semi-definite so it admits orthogonal eigendecomposition: $V G V^T =A^TA$ with $V$ orthonormal and $G$ diagonal. 
Since $L$ is the Lipschitz constant of $\nabla f$, it implies that $\mathbf 0 \preceq A^T \preceq LI$. 
Therefore we have $\mathbf 0 \preceq I - L^{-1} A^TA \preceq I$ and $I - L^{-1}A^TA = V(I - L^{-1}G)V^T$. 
Using that we can simplify the above recurrence into 

$$
\begin{aligned}
    y_{t + 1} - L^{-1}VGV^T y^+ 
    &= 
    (1 + \theta_t)V(I - L^{-1}G)V^Ty_t
    - \theta_t V(I - L^{-1}G)V^Ty_{t - 1}
    \\
    V(V^T y_{t + 1} - L^{-1}GV^T y^+)
    &= 
    V
    \left(
        (1 + \theta_t)(I - L^{-1}G)V^Ty_t
        - \theta_t(I - L^{-1}G)V^Ty_{t - 1}
    \right)
    \\
    V^T y_{t + 1} - L^{-1}GV^T y^+
    &= 
    (1 + \theta_t)(I - L^{-1}G)V^Ty_t
    - \theta_t(I - L^{-1}G)V^Ty_{t - 1}
    \\
    V^T y_{t + 1} 
    - V^T y^+
    &= 
    (1 + \theta_t)(I - L^{-1}G)V^Ty_t
    - \theta_t(I - L^{-1}G)V^Ty_{t - 1}
    + L^{-1}GV^T y^+ - V^T y^+
    \\
    V^T(y_{t + 1} - y^+)
    &= 
    (1 + \theta_t)(I - L^{-1}G)V^Ty_t
    - \theta_t(I - L^{-1}G)V^Ty_{t - 1}
    - (I -  L^{-1}G)V^T y^+
    \\
    V^T(y_{t + 1} - y^+)
    &= 
    (1 + \theta_t)(I - L^{-1}G)V^T(y_t - y^+)
    - \theta_t(I - L^{-1}G)V^T(y_{t - 1} - y^+). 
\end{aligned}
$$

The recurrence can be established on the successive iterates of $y_t - y^+, y_{t - 1} - y^+$, giving us the block recurrence relations: 

$$
\begin{aligned}
    \begin{bmatrix}
        V^T(y_{t} - y^+)
        \\
        V^T(y_{t + 1} - y^+)
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        I & \mathbf 0 
        \\
        - \theta_t(I - L^{-1}G)
        & 
        (1 + \theta_t)(I - L^{-1}G)
    \end{bmatrix}
    \begin{bmatrix}
        V^T (y_{t - 1} - y^+) \\ V^T (y_t - y^+)
    \end{bmatrix}. 
\end{aligned}
$$

Finally, we consider a permutation matrix the re-orders the rows and columns of $G$ with $PGP^T = \Lambda$ such that $\Lambda$ is a diagonal matrix of $l_i$ where $l_i \le l_{i + 1}$ for all $i = 1, \cdots, n -1$. 
Then the above recurrence relations becomes: 

$$
\begin{aligned}
    \begin{bmatrix}
        V^T(y_{t} - y^+)
        \\
        V^T(y_{t + 1} - y^+)
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        PP^T & \mathbf 0 
        \\
        - P\theta_t(I - L^{-1}\Lambda)P^T
        & 
        (1 + \theta_t)P(I - L^{-1}\Lambda)P^T
    \end{bmatrix}
    \begin{bmatrix}
        V^T (y_{t - 1} - y^+) \\ V^T (y_t - y^+)
    \end{bmatrix}
    \\
    \begin{bmatrix}
        P^TV^T(y_{t} - y^+)
        \\
        P^TV^T(y_{t + 1} - y^+)
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        I & \mathbf 0 
        \\
        -\theta_t(I - L^{-1}\Lambda)
        & 
        (1 + \theta_t)(I - L^{-1}\Lambda)
    \end{bmatrix}
    \begin{bmatrix}
        P^TV^T (y_{t - 1} - y^+) \\ P^TV^T (y_t - y^+)
    \end{bmatrix}. 
\end{aligned}
$$

From the first equality to the second, a $P^T$ is multiplied on both side of the equation and a $P^T$ is factored ou as a block diagonal matrix to merge to the vector multiplying from the right side of the matrix. 
Finally, we make the substitution $\tilde y_t =P^TV^T (y_t - y^+)$ to transform the above matrix recurrence into 

$$
\begin{aligned}
    \begin{bmatrix}
        \tilde y_{t} \\ \tilde y_{t + 1}
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        I & \mathbf 0 
        \\
        -\theta_t(I - L^{-1}\Lambda)
        & 
        (1 + \theta_t)(I - L^{-1}\Lambda)
    \end{bmatrix}
    \begin{bmatrix}
        \tilde y_{t - 1} \\ \tilde y_{t}
    \end{bmatrix}
    \\
    \text{Set: }
    T_t &= I - L^{-1}\Lambda
    \\
    \text{Set: }
    M_t &= 
    \begin{bmatrix}
        I & \mathbf 0 
        \\
        -\theta_t T_t & (1 + \theta_t)T_t
    \end{bmatrix}
    \begin{bmatrix}
        \tilde y_{t - 1} \\ \tilde y_{t}
    \end{bmatrix}
    \\
    \iff 
    \begin{bmatrix}
        \tilde y_{t} \\ \tilde y_{t + 1}
    \end{bmatrix}
    &= M_t 
    \begin{bmatrix}
        \tilde y_{t - 1} \\ \tilde y_{t}
    \end{bmatrix}. 
\end{aligned}
$$

Therefore, for Nesterov's acceleration, it suffice to study the block diagonal iteration matrix $M_t$. 


---
### **Convergence analysis of the spectral momentum algorithm in for convex quadratic function**

It suffices to show the behavior of the algorithm under the assumption that $\Lambda$ is a diagonal matrix 
We will first study the case where $\tilde y_t$ is a scalar, in which case we will have matrix $M_t$ as a 2x2 matrix. 
Ignoring the subscript $t$ for notational simplicity we have 

$$
\begin{aligned}
    M = \begin{bmatrix}
        0 & 1\\ -\theta \tau & (1 + \theta) \tau
    \end{bmatrix}. 
\end{aligned}
$$

Next, we make claims on the eigensystem, spectral radius for $M$ for varying $\theta_t \in [0, 1]$. 


#### **Claim 1 | Eigensystem of the 2x2 Nesterov's recurrence matrix**
> 

