Not to be confused with the Householder Transformation, the QR algorithm is designed for computing the Eigenvalues and stuff. 

[[Eigen Decomposition Algo 2]]

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

### Practical QR Algorithms
![[Practical QR Algorithm.png]]

This is the Shifted QR Algorithm and it assumes that the matrix is Hermitian. 