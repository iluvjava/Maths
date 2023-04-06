### **Norm**
Matrix and vectors norm

Wiki: [link](https://www.wikiwand.com/en/Matrix_norm)

---

### **Norm Axioms**

Let $\mathbb C^n$ be a vector space equipped with complex scalar field, then the norm is a mapping $||\cdot||:\mathbb{C}^n\mapsto\mathbb{R}_+$ which satisfies the following: 

* $\forall x \in \mathbb{C}^n, \; \alpha \in \mathbb{R} \quad ||\alpha x|| = |\alpha| ||x||$
* $\forall x \in \mathbb{C}^n \quad ||x|| \geq 0$
* $\forall x \in \mathbb{C}^n \quad ||x|| = 0 \iff x = \mathbb{0}$
* $\forall x, y \in \mathbb{C}^n:\; ||x|| + ||y||  \geq ||x + y||$

**Remarks**: 

In general, the set $\mathbb C^n$ can be any vector space equipped with a scalar that is a subfield of $\mathbb C$. Then the same axioms would apply and defining the norm for us. Additionally, the space $\mathbb C^n$ contains a semi-inner product that can induce norms for the space. The absolute value here is applied on a complex number, $|a|^2 = \bar a a = (a_1 - a_2i)(a_1 + a_2i)$, it's the square root of their conjugate products. 

**Examples of Norm on Vector space**: 

Generalized $p$ norm

$$
\forall x \in \mathbb{R}^n \; ||x||_p := 
\sqrt[p]{\sum_{i = 1}^n |x_i|^p}
$$

And there are 2 types of weird norm that is the extreme case of the above norm

$$||x||_\infty := \max_{1 \leq i \leq n}(|x_i|)$$
$$||x||_1 = \max_{1\leq i\leq n}|x_i|$$


---
### **Matrix Induced Vector Norm** (Energy Norm)
$$||x||_A:= ||x^TAx||$$

Only positive definite operator can be used to induced such a norm. See [[Positive Definiteness]] for more context.

---
### **Matrix Norm**

The matrix norm is induced by the vectors norm, it tells us how the matrices is able to manipulate the vectors. The norm is used to bound the transformation with a real number, so we know just how badly the matrix distort the linear spaces. 

For definitions of the norm, write the matrix $A \in \mathbb{C}^{m\times n}$ like: 
$$A = \begin{bmatrix}
\\
a_1 & a_2 & \cdots & a_n
\\
\\
\end{bmatrix}
$$

Let's also define 2 different vector norm for the domain and range of the matrix, as $||\cdot||_n$ and $||\cdot||_m$, the induced matrix norm, denoted as $||A||_{m, n}$ is the smallest number $C\in \mathbb{R}$ such that: 

$$||Ax||_m \leq C||x||_n \quad \forall x\in \mathbb{C^n}$$

And hence the definition of the matrix norm can be simply written as: 

> $$||A||_{m, n} = \sup_{x\in \mathbb{C}^n \wedge x\neq 0} \frac{||Ax||_m}{||x||_n}
>  = \sup_{x\in \mathbb{C}^n \wedge ||x||_n = 1} ||Ax||_m
> $$

The correct way to visualize this is via looking at the $L_n$ Lasbegue space and how the matrix shapes the spaces, and the number we are looking at is the longest line that cut through the space. (The idea of "long" depends on the vector norm used on the output space) 

--- 
### **The Matrix 1-Norm/Inf-Norm**

We provide some intuition about the definitionf of the one-norm of a matrix. Denotes $a_i$ to be the ith column of the matrix $A$, we consider the definition of $\Vert Ax\Vert_1$: 


$$
\begin{aligned}
    & ||Ax||_1 = \left\Vert\sum_{i = 1}^n x_i a_i\right\Vert_1 \leq \sum_{i = 1}^n |x_i|\Vert a_i\Vert_1
\end{aligned}
$$

By triangular inequality of the absolute value. Now, we make use of the properties of vector $x$ from the definition.

$$
    ||x||_1 = 1 \implies \sum_{i = 1}^n |x_i|a_i \leq \max_{1\leq i \leq n} ||a_i||_1.
$$

We used the fact;  $\sum_i |x_i| = 1$. The equality of is true when we have $x = (1/n)\mathbf 1 = [1/n \; 1/n\;, \cdots, 1/n]$.

> $$\Vert A\Vert_1 = \max_{1 \leq i \leq n} ||a_i||_1$$

A similiar reasoning as the above one can be used to prove that substituting the infinity norm to the matrix norm definition will be able to yield the results of: 

> $$
>   ||A||_\infty = \max_{1 \leq i \leq m}
>   \left(\sum_{j = 1}^n|a_{i, j}| \right) \text{ where: }    
>   A\in \mathbb{C}^{m\times n}.
> $$


---
### **Matrix F-Norm**

The Forbenius Norm. 

> $$
\|A\|_{\mathrm{F}}=\sqrt{\sum_{i=1}^{m} \sum_{j=1}^{n}\left|a_{i j}\right|^{2}}=\sqrt{\operatorname{trace}\left(A^{H} A\right)}=\sqrt{\sum_{i=1}^{\min \{m, n\}} \sigma_{i}^{2}(A)}$$

It's all of the following at the same time: 
* The sum of modular of all entries in the matrix square rooted
* Square root of the sum of the diagonal entry of $A^HA$. 
* The sum of the first $\min(n, m)$ singular values ($\sigma_i^2(A)$) of the matrix under the square root. 


---
### **Matrix Induced 2-Norm (Spectral Norm)**

**Notes**: This is very different from the Frobenius norm of a matrix. 

Here let's derive it. By the definition of vector induced matrix norm:

$$
\begin{align}\tag{1}
    \Vert A\Vert_2^2 
    &=
    \sup_{x\in\mathbb{R}^n\setminus\mathbf\{0\}} \left(
        \frac{\Vert Ax\Vert^2_2}{\Vert x\Vert^2_2}
    \right)
    \\
    \Vert A\Vert_2^2 
    &=
    \sup_{x\in\mathbb{R}^n\setminus\mathbf\{0\}} \left(
        \frac{x^TA^TAx}{\Vert x\Vert^2_2}
    \right)
    \\
    \Vert A\Vert_2^2
    &=
    \sup_{\Vert x \Vert = 1} \left(
        x^TA^TAx
    \right)
    \\
    \Vert A\Vert_2^2 &= \max_{i}|\lambda_i| = \max_{i}(\sigma_i^2)
\end{align}
$$

Where $\lambda_i$ are the eigenvalues of the matrix $A^TA$, the argument from line 3 to line 4 follows from the Eigen Decomposition of the Matrix $A^TA$, or equivalently, the maximal of the singular squared on matrix $A$. 