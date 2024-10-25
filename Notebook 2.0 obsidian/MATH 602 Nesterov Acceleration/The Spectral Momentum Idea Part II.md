- [The Spectral Momentum Idea](The%20Spectral%20Momentum%20Idea.md)


---
### **Intro**

$G$ is a positive semi-definite matrix with $\mathbf 0 \preceq G \preceq I$. 
Define $T := I - G$. 
Let $(\theta_t)_{t\in \N}$ be a sequence such that $\theta_t \in (0, 1)$. 
Consider the iterations

$$
\begin{aligned}
    y_t &= T y_{t - 1} + \theta_t T(y_{t - 1} - y_{t - 2})
    \\
    &= (T + \theta_t T) y_{t - 1} - \theta_t T y_{t - 2}
    \\
    \begin{bmatrix}
        y_{t - 1}  \\ y_{t}
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        \mathbf 0 & I 
        \\
        - \theta_t T
        & T + \theta_t T
    \end{bmatrix}
    \begin{bmatrix}
        y_{t - 2} \\ y_{t - 1}
    \end{bmatrix}

\end{aligned}
$$

It would be great for the $T$ matrix to be a diagonal matrix. 
We can do that without loss of generality, because $T$ is semi-definite. 
Assume $T$ is diagonal. 
So we can solve the block 2x2 matrix's eigen system and carry the eigen system over for the entire block 2x2 matrix. 

