The steepest descend method for solving the matrix vector equation. 
Basic understanding about [[Hermitian Adjoint]] is needed for exploiting the structure of symmetric matrix using steepest Descend. 

---
### **Intro**

Our objective is to solve: 

$$
Ax = b
$$

Where we **assume that the matrix $A$ is Symmetric Positive Definite** and sparse, and we treat it as a black box transformation applied to vectors.

Consider the function: 

$$
\begin{aligned}
f(x)    & =\frac{1}{2}x^TAx - b^T x + c
\\
\nabla_x[f(x)] &= \frac{1}{2}(A^T + A)x - b
\\
\underset{(1)}{\implies}
\nabla_x[f(x)] &= Ax - b
\\
\text{Let: }\quad \nabla_x[f(x)] &= 0
\\
\implies 
    Ax & = b 
\end{aligned}
$$

(1): Using that assumption that matrix $A$ is orthogonal. 

* Therefore, looking for the minima of the function $f(x)$ is equivalent to solving the matrix vector equation. Only true when the matrix is Symmetric

**Defined Quantities**:

0. $Ax_+ = b$
1. $e^{(i)} = x^{(i)} - x_+$
2. $r^{(i)} = b - Ax^{(i)}$
3. $r^{(i)} = -Ae^{(i)} = -A(x^{(i)} - x_+) = -Ax^{(i)} + b$
4. $r^{(i)} = -\nabla_x[f](x^{(i)})$

$e^{(i)}$ is the error on the input space and $r^{(i)}$ is the error on the output space. 

Residual is also the gradient at that particular step. 

**Observe**

> The residual is the gradient of the function. 

> If the matrix is not symmetric, then the gradient is not the residual at each teration. 

---
### **Steepest Descend Method Proof** 

$$
\begin{aligned}
    x^{(k + 1)} & = x^{(k)} + \alpha r^{(k)}
    \\
    f(x^{(k + 1)}) &= f(x^{(k)} + \alpha r^{(k)})
    \\
    \underset{(1)}{\implies}
    \partial_\alpha[f(x^{(k)} + \alpha r^{(k)})]&= 
    r^{(k)T}\nabla_x[f](x^{(k + 1)}) 
    \\
    \text{let}\quad r^{(k)T}\nabla_x[f](x^{(k + 1)})  &= 0
    \\
    \underset{(2)}{\implies}
    r^{(k)T}r^{(k + 1)} &= 0
\end{aligned}
$$

(1): Basic Calculus 

(2): by 4. and a sign change. 

To solve for alpha, we need to consider: 

$$
\begin{aligned}
    r^{(k)T}r^{(k + 1)} &= 0
    \\
    r^{(k)T}(b - Ax^{(k + 1)}) &= 0
    \\
    r^{(k)T}(b - A(x^{k} + \alpha r^{(k)})) &= 0
    \\
    r^{(k)T}b - r^{(k)T}Ax^{(k)} - \alpha r^{(k)T}Ar^{(k)}&= 0
    \\
    r^{(k)T}(b - Ax^{(k)}) &= \alpha r^{(k)T}Ar^{(k)}
    \\
    r^{(k)T}r^{(k)} &= \alpha r^{(k)T}Ar^{(k)}
    \\
    \alpha = \frac{||r^{(k)}||_2^2}{r^{(k)T}Ar^{(k)}}
\end{aligned}
$$

Alpha is the step size for the steepest descend method. We have expressed the direction of $\alpha$ in terms of quantities from the previous step. 

**Graphical Interpretation**

The fact that $r^{(k + 1)}\perp r^{(k)}$ means that we always turns a right angle while we travels in the gradient field of the function $f(x)$. This is true by the definition of the residual vector $r$. 

**Algorithm Description**

$$
\begin{aligned}
    & r^{(k)} = b - Ax^{(k)}
    \\
    & \alpha = \frac{||r^{(k)}||_2^2}{r^{(k)T}Ar^{(k)}}
    \\
    & x^{(k + 1)} = x^{(k)} + \alpha r^{(k)}
\end{aligned}
$$

---
### **Convergence Analysis**

For more details of analysis, consult [Conjugate without pain](https://sites.math.washington.edu/~morrow/498_13/conjgrad.pdf) for more details. 

But a summary will be given here regardless. 

Consider expressing the error terms using the orthogonal eigenvectors for the symmetric positive definite matrix. 

**Claim:**

> Although the steepest descend method takes the best step at each iteration, it's not incoorperating the previous iterations to figure out the best descend direction.


