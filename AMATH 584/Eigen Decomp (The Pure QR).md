Not to be confused with the Householder Transformation, the QR algorithm is designed for computing the Eigenvalues and stuff. 

[[Eigen Decomp Algo (Baisc and Intro)]]

You need to read all the way up to that. We need to know the power iterations first. 

---

### Pure QR Algorithm 

```
A^{(0)} = A 
for k = 1: "Some Big Number"
	Q, R = lu(A^{k})
	A(k) = R Q
```

Similarity Transform is preserved: 

$$
A_k = Q_kR_k
$$

$$
A_{k + 1} = R_kQ_k = Q^TQR_kQ = Q^TA_kQ \quad\blacksquare
$$



---
## Mathematical Investigations

### Simultaneous Iterations

This is the procedures for doing it: 

* Initialize with: $\widehat{Q^{(0)}} = I$
* for K goes from 1 to some big number **(Algo 1)**
	1.  $Z = A\widehat{Q^{(k - 1)}}$
	2. $\widehat{Q^{(k)}}R^{(k)} := Z$ 
	using reduced QR decomposition, e.g Modified GS.
* $A^{(k)} = (\widehat{Q^{(k)}})^TAQ^{(k)}$

**Take notice that**, this is analogous to the subspace iterations. 

Step 1. is apply the transformation on the orthogonal vector. 

Step 2. is normalizing all vectors and then remove projections from each other, 
this will make the algorithm converge if all Eigenvalues are distinct. 

Last Step outside the loop:  This process is reapplying the transformation and then take the dot product, Kinda like looking at the EigenValues? 

**When Hermitian**, this iterations is going to converge to a diagonal matrix in the end, because Hermitian Matrices are orthogonal. 

**When Not Hermitian** We get the eigenvector at step 1. (????)


### Pure QR Iterations

The pseudo code is on the top of the page. But let's restate it here anyway. 

* Initialize with: $A^{(0)} = A$
* For k goes from 2 to something really large **(Algo 2)**
	1. $Q^{(k)}R^{(k)} = A^{(k-1)}$ 
	QR Decompose the $A$ matrix from last iteration. 
	2. $A^{(k)}:=R^{(k)}Q^{(k)}$ 
	compute the next $A$ using the QR decomposition
	3. Accumulate: $\widehat{Q^{(k)}} = Q^{(k)}Q^{(k - 3)}Q^{(k - 2)}\cdots Q^{(1)}$
	
For analysis, let the sequence of $R$ generated from both algorithms multiplied together in sequence, and denote them with a bar, so it's like: 

$$
\widehat{R^{(k)}} = R^{(k)}R^{(k - 3)}R^{(k - 2)}\cdots R^{(1)}
$$

---
### These 2 Algorithms are The Same (Galaxy Brain Part)
It's cited as Theorem 28.3 in Trefethen's book. 

The $\widehat{Q^{(k)}}$ generated from the Simultaneous iteration algorithms are all the $Q^{(k)}$ matrices multiplied together in the Pure QR algorithm. In addition, we have: 
$$
A^k = \widehat{Q^{(k)}} \widehat{R^{(k)}} 
$$
**(1)**

Which is saying that, for the whole sequence produced, it's $A$ raise to the $k$ th power.  Or equivalently, if you take the final $Q$, $R$ matrix from the simultaneous iteration and then multiply them together then we have the matrix $A$ raise to the $k$ th power. 

Furthermore: 

$$
A^{(k)} = (\widehat{Q^{(k)}})^TR^{(k)}\widehat{Q^{(k)}}
$$
**(2)**
The final $A^{(k)}$ we have for the Pure QR algorithm will be the same as the sequences of QR multiplied and projected, produced from the Simultaneous iterations. 

#### Proof

Inductive case, assuming inductive hypothesis based on the correctness of both algorithms, and then assume that $k>1$ for our inductive hypothesis. 

$A^k \rightarrow AA^{k - 1}$ by induction base on **(1)**, $AA^{k-1} = A\widehat{Q^{(k-1)}}\widehat{R^{(k-1)}}$. 


By step 2 of the **(Algo1)**, $A\widehat{Q^{(k-1)}} = \widehat{Q^{(k)}}{R^{(k)}}$, which follows from above, we substitute to get: $\widehat{Q^{(k)}}R^{(k)}\widehat{R^{(k-1)}}$ and by how we defined $\widehat{R^{(k)}}$, we have: $\widehat{Q^{(k)}}R^{(k)}\widehat{R^{(k-1)}} =\widehat{Q^{(k)}}\widehat{R^{(k)}}$. 

Condition **(1)** is inductively preserved. 

Let's proof the same inductive proof for **(Algo 2)** 

$A^k \rightarrow AA^{k - 1}$ by induction base on **(1)**, $AA^{k-1} = A\widehat{Q^{(k-1)}}\widehat{R^{(k-1)}}$. 

Using induction on **(2)**, we have: $A^{(k-1)}= (\widehat{Q^{(k-1)}})^TAQ^{(k-1)}$, which is saying that $\widehat{Q^{(k-1)}}A^{(k-1)}= AQ^{(k-1)}$. 

substituting into previous expression we have: $AA^{k-1} = \widehat{Q^{(k-1)}}A^{(k-1)}\widehat{R^{(k-1)}}$. By step (1.) and  of **(Algo 2)** and induction we have $R^{(k-1)}Q^{(k-1)} := \text{qr}(A^{(k-1)})$. 

Substituting it in we have: $\widehat{Q^{(k-1)}} R^{(k-1)}Q^{(k-1)}\widehat{R^{(k-1)}} = \widehat{Q^{(k)}}\widehat{R^{(k)}}$. 

By induction, the **(1)** and **(2)** are asserted. $\blacksquare$

### The Next Step

To speed up the algorithm using the idea of inverse iterations, it's discussed here: [[Eigen Decomp Algo 3 (Shifted QR)]]. 