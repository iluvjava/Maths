Using Block matrices operations we have: 

By definition of inverse matrix multiplication, we can also use block matrices multiplication which is giving us: 
$$
\begin{bmatrix}
    R^T & -R^T t
    \\
    \mathbb{0}_{1\times 3} & 1
\end{bmatrix}
\begin{bmatrix}
    R & t 
    \\
    \mathbb{0}_{1\times 3} & 1
\end{bmatrix}
= 
\begin{bmatrix}
    I_{3\times 3} & R^Tt - R^Tt 
    \\
    0_{1\times 3} & 1
\end{bmatrix}
= 
I_{4\times 4}
$$ 

Note: $R^TR$ is the identity by the fact that $R$ is an orthonormal matrix. 