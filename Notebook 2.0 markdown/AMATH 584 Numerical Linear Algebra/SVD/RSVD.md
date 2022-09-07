Prereq: [SVD](../Matrix%20Theory/Matrix%20Decomposition/SVD.md)

It's just SVD but we are doing it in a dominating subspace. 

---

### Intro
Randomized SVD is a computational technique that is applied when the matrix under operation is too big to fit into computer memory. However, access to all elements inside the matrix is still possible, then we can use the Randomized Method SVD method. 

What assumptions to make about the Matrix? 

It's a low rank data matrix, and most of the important feature across the data set is significant, and we approximately knows that the rank should be. 

Assuming he matrix is: $\mathbb{R}^{m\times n}$ and $r$ is the rank where: 
$$
r << \min(m, n)
$$

The computations has 2 Stages
* Find a Orthogonal Subspace that is representing the feature embedding. $A\approx QQ^TA$
* Operates SVD on the subspace. $B = Q^TA$

### Basics

Generate a random matrix such that each of the columns are generated from random distribution with the same variance, and probability will guarantee that the matrix is very orthogonal. Name this matrix $\Omega$  then it will be the case that: 
$$
\Omega^H\Omega \approx I
\hspace{3em}
\Omega \in \mathbb{R}^{n\times r}
$$


And the subspace projector is gonna be like: 
$$
P := QQ^T
$$

Now, we use this random normal matrix to choose linear combinations of features from the Data matrix, which is going to give us: 

$$
Y := A\Omega \quad Y \in \mathbb{R}^{r\times m} 
$$

Consider the **Reduced QR decomposition** of such a matrix, and this is: 

$$
Y = QR = A\Omega \quad 
Q \in \mathbb{R}^{r\times r}
\quad R
\in\mathbb{R}^{r\times m}
$$

**Stage** A has been completed, and now let's take a look at stage B: 

$$
B = Q^T A \quad B \in \mathbb{R}^{r\times n}
$$

And then we also have the features approximations to the matrix, and this is giving us the expression: 

$$
B := Q^TA \quad A \approx QB = QQ^T A
$$

**ECON SVD** and projection. Now the new $Q$ is going to describe what we have for the big matrix, and then we perform a SVD decomposition on the matrix which is giving us: 

$$
\widehat{U}\widehat{\Sigma}\widehat{V}^H = B = Q^T A
$$

And then the low rank reconstruction of the matrix $A$ is going to be: $B$, and the low rank reconstructions of the column space of the matrix is going to be: 

$$
	U \approx Q\widehat{U}
$$

And this is the approximated low rank feature space of the matrix $A$ for the first $r$ columns only. 

**How Well Did We do?**

We have to check this via: 

$$
\Vert A - QQ^TA\Vert
$$

**Comment**
The matrix we does the SVD decomposition on is very small if the dominating modes of the data set is limited, and in that case, it's faster to compute. 

Note that in the procedure, we have to use reduce OR decomposition and Reduced SVD decomposition on $Y$ and $B$, if not, we are doing all the columns and rows and that is slow. 

---
