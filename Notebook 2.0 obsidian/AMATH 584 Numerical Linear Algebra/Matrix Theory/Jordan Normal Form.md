[[Subspace Direct Sum]]

- References 1: [here](https://www.maths.tcd.ie/~vdots/teaching/files/MA1111+1212-0809/113jord.pdf)
- References 2: A whole chapter on Jordan Normal Form in the book \<Matrix Analysis\>. 
- Make sure to read [[Generalized Eigenspaces]] before so we get the idea about eigen subspace of matrices. 

---
### **Intro**

Given any matrices, the Jordan normal form reduces matrix such that all of them are similar to matrices to a Jordan Normal Matrix. 

**Definition | Jordan Block**

A Jordan block is a diagonal matrix of eigenvalues together with a nullpotent operator. Let the nullpotent operator be $N_k = \text{diag}(\vec{1}, + 1)\in \mathbb{R}^{k \times k}$, (diagonal of ones shifted upwards by one index). It's called nullpotent because $N^{k} = \mathbf{0}$. Then a Jordan block is defined to be: 

$$
J_k = \lambda I + N_k
$$


---
### **The Jordan Normal Form**

For any matrix $A \in \mathbb{R}^{n\times n}$, it can be decompose into $XJX^{-1}$ where $J = \text{diag}(\{J_i\}_{i = 1}^{n_k})$ where $n_1 + n_2 \cdots + n_{k} = n$. Each eigenvactor, corresponds to a Jordan Block, and each Jordan block is either representing an invariant subspace, or a nilpotent space for an eigenvalue that has a algebraic multiplicity larger than one. 




