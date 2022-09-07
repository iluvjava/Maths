### **Intro**

We talk about this mathematical entities and the things surrouding it. [Here](https://en.wikipedia.org/wiki/Companion_matrix) is the wiki for this entity. 

**Definition**: 

> $$
> C_n = \begin{bmatrix}
> 	e_2 & e_3 & \cdots & e_n & c
> \end{bmatrix}
> $$
> Is the companion matrix and it has a monic characteristic polynomial in that is: 
> $$
> |C_n - tI| = c_0 + c_1t + \cdots + c_{n - 1}t^{n - 1} + t^n
> $$
> Where, the last column of $C_n$ consist of $n$ elements, $c_0, \cdots, c_{n - 1}$. 

Sometimes it's written as the transpose of the above definition. 

**In Relation to Krylov Subspace**: 

One of the good nature about this matrix is the fact it represent the transformation between the matrix $A$ and its Krylov Subspace. Suppose that $\mathcal{K}_n(A, x) = I + Ax + A^2x + \cdots + A^{n -1}x$, Then we have the relations that $\mathcal{K}_n(A, x)C_n = A\mathcal{K}_n(A, x)$, which implies that $\mathcal{K}_n(A,x)^{-1}A\mathcal{K}_n(A, x) = C_n$, The matrix $A$ is similar to the companion matrix via it's Krylov subspace generated. This property is used for [Krylov Matrix QR and Arnoldi Iterations](../Hessenberg%20Form/Krylov%20Matrix%20QR%20and%20Arnoldi%20Iterations.md). 



---
### **More Details About the Properties**

