The Arnoldi Iterations produces an orthogonal subspace for the Krylov Subspace, more generally it's used to find the Hessenberg similarity transform. 

prereq: [[Modified GS Process]]
The iterations share the same algorithm structure as the modified GS process. 
prereq: [[Eigen Decomp (Hessenberg Transform)]], Take a look at the Hessenberg Similarity Transform. 


---
### **Similarity Transform**

Let the matrix A be similar to an Hessenberg matrix, with orthogonal transform. 

$$
A = QHQ^H
$$

Where $H$ is in upper Hessenberg form, and $Q$ is an orthogonal matrix. 

Ok, this is a weird concept, but the heart of understanding it is to start with the algorithm and see what we can do about it. 

Algorithm: 
```matlab
 b:= Arbitrary Vector; q_1 = b/||b||
 for n = 1, 2, 3... 
 	v  = A q_n
	for j = 1: n
		h_{j, n} = q_j^H v
		v = v - h_{j_n}q_j
	h_{n + 1, n} = ||v||  % Note: could be zero: please ignore this for now
	q_{N + 1}    = v/h_{N + 1, N}
 ```
 
 Let's do this step by step and see what is going on here and what it's doing. 
 
 Take the vector $b$, which can really be any vector, normalized it and let it be the first column for the matrix $Q$
$$
	q_1 = \frac{b}{||b||}
$$
$$
	v = Aq_1 
$$
$$
	h_{1,1} = q_1^Hv
$$
$$
	v = v - h_{1, 1}q_1
$$
$$h_{2, 1} = ||v||$$
$$
	q_2 = \frac{v}{h_{2, 1}}
$$

So what happen is, recursively, compute $Aq_n$, and then remove all the component of this vector that appeared in $\langle Aq_1, Aq_2... , Aq_n\rangle$. 

And recursively, we are trimming off the component of the new vector that lies in the first n Krylov Subspace! 


#### The Recurrence

$$AQ = QH$$

Let's take the first column out from both side, equates them and then we will have: 

$$
Aq_1 = h_{1,1}q_1 + h_{2,1}q_2
$$

let's look at the next column: 

$$
Aq_2 = h_{1,2} q_1 + h_{2,2}q_2 + h_{3,2}q_3
$$

And hence, the recurrences can be constructed upon submatrices, and it will be like: 

$$
A[q_1| q_2| q_3 \cdots q_k] = [q_1| q_2| q_3 \cdots q_{k + 1}]H_{1: k + 1, 1: k}
$$

#### Observations
The architecture of the algorithm is very similar to the Modified GS algorithm. But instead of starting the iteration with a vector inside of the matrix $A$, we instead take a random one $b$ and place that as the first vector. 

During the iterations of the algorithm, the matrix $A$ is treated as a black box, and this is very interesting, and as far as we know, it can be infinitely huge, and we are just interacting with the matrix via subpart of it, and this is the general philosophy of iterative methods for linear algebra. 

