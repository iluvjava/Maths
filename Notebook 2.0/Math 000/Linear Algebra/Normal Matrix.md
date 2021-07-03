A normal matrix doesn't mean that all the columns in the matrix are normalized. 

---
### **Intro:** 
When a matrix is normal, it satisfies the following conditions: 
Let's say that the matrix $A$ is a normal matrix then: 

> $$A^HA = AA^H$$

> $$A = Q\Lambda Q^H$$

Where $Q$ is an unitary matrix. 

If a matrix is similar to a diagonal matrix by a unitary transform, then the matrix is going to be normal. 

### **Interesting Fact:** 

When the matrix is normal, the singular values of the matrix are the absolute eigen values of the original matrix. 

This is followed from the theorems from SVD, [[SVD Theorems]]

---
### **Normal vs Hermitian**
 
Hermitian Matrix has real eigenvalues and diagonalizable, and they can be written as $Q\Lambda Q^H$, and the diagonals of $\Lambda$ are all positive reals. 

Normal Matrix can be written as $Q\Lambda Q^H$, where the diagonal of $\Lambda$ can have any kind of numbers it wants. 

> Hermitians are a special kind of Normal. 


