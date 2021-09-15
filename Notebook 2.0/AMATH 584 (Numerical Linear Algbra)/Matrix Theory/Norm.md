# Norm
Matrix and vectors norm

Wiki: [link](https://www.wikiwand.com/en/Matrix_norm)

---

### **Vector Norm**

There are 3 axioms for the norm operator, suppose that, all the vector that support the operator $||\bullet||:\mathbb{C}^n\mapsto\mathbb{R}^n_+$ then it must satisfied the following: 

* $\forall x \in \mathbb{C}^n, \; \alpha \in \mathbb{R} \quad ||\alpha x|| = |\alpha| ||x||$
* $\forall x \in \mathbb{C}^n \quad ||x|| \geq 0$
* $\forall x \in \mathbb{C}^n \quad ||x|| = 0 \iff x = \mathbb{0}$
* $\forall x, y \in \mathbb{C}^n:\; ||x|| + ||y||  \geq ||x + y||$


This is the Generalized $p$ norm

$$\forall x \in \mathbb{R}^n \; ||x||_p := 
\sqrt[n]{\sum_{i = 1}^n |x_i|^p} $$

And there are 2 types of weird norm that is the extreme case of the above norm

$$||x||_\infty := \max_{1 \leq i \leq n}(x_i)$$
$$||x||_i = \max_{1\leq i\leq n}|x_1|$$
$$\|x\|_{0}=\lim _{p \rightarrow 0} \sum_{k=1}^{n}\left|x_{k}\right|^{p}$$

### **Useful Inequalities **

$$\sum_{i = 1}^n x_i \leq ||x||_1$$



### **Matrix Induced Vector Norm**
$$||x||_A:= ||x^TAx||$$
Notice that only full ranked matrices can be used for this type of norm, and other things cannot be used because it will break the axioms listed above. 

---
### **Matrix Norm**

The matrix norm is induced by the vectors norm, it tells us how the matrices is able to manipulate the vectors. The norm is used to bound the transformation a bit with one real number, so we know just how badly the matrix transform the linear spaces. 

For definitions of the norm, write the matrix $A \in \mathbb{C}^{m\times n}$ like: 
$$A = \begin{bmatrix}
\\
a_1 & a_2 & \cdots & a_n
\\
\\
\end{bmatrix}
$$

Let's also define 2 different vector norm for the domain and range of the matrix, as $||\bullet||_n$ and $||\bullet||_m$, the induced matrix norm, denoted as $||A||_{m, n}$ is the smallest number $C\in \mathbb{R}$ such that: 

$$||Ax||_m \leq C||x||_n \quad \forall x\in \mathbb{C^n}$$

And hence the definition of the matrix norm can be simply written as: 

> $$||A||_{m, n} = \sup_{x\in \mathbb{C}^n \wedge x\neq 0} \frac{||Ax||_m}{||x||_n}
>  = \sup_{x\in \mathbb{C}^n \wedge ||x||_n = 1} ||Ax||_m
> $$

The correct way to visualize this is via looking at the $L_n$ Lasbegue space and how the matrix shapes the spaces, and the number we are looking at is the longest line that cut through the space. (The idea of "long" depends on the vector norm used on the output space) 

--- 
### **The Matrix 1-Norm**
Starts with
$$||Ax||_1 = \left\Vert\sum_{i = 1} x_i a_i\right\Vert_1$$

Let's find the maximal value among all the $x_i$, say it's $x_max$

$$\left\Vert\sum_{i = 1} x_i a_i\right\Vert_1 \leq \sum_{i = 1}^n |x_i|a_i$$

By one of the useful inequalities from the vector norm section 

Now, we make use of the properties of vector $x$ from the definition.

$$||x||_1 = 1 \quad \forall x \in \mathbb{C}^n$$

Which means that $\sum_i |x_i| = 1$, and this will make 

$$\sum_{i = 1}^n |x_i|a_i \leq \max_{1\leq i \leq n} ||a_i||_1$$

And hence we got the formula for the one matrix norm using only the definition: 


> $$\Vert A\Vert_i = \max_{1 \leq i \leq n} ||a_i||_1 $$

The matrix one norm equals to the norm of the column vector with the maximal one norm in the matrix. 


A similiar process as the above one can be used to prove the the **infinity norm** is going to be the maximal row absolute sum. 

> $$||A||_\infty = \max_{1 \leq i \leq m}
> \left(\sum_{j = 1}^n|a_{i, j}| \right)$$

where $$A\in \mathbb{C}^{m\times n}$$

### **Matrix F-Norm**

The Forbenius Norm. 

> $$
\|A\|_{\mathrm{F}}=\sqrt{\sum_{i=1}^{m} \sum_{j=1}^{n}\left|a_{i j}\right|^{2}}=\sqrt{\operatorname{trace}\left(A^{H} A\right)}=\sqrt{\sum_{i=1}^{\min \{m, n\}} \sigma_{i}^{2}(A)}$$

It's all of the following at the same time: 
* The sum of modular of all entries in the matrix square rooted
* Square root of the sum of the diagonal entry of $A^HA$. 
* The sum of the first $\min(n, m)$ singular values ($\sigma_i^2(A)$) of the matrix under the square root. 


### **Matrix Induced 2-Norm (Spectral Norm)**

**Notes**: This is very different from the Frobenius Norm of matrices because this is a norm induced by vector 2-norm. 

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