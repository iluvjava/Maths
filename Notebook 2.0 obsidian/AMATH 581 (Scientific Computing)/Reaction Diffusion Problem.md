Here we are going to use the full spectral method to solve for the Reaction diffusion equations. 
prereq: [[Spectral Method 2]]

---

The problem is stated as the following system of PDEs: 

$$
u_t = \lambda(A)u - \omega(A)v + D_1 \nabla^2 u
$$

$$
v_t = \omega(A)u - \lambda(A)v + D_2\nabla^2 v
$$

Where 
$$
A = u^2 + v^2 \quad \nabla^2 = \partial_{x}^2 + \partial_{y}^2
$$

And the terms that make 2 of the agents reacts with each other will be governed by the $\lambda$ and the $\omega$ function, for the sake of HW5 we are looking at these function as: 

$$
\lambda(A) = 1 - A^2 \quad \omega(A) = -\beta A^2
$$

This is a non-linear system of partial differential equations, so it's really fancy however the temporal evolution of the system is explicit. 

### **FFT and Periodic Conditions**

#### **Descritization**: 

$$
x, y = [-10, 10] \quad n = 64
$$

Define the partial differential operator as a square matrix as: $K_x$, $K_y$ under the Fourier Domain, they are $64 \times 64$ matrix.  

Denote the $\circ$ as the element-wise multiplications of the matrices. 

Then the **Laplacian** under the Fourier Domain is defined as: 

$$
\nabla^2(\bullet) := (K_x\circ K_x + K_y\circ K_y)\circ  (\bullet)
$$

#### **Fourier Domain Operations**

Now let's define the transformation of the Non-Linear operators $A^2$, which is going to be: 

$$
A^2 = (u^2 + v^2)
$$

Now, assume that the inputs are $\widehat{u}, \widehat{v}$, then here is the procedures: 

Input: ($\widehat{u}, \widehat{v}$) --> IFFT($\widehat{u}, \widehat{v}$) --> $A^2$ --> FFT($A^2$)--> Output: 

All the non-linear operations are going to be element-wise operations so it's good. 

### **Vectorization**

Notice that, when evolving the PDEs as a ODEs system, the vectors are vectorized. Which means that, the grids points of $u$ and $v$ are packed in one big vector. And hence, it's useful that we need a vectorization transform to take the $u, v$ from the vector shape to matrix shaped. 

Another approach is to vectorize our Operational Matrices, instead of vectorizing the $u, v$ that are used for the simulations. 



