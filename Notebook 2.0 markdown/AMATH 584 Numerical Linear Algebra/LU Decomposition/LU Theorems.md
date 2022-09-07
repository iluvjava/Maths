Here we are going to learn some theorems related to the LU decomposition. 

---

### Statement 1
> The LU decomposition of a invertible matrix is unique. 

Summary on the proof: 
* Via this proof we need to make use of one of the theorems. And we are going to use this fact: 
	> The inverse of a **Lower/Upper** Triangular matrix is still going to be **Lower/Upper** Triangular. 
* We are also going to reason the structure of the matrix, which is crucial when it comes to analysis. 

Consider 2 decomposition of the same invertible matrix A. 

> $$A = L_1U_1 = L_2U_2$$

Then: 
$$
L_1U_1 = L_2U_2
$$ 
$$
U_1 = L_1^{-1}L_2U_2
$$
$$
U_1U_2^{-1} = L_1^{-1}L_2
$$

Observe that: 

The inverse of the Lower Triangular matrix is still lower Triangular, and it's still true for the upper Triangular. 

$L_1^{-1}$ is also going to be a matrix with ones on the diagonal, this is discussed in [LU Decomposition](LU%20Decomposition.md), and the inverse is trivial to compute. Then it's true that $L_1^{-1}$ is also gonna have ones on the diagonal. 

If both $L_1^{-1}$ and $L_2$ have the ones on the diagonal and they are lower triangular, then the product $L_1^{-1}L_2$ will have zeros on the Diagonal too. 

Similarly, the inverse of a Upper Triangular matrix has to be upper diagonal too.

$U_1U_2^{-1}$ is gonna be UT, and $L_1^{-1}L_2$  is gonna be LT and the diagonal of them have to be ones, and then it means that: 

$$
U_1U_2^{-1} = I
$$
and 
$$
L_1^{-1}L_2 = I
$$

And this will mean that, $L_1 = L_2$ and $U_1 = U_2$, and hence the given statement is proved. 

---

### Statement 0.9

If a matrix is upper UT or LT, then the inverse it's going to preserve the structure of the matrix. 

Key: Use row operation matrix to prove this, without bring in the LU decomposition algorithm, the row operational matrix will reduce the lower triangular to identity, and then the matrix we used to do the row cancellation is going to be LT too. 

And if the matrix UT, then we just the operations on its transpose, the the inverse of the transpose if the transpose of the inverse, and then the inverse matrix will be UT too. 