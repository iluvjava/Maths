Needs to know some [Useful Matrix Identities](Useful%20Matrix%20Identities.md) before stepping into this part first. 


---
### **Intro**

This is the woodburry's formula: 

> $$
> (A + UCV)^{-1} = A^{-1} - A^{-1}U(C^{-1} + VA^{-1}U)^{-1}VA^{-1}\tag{1}
> $$

This is a very cool formula. Assuming that $UCV$ is some kind of low ranked matrices (SVD of some sort.) and $A$ is already determined to be invertible and we know the inverse of it, then we can find the inverse of $(A + UCV)$ rather quickly. 

This is also the update subroutine involved in the BFGS algorithm. 


---
### **Proofs**

Use the matrix sum identity from the [Useful Matrix Identities](Useful%20Matrix%20Identities.md) to prove this. It will take a while but it should be the right approach to it. 


---
### **The Sherman Morrison Formula**

The formula: 

> $$
> (A + uv^T)^{-1} = A^{-1} - 
> \frac{A^{-1}uv^TA^{-1}}{1 + v^TA^{-1}u}
> \tag{2}
> $$ 

This formula is a special case of the above, Woodyburry's formula, where the matrix $u,v$ are replaced to be vectors and the matrix $C$ is a scalar. 

This is a great strategies of updating the inverse of a matrix iteratively while rank-1, or multiple rank additions of the matrix are being applied to it. But there are some intricacy in it, such as keeping the matrix to be invertible. 