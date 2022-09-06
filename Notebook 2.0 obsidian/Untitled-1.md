Orthogonal projection of $a$ onto $b$. Hold on...
$$
\begin{aligned}
   & a - \langle  a, \hat b\rangle \hat b
   \\
    = & a - ((\hat b)^T a)\hat b
    \\
    = & a - \hat  b(\hat b)^T a
    \\
    = & (I - \hat b(\hat b)^T)
\end{aligned}
$$
Where $\hat b = b/\Vert b\Vert$
$$
R = 
\begin{bmatrix}
    1 & & 
    \\
    & 1 & 
    \\
    & & 1
\end{bmatrix}
-
\frac{1}{\Vert b\Vert^2}
\begin{bmatrix}
    b_1^2 & b_1b_2 & b_1b_3
    \\
    b_2b_1 & b_2^2 & b_2b_3
    \\
    b_3b_1 & b_3b_2 & b_3^2
\end{bmatrix}
$$


