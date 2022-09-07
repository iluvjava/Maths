let's Talk about Unitary Matrix, Orthogonal vectors and matrices. 


Prereq: [Complex Inner Product](Complex%20Inner%20Product.md)

---

### **Definition**
By definition, a Unitary Matrix is a Matrix such that
> $$Q^HQ = I$$

It i's **NOT** implied that, the matrix is a square matrix. 


#### **Theorems**

> The vectors in an orthogonal set S has to to be linear independent. theorem 2.1 stated in *Numerical Linear Algebra*

> Stated as **Lemma 2.1.8** in *Matrix Analysis*, All Unitary Matrices form a compact space and they experience Sequential Compactness meaning that, given any infinite sequence of Unitary Matrices like: 
> $$
> \exists\; U: U^HU = I\; \forall\; U_1U_2\cdots U_n\cdots \exists \; U_{n1}U_{n_2}... : 
> \lim_{k\rightarrow \infty} U_{n_k} = U
> $$
> For every sequence of unitary matrices in the Unitary Matrix space, there is a subsequence of it, which will converge to a unitary matrix. 


---
### **Famous Examples**

Householder Reflector: [HS Reflector](../QR%20Decomposition/HS%20Reflector.md)
Plane Rotation Matrix: 
 


---
### **Orthonormal Set** 

A set of vectors from $\mathbb{C}^n$ is said to be orthogonal if, all of the elements from the set are perpendicular with each other. 

Let $Q = \{q_1, q_2, ... q_m\}$, it's implied that $m \leq n$. 

Orthogonality of the set asserts that $q_i^Hq_j = 0 \quad \forall\; 1 \leq i \neq j \leq m$

Normality of the set asserts that $||q_i||_2= 1 \quad \forall 1\ \leq i \leq m$

---
### **Project onto** $Q$
Choose any $v\in \mathbb{C}^n$, then the projection of $r$ onto the subspace is gonna be: 

$$v - \sum_{i = 1}^m (q_i^Hv)q_i \perp \sum_{i = 1}^m(q_i^Hv)q_i$$

These 2 vectors are $\perp$. 

Take Note that $q_i^Hr$ cannot commute, can't do that any more complex numbers. To prove it, multiple it by both sides by $q_i$ of $v - \sum_{i = 1}^m (q_i^Hv)q_i$

Cool, so what we have done is, breaking down the vector $v$ into 2 orthogonal components. 

The component onto the $Q$ subspace is: 

>$$\text{proj}_Q(v) = \sum_{i = 1}^m (q_i^Hv)q_i$$

And then the residual will be $v - \text{proj}_{Q}(v)$. 

Another interpretation of the projection of the vector involves some outter poruduct and matrix algebra, and here is the derivation of the formula: 

> $$\text{proj}_Q(v) = \sum_{i = 1}^m (q_iq_i^H)v$$

**Observe**

It's $q^Hv$ not the other way around, a projection onto another vector has to place that vector being projected to under the Hermitian Transpose operator

---
### **Derivation**

I think this is trivial when we just view everything as a Matrix, including scalar, but scalar and vectors are still matrices. 

Take a look at the expression of 

$$q_i(q_i^Hv)$$

and the dimension mapping is: 

$$\mathbb{C}^{n \times 1} \leftarrow \mathbb{C}^{1 \times n} \leftarrow  \mathbb{C}^{n \times 1}$$

Notice how this is already making sense we if just use the associate tivitity of the amtrix multiplication and then we will have: 

$$q_i(q_i^Hv) = (q_iq_i^H)v$$

And this representation is exactly the same thing but with different interpretations. To get the different interpretation, we only need to view everything as a matrix and then apply the conjugate transpose of the matrix as usual. 

---
### **Notes and Additional Properties**
This matrix is pretty important to the idea of [SVD](Matrix%20Decomposition/SVD.md) and [QR](Matrix%20Decomposition/QR.md). 

And some of it's properties are explored in [HW1 Mistakes](../HW1%20Mistakes.md). 