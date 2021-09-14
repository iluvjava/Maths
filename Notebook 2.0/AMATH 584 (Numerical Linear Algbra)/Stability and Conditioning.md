We need to talk about the algorithmic aspect of things like SVD, Eigen, and QR. 

prereq: [[Norm]]

This is one of the metric used for measure the behavior of linear operator, which under the context of conditioning and stability for linear algebra, forms the basis for computational algorithm for the condition number. 

---
### **Conceptually Speaking**
Conditioning and stability are property of the functions that maps things from an input space to the output space of the function. 

#### **Conditioning**
 Perturbs the inputs and how does it change the output of the function. 
 * Well-Conditioned: 
   * Small changes in x is also going to cause small changes in the output of the function f. 
 * Ill-Conditioned: 
 	* Small changes in the x causes huge changes in the output of the function. 

This idea is relevant to controlling the error because if reflects how the round off errors could potentially got scaled up when smaller numerical errors are introduced. 
#### **Stability**
 Behaviors of the algorithm under perturbations 

 
 ---
 Assuming that the function $f(x): X \mapsto Y$ is our numerical algorithm. 
 
 Absolute Condition Number: 
 
 > $$\sup_{\delta x} \left(\frac{||\delta f||}{||\delta x||}\right)$$

However, if the function output at the point $x$ is just huge, then this is really not an representation, and hence we have the Relative condition number where the inputs and the outputs are normalized. 
 
 Relative Condition Number: 
 
 > $$\lim_{\delta \rightarrow 0}\sup_{\delta x < \delta} \left( 
 > \frac{||\delta f||/||f||}
 > {||\delta x||/||x||}
 > \right)$$

So we measure the perturbations relative to the input vector, and measure the perturbations relative to the output vector from the function, and then we are interested in the ratio between the 2, if this scales too big, then we are in a bit of a trouble. 

Generalizing the concepts to any function, we will use the jacobian matrix. 

$$\delta f \approx \textbf{J}_f(x) $$

And hence, we will know that the discussion of conditioning under the context of linear algebra will be helpful here. 

**Note:**
There are different types of norm which can be used here, but it's not specified here. 

 ---
#### Conditioning Under the Context of Linalg

Now, assume that the matrix $A\in \mathbb{C}^{m\times n}$

Then, using the definition from above on the general mapping functions, it's going to be 

$$
\sup_{\delta x}
\left(
	\frac{||A(x + \delta x) - Ax||/||Ax||}
	{||\delta x||/||x||}
\right)
$$

Then an upper bound can be identified with some properties of Matrix Vecor Norm, [[Norm]], which will results in the following expression here: 

> $$\kappa = \sup_{||x|| = 1}\frac{||A||\;||x||}{||Ax||}$$
Relative Conditioning Number of a matrix

Now the condition number will tells us the upper bound for Relative Condition of a matrix, and the upper bound will be tight. 

#### **Proof:** 

Here we will quickly work through the poof for the conditioning of a matrix in linear algebra and in this case, we might need to understand something about the [[Norm]] of a matrix, which is used here. 

$$\underset{\delta x}{\sup}\left(
\frac{
	\Vert A\delta x\Vert/ \Vert Ax\Vert 
	}
	{
	\Vert\delta x \Vert /\Vert x \Vert 
	}
\right)$$

Now we clean up the fraction and get: 

$$
\underset{\delta x}{\sup}\left(
\frac{
		\Vert A\delta x\Vert \Vert x\Vert
	}
	{
		\Vert \delta x\Vert  \Vert Ax\Vert 
	}
\right)
$$

$$
\underset{\delta x}{\sup}\left(
\frac{
		\Vert A\delta x\Vert 
	}
	{
		\Vert \delta x\Vert
	}
\right)
\underset{\delta x}{\sup}\left(
	\frac{\Vert x\Vert}
	{\Vert Ax\Vert}
\right)
= \Vert A\Vert \sup_{\delta x}\frac{\Vert x \Vert}{\Vert Ax\Vert} 
$$


#### Squared Matrices
Now assume that the matrix $A$ is also squared. 

$$\frac{||x||}{||Ax||} \leq ||A^{-1}||$$

Under the case of the square matrices, the above definition will be useful for us, and hence we can say the following about the condition number of the squared matrix: 

> $$\kappa = ||A||\;||A^{-1}||$$

#### Condition Number and SVD for Squared Matrices

Fact: $||A||_2 = \sigma_{max}$

The matrix induced 2 norm (Spectral Norm) is equaled to the maximal Singular value of the matrix. 

Fact: $||A||_F = \sum_{i} \sigma_i$
The Frobenius Norm of the matrix $A$ equals to the sum of all the singular values. 

Notice that, the norm of the matrices can be computed using the SVD of the matrix, and then we will get the expression of $||A||_2, ||A||_F$ using the singular values of $||A||$. 

$$||A||_2 =||U||_2|\Sigma||_2||V^H||_2 = \sigma_{max}$$

$$||A^{-1}||_2 = ||(V\Sigma V^H)^{-1}||_2 = ||\Sigma^{-1}||_2$$

$$\kappa_2(A) = ||A||_2||A^{-1}||_2 = \frac{\sigma_{max}}{\sigma_{min}}$$


Which is the expression of the Condition number, and it can be easily computed using the SVD decomposition of the matrix $A$. 

#### For Non-squared Matrices

When the matrices is not squared, we are going to assume that the matrix is full rank so that the Penrose Pseudo Inverse of the matrix exists. 