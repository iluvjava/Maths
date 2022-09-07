[Fields of Values](Fields%20of%20Values.md)
We are interested in computing the fields of values. 

---
### **Intro**

The fields of values is a **compact, convex set**. The proofs for that part is still *unclear*. 

Take the for granted, then we only need to sample from the boundary, and then create a convex hull around all the sampled points to approximate the set of numerical values of a given matrix. 

**Computational Procedures**

* Using the second corrolary from fields of values, we have: $\Re(\mathcal{F}(A)) = \mathcal{F}(\mathbb{H}(A))$

* Find the maximal eigenvalues for $\mathbb{H}(A)$ and its correconding eigenvector say $\lambda_{\max}, u$. 

* Then the vertical line cutting through $\Re(\lambda_{\max})$ is the left boundary of the field of value of the matrix $A$. 

* Consider rotating the fields of values using: 
  $$
  \mathcal{F}(\exp(i\theta)A) = \exp(i\theta)\mathcal{F}(A)
  $$

* Then, for all $\theta \in [0, 2\pi)$, we can measure the maximal eigenvalues of $\mathbb{H}(\exp(i\theta)A)$ and find the left boundary for the rotated field of values. 

* Because it's convex and compact, the vertical boundary line is enough to give tell us the shape for the field f values for the matrix $A$. 


