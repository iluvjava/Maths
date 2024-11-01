- [The Spectral Momentum Idea Part II](The%20Spectral%20Momentum%20Idea%20Part%20II.md)


---
### **Intro**

This file formalize some of the explorations and make them into mathematical claims about the spectral momentum algorithm stated from previously. Nesterov's accelerated gradient performs the following iterations for iterates $y_t$: 

$$
\begin{aligned}
    y_t &= [I - L^{-1} \nabla f]y_{t} + \theta_t([I - L^{-1}f]y_{t} - [I - L^{-1}f]y_{t - 1})
\end{aligned}
$$

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
    y_t &= 
    (1 + \theta_t)[I - L^{-1}\nabla f] y_t - \theta_t [I - L^{-1}\nabla f]y_{t - 1}
    \\
    &= 
    (1 + \theta_t)(
        y_t - L^{-1}A^TAy_t + A^Tb
    ) - \theta_t
    (
        y_{t - 1} - L{-1}A^TA y_{t - 1} + A^Tb
    )
    \\
    &= 
    (1 + \theta_t)(y_t - L^{-1}A^TA y_t)
    - \theta_t(y_{t - 1} - L^{-1}A^TAy_{t - 1}) 
    + A^Tb
    \\
    &= (1 + \theta_t)(y_t - L^{-1}A^TA y_t) 
    - \theta_t(y_{t - 1} - L^{-1}A^TAy_{t - 1}) 
    + A^TA y^+
    \\
    &= (1 + \theta_t)(I - A^TA)y_t + 
    \theta_t(I - A^TA)y_{t - 1} 
    + A^TA y^+
    \\
    y_t - A^TA y^+ &= 
    (1 + \theta_t)(I - A^TA)y_t + 
    \theta_t(I - A^TA)y_{t - 1}. 
\end{aligned}
$$

Next, $A^TA$ is semi-definite so let's assume that it admits orthogonal eigendecomposition: $V G V^T =A^TA$. 
Since $L$ is the Lipschitz constant of $\nabla f$, it implies that $\mathbf 0 \preceq A^T \preceq LI$. 
Therefore we have $I - L^{-1} A^TA$ semi-definite as well and $I - L^{-1}A^TA = V(I - G)V^T$. 
Using that we can simplify the above recurrence into 

$$
\begin{aligned}
    y_t - A^TA y^+ 
    &= 
    (1 + \theta_t)V(I - G)V^Ty_t
    + \theta_t V(I - G)V^Ty_{t - 1}
    \\
    &= 
    
\end{aligned}
$$




---
### **Convergence analysis of the spectral momentum algorithm in for convex quadratic function**

It suffices to show the behavior of the algorithm under the assumption that $\Lambda$ is a diagonal matrix 

