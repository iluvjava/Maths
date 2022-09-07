Projector is a type of matrix
For more detailed look into this mathematical entity, visit: [Deeper Look into Projector](Deeper%20Look%20into%20Projector.md)

---

* **Projector**
	* Standing Assumption: $P \in \mathbb{R}^{n\times n}$, $P^2 = P$
	* Simply speaking: transforming vectors from the subspace spanned by the matrix onto itself is not changing the vectors in the subspace. 
	* e.g: A single unit vector is a projector
	* Facts: 
		* $P(Pv - v) = P^2v - Pv = 0$, and hence $(I - P)$ will be the complementary projector, because whatever it projected it's orthogonal to $P$'s projection.
		* proof: $(I - P)$ is a projector because: 
			* $(I - P)^2 = (I - 2P - P^2) = (I - P)$
		* proof $(I - P)$ is complementary to $P$ because: 
			* $(I - P)P = 0$
		* Then $null(P)\subseteq range(I - P)\wedge range(I - P) \subseteq null(P)$ implying that:
		$$range(I - P) = null(P)$$
		
* **Ortho Projector**: 
	* First of all, it's a prjector
	* It's orthogonal if: 
		* $((I - P)y)^*(Px) = 0 \quad\forall x, y\in \mathbb{R^n}$, putting vector through the matrix will always results in orthogonal vectors. 
		* Or simply put: $$range(P) \perp range(I - P)$$
	
	* $P$ is an orthogonal prjector **iff** $P = P^*$ and $P^2 = P$
		* --> Can be proved directly 
		* <-- use [SVD](Matrix%20Decomposition/SVD.md) to show that P decompose to $Q\Sigma Q^*$
		* [ ] Proof ...? 

---

#### **Ortho Projector Example**
Assume that the matrix $!$ is given as a unitary matrix, $Q \in \mathbb{C}^{m\times n}$

Ok, now if I want to represent any vector $x\in \mathbb{C}^{m}$ in the space, when we will do this: 

$$
x = r + \sum_{j = 1}^n (q^H_jx)\circ q_j
$$

Where $\circ$ is the elementwise multiplications. 

Notice that this sum over there is a matrix multiplicaton in disguise: 

$$QQ^Hx$$

And yes, that is your projection matrix into the subspace, and the complementary operator will be presented as: 

$$
I - QQ^H
$$

---
### **Penrose Psuedo Inverse**

Penrose Psuedo Inverse is one projector matrix. Here is the definition of Penrose Peusdo Inverse matrix: 

>$$ AA^\dagger = A(A^HA)^{-1}A$$

Notice that it's not hard to check: 

> $$AA^\dagger AA^\dagger =AA^\dagger$$

And this is fitting the definition of a projection matrix. 

