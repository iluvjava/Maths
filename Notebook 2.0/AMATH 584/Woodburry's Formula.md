Needs to know some [[Useful Matrix Identities]] before stepping into this part first. 


---
### **Intro**

This is the woodburry's formula: 

> $$
> (A + UCV)^{-1} = A^{-1} - A^{-1}U(C^{-1} + VA^{-1}U)^{-1}VA^{-1}
> $$

This is a very cool formula. Assuming that $UCV$ is somekind of lowrank matrices (SVD of some sort.) and $A$ is already determined to be invertible and we know the inverse of it, then we can find the inverse of $(A + UCV)$ rather quickly. 

This is also the update subroutine involved in the BFGS algorithm. 


---
### **Proofs**

Use the matrix Sum identity from the [[Useful Matrix Identities]] to prove this. It will take a while but it should be the right approach to it. 
