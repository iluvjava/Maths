- [[Hessenberg Transform intro, HS Reflector]]
- [[Hessenberg Transform with Arnoldi Iterations]]
- [[Krylov Matrix QR and Arnoldi Iterations]]

Need to know all above to understand what I am trying to talk about in this file

---
### **Intro**

In this file, we will be looking for computable connections between all these ideas, here is the list of Ideas: 

* Computing the Hessenberg form using the Householder Reflector
* Computing the Hessenberg form using the Arnoldi Iteration
* Computing the Hessenberg form using the QR on the Krylov Subspace

**Questions to Answer**: 
1. How to choose the first parameter $q_1$ so that the HS method will produce the same $\tilde{H}, Q$ matrix as the Arnoldi Iterations? 
2. During the computation of the algorithm, how do we express the $q_k$ vector from the Arnoldi Iteration is the same as the $q_k$ vector from the QR decomposition on the Successive Krylov Subspace, without assuming the rank of the Krylov Subspace. 