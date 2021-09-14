Fix some of the mistakes in the first HW and then hopefully we can be more careful about HW in the future. 

Topics on this includes: [[Unitary Matrix]]

---

### Statement 1

> If $A$ is a triangular matrix and it's unitary, then A is a diagonal matrix. 

I think the proof here doesn't have to use the fact that the matrix unitary, we only need to use the fact that, the matrix and its inverse is, upper triag and lower triag, and this is all we need. 

> By the fact that the matrix $A$ is unitary, we know that $AA^H = I$, and hence, the matrix multiplied by its transpose is giving us the identity matrix. 



#### Illustrating Example for a Base Case

The proof of the base case is trivial, and it comes down to consider the equation for 2 by 2 complex matrix:
$$
AA^H = 
\begin{bmatrix}
	a_{1, 1} & a_{1, 2} \\ 
	0 & a_{2,2}
\end{bmatrix}
\begin{bmatrix}
	a_{1, 1}^* & 0 \\ 
	a_{1, 2}^* & a_{2,2}^*
\end{bmatrix}
=I _{2\times 2}
$$

Follows from the fact that the matrix $AA^H$ is actually the identity matrix: 
> Claim (1): $(AA^H)_{2,2} = 1$ and $(AA^H)_{1, 2} = 0$ implies that $a_{1, 2} = 0$

$$(AA^H)_{2,2} = 1 \implies a_{2, 2}^*a_{2,2} = 1 \implies a_{2,2} \neq 0$$ (1.1)

$$(AA^H)_{1, 2} = 0 \implies a^*_{2,2}a_{1, 2} = 0$$

by (1.1), it must be the case that $a_{1, 2} = 0$

Now let's assume that the matrix $A\in \mathbb{C^{n\times n}}$, and then we will try to show that the element $A_{i, n} = 0$ when $1\leq i \leq n - 1$ and $A_{n, n} \neq 0$ from the fact that $AA^H = I_n$. 

Fact 1: 
$$
(AA^H)_{n, n} = 1
$$
which means that $|a_{n, n}| \neq 0$

Fact: 
$$(AA^H)_{i, n} = 0 \; \forall\; 1 \leq i \leq n - 1$$

But also: $(AA^H)_{i, n} = a_{i, n}a^*_{n, n} = 0$

Using the fact that $a_{n, n} \neq 0$, we know that $a_{i, n} = 0$ for all $1 \leq i \leq n - 1$

Now, choose the sub $(n- 1)\times (n - 1)$ matrix of the matrix $A$, and then apply this argument inductively, it will follow that: 
$$a_{i, n - 1} = 0 \; \forall \; 1 \leq i \leq n - 2$$ and 
$$|a_{n - 1, n - 1}| = 1$$

Until the remaining upper submatrix is $2\times 2$ then it will go back the the base case, which is already proved above. 

#### Another Proof

So we are going to make another proof, where make use of the fact that: 
> The inverse matrix of an Upper/Lower Triangular Matrix is still going to be Upper, or Lower triangular. 

This is easy to reason with an row operation matrix that brigs the LT to identity matrix. 

---

### Statement 2

> If U is an unitary matrix, then all its eigen values will have a modulus of 1. 

For this proof, we have to use the norm property of the unitary, matrix, more specifically: $||Ux|| = ||x||$. 

Suppose that the matrix $U$ has the eigen values $\lambda$ and its corresponding eigen values: $v$, then it will mean that $||Ux|| = ||\lambda x|| = |\lambda|||x|| = ||x||$, and this will imply the fact that 

$$|\lambda| = 1$$

Take note that, this is the absolute value of the eigen value is 1, not that the eigen values are actually 1. 

#### Corollary
This will mean that $\det(U) = \pm 1$
