Here we talk about the process of orthogonalizing a given linear independent subspace. 

This is the practical aspect of the: [[QR]]
It uses the idea of a orthogonal projector, coming from: [[Projector]]

---

### Psuedo Codes

Ok, I am going to write modified Gram-Schmidt here in pseudo codes. 

```suedo
Let var: V be a matrix
for var: i going from 1 to n: 
	r_{i, i} = ||v_i||
	q_i = v_i/r_{i, i}
	for var: j going from i + 1 to n: 
		r_{i, j} = q_i^T v_j
		v_j -= r_{i, j}q_i
```

The outer loop is going through each column, and the inner loop removes the components that already exists in the subspace spanned by $Q$. 

The inner forloop is way more interesting, because it's actually using the idea of a **Orthogonal Projector**, let's take a closer look. 

---
### Key To Understanding

Suppose that we are given a really special type of matrix like where, all the first $i$ the columns of the matrix forms a ortho-normal basis and all the columns that comes after it are the vectors we want to Orthogonalize and Normalize, in addition, they are perpendicular to the first $i$ columns of the matrix A. 

Let's take a look at some of the loop invariants.

> $$(A)_{:, 1:i}^H(A)_{:, 1:i} = I$$  (1)

> $$\text{range}\{(A)_{:, 1:i}\}\perp \text{range}\{(A)_{:, i + 1:\text{end}}\}$$(2)

Take the $i + 1$th column of the matrix, now I want it to be perpendicular to all the vectors that comes before it, and this is what the algorithm is recursively asserting in the inner forloop. 

First of all, $(A_{:, i + 1})$ is $\perp$ to $\text{range}\{(A)_{:, 1:i}\}$ hence:

$$q_i = v_{i + 1}/||v_{i + 1}||$$

Where $v_i$ is $(A)_{:, i + 1}$, then **invariant (1)** is asserted . 

Then, for all the remaining columns, going from $i + 2$ to the end of the matrix $A$, we remove their components that can be represented by $v_{i + 1}$, which is a giant matrix way of doing things using the idea of **Orthogonal Projector**

$$(A)_{:, i + 2:\text{end}}:=(I - q_{i+1}q_{i+1}^H)(A)_{:, i + 2:\text{end}}$$

Hence,** invariant (2)** is asserted. Now we can assert the same invariant but for $i + 2$ th column in the matrix. 

However this is not the end of the story, we still need to construct the $R$ matrix, one way of doing is to just project the $A$ matrix onto $Q$ to get the $R$ matrix. 

$$R = Q^HA$$

---
