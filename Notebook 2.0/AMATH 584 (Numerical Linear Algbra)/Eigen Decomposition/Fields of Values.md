[[Matrices]], [[Spectral Radius]]

Important references for more stuff: [numerical range in a nutshell](http://www.math.wsu.edu/faculty/tsat/files/short.pdf)

---
### **Intro**

The idea of fields of values is analogous to spectral radius, but it's for non-hermitian matrices. 

Definition 

$$
\mathcal{F}(A) = \left\lbrace
    \frac{y^HAy}{y^Hy}: y \in \mathbb{C}^n
\right\rbrace
$$

This is a set of scalars. The thing inside is called the Rayleigh Quotient. 

**Numerical Range**

Another similar concept of a matrix is the numerical range of the matrix, which is simply: 

> $$
> \mathcal{R}(A) = \left\lbrace
>     |z|: z\in \mathcal{F}(A) 
> \right\rbrace
> $$

---
### **Corollary 1**

> The eigenvalues of the matrix $A$ is in $\mathcal{F}(A)$. This too obvious to prove. 

---
### **Corollary 2**

> $$
> \Re(\mathcal{F}(A)) = \mathcal{F}(\mathbb{H}(A))
> $$ 
> where $\mathbb{H}(A) = \frac{1}{2}(A + A^H)$

The proof is kinda obvious, just remember that $y^H A y$ and $y^HA^Hy$ are conjugate of each other, using the properties of: [[Complex Vec Dot]]. Nice and easy. 