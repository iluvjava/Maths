The iterative method for solving linear systems are usually deployed to solve discretized problem of the form: $Ax = b$ for a given time stepping for a differential equations. 
Related: [[Direct Method]]

---

### **Jacobi Iteration**

The Jacobi Iteration is used as a way to figure out the solution of a linear system. 

Consider any matrix that is SDD (Strictly Diagonally Dominance), meaning that the absolute value of the diagonally elements is larger than all the other elements on that row of the matrix. 

Say that matrix is $A$, and then we want to decompose the matrix into 2 parts the diagonal parts and the non-diagonal parts, so it's like: 

$$
A = D + R
$$

Where $D$ is literally the diagonal matrix with diagonal elements from the matrix A. And the matrix $R$ is the matrix for all the other elements in the matrix. Then the iteration scheme will be: 

> $$
> \vec{x}_{k + 1} = D^{-1}(-R \vec{x}_k + b)
> $$

The key here is to realized that, iteratively, the norm of the matrix $D_{-1}R$ is approach zero, and this is actually bring down the error $||\vec{x}_{k + 1} - \vec{x}_{k}||_p$

---

### **Gauss-Seidel Method**

It's an modification of the Jacobi Method where sequencial substitution is used to speed up, because whenever $(\vec{x}_{k + 1})_1$ has been computed, then we will have this new element closer to the solution, and we can use it for the sub-sequence computation like: $(\vec{x}_{k + 1})_3, (\vec{x}_{k + 1})_3 \cdots$

Like that. 

Now let's decompose the matrix into a lower triangular matrix and a **strictly upper triangular matrix** (**Where the diagonal must be zero**)

$$
A = L + U
$$

Then the iterative scheme is gonna be like: 

$$
\vec{x}_{k + 1} = L^{-1}(-U\vec{x}_{k} + \vec{b})
$$
 
 **NOTE:**
 
 We can apply full permutations on the rows and columns of the matrix to make the matrix to be Strictly Diagonally Dominance. 
 
 Both of these methods has a complexity of $\mathcal{O}(N^2)$, where $N$ is the dimension of the matrix. 
 
 SDD: 
 **Strictly Diagonal Dominant**: The element on the diagonal of the matrix is larger than the sum of absolute value of all the non diagonal element. 
 
 **Computational Concerns**: 
 Jacobi Method: Supports Parallelization
 
Gauss-Seidel Method: Doesn't support because back substitution is going to be need for the algorithm. 

--- 

### **Brief Analysis On Convergence (Jacobi)**

If the solution of the linear system is $x_*$, then it will equates the left and right side of the iterative scheme, meaning that: 

$$
x_{k + 1} = D^{-1}(-Rx_k + b)
$$

Stabilizes and changed into: 
$$
x_* = D^{-1}(-Rx_* + b)
$$

And then we subtract the second equations on the first one and then get an description of the error $\Vert x_k - x_*\Vert$ for the iterations, and it will be like: 

$$
x_{k + 1} - x_* = -D^{-1}R(x_k - x_*)
$$

And then recursively expand the expression we will have: 

$$
x_{k + 1} - x_* = (-D^{-1}R)^{k}(x_0 - x_*)
$$

Notice that the iterations will converge if the following condition is true for any norm: 

$$
\Vert-D^{-1}R\Vert < 1
$$

And if that happens, the the Jacobi iteration is going to converge. The same technique can be applied to other schemes to prove the convergence. 

