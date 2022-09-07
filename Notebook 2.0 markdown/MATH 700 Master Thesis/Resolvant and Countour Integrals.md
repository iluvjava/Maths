[GMRes Error Bound via Cauchy Integral on Resolvant](GMRes%20Error%20Bound%20via%20Cauchy%20Integral%20on%20Resolvant.md)
[Calculus of Residual](../AMATH%20501%20Complex%20Analysis,%20Vector%20Calculus/Complex%20Analysis/Calculus%20of%20Residual.md)
[Calculus of Residual (Res Shortcut)](../AMATH%20501%20Complex%20Analysis,%20Vector%20Calculus/Complex%20Analysis/Calculus%20of%20Residual%20(Res%20Shortcut).md)

---
### **Intro**

The use of countour integrals on the resolvant of operator $A$, hopefully diagonalizable, are widely used for a lot of theoretical applications numerical analysis. 

For Hermitian Matrix, consider the vector outter product representatoin of it: 

$$
\begin{aligned}
    A &= \sum_{i = 1}^{n} \lambda_i uu^H
    \\
    \implies A^{-1} &= \sum_{i = 1}^{n}
        \frac{1}{\lambda_i} uu^H
    \\
    (zI - A)^{-1} &= 
    \sum_{i = 1}^{n}
        \frac{1}{z - \lambda_i}u^Hu
\end{aligned}
$$

Parameter $z$ and the summation of the outter products of eigenvectors allows for the applications of Residual Method from the countour integral. 


