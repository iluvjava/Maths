[[Conjugate Gradient]], [[Lancosz Algoritm]]

---
### **Intro**

There are a lot of ways to derive the conjugate Gradient algorithm. 

In [[Conjugate Gradient]] we derived the algorithm using the Gramschitz conjugation, here we will minimize the energy norm of the residual vector over the Krylov Subspace. 

Make you you know the Lancosz algorithm and its relations with Krylov Subspace. 

**Claim:** 

> The conjugate graidient algorithm minimizes the energy norm of the error vector at each iterations of the algorithm, which is to say: 
> 
> $$
> \begin{aligned}
>     x_{k + 1} = \arg\min_{x\in \langle K_{k}\rangle} 
>         \Vert x - x^+\Vert_A^2
> \end{aligned} \quad  \text{where: } Ax^+ = b
> $$

**The Major Idea**

We need a set of vectors such that they are orthogonal under the A-Inner product space. 

Looking for the solution of a system involving sparse matrix is very similar to looking for the Eigen Decomposition of the matrix, and then modify it at each step during the iterations. 



